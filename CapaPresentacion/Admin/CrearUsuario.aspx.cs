using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static CapaNegocio.Util;

namespace CapaPresentacion.Admin
{
    public partial class CrearUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["SistemasUsuario"] != null)
            {
                if (!IsPostBack)
                {
                    Usuario us = new Util().getUserData();
                    hfIdUsuario.Value = us.IdUsuario.ToString();
                    CargarTipoUsuario();
                }
            }
            else
            {
                string path = HttpContext.Current.Request.Url.AbsolutePath + Request.Url.Query;
                Session["Url"] = path;
                Response.Redirect("Login.aspx");
            }

        }
        public void CargarTipoUsuario()
        {
            DataSet ds = new LogicaUsuario().Select_Tipo_Usuario();
            ddlTipoUsuario.DataSource = ds;
            ddlTipoUsuario.DataValueField = "ID";
            ddlTipoUsuario.DataTextField = "TIPO_USUARIO";
            ddlTipoUsuario.DataBind();
        }

        protected void BtnGuardar_Click(object sender, EventArgs e)
        {
            string Identificador = txtIdentificador.Text;
            string NombreUsuario = txtUsuario.Text;
            int IdTipoUsuario = Convert.ToInt32(ddlTipoUsuario.SelectedValue);
            string Nombres = txtNombres.Text;
            string Apellidos = txtApellidos.Text;
            string Correo = txtCorreo.Text;
            int IdEstado = Convert.ToInt32(RdActivo.SelectedValue);

            int Resp = new LogicaUsuario().Insertar_Usuario(NombreUsuario,
                                                            Identificador,
                                                            Nombres,
                                                            Apellidos,
                                                            IdEstado,
                                                            Correo,
                                                            Convert.ToInt32(hfIdUsuario.Value),
                                                            IdEstado);
            if (Resp > 0)
            {
                div_msg.Visible = true;
                lbmsg.Text = "Se registro correctamente el usuario";
                div_msgerror.Visible = false;
                lbmsgerror.Text = "";
            }
            else if (Resp==0)
            {
                div_msg.Visible = false;
                lbmsg.Text = "";
                div_msgerror.Visible = true;
                lbmsgerror.Text = "El usuario ya existe";
            }
            else if (Resp==-1)
            {
                div_msg.Visible = false;
                lbmsg.Text = "";
                div_msgerror.Visible = true;
                lbmsgerror.Text = "Ocurrio un error si persiste comunicarse con el administrador";
            }
        }
    }
}