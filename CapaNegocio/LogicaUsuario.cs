using System;
using System.Data;
using CapaDatos;
using static CapaNegocio.Util;

namespace CapaNegocio
{
    public class LogicaUsuario
    {
        public string Select_Todos_Usuarios()
        {
            //SEGUN EL PERFIL DE USUARIO MUESTRA TODOS LOS USUARIOS REGISTRADOS.
            Usuario us = new Util().getUserData();
            int IdUsuario = us.IdTipoUsuario ==2 ? 0 : us.IdUsuario;

            DataSet ds = new DBUsuarios().Select_Todos_Usuarios(IdUsuario);
            return new Util().DataTableToJSONWithJavaScriptSerializer(ds.Tables[0]);
        }
        public DataSet Select_Tipo_Usuario()
        {
            return new DBUsuarios().Select_Tipo_Usuario();
        }
        public int Insertar_Usuario(string NomUsuario, string Identificador, string Nombres, string Apellidos, int Estado,
                                   string Correo, int IdUsuario, int TipoUsuario)
        {
            string NewPass = new Util().RandomString(10);
            int Resp = new DBUsuarios().Crear_Usuario(NomUsuario, Identificador, Nombres, Apellidos, Estado,
                                   Correo, IdUsuario, TipoUsuario);
            if (Resp > 0)
            {
                RegistraContraseña(Resp, NewPass);
                bool Flag = new Util().EnviarContraseñaNew(Correo,
                                                           Nombres + " " + Apellidos,
                                                           NewPass,
                                                           NomUsuario);
            }
               
            return Resp;
        }
        public int RegistraContraseña(int IdUsuario,string Contraseña)
        {
            return new BDLogin().Cambia_Contraseña(IdUsuario,Contraseña);
        }
        public DataSet Select_Datos_EditUsuario(int IdUsuario)
        {
            return new DBUsuarios().Select_Todos_Usuarios(IdUsuario);
        }
        public int Editar_Usuario(string NombreUsuario, string Identificador, string Nombres, string Apellidos, int IdEstado, string Correo,
                                int IdUsuarioMod, int IdTipoUsuario, int IdUsuario)
        {
            return new DBUsuarios().EditarUsuario(NombreUsuario, Identificador, Nombres, Apellidos, IdEstado, Correo,IdUsuarioMod, IdTipoUsuario, IdUsuario);
        }
        public int Elimina_Usuario(string IdUsuario, int IdUsuarioElimina)
        {
            return new DBUsuarios().Elimina_Usuario(Convert.ToInt32(new Util().Base64Decode(IdUsuario)),IdUsuarioElimina);
        }
        public int Cambia_Contraseña_Admin(string ContraseñaActual, string ContraseñaNew, int IdUsuario, int IdUsuarioCambia)
        {
            return new DBUsuarios().Cambia_Contraseña_Admin(ContraseñaActual,ContraseñaNew,IdUsuario,IdUsuarioCambia);
        }
    }
}
