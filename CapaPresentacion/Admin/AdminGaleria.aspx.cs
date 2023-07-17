using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static CapaNegocio.Util;

namespace CapaPresentacion.Admin
{
    public partial class AdminGaleria : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SistemasUsuario"] != null)
            {
                if (!IsPostBack)
                {
                    Usuario us = new Util().getUserData();
                    hfIdUsuario.Value = us.IdUsuario.ToString();
                    CargaDatos();
                }
            }
            else
            {
                string path = HttpContext.Current.Request.Url.AbsolutePath + Request.Url.Query;
                Session["Url"] = path;
                Response.Redirect("Login.aspx");
            }
        }

        public void CargaDatos()
        {
            DataSet ds = new Util().Select_Galeria_Edit();

            GvGaleria.DataSource = ds.Tables[0];
            GvGaleria.DataBind();
        }

        protected void GvGaleria_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)

            {
                LinkButton lb = e.Row.FindControl("BtnEliminar") as LinkButton;
                ScriptManager sm = ScriptManager.GetCurrent(this);
                sm.RegisterAsyncPostBackControl(lb);

                RadioButtonList ddl = e.Row.FindControl("RdActivo") as RadioButtonList;
                ddl.SelectedValue = (e.Row.FindControl("LbActivo") as Label).Text;

                RadioButtonList rdPortada = e.Row.FindControl("RdPortada") as RadioButtonList;
                rdPortada.SelectedValue = (e.Row.FindControl("LbPortada") as Label).Text;
            }
        }

        protected void btnSubirFotos_Click(object sender, EventArgs e)
        {
            string MensajeError="";
            if (FileUpload.PostedFile != null && FileUpload.PostedFile.ContentLength > 0)
            {
                foreach (HttpPostedFile uploadedFile in FileUpload.PostedFiles)
                {
                    bool Flag;
                    string folder = Server.MapPath("~/images/");
                    string fileName = Path.GetFileName(uploadedFile.FileName);

                    uploadedFile.SaveAs(Path.Combine(folder, uploadedFile.FileName));
                    try
                    {
                        Flag = true;
                    }
                    catch
                    {
                        Flag = false;
                    }
                    if (Flag)
                    {
                        int Resp = new LogicaMetodos().Insertar_Fotos("images/"+ fileName,Convert.ToInt32(hfIdUsuario.Value));
                        if (Resp == 0)
                            MensajeError += fileName + " no se subió , ocurrio un error</br>";

                        if (Resp==2)
                            MensajeError += fileName + " no se subió , ya existe una foto con el mismo nombre</br>";
                    }
                }

                if (MensajeError=="")
                {
                    div_msg.Visible = true;
                    lbmsg.Text = "Se subió todas las fotos correctamente";
                    div_msgerror.Visible = false;
                    lbmsgerror.Text = "";
                }
                else
                {
                    div_msg.Visible = false;
                    lbmsg.Text = "";
                    div_msgerror.Visible = true;
                    lbmsgerror.Text = "Las Siguentes fotos no se subieron por el siguente motivo:</br>"+ MensajeError;
                }
            }
        }
    }
}