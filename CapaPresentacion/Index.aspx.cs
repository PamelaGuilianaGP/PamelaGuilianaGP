using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CapaPresentacion
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarCarusel();
            CargarFotos();
        }
        public void CargarFotos()
        {
            GaleriaHtml.InnerHtml = new CapaNegocio.Util().Select_Galeria();
        }
        public void CargarCarusel()
        {
            GaleriaCarusel.InnerHtml = new CapaNegocio.Util().Select_Carusel();
        }
    }
}