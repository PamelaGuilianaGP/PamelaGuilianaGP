using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class DBMetodos
    {
        public DB Instancia { get; set; }
        public DBMetodos()
        {
            Instancia = new DB();
        }
        public DataSet GetDataSetSimpleQuery(string query)
        {
            return Instancia.DAExecuteSimpleQuerySelect(query);
        }
        public int Insertar_Fotos(string LinkFoto,int IdUsuarioSube)
        {
            Instancia.DAAsignarProcedure("INSERTAR_FOTOS");
            Instancia.DAAgregarParametro("@LINKFOTO", LinkFoto);
            Instancia.DAAgregarParametro("@IDUSUARIO_SUBE", IdUsuarioSube);
            return Convert.ToInt32(Instancia.DAExecuteScalar());
        }
    }
}
