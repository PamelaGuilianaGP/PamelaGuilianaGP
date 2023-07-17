using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;

namespace CapaNegocio
{
    public class LogicaReportes
    {
        public string Select_Reservas(string FechaInicio,string FechaFin)
        {
            DataSet ds = new DBReportes().Reporte_Reservas(FechaInicio,FechaFin);
            return new Util().DataTableToJSONWithJavaScriptSerializer(ds.Tables[0]);
        }
    }
}
