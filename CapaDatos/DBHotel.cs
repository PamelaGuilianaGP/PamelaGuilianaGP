using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class DBHotel
    {
        public DB Instancia { get; set; }
        public DBHotel()
        {
            Instancia = new DB();
        }
        public int CrearHotel(string NomHotel,string Descripcion,int NumeroPisos,int IdUsuario)
        {
            Instancia.DAAsignarProcedure("CREAR_EDIFICIO");
            Instancia.DAAgregarParametro("@NOM_HOTEL", NomHotel);
            Instancia.DAAgregarParametro("@DESCRIPCION", Descripcion);
            Instancia.DAAgregarParametro("@PISOS", NumeroPisos);
            Instancia.DAAgregarParametro("@IDUSUARIO", IdUsuario);
            
            return Convert.ToInt32(Instancia.DAExecuteScalar());
        }

        public DataSet SelectDatos_Hotel(int IdEdificio)
        {
            Instancia.DAAsignarProcedure("SELECTDATOS_EDIFICIO");
            Instancia.DAAgregarParametro("@ID_EDIFICIO", IdEdificio);
            return Instancia.DAExecuteDataSet();
        }
        public DataSet Select_Galeria(int Top)
        {
            Instancia.DAAsignarProcedure("SELECT_GALERIA");
            Instancia.DAAgregarParametro("@TOP", Top);
            return Instancia.DAExecuteDataSet();
        }
        public int CreaActualizaEdifico(int IdHotel,string NombreHotel,int Pisos,string Desc,int NumeroPisos,int IdEstadoHotel,
                                        int Idhabitacion,int IdEstadoHab,int NHab,int NCamas,int IdTipoMoneda,decimal Precio,int IdUsuario)
        {
            Instancia.DAAsignarProcedure("CREAEDITAEDIFICIO");
            Instancia.DAAgregarParametro("@IDHOTEL", IdHotel);
            Instancia.DAAgregarParametro("@NOMBRE", NombreHotel);
            Instancia.DAAgregarParametro("@PISOS", Pisos);
            Instancia.DAAgregarParametro("@DESCRIPCION", Desc);
            Instancia.DAAgregarParametro("@NPISO", NumeroPisos);
            Instancia.DAAgregarParametro("@IDESTADO_HOTEL", IdEstadoHotel);
            Instancia.DAAgregarParametro("@IDHABITACION", Idhabitacion);
            Instancia.DAAgregarParametro("@IDESTADO_HAB", IdEstadoHab);
            Instancia.DAAgregarParametro("@NUMHAB", NHab);
            Instancia.DAAgregarParametro("@NUMCAMAS", NCamas);
            Instancia.DAAgregarParametro("@IDUSUARIO", IdUsuario);
            Instancia.DAAgregarParametro("@IDTIPOMONEDA", IdTipoMoneda);
            Instancia.DAAgregarParametro("@PRECIO", Precio);
            return Convert.ToInt32(Instancia.DAExecuteScalar());
        }
        public DataSet Select_Datos_habitacion(int IdEdificio,int IdPiso)
        {
            Instancia.DAAsignarProcedure("SELECT_DATOS_HABITACION");
            Instancia.DAAgregarParametro("@IDEDIFICIO", IdEdificio); 
            Instancia.DAAgregarParametro("@IDPISO", IdPiso);
            return Instancia.DAExecuteDataSet();
        }
        public int EliminaHabitacion(int IdHabitacion,int IdUsuario)
        {
            Instancia.DAAsignarProcedure("ELIMINAR_HABITACION");
            Instancia.DAAgregarParametro("@IDHABITACION", IdHabitacion);
            Instancia.DAAgregarParametro("@IDUSUARIO", IdUsuario);
            
            return Convert.ToInt32(Instancia.DAExecuteScalar());
        }
        public DataSet Select_Carusel()
        {
            Instancia.DAAsignarProcedure("SELECT_GALERIA_CARUSEL");
            return Instancia.DAExecuteDataSet();
        }
        public DataSet Select_Galeria_Edit()
        {
            Instancia.DAAsignarProcedure("SELECT_GALERIA_EDIT");
            return Instancia.DAExecuteDataSet();
        }
    }
}
