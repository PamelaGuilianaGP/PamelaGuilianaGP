using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaNegocio;
using static CapaNegocio.Util;

namespace CapaPresentacion.Admin
{
    public partial class ListadoHotel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SistemasUsuario"] != null)
            {
                if (!IsPostBack)
                {
                    Usuario us = new Util().getUserData();
                    hfIdUsuario.Value = us.IdUsuario.ToString();
                }
            }
            else
            {
                string path = HttpContext.Current.Request.Url.AbsolutePath + Request.Url.Query;
                Session["Url"] = path;
                Response.Redirect("Login.aspx");
            }
        }
        [System.Web.Services.WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string ObtenerEdificio()
        {
            return new LogicaHotel().ListadoEdificio();
        }
        [System.Web.Services.WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string EncrypBase64(string Param)
        {
            return new Util().Base64Encode(Param);
        }

        
    }
}