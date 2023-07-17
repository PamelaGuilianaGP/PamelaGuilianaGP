using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;

namespace CapaNegocio
{
    public class LogicaMetodos
    {
        public int Insertar_Fotos(string LinkFoto,int IdUsuarioSube)
        {
            return new DBMetodos().Insertar_Fotos(LinkFoto, IdUsuarioSube);
        }
    }
}
