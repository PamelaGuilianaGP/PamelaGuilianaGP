using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CapaPresentacion
{
    public partial class Reserva : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [System.Web.Services.WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string ObtenerHabitacionesLibres(string FechaInicio, string FechaFin, int CantPersonas)
        {
            return new LogicaReservas().Obtener_Habitaciones_Libres(FechaInicio, FechaFin, CantPersonas);
        }
        [System.Web.Services.WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string GetHuesped(string Identificador)
        {
            return new LogicaReservas().BusquedaPredec_Huesped(Identificador);
        }
        [System.Web.Services.WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string GuardarReserva(string Identificador, string Nombres, string Apellidos, string Nacionalidad, string Telefono,
                                            string Correo, string FechaIngreso, string FechaSalida, string Comentario, string Array, int IdHuesped, int IdUsuario)
        {
            return new LogicaReservas().Reservar_Habitacion_Cliente(Identificador, Nombres, Apellidos, Nacionalidad, Telefono, Correo,
                                              FechaIngreso, FechaSalida, Comentario, Array, IdHuesped, IdUsuario);
        }
    }
}