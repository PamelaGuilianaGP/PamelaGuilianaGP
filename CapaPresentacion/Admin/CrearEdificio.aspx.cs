using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaNegocio;
using static CapaNegocio.Util;

namespace CapaPresentacion.Admin
{
    public partial class CrearEdificio : System.Web.UI.Page
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

        protected void BtnGuardarHotel_Click(object sender, EventArgs e)
        {
            int Resp = new LogicaHotel().CrearHotel(txtEdificio.Text,
                                                    txtDesc.Text,
                                                    Convert.ToInt32(txtPisos.Text),
                                                    Convert.ToInt32(hfIdUsuario.Value));
            if (Resp>0)
            {
                lbMsg.Text = Resp.ToString();
                ScriptManager.RegisterStartupScript(this, typeof(Page), "invocarfuncion", "MostrarAlerta();", true);
                Response.Redirect("EditarEdificio.aspx?IdEdificio="+ new Util().Base64Encode(Resp.ToString()));
            }
            else
            {
                lbMsg.Text = Resp.ToString();
                ScriptManager.RegisterStartupScript(this, typeof(Page), "invocarfuncion", "MostrarAlerta();", true);
            }
                
        }
    }
}