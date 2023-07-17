using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaNegocio;
using static CapaNegocio.Util;

namespace CapaPresentacion.Admin
{
    public partial class EditarEdificio : System.Web.UI.Page
    {
        public static int IdEdificio;
        DataTable dtHabitaciones = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SistemasUsuario"] != null)
            {
                if (!IsPostBack)
                {
                    Usuario us = new Util().getUserData();
                    hfIdUsuario.Value = us.IdUsuario.ToString();
                    IdEdificio = Convert.ToInt32(new Util().Base64Decode(Request.QueryString["Id"]));
                    CargarDatosEdificio(IdEdificio);
                }
            }
   
            else
            {
                string path = HttpContext.Current.Request.Url.AbsolutePath + Request.Url.Query;
                Session["Url"] = path;
                Response.Redirect("Login.aspx");
            }
        }
        #region[Metodos]
        public void CargarDatosEdificio(int IdEdificio)
        {
            DataSet ds = new LogicaHotel().SelectDatos_Hotel(IdEdificio);
            if (ds.Tables[0].Rows.Count>0)
            {
                
                txtEdificio.Text = ds.Tables[0].Rows[0]["NOMBRE_EDIFICIO"].ToString();
                ddlPisos.SelectedValue = ds.Tables[0].Rows[0]["PISOS"].ToString();
                txtDesc.Text = ds.Tables[0].Rows[0]["DESCRIPCION"].ToString();
                int Pisos = Convert.ToInt32(ddlPisos.SelectedValue);
                rdEstado.SelectedValue = ds.Tables[0].Rows[0]["IDESTADO"].ToString();
                CargarEdificios(Pisos);

            }
            
        }
        public void CargarEdificios(int Pisos)
        {
            TabPiso.DataSource = this.Pisos(Pisos);
            TabPiso.DataBind();

            ddlPisosHotel.Items.Clear();
            ddlPisosHotel.DataSource = this.Pisos(Pisos);
            ddlPisosHotel.Items.Add(new ListItem("Seleccione Piso", ""));
            ddlPisosHotel.DataTextField = "Nombre";
            ddlPisosHotel.DataValueField = "Id";
            ddlPisosHotel.DataBind();

            //LLENA LA GRILLA DE CADA EDIFICIO
            foreach (RepeaterItem item in TabPiso.Items)
            {
                int IdPiso = Convert.ToInt32((item.FindControl("LbIdPiso") as Label).Text);
                GridView gv = item.FindControl("gvhabitaciones") as GridView;
                DataSet ds = new LogicaHotel().Select_Datos_habitacion(IdEdificio,IdPiso);
                gv.DataSource = ds.Tables[0];
                gv.DataBind();
            }

        }
        public List<Edificio> Pisos(int NPisos)
        {
            List<Edificio> Pisos = new List<Edificio>();
            for (int i = 1; i <= NPisos; i++)
            {
                
                Pisos.Add(new Edificio() { Id = i, Nombre = "Piso "+i });
            }   
            return Pisos;
        }
        public class Edificio
        {
            public int Id { get; set; }
            public string Nombre { get; set; }
        }
        #endregion

        #region[Eventos]
        protected void ddlPisos_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlPisos.SelectedValue!="")
            {
                CargarEdificios(Convert.ToInt32(ddlPisos.SelectedValue));
            }
            
        }
        protected void AgregarHab_Click(object sender, EventArgs e)
        {
            try
            {
                int NumeroPiso = Convert.ToInt32(ddlPisosHotel.SelectedValue);
                int Numerohab = Convert.ToInt32(txtCantidadHab.Text);
                int Camas = Convert.ToInt32(ddlCantCamas.SelectedValue);
                int IdEstado = Convert.ToInt32(ddlEstado.SelectedValue);


                foreach (RepeaterItem item in TabPiso.Items)
                {
                    int IdPiso = Convert.ToInt32((item.FindControl("LbIdPiso") as Label).Text);
                    if (IdPiso == NumeroPiso)
                    {
                        GridView gv = item.FindControl("gvhabitaciones") as GridView;
                        DataTable dt = new Util().ConvertGVDatatable(gv);
                        int indexUltimo = dt.Rows.Count;
                        for (int i = 1; i <= Numerohab; i++)
                        {
                            indexUltimo++;
                            DataRow NewRow = dt.NewRow();
                            NewRow["IdHabitacion"] = 0;
                            NewRow["IdEstado"] = IdEstado;
                            NewRow["NumHabitacion"] = indexUltimo;
                            NewRow["NumCamas"] = Camas;
                            dt.Rows.Add(NewRow);
                        }
                        gv.DataSource = dt;
                        gv.DataBind();
                        txtCantidadHab.Text = "";
                    }
                }

               
            }
            catch (Exception ex)
            { throw ex; }
        }
        protected void BtnEliminar_Click(object sender, EventArgs e)
        {
            int Resp = 1;
            LinkButton btnEliminarHabitacion = (sender as LinkButton);
            GridView gv = (btnEliminarHabitacion.NamingContainer.NamingContainer as GridView);
            GridViewRow row = (btnEliminarHabitacion.NamingContainer as GridViewRow);
            int IdHabitacion = Convert.ToInt32(btnEliminarHabitacion.CommandArgument);
            DataTable dt = new Util().ConvertGVDatatable(gv);
            if (IdHabitacion != 0)
            {
                Resp = new LogicaHotel().EliminaHabitacion(IdHabitacion, Convert.ToInt32(hfIdUsuario.Value));
            }
            if (Resp>0)
                dt.Rows[row.RowIndex].Delete();

            gv.DataSource = dt;
            gv.DataBind();
        }
        protected void gvhabitaciones_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)

            {
                LinkButton lb = e.Row.FindControl("BtnEliminar") as LinkButton;
                ScriptManager sm = ScriptManager.GetCurrent(this);
                sm.RegisterAsyncPostBackControl(lb);

                DropDownList ddl = e.Row.FindControl("ddlEstado") as DropDownList;
                ddl.SelectedValue = (e.Row.FindControl("LbIdEstado") as Label).Text;

                DataSet dsTipoMoneda = new LogicaReservas().Obtenerer_Tipo_Moneda();
                DropDownList ddlTipoMoneda = e.Row.FindControl("dllTipoMoneda") as DropDownList;
                ddlTipoMoneda.DataSource = dsTipoMoneda;
                ddlTipoMoneda.DataValueField = "ID";
                ddlTipoMoneda.DataTextField = "MONEDA";
                ddlTipoMoneda.DataBind();

                ddlTipoMoneda.SelectedValue = (e.Row.FindControl("IdTipoMoneda") as Label).Text;

            }
        }
        #endregion

        protected void BtnGuardarHotel_Click(object sender, EventArgs e)
        {
            string NombreEdificio = txtEdificio.Text;
            int NroPisos = Convert.ToInt32(ddlPisos.SelectedValue);
            string Descripcion = txtDesc.Text;
            int IdEstado = Convert.ToInt32(rdEstado.SelectedValue);

            int Resp = new LogicaHotel().CreaActualizaEdifico(IdEdificio
                                                            , NombreEdificio
                                                            , NroPisos
                                                            , Descripcion
                                                            , IdEstado
                                                            , TabPiso
                                                            , Convert.ToInt32(hfIdUsuario.Value));

            if (Resp > 0)
            {
                div_msg.Visible = true;
                lbmsg.Text = "Se Guardo los cambios Correctamente";
                div_msgerror.Visible = false;
                lbmsgerror.Text = "";
            }
            else
            {
                div_msg.Visible = false;
                lbmsg.Text = "";
                div_msgerror.Visible = true;
                lbmsgerror.Text = "Ha Ocurrido un error si persiste comunicarse con el administrador";
            }

        }
    }
}