﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CapaPresentacion.EN
{
    public partial class MasterPageEN : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarFotos();
        }
        public void CargarFotos()
        {
            GaleriaHtml.InnerHtml = new CapaNegocio.Util().Select_Galeria_MasterEN(0);
            GaleriaHtmlHead.InnerHtml = new CapaNegocio.Util().Select_Galeria_MasterEN(1);
        }
    }
}