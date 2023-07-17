using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class DBReservas
    {
        public DB Instancia { get; set; }
        public DBReservas()
        {
            Instancia = new DB();
        }
        public DataSet Select_Reservados(int Idhabitacion)
        {
            Instancia.DAAsignarProcedure("PERSONAS_RESERVADAS");
            Instancia.DAAgregarParametro("@IDHABITACION", Idhabitacion);
            return Instancia.DAExecuteDataSet();
        }
        public string Reservar_Habitacion(string Identificador,string Nombres,string Apellidos,string Nacionalidad,string Telefono,string Correo,
                                           string FechaIngreso,string FechaSalida,string Comentario,int Idhabitacion,int IdHuesped,int IdUsuario)
        {
            Instancia.DAAsignarProcedure("RESERVAR_HABITACION");
            Instancia.DAAgregarParametro("@IDEN", Identificador);
            Instancia.DAAgregarParametro("@NOMBRES", Nombres);
            Instancia.DAAgregarParametro("@APELLIDOS", Apellidos);
            Instancia.DAAgregarParametro("@NACIONALIDAD", Nacionalidad);
            Instancia.DAAgregarParametro("@TELEFONO", Telefono);
            Instancia.DAAgregarParametro("@CORREO", Correo);
            Instancia.DAAgregarParametro("@FECHAINGRESO", FechaIngreso);
            Instancia.DAAgregarParametro("@FECHASALIDA", FechaSalida);
            Instancia.DAAgregarParametro("@COMENTARIO", Comentario);
            Instancia.DAAgregarParametro("@IDHABITACION", Idhabitacion);
            Instancia.DAAgregarParametro("@IDHUESPED", IdHuesped);
            Instancia.DAAgregarParametro("@IDUSUARIO", IdUsuario);
            return Instancia.DAExecuteScalar().ToString();
        }

        public DataSet BusquedaPredec_Huesped(string Identificador)
        {
            Instancia.DAAsignarProcedure("BUSQUEDAPREDEC_HUESPED");
            Instancia.DAAgregarParametro("@IDENTIFICADOR", Identificador);
            return Instancia.DAExecuteDataSet();
        }
        public string Realizar_CheckIN_CheckOUT(int IdReserva,int IdUsuario,string Tipo)
        {
            Instancia.DAAsignarProcedure("REALIZAR_CHECKIN_CHECKOUT");
            Instancia.DAAgregarParametro("@IDRESERVA", IdReserva);
            Instancia.DAAgregarParametro("@IDUSUARIO", IdUsuario);
            Instancia.DAAgregarParametro("@TIPO", Tipo);
            return Instancia.DAExecuteScalar().ToString();

        }
        public DataSet Reservas_Por_Habitacion(int IdHabitacion)
        {
            Instancia.DAAsignarProcedure("SELECT_RESERVAS_HABITACION");
            Instancia.DAAgregarParametro("@IDHABITACION", IdHabitacion);
            return Instancia.DAExecuteDataSet();
        }
        public string Eliminar_Reserva(int IdReserva,int IdUsuario,string Comentario)
        {
            Instancia.DAAsignarProcedure("ELIMINAR_RESERVA");
            Instancia.DAAgregarParametro("@IDRESERVA", IdReserva);
            Instancia.DAAgregarParametro("@IDUSUARIO", IdUsuario);
            Instancia.DAAgregarParametro("@COMENTARIO", Comentario);
            return Instancia.DAExecuteScalar().ToString();
        }
        public DataSet Obtener_Habitaciones_Libres(string FechaInicio,string FechaFin,int Personas)
        {
            Instancia.DAAsignarProcedure("SELECT_HABITACIONES_LIBRES");
            Instancia.DAAgregarParametro("@FECHAINICIO", FechaInicio);
            Instancia.DAAgregarParametro("@FECHAFIN", FechaFin);
            Instancia.DAAgregarParametro("@CANTPERSONAS", Personas);
            return Instancia.DAExecuteDataSet();
        }
        public DataSet Obtenerer_Tipo_Moneda()
        {
            Instancia.DAAsignarProcedure("SELECT_MONEDAS");
            return Instancia.DAExecuteDataSet();
        }
    }
}
