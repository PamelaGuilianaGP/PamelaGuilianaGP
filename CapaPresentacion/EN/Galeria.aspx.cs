﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CapaPresentacion.EN
{
    public partial class Galeria : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarFotos();
        }
        public void CargarFotos()
        {
            GaleriaHtml.InnerHtml = new CapaNegocio.Util().Select_Galeria_EN();
        }
    }
}