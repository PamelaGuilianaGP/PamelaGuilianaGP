using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class BDLogin
    {
        public DB Instancia { get; set; }
        public BDLogin()
        {
            Instancia = new DB();
        }
        public DataSet Login(string Nombre,string Password)
        {
            Instancia.DAAsignarProcedure("LOGIN");
            Instancia.DAAgregarParametro("@USUARIO", Nombre);
            Instancia.DAAgregarParametro("@PASS", Password);
            return Instancia.DAExecuteDataSet();
        }
        public DataSet Obtener_Datos_Usuario(string Nombre, string Password)
        {
            Instancia.DAAsignarProcedure("Obtener_Datos_Usuario");
            Instancia.DAAgregarParametro("@USUARIO", Nombre);
            Instancia.DAAgregarParametro("@PASS", Password);
            return Instancia.DAExecuteDataSet();
        }
        public DataSet Select_Datos_Usuarios(string NombreUsuario)
        {
            Instancia.DAAsignarProcedure("SELECT_DATOS_USUARIOS");
            Instancia.DAAgregarParametro("@NOMBREUSUARIO", NombreUsuario);
            return Instancia.DAExecuteDataSet();
        }
        public int Cambia_Contraseña(int IdUsuario,string ContraseñaNew)
        {
            Instancia.DAAsignarProcedure("CAMBIA_CONTRASEÑA");
            Instancia.DAAgregarParametro("@IDUSUARIO", IdUsuario);
            Instancia.DAAgregarParametro("@CONTRASEÑANEW", ContraseñaNew);
            return Convert.ToInt32(Instancia.DAExecuteScalar());
        }
    }
}
