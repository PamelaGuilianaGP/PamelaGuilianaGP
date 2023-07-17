using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static CapaNegocio.Util;

namespace CapaPresentacion.Admin
{
    public partial class Reservahabitaciones : System.Web.UI.Page
    {
        public static int IdEdificio=0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SistemasUsuario"] != null)
            {
                if (!IsPostBack)
                {
                    Usuario us = new Util().getUserData();
                    hfIdUsuario.Value = us.IdUsuario.ToString();
                    IdEdificio = IdEdificio == 0 ? Convert.ToInt32(new Util().Base64Decode(Request.QueryString["Id"])) : IdEdificio;
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
                string Idhabitacion = (e.Row.FindControl("LdIdHabitacion") as Label).Text;
                string CantCamas = (e.Row.FindControl("LbCamasDisponibles") as Label).Text;
                if(Convert.ToInt32(CantCamas)==0)
                {
                    (e.Row.FindControl("LbCamasDisponibles") as Label).CssClass = "label label-danger";
                }
                DataSet dsReservados = new LogicaReservas().Select_Reservados(Convert.ToInt32(Idhabitacion));
                Table Tb = e.Row.FindControl("TableReservados") as Table;

                if(dsReservados.Tables[0].Rows.Count>0)
                {
                    TableRow rowHeader = new TableRow();
                    TableCell cellHeader = new TableCell();
                    cellHeader.Text = "Identificador";
                    rowHeader.Cells.Add(cellHeader);

                    TableCell cellHeader2 = new TableCell();
                    cellHeader2.Text = "Nombres";
                    rowHeader.Cells.Add(cellHeader2);

                    TableCell cellHeader3 = new TableCell();
                    cellHeader3.Text = "Apellidos";
                    rowHeader.Cells.Add(cellHeader3);

                    TableCell cellHeader4 = new TableCell();
                    cellHeader4.Text = "Fechas";
                    rowHeader.Cells.Add(cellHeader4);

                    TableCell cellHeader5 = new TableCell();
                    cellHeader5.Text = "CheckInOut";
                    rowHeader.Cells.Add(cellHeader5);

                    TableCell cellHeader6 = new TableCell();
                    cellHeader6.Text = "Eliminar";
                    rowHeader.Cells.Add(cellHeader6);

                    Tb.Rows.Add(rowHeader);

                    foreach (DataRow item in dsReservados.Tables[0].Rows)
                    {
                        TableRow row = new TableRow();
                        foreach (DataColumn col in dsReservados.Tables[0].Columns)
                        {
                            TableCell cell = new TableCell();
                            if (col.ColumnName.ToString()=="ID")
                            {
                                cell.Text = new Util().IconCheckOutIn(Convert.ToInt32(item[col.ColumnName].ToString()));
                                row.Cells.Add(cell);
                            }
                            else if(col.ColumnName.ToString() == "ELIMINA")
                            {
                                cell.Text = "<a href=JavaScript:EliminarReserva(\'" + item[col.ColumnName].ToString() + "\') class='btn btn-danger btn-xs'><span class='glyphicon glyphicon-remove fa-1x'></span></a>";
                                row.Cells.Add(cell);                              
                            }
                            else
                            {
                                cell.Text = item[col.ColumnName].ToString();
                                row.Cells.Add(cell);
                            }
                                
                        }
                      
                        Tb.Rows.Add(row);

                    }
                }
                
            }
        }
        #endregion

        #region [Web Method]
        [System.Web.Services.WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string GetHuesped(string Identificador)
        {
            return new LogicaReservas().BusquedaPredec_Huesped(Identificador);
        }

        [System.Web.Services.WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string GuardarReserva(string Identificador, string Nombres, string Apellidos, string Nacionalidad, string Telefono,
                                            string Correo, string FechaIngreso, string FechaSalida, string Comentario, int Idhabitacion, int IdHuesped, int IdUsuario)
        {
            return new LogicaReservas().Reservar_Habitacion(Identificador, Nombres, Apellidos, Nacionalidad, Telefono, Correo,
                                              FechaIngreso, FechaSalida, Comentario, Idhabitacion, IdHuesped, IdUsuario);
        }
        [System.Web.Services.WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string Realizar_CheckIN_CheckOUT(int IdReserva,int Idusuario,string Tipo)
        {
            return new LogicaReservas().Realizar_CheckIN_CheckOUT(IdReserva,Idusuario,Tipo);
        }
        [System.Web.Services.WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string Reservas_Por_Habitacion(int IdHabitacion)
        {
            return new LogicaReservas().Reservas_Por_Habitacion(IdHabitacion);
        }
        [System.Web.Services.WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string EliminarReserva(int IdReserva,int IdUsuario,string Comentario)
        {
            return new LogicaReservas().Eliminar_Reserva(IdReserva, IdUsuario,Comentario);
        }
        
        #endregion
    }
}