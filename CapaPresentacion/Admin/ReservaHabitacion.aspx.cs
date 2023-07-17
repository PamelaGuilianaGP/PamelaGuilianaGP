using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static CapaNegocio.Util;

namespace CapaPresentacion.Admin
{
    public partial class ReservaHabitacion : System.Web.UI.Page
    {
        public static int IdEdificio;
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario us = new Util().getUserData();
            hfIdUsuario.Value = us.IdUsuario.ToString();
            IdEdificio = Convert.ToInt32(new Util().Base64Decode(Request.QueryString["Id"]));
            CargarDatosEdificio(IdEdificio);
        }
        #region[Metodos]
        public void CargarDatosEdificio(int IdEdificio)
        {
            DataSet ds = new LogicaHotel().SelectDatos_Hotel(IdEdificio);
            if (ds.Tables[0].Rows.Count > 0)
            {
                CargarEdificios(Convert.ToInt32(ds.Tables[0].Rows[0]["PISOS"].ToString()));
            }
        }
        public void CargarEdificios(int Pisos)
        {
            TabPiso.DataSource = this.Pisos(Pisos);
            TabPiso.DataBind();

            foreach (RepeaterItem item in TabPiso.Items)
            {
                int IdPiso = Convert.ToInt32((item.FindControl("LbIdPiso") as Label).Text);
                GridView gv = item.FindControl("gvhabitaciones") as GridView;
                DataSet ds = new LogicaHotel().Select_Datos_habitacion(IdEdificio, IdPiso);
                gv.DataSource = ds.Tables[0];
                gv.DataBind();
            }

        }
        public List<Edificio> Pisos(int NPisos)
        {
            List<Edificio> Pisos = new List<Edificio>();
            for (int i = 1; i <= NPisos; i++)
            {

                Pisos.Add(new Edificio() { Id = i, Nombre = "Piso " + i });
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
       
        protected void gvhabitaciones_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton lb = e.Row.FindControl("BtnReservar") as LinkButton;
                ScriptManager sm = ScriptManager.GetCurrent(this);
                sm.RegisterAsyncPostBackControl(lb);
                string Idhabitacion = (e.Row.FindControl("LdIdHabitacion") as Label).Text;
                DataSet dsReservados = new LogicaReservas().Select_Reservados(Convert.ToInt32(Idhabitacion));
                Table Tb = e.Row.FindControl("TableReservados") as Table;

                TableRow row = new TableRow();
                foreach (DataRow item in dsReservados.Tables[0].Rows)
                {
                    TableCell cell = new TableCell();
                    cell.Text = item["IDENTIFICADOR"].ToString();
                    cell.Text = item["NOMBRES"].ToString()+" "+ item["NOMBRES"].ToString();
                    row.Cells.Add(cell);
                }
               
                Tb.Rows.Add(row);


            }
        }
        #endregion

    }
}