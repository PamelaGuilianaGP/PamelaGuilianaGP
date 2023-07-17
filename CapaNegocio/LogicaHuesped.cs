using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;

namespace CapaNegocio
{
    public class LogicaHuesped
    {
        public string Select_Huesped()
        {
            DataSet ds = new DBHuesped().Select_Huesped(0);
            return new Util().DataTableToJSONWithJavaScriptSerializer(ds.Tables[0]);
        }
        public int Elimina_Huesped(int IdUsuario,string IdHuesped)
        {

            return new DBHuesped().Elimina_Huesped(IdUsuario,Convert.ToInt32(new Util().Base64Decode(IdHuesped)));
        }
        public int Valida_Identificador_Huesped(string Identificador)
        {
            return  new DBHuesped().Valida_Identidicador_Huesped(Identificador);
        }
        public int Crear_Huesped(string Identificador, string Nombres, string Apellidos, string Nacionalidad, string Telefono,
                                string Correo, int IdEstado, int IdUsuario)
        {
            return new DBHuesped().Crear_Huesped(Identificador,Nombres,Apellidos,Nacionalidad,Telefono,Correo,IdEstado,IdUsuario);
        }
        public DataSet Datos_Huesped_Por_Id(int IdHuesped)
        {
            return new DBHuesped().Select_Huesped(IdHuesped);
        }
        public int Edit_Huesped(string Identificador, string Nombres, string Apellidos, string Nacionalidad, string Telefono,
                                string Correo, int IdEstado, int IdUsuario, int IdHuesped)
        {
            return new DBHuesped().Edit_Huesped(Identificador,Nombres,Apellidos,Nacionalidad,Telefono,Correo,IdEstado,IdUsuario,IdHuesped);
        }
    }
}
