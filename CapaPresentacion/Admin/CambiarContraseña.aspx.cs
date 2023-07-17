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
    public partial class CambiarContraseña : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SistemasUsuario"] != null)
            {
                if (!IsPostBack)
                {
                    Usuario us = new Util().getUserData();
                    hfIdUsuario.Value = us.IdUsuario.ToString();
                    lbCorreo.Text = us.Email;
                    lbUsuario.Text = us.NombreUsuario;
                }
            }
            else
            {
                string path = HttpContext.Current.Request.Url.AbsolutePath + Request.Url.Query;
                Session["Url"] = path;
                Response.Redirect("Login.aspx");
            }
        }

        protected void BtnGuardar_Click(object sender, EventArgs e)
        {
            string PassActual = txtContrasenaActual.Text;
            string PassNew = txtPassNew2.Text;
            int Resp = new LogicaUsuario().Cambia_Contraseña_Admin(PassActual,PassNew,Convert.ToInt32(hfIdUsuario.Value), Convert.ToInt32(hfIdUsuario.Value));

            if (Resp > 0)
            {
                div_msg.Visible = true;
                lbmsg.Text = "Se Guardo los cambios Correctamente";
                div_msgerror.Visible = false;
                lbmsgerror.Text = "";
            }
            else if(Resp==-1)
            {
                div_msg.Visible = false;
                lbmsg.Text = "";
                div_msgerror.Visible = true;
                lbmsgerror.Text = "La contraseña actual es incorrecta";
            }
            else if (Resp == 0)
            {
                div_msg.Visible = false;
                lbmsg.Text = "";
                div_msgerror.Visible = true;
                lbmsgerror.Text = "Ocurrio un error, si persiste comunicarse con el administrador";
            }
            else if (Resp == -2)
            {
                div_msg.Visible = false;
                lbmsg.Text = "";
                div_msgerror.Visible = true;
                lbmsgerror.Text = "La contraseña ingresada , ya se uso anteriormente por favor ingrese una diferente";
            }
        }
    }
}