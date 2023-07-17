using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class DBHuesped
    {
        public DB Instancia { get; set; }
        public DBHuesped()
        {
            Instancia = new DB();
        }

        public DataSet Select_Huesped(int IdHuesped)
        {
            Instancia.DAAsignarProcedure("SELECT_HUESPED");
            Instancia.DAAgregarParametro("@IDHUESPED", IdHuesped);
            return Instancia.DAExecuteDataSet();
        }
        public int Elimina_Huesped(int IdUsuario,int IdHuesped)
        {
            Instancia.DAAsignarProcedure("ELIMINAR_HUESPED");
            Instancia.DAAgregarParametro("@IDHUESPED", IdHuesped);
            Instancia.DAAgregarParametro("@IDUSUARIO_DEL", IdUsuario);
            return Convert.ToInt32(Instancia.DAExecuteScalar());
        }
        public int Valida_Identidicador_Huesped(string Identificador)
        {
            Instancia.DAAsignarProcedure("VALIDA_IDENTIFICADOR_HUESPED");
            Instancia.DAAgregarParametro("@IDENTIFICADOR", Identificador);
            return Convert.ToInt32(Instancia.DAExecuteScalar());
        }
        public int Crear_Huesped(string Identificador,string Nombres,string Apellidos,string Nacionalidad,string Telefono,
                                string Correo,int IdEstado,int IdUsuario)
        {
            Instancia.DAAsignarProcedure("CREAR_HUESPED");
            Instancia.DAAgregarParametro("@IDEN", Identificador);
            Instancia.DAAgregarParametro("@NOMBRES", Nombres);
            Instancia.DAAgregarParametro("@APELLIDOS", Apellidos);
            Instancia.DAAgregarParametro("@NACIONALIDAD", Nacionalidad);
            Instancia.DAAgregarParametro("@TELEFONO", Telefono);
            Instancia.DAAgregarParametro("@CORREO", Correo);
            Instancia.DAAgregarParametro("@ESTADO", IdEstado);
            Instancia.DAAgregarParametro("@IDUSUARIO", IdUsuario);
            return Convert.ToInt32(Instancia.DAExecuteScalar());
        }
        public int Edit_Huesped(string Identificador, string Nombres, string Apellidos, string Nacionalidad, string Telefono,
                                string Correo, int IdEstado, int IdUsuario,int IdHuesped)
        {
            Instancia.DAAsignarProcedure("EDIT_HUESPED");
            Instancia.DAAgregarParametro("@IDEN", Identificador);
            Instancia.DAAgregarParametro("@NOMBRES", Nombres);
            Instancia.DAAgregarParametro("@APELLIDOS", Apellidos);
            Instancia.DAAgregarParametro("@NACIONALIDAD", Nacionalidad);
            Instancia.DAAgregarParametro("@TELEFONO", Telefono);
            Instancia.DAAgregarParametro("@CORREO", Correo);
            Instancia.DAAgregarParametro("@ESTADO", IdEstado);
            Instancia.DAAgregarParametro("@IDUSUARIO", IdUsuario);
            Instancia.DAAgregarParametro("@IDHUESPED", IdHuesped);
            return Convert.ToInt32(Instancia.DAExecuteScalar());
        }
    }
}
