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
    public partial class EditUsuario : System.Web.UI.Page
    {
        public static int IdUsuarioVictima;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SistemasUsuario"] != null)
            {
                if (!IsPostBack)
                {
                    Usuario us = new Util().getUserData();
                    hfIdUsuario.Value = us.IdUsuario.ToString();
                    IdUsuarioVictima = Request.QueryString["IdUsuario"] !="" && Request.QueryString["IdUsuario"] !=null? Convert.ToInt32(new Util().Base64Decode(Request.QueryString["IdUsuario"])) : us.IdUsuario;
                    CargarDatosUsuario();
                }
            }
            else
            {
                string path = HttpContext.Current.Request.Url.AbsolutePath + Request.Url.Query;
                Session["Url"] = path;
                Response.Redirect("Login.aspx");
            }
        }
        public void CargarDatosUsuario()
        {
            DataSet ds = new LogicaUsuario().Select_Datos_EditUsuario(IdUsuarioVictima);
            if (ds.Tables[0].Rows.Count>0)
            {
                txtIdentificador.Text = ds.Tables[0].Rows[0]["IDENTIFICADOR"].ToString();
                txtNombres.Text = ds.Tables[0].Rows[0]["NOMBRES"].ToString();
                txtUsuario.Text = ds.Tables[0].Rows[0]["NOMBREUSUARIO"].ToString();
                txtApellidos.Text = ds.Tables[0].Rows[0]["APELLIDOS"].ToString();
                txtCorreo.Text = ds.Tables[0].Rows[0]["CORREO"].ToString();
                RdActivo.SelectedValue = ds.Tables[0].Rows[0]["IDESTADO"].ToString();
                CargarTipoUsuario();
                ddlTipoUsuario.SelectedValue = ds.Tables[0].Rows[0]["IDTIPO"].ToString();
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
            int Resp = new LogicaUsuario().Editar_Usuario(txtUsuario.Text, txtIdentificador.Text, txtNombres.Text, txtApellidos.Text,
                                                           Convert.ToInt32(RdActivo.SelectedValue), txtCorreo.Text,Convert.ToInt32(hfIdUsuario.Value)
                                                           ,Convert.ToInt32(ddlTipoUsuario.SelectedValue),IdUsuarioVictima);
            if (Resp > 0)
            {
                div_msg.Visible = true;
                lbmsg.Text = "Se actualizó correctamente los datos del usuario";
                div_msgerror.Visible = false;
                lbmsgerror.Text = "";
            }
            else if (Resp == 0)
            {
                div_msg.Visible = false;
                lbmsg.Text = "";
                div_msgerror.Visible = true;
                lbmsgerror.Text = "Ocurrio un error , si persiste comunicarque con el administrador";
            }
            else if (Resp == -1)
            {
                div_msg.Visible = false;
                lbmsg.Text = "";
                div_msgerror.Visible = true;
                lbmsgerror.Text = "El identificador que desea cambiar ya esta registrado con otro usuario";
            }
        }
    }
}