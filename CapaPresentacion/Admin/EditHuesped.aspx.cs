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
    public partial class EditHuesped : System.Web.UI.Page
    {
        public static int IdHUesped;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SistemasUsuario"] != null)
            {
                if (!IsPostBack)
                {
                    Usuario us = new Util().getUserData();
                    hfIdUsuario.Value = us.IdUsuario.ToString();
                    IdHUesped = Convert.ToInt32(new Util().Base64Decode(Request.QueryString["IdHuesped"]));
                    CargaDatosHuesped();
                }
            }
            else
            {
                string path = HttpContext.Current.Request.Url.AbsolutePath + Request.Url.Query;
                Session["Url"] = path;
                Response.Redirect("Login.aspx");
            }

        }
        public void CargaDatosHuesped()
        {
            DataSet ds = new LogicaHuesped().Datos_Huesped_Por_Id(IdHUesped);
            if (ds.Tables[0].Rows.Count>0)
            {
                txtIdentificador.Text = ds.Tables[0].Rows[0]["IDENTIFICADOR"].ToString();
                txtNombres.Text = ds.Tables[0].Rows[0]["NOMBRES"].ToString();
                txtApellidos.Text = ds.Tables[0].Rows[0]["APELLIDOS"].ToString();
                txtCorreo.Text = ds.Tables[0].Rows[0]["CORREO"].ToString();
                txtNacionalidad.Text = ds.Tables[0].Rows[0]["NACIONALIDAD"].ToString();
                txtTelefono.Text = ds.Tables[0].Rows[0]["TELEFONO"].ToString();
                RdActico.SelectedValue = ds.Tables[0].Rows[0]["IDESTADO"].ToString();
            }

        }

        protected void BtnGuardar_Click(object sender, EventArgs e)
        {
            int Resp = new LogicaHuesped().Edit_Huesped(txtIdentificador.Text,
                                                        txtNombres.Text,
                                                        txtApellidos.Text,
                                                        txtNacionalidad.Text,
                                                        txtTelefono.Text,
                                                        txtCorreo.Text,
                                                        Convert.ToInt32(RdActico.SelectedValue),
                                                        Convert.ToInt32(hfIdUsuario.Value),
                                                        IdHUesped);
            if (Resp > 0)
            {
                div_msg.Visible = true;
                lbmsg.Text = "Se Guardo los cambios Correctamente";
                div_msgerror.Visible = false;
                lbmsgerror.Text = "";
            }
            else if (Resp == -1)
            {
                div_msg.Visible = false;
                lbmsg.Text = "";
                div_msgerror.Visible = true;
                lbmsgerror.Text = "El identificador que desea ingresar ya esta asociado a otra persona";
            }
            else if (Resp==0)
            {
                div_msg.Visible = false;
                lbmsg.Text = "";
                div_msgerror.Visible = true;
                lbmsgerror.Text = "Ha Ocurrido un error si persiste comunicarse con el administrador";
            }
        }
    }
}