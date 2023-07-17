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
    public partial class CrearHuesped : System.Web.UI.Page
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

        protected void BtnGuardar_Click(object sender, EventArgs e)
        {
            int Resp = new LogicaHuesped().Crear_Huesped(txtIdentificador.Text,
                                                        txtNombres.Text,
                                                        txtApellidos.Text,
                                                        txtNacionalidad.Text,
                                                        txtTelefono.Text,
                                                        txtCorreo.Text,
                                                        Convert.ToInt32(RdActico.SelectedValue),
                                                        Convert.ToInt32(hfIdUsuario.Value));
            if (Resp > 0)
            {
                div_msg.Visible = true;
                lbmsg.Text = "Se Guardo los cambios Correctamente";
                div_msgerror.Visible = false;
                lbmsgerror.Text = "";
            }
            else
            {
                div_msg.Visible = false;
                lbmsg.Text = "";
                div_msgerror.Visible = true;
                lbmsgerror.Text = "Ha Ocurrido un error si persiste comunicarse con el administrador";
            }
        }
        [System.Web.Services.WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static int Valida_Identicador_Huesped(string Identificador)
        {
            return new LogicaHuesped().Valida_Identificador_Huesped(Identificador);
        }
    }
}