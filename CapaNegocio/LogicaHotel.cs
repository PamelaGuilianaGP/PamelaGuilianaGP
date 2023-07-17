using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;
using CapaDatos;

namespace CapaNegocio
{
   public class LogicaHotel
    {
        public int CrearHotel(string NomHotel, string Descripcion, int NumeroPisos, int IdUsuario)
        {
            return new DBHotel().CrearHotel(NomHotel,Descripcion,NumeroPisos,IdUsuario);
        }
        public DataSet SelectDatos_Hotel(int IdEdificio)
        {
            return new DBHotel().SelectDatos_Hotel(IdEdificio);
        }
        public string ListadoEdificio()
        {
            DataSet ds = new DBHotel().SelectDatos_Hotel(0);
            return new Util().DataTableToJSONWithJavaScriptSerializer(ds.Tables[0]);
        }
        public int  CreaActualizaEdifico(int IdHotel,string Nombre,int Pisos,string Descripcion,int Estado,Repeater Rp,int IdUsuario)
        {
            try
            {
                foreach (RepeaterItem item in Rp.Items)
                {
                    int IdPiso = Convert.ToInt32((item.FindControl("LbIdPiso") as Label).Text);
                    GridView gv = item.FindControl("gvhabitaciones") as GridView;
                    DataTable dt = new Util().ConvertGVDatatable(gv);
                    foreach (DataRow dtRow in dt.Rows)
                    {
                        int IdHabitacion = Convert.ToInt32(dtRow["IdHabitacion"].ToString());
                        int IdEstado = Convert.ToInt32(dtRow["IdEstado"].ToString());
                        int NumHabitacion = Convert.ToInt32(dtRow["NumHabitacion"].ToString());
                        int NumCamas = Convert.ToInt32(dtRow["NumCamas"].ToString());
                        int IdTipoMoneda = Convert.ToInt32(dtRow["IdTipoMoneda"].ToString());
                        decimal Precio = Convert.ToDecimal(dtRow["Precio"].ToString());

                        int Res = new DBHotel().CreaActualizaEdifico(IdHotel, Nombre, Pisos, Descripcion, IdPiso, Estado, IdHabitacion, 
                                                                    IdEstado, NumHabitacion, NumCamas, IdTipoMoneda, Precio, IdUsuario);
                    }
                }
                return 1;
            }
            catch(Exception ex)
            {
                return 0;
            }
            
        }
        public DataSet Select_Datos_habitacion(int IdEdificio,int IdPiso)
        {
            return new DBHotel().Select_Datos_habitacion(IdEdificio, IdPiso);
        }
        public int EliminaHabitacion(int Idhabitacion,int IdUsuario)
        {
            return new DBHotel().EliminaHabitacion(Idhabitacion, IdUsuario);
        }
    }
}
