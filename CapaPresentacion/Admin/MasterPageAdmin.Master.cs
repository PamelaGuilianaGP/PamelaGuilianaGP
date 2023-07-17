using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static CapaNegocio.Util;

namespace CapaPresentacion.Admin
{
    public partial class MasterPageAdmin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario us = new Util().getUserData();
            LbNombreUsuario.Text = us.NombreUsuario.ToUpper();
            LbTipoUsuario.Text = us.TipoUsuario;
            NomUser.Text = us.NombreUsuario.ToUpper();
        }
    }
}