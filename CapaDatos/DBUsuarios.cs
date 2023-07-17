using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class DBUsuarios
    {
        public DB Instancia { get; set; }
        public DBUsuarios()
        {
            Instancia = new DB();
        }
        public DataSet Select_Todos_Usuarios(int IdUsuario)
        {
            Instancia.DAAsignarProcedure("SELECT_TODOS_USUARIOS");
            Instancia.DAAgregarParametro("@IDUSUARIO", IdUsuario);
            return Instancia.DAExecuteDataSet();
        }
        public DataSet Select_Tipo_Usuario()
        {
            Instancia.DAAsignarProcedure("SELECT_TIPO_USUARIO");
            return Instancia.DAExecuteDataSet();
        }

        public int Crear_Usuario(string NomUsuario,string Identificador,string Nombres,string Apellidos,int Estado,
                                   string Correo,int IdUsuario,int TipoUsuario)
        {
            Instancia.DAAsignarProcedure("CREAR_USUARIO");
            Instancia.DAAgregarParametro("@NOMBREUSUARIO", NomUsuario);
            Instancia.DAAgregarParametro("@IDENTIFICADOR", Identificador);
            Instancia.DAAgregarParametro("@NOMBRES", Nombres);
            Instancia.DAAgregarParametro("@APELLIDOS", Apellidos);
            Instancia.DAAgregarParametro("@ESTADO", Estado);
            Instancia.DAAgregarParametro("@CORREO", Correo);
            Instancia.DAAgregarParametro("@IDUSUARIO_REGISTRA", IdUsuario);
            Instancia.DAAgregarParametro("@TIPOUSUARIO", TipoUsuario);
            return Convert.ToInt32(Instancia.DAExecuteScalar().ToString());

        }
        public int EditarUsuario(string NombreUsuario,string Identificador,string Nombres,string Apellidos,int IdEstado,string Correo,
                                int IdUsuarioMod,int IdTipoUsuario,int IdUsuario)
        {
            Instancia.DAAsignarProcedure("EDITAR_USUARIO");
            Instancia.DAAgregarParametro("@NOMBREUSUARIO", NombreUsuario);
            Instancia.DAAgregarParametro("@IDENTIFICADOR", Identificador);
            Instancia.DAAgregarParametro("@NOMBRES", Nombres);
            Instancia.DAAgregarParametro("@APELLIDOS", Apellidos);
            Instancia.DAAgregarParametro("@ESTADO", IdEstado);
            Instancia.DAAgregarParametro("@CORREO", Correo);
            Instancia.DAAgregarParametro("@IDUSUARIOMOD", IdUsuarioMod);
            Instancia.DAAgregarParametro("@IDTIPOUSUARIO", IdTipoUsuario);
            Instancia.DAAgregarParametro("@IDUSUARIO", IdUsuario);
            return Convert.ToInt32(Instancia.DAExecuteScalar().ToString());
        }
        public int Elimina_Usuario(int IdUsuario,int IdUsuarioElimina)
        {
            Instancia.DAAsignarProcedure("ELIMINAR_USUARIO");
            Instancia.DAAgregarParametro("@IDUSUARIO", IdUsuario);
            Instancia.DAAgregarParametro("@IDUSUARIOELIMINA", IdUsuarioElimina);
            return Convert.ToInt32(Instancia.DAExecuteScalar().ToString());
        }
        public int Cambia_Contraseña_Admin(string ContraseñaActual,string ContraseñaNew,int IdUsuario,int IdUsuarioCambia)
        {
            Instancia.DAAsignarProcedure("CAMBIAR_CONTRASEÑA_ADMIN");
            Instancia.DAAgregarParametro("@CONTRASEÑA_ACTUAL", ContraseñaActual);
            Instancia.DAAgregarParametro("@CONTRASEÑA_NEW", ContraseñaNew);
            Instancia.DAAgregarParametro("@IDUSUARIO", IdUsuario);
            Instancia.DAAgregarParametro("@IDUSUARIO_CAMBIA", IdUsuarioCambia);
            return Convert.ToInt32(Instancia.DAExecuteScalar().ToString());
        }
    }
}
