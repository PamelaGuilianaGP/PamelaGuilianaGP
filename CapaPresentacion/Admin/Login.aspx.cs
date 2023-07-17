using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaNegocio;
using static CapaNegocio.Util;

namespace CapaPresentacion.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {

            }
        }

        protected void btnEntrar_Click(object sender, EventArgs e)
        {
            string Resp = new LogicaLogin().Login(txtUser.Text,txtPass.Text);
            if (Resp == "OK")
            {
                Usuario us = new Util().ObtenerDatosuser(txtUser.Text, txtPass.Text);
                string usua = new JavaScriptSerializer().Serialize(us);
                if (us.NombreUsuario != "" && us.NombreUsuario != null)
                {
                    FormsAuthentication.Initialize();
                    FormsAuthenticationTicket tkt = new FormsAuthenticationTicket(1, txtUser.Text, DateTime.Now, DateTime.Now.AddMonths(1), true, usua, FormsAuthentication.FormsCookiePath);
                    HttpCookie ck = new HttpCookie(FormsAuthentication.FormsCookieName, FormsAuthentication.Encrypt(tkt));

                    //System.Windows.Forms.MessageBox.Show(ck)
                    Session["SistemasUsuario"] = txtUser.Text;
                    Response.Cookies.Add(ck);
                    //string strRedirect = Request["ReturnUrl"];
                    if (Session["Url"] != null)
                        Response.Redirect(new Util().SecureUrl(Session["Url"].ToString()));
                    else
                        Response.Redirect(new Util().SecureUrl("Admin/Index.aspx"));
                }
            }  
            else
                lbMsg.Text = Resp;
        }
    }
}