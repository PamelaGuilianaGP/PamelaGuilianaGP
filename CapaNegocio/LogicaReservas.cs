using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace CapaNegocio
{
    public class LogicaReservas
    {
        public DataSet Select_Reservados(int IdHabitacion)
        {
            return new DBReservas().Select_Reservados(IdHabitacion);
        }
        public string  Reservar_Habitacion(string Identificador, string Nombres, string Apellidos, string Nacionalidad, string Telefono, string Correo,
                                           string FechaIngreso, string FechaSalida, string Comentario, int Idhabitacion, int IdHuesped, int IdUsuario)
        {
            return new DBReservas().Reservar_Habitacion(Identificador, Nombres, Apellidos, Nacionalidad, Telefono, Correo,
                                            FechaIngreso, FechaSalida, Comentario, Idhabitacion, IdHuesped, IdUsuario);
        }
        public string Reservar_Habitacion_Cliente(string Identificador, string Nombres, string Apellidos, string Nacionalidad, string Telefono, string Correo,
                                           string FechaIngreso, string FechaSalida, string Comentario, string ArrayHab, int IdHuesped, int IdUsuario)
        {
            try
            {
                string Resp="0";

                Habitacion[] results = JsonConvert.DeserializeObject<Habitacion[]>(ArrayHab);

                foreach (DataRow row in ObjectToData(results).Rows)
                {
                    int CantReservas = Convert.ToInt32(row["CAMAS"].ToString());
                    for (int i = 1; i <= CantReservas; i++)
                    {
                        Resp = new DBReservas().Reservar_Habitacion(Identificador, Nombres, Apellidos, Nacionalidad, Telefono, Correo,
                                                FechaIngreso,FechaSalida, Comentario, Convert.ToInt32(row["ID"].ToString()), IdHuesped, IdUsuario);
                    }
                }

                bool resp = new Util().EnviaCorreoReserva(Identificador,Nombres+" "+Apellidos,Correo, ArrayHab, FechaIngreso, FechaSalida);
                return Resp;
            }
            catch(Exception ex)
            {
                return "0";
            } 
        }
        public string BusquedaPredec_Huesped(string Identificador)
        {
            DataSet ds = new DBReservas().BusquedaPredec_Huesped(Identificador);
            return new Util().DataTableToJSONWithJavaScriptSerializer(ds.Tables[0]);
        }
        public string Realizar_CheckIN_CheckOUT(int IdReserva, int IdUsuario, string Tipo)
        {
            return new DBReservas().Realizar_CheckIN_CheckOUT(IdReserva,IdUsuario,Tipo);
        }
        public string Reservas_Por_Habitacion(int IdHabitacion)
        {
            DataSet ds = new DBReservas().Reservas_Por_Habitacion(IdHabitacion);
            return new Util().DataTableToJSONWithJavaScriptSerializer(ds.Tables[0]);
        }
        public string Eliminar_Reserva(int IdReserva, int IdUsuario, string Comentario)
        {
            return new DBReservas().Eliminar_Reserva(IdReserva, IdUsuario, Comentario);
        }
        public string Obtener_Habitaciones_Libres(string FechaInicio,string FechaFin,int CantPersonas)
        {
            try
            {
                string Resp = "";
                DataSet ds = new DBReservas().Obtener_Habitaciones_Libres(FechaInicio, FechaFin, CantPersonas);
                if (ds.Tables[0].Columns.Count > 1)
                {
                   Resp = new Util().DataTableToJSONWithJavaScriptSerializer(ds.Tables[0]);
                }
                
                return Resp;
            }
            catch(Exception ex)
            {
                return "";
            }
            
        }
        public static DataTable ObjectToData(object[] oBject)
        {
            if (oBject != null && oBject.Length > 0)
            {
                Type t = oBject[0].GetType();
                DataTable dt = new DataTable(t.Name);
                foreach (PropertyInfo pi in t.GetProperties())
                {
                    dt.Columns.Add(new DataColumn(pi.Name));
                }
                foreach (var o in oBject)
                {
                    DataRow dr = dt.NewRow();

                    foreach (DataColumn dc in dt.Columns)
                    {
                        dr[dc.ColumnName] = o.GetType().GetProperty(dc.ColumnName).GetValue(o, null);
                    }

                    dt.Rows.Add(dr);
                }
                return dt;
            }
            return null;
        }
        public DataSet Obtenerer_Tipo_Moneda()
        {
            return new DBReservas().Obtenerer_Tipo_Moneda();
        }
        public class Habitacion
        {
            public int CAMAS { get; set; }
            public int ID { get; set; }
            public string MONEDA { get; set; }
            public string NOMBRE_EDIFICIO { get; set; }
            public int NUMERO { get; set; }
            public int PISO { get; set; }
            public string PRECIO { get; set; }
        }
    }
}
