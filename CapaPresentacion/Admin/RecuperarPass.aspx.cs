using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaNegocio;

namespace CapaPresentacion.Admin
{
    public partial class RecuperarPass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lbFoo_Click(object sender, EventArgs e)
        {
            div_msg.Visible = true;
            lbMsg.Text = new LogicaLogin().Select_Datos_Usuarios(txtUsuario.Text,0);
        }
    }
}