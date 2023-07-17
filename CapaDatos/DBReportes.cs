using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class DBReportes
    {
        public DB Instancia { get; set; }
        public DBReportes()
        {
            Instancia = new DB();
        }
        public DataSet Reporte_Reservas(string Fecha_Inicio,string Fecha_Fin)
        {
            Instancia.DAAsignarProcedure("REPORTE_RESERVAS");
            Instancia.DAAgregarParametro("@FECHAINICIO", Fecha_Inicio);
            Instancia.DAAgregarParametro("@FECHAFIN", Fecha_Fin);
            return Instancia.DAExecuteDataSet();
        }
    }
}
