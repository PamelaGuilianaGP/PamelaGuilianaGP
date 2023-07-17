using CapaNegocio;
using System;
using System.Web;
using System.Web.Script.Services;
using static CapaNegocio.Util;

namespace CapaPresentacion.Admin
{
    public partial class ListadoHuesped : System.Web.UI.Page
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
        public static string ObtenerHuesped()
        {
            return new LogicaHuesped().Select_Huesped();
        }
        [System.Web.Services.WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static int EliminaHuesped(int IdUsuario,string IdHuesped)
        {
            return new LogicaHuesped().Elimina_Huesped(IdUsuario,IdHuesped);
        }
    }
}