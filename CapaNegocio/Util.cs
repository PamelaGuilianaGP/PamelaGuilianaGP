using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Security;
using System.Web.UI.WebControls;
using CapaDatos;
using Newtonsoft.Json;
using static CapaNegocio.LogicaReservas;
using System.IO;

namespace CapaNegocio
{
    public class Util
    {
        public Usuario getUserData()
        {
            try
            {

                HttpCookie cookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName];
                FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(cookie.Value);
                Usuario us = new Usuario();
                JavaScriptSerializer serializer1 = new JavaScriptSerializer();
                us = (Usuario)serializer1.Deserialize(ticket.UserData, us.GetType());

                return us;

            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public string ConvertirFechaParaBD(object fecha)
        {
            DateTime fec_user;
            string fec_usuario = "19000101";
            if (fecha != null)
            {
                if (fecha.ToString() != "")
                {
                    if (DateTime.TryParseExact(fecha.ToString(), "dd-MM-yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out fec_user))
                    {
                        fec_usuario = fec_user.ToString("yyyyMMdd");
                    }
                    else
                    {
                        fec_usuario = W4ToDateTime(fecha).ToString("yyyyMMdd");
                    }
                }
            }
            return fec_usuario;
        }
        public DateTime W4ToDateTime(object fecha)
        {
            DateTime fecreturn = new DateTime();
            DateTime fec_user;
            try
            {
                if (fecha != null)
                {
                    if (fecha.ToString() != "")
                    {
                        if (DateTime.TryParseExact(fecha.ToString(), "dd-MM-yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out fec_user))
                        {
                            fecreturn = fec_user;
                        }
                        else if (DateTime.TryParseExact(fecha.ToString(), "yyyyMMdd", CultureInfo.InvariantCulture, DateTimeStyles.None, out fec_user))
                        {
                            fecreturn = fec_user;
                        }
                        else if (DateTime.TryParse(fecha.ToString(), CultureInfo.InvariantCulture, DateTimeStyles.None, out fec_user))
                        {
                            fecreturn = fec_user;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                return fecreturn;
            }
            return fecreturn;
        }
        public string SecureUrl(string url)
        {
            url = url.Replace("//", "/");
            string ruta = ConfigurationManager.AppSettings["DirectorioRaiz"].ToString() + url;
            ruta.Replace("'", "").Replace("<", "").Replace(">", "");
            return ruta;
        }
        public Usuario ObtenerDatosuser(string Usuario, string Password)
        {
            Usuario us = new Usuario();
            DataSet ds = new  BDLogin().Obtener_Datos_Usuario(Usuario, Password);
            if (ds.Tables[0].Rows.Count > 0)
            {
                us.NombreUsuario = Usuario.ToString();
                us.IdUsuario = Convert.ToInt32(ds.Tables[0].Rows[0]["IDUSUARIO"]);
                us.Email = ds.Tables[0].Rows[0]["CORREO"].ToString();
                us.IdTipoUsuario = Convert.ToInt32(ds.Tables[0].Rows[0]["TIPOUSUARIO"]);
                us.Nombres = ds.Tables[0].Rows[0]["NOMBRES"].ToString();
                us.Apellidos = ds.Tables[0].Rows[0]["APELLIDOS"].ToString();
                us.TipoUsuario = ds.Tables[0].Rows[0]["TIPO_USUARIO"].ToString();
            }
            return us;
        }
        public string Base64Encode(string plainText)
        {
            var plainTextBytes = System.Text.Encoding.UTF8.GetBytes(plainText);
            return System.Convert.ToBase64String(plainTextBytes);
        }
        public string Base64Decode(string base64EncodedData)
        {
            var base64EncodedBytes = System.Convert.FromBase64String(base64EncodedData);
            return System.Text.Encoding.UTF8.GetString(base64EncodedBytes);
        }
        public string DataTableToJSONWithJavaScriptSerializer(DataTable table)
        {
            JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
            List<Dictionary<string, object>> parentRow = new List<Dictionary<string, object>>();
            Dictionary<string, object> childRow;
            foreach (DataRow row in table.Rows)
            {
                childRow = new Dictionary<string, object>();
                foreach (DataColumn col in table.Columns)
                {
                    childRow.Add(col.ColumnName, row[col]);
                }
                parentRow.Add(childRow);
            }
            return jsSerializer.Serialize(parentRow);
        }
        public DataTable ConvertGVDatatable(GridView gv)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("IdHabitacion", typeof(Int32));
            dt.Columns.Add("IdEstado", typeof(Int32));
            dt.Columns.Add("NumHabitacion", typeof(string));
            dt.Columns.Add("NumCamas", typeof(Int32));
            dt.Columns.Add("Precio", typeof(decimal));
            dt.Columns.Add("IdTipoMoneda", typeof(Int32));

            foreach (GridViewRow item in gv.Rows)
            {
                int IdHabitacion = Convert.ToInt32((item.FindControl("LdIdHabitacion") as Label).Text);
                int IdEstado = Convert.ToInt32((item.FindControl("ddlEstado") as DropDownList).SelectedValue);
                int NumHabitacion = Convert.ToInt32((item.FindControl("LbNumeroHabitacion") as Label).Text);
                int NumCamas = Convert.ToInt32((item.FindControl("txtNroCamashab") as TextBox).Text);
                decimal Precio = Convert.ToDecimal((item.FindControl("txtPrecio") as TextBox).Text);
                int IdTipoMoneda = Convert.ToInt32((item.FindControl("dllTipoMoneda") as DropDownList).SelectedValue);
                dt.Rows.Add(IdHabitacion, IdEstado, NumHabitacion, NumCamas, Precio, IdTipoMoneda);
            }
            return dt;
        }
        public DataSet GetDataSetSimpleQuery(string query)
        {
            try
            {
                return new DBMetodos().GetDataSetSimpleQuery(query);
            }
            catch (Exception ex)
            { throw ex; }
        }
        public string RandomString(int length)
        {
            Random random = new Random();
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            return new string(Enumerable.Repeat(chars, length)
              .Select(s => s[random.Next(s.Length)]).ToArray());
        }
        public bool EnviaCorreoRecuperar_Contraseña(string Correo,string NombresCompletos,string ContraseñaNew,string Usuario)
        {
            bool flag = false;
            string Cuerpo = "<div style='width: 100%'>" +
               "<div style='height: 130px;background-color: #D8D8D8;text-align: center;'>" +
                   "<img src='" + ConfigurationManager.AppSettings["LogoDeCorreos"] + "' style='height: 100px;width: 100px;padding: 9px;'>" +
               "</div>" +
               "<div style='margin-left: 15px;'>" +
                   "<h3>Estimado(a): "+ Usuario + "-"+ NombresCompletos + "</h3><br><br>" +
                   "<h3>Se adjunta contraseña temporal</h3>" +
                   "<table width = '100%' border='1' cellpadding='0' cellspacing='0'>" +
                       "<tr><td colspan='2' align='center' style='background-color:#454b52;color:white;'><strong>RECUPERACION DE CONTRASEÑA</strong></td></tr>" +
                       "<tr><td>Contraseña</td><td>" + ContraseñaNew + "</td></tr>" +
                   "</table>" +
               "</div><br>" +
               "<a href='"+ new Util().SecureUrl("Admin/Login.aspx") + "'>Clic Aquí para iniciar sesion</a><br>" +
               "<h3>Si ud. no fue quien intento recuperar su contraseña , se recomienda cambiarla </h3>" +
               "<div style='height: 80px;background-color: #D8D8D8;text-align: center;'>" +
                   "<h5 style='padding: 30px;'>Atentamente Servicio de Correo Paco Hostel </br>" + DateTime.Now + "</h5>" +
               "</div>" +
           "</div>";
            flag = EnvioCorreo(Correo, "Recuperacion de Contraseña - Paco Hostel", Cuerpo);
            return flag;
        }
        public bool EnviarContraseñaNew(string Correo, string NombresCompletos, string ContraseñaNew, string Usuario)
        {
            bool flag = false;
            string Cuerpo = "<div style='width: 100%'>" +
               "<div style='height: 130px;background-color: #D8D8D8;text-align: center;'>" +
                   "<img src='" + ConfigurationManager.AppSettings["LogoDeCorreos"] + "' style='height: 100px;width: 100px;padding: 9px;'>" +
               "</div>" +
               "<div style='margin-left: 15px;'>" +
                   "<h3>Estimado(a): " + Usuario + "-" + NombresCompletos + "</h3><br><br>" +
                   "<h3>Se adjunta contraseña temporal</h3>" +
                   "<table width = '100%' border='1' cellpadding='0' cellspacing='0'>" +
                       "<tr><td colspan='2' align='center' style='background-color:#454b52;color:white;'><strong>CONTRASEÑA DE REGISTRO</strong></td></tr>" +
                       "<tr><td>Contraseña</td><td>" + ContraseñaNew + "</td></tr>" +
                   "</table>" +
               "</div><br>" +
               "<a href='" + new Util().SecureUrl("Admin/Login.aspx") + "'>Clic Aquí para iniciar sesion</a><br>" +
               "<div style='height: 80px;background-color: #D8D8D8;text-align: center;'>" +
                   "<h5 style='padding: 30px;'>Atentamente Servicio de Correo Paco Hostel </br>" + DateTime.Now + "</h5>" +
               "</div>" +
           "</div>";
            flag = EnvioCorreo(Correo, "Recuperacion de Contraseña - Paco Hostel", Cuerpo);
            return flag;
        }
        public bool EnviaCorreoReservaEN(string Identificador, string NombresCompletos, string CorreoHuesped, string json, string FechaEntrada, string FechaSalida)
        {
            bool flag = false;
            string Cuerpo = "";
            string CuerpoEmail = "";
            Habitacion[] results = JsonConvert.DeserializeObject<Habitacion[]>(json);
            foreach (DataRow row in ObjectToData(results).Rows)
            {
                CuerpoEmail += "<tr><td>Habitacion:</td><td>Nro:" + row["NUMERO"].ToString() + " Piso:" + row["PISO"].ToString() + " Cupos Reservados:" + row["CAMAS"].ToString() + "</td></tr>";
            }
            Cuerpo = "<div style='width: 100%'>" +
                "<div style='height: 130px;background-color: #D8D8D8;text-align: center;'>" +
                    "<img src='" + ConfigurationManager.AppSettings["LogoDeCorreos"] + "' style='height: 100px;width: 100px;padding: 9px;'>" +
                "</div>" +
                "<div style='margin-left: 15px;'>" +
                    "<h3>Estimado(a): </h3>" +
                    "<table width = '100%' border='1' cellpadding='0' cellspacing='0'>" +
                        "<tr><td colspan='2' align='center' style='background-color:#454b52;color:white;'><strong>DATOS DE LA RESERVA</strong></td></tr>" +
                            "<tr><td>Identifier</td><td>" + Identificador + "</td></tr>" +
                            "<tr><td>Client</td><td>" + NombresCompletos + "</td></tr>" +
                            CuerpoEmail +
                            "<tr><td>Entry date</ td><td>" + FechaEntrada + "</td></tr>" +
                            "<tr><td>Departure date</ td><td>" + FechaSalida + "</td></tr>" +
                    "</table>" +
                "</div>" +
                "<div style='height: 80px;background-color: #D8D8D8;text-align: center;'>" +
                    "<h5 style='padding: 30px;'>Attentively Mail Service Paco Hostel </br>" + DateTime.Now + "</h5>" +
                "</div>" +
            "</div>";

            string CorreoAdministrador = ConfigurationManager.AppSettings["CorreosAdmins"];
            //ENVIA AL ADMINISTRADOR
            if (CorreoAdministrador != "")
                EnvioCorreo(CorreoHuesped, "Nueva Reserva Realizada - Paco Hostel", Cuerpo);

            //ENVIA CORREO AL HUESPED CONFIRMANDO RESERVA
            if (CorreoHuesped != "")
                EnvioCorreo(CorreoHuesped, "Confirmation of your reservation - Paco Hostel", Cuerpo);

            return true;
        }
        public bool EnviaCorreoReserva(string Identificador,string NombresCompletos,string CorreoHuesped,string json, string FechaEntrada,string FechaSalida)
        {

            bool flag = false;
            string Cuerpo = "";
            string CuerpoEmail = "";
            Habitacion[] results = JsonConvert.DeserializeObject<Habitacion[]>(json);
            foreach (DataRow row in ObjectToData(results).Rows)
            {
                CuerpoEmail += "<tr><td>Habitacion:</td><td>Nro:"+ row["NUMERO"].ToString() + " Piso:"+ row["PISO"].ToString() + " Cupos Reservados:"+ row["CAMAS"].ToString() + "</td></tr>"; 
            }
                Cuerpo = "<div style='width: 100%'>" +
                    "<div style='height: 130px;background-color: #D8D8D8;text-align: center;'>" +
                        "<img src='"+ ConfigurationManager.AppSettings["LogoDeCorreos"] + "' style='height: 100px;width: 100px;padding: 9px;'>" +
                    "</div>" +
                    "<div style='margin-left: 15px;'>" +
                        "<h3>Estimado(a): </h3>" +
                        "<table width = '100%' border='1' cellpadding='0' cellspacing='0'>"+
                            "<tr><td colspan='2' align='center' style='background-color:#454b52;color:white;'><strong>DATOS DE LA RESERVA</strong></td></tr>"+
                                "<tr><td>Identificador</td><td>"+ Identificador + "</td></tr>" +
                                "<tr><td>Cliente</td><td>" + NombresCompletos + "</td></tr>" +
                                CuerpoEmail+
                                "<tr><td>Fecha Entrada</td><td>" + FechaEntrada + "</td></tr>" +
                                "<tr><td>Fecha Salida</td><td>" + FechaSalida + "</td></tr>" +
                        "</table>" +
                    "</div>" +
                    "<div style='height: 80px;background-color: #D8D8D8;text-align: center;'>" +
                        "<h5 style='padding: 30px;'>Atentamente Servicio Correo Paco Hostel </br>" + DateTime.Now + "</h5>" +
                    "</div>" +
                "</div>";

            string CorreoAdministrador = ConfigurationManager.AppSettings["CorreosAdmins"];
            //ENVIA AL ADMINISTRADOR
            if(CorreoAdministrador!="")
                EnvioCorreo(CorreoHuesped, "Nueva Reserva Realizada - Paco Hostel", Cuerpo);

            //ENVIA CORREO AL HUESPED CONFIRMANDO RESERVA
            if (CorreoHuesped != "")
                EnvioCorreo(CorreoHuesped, "Confirmacion de su reserva - Paco Hostel", Cuerpo);
          
            return true;

        }
        public bool EnvioCorreo(string Correo,string Asunto,string Cuerpo)
        {
            string client_smtp = ConfigurationManager.AppSettings["MAILsmtp"];
            string port = ConfigurationManager.AppSettings["MAILpuerto"];
            string usuario = ConfigurationManager.AppSettings["MAILusuario"];
            string password = ConfigurationManager.AppSettings["MAILpassword"];
            bool ssl = Convert.ToBoolean(ConfigurationManager.AppSettings["MAILSSL"]);
            MailMessage msg = new MailMessage();
            msg.To.Add(Correo);
            msg.From = new MailAddress(usuario, "NoResponder", System.Text.Encoding.UTF8);
            msg.Subject = Asunto;
            msg.SubjectEncoding = System.Text.Encoding.UTF8;
            msg.Body = Cuerpo;
            msg.BodyEncoding = System.Text.Encoding.UTF8;
            msg.IsBodyHtml = true;
            SmtpClient client = new SmtpClient(client_smtp);
            client.Credentials = new System.Net.NetworkCredential(usuario, password);
            client.Port = Convert.ToInt32(port);
            client.EnableSsl = ssl;
            try
            {
                client.Send(msg);
                return true;

            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public string IconCheckOutIn(int IdReserva)
        {
            try
            {
                string HtmlReturn="";
                string Query = "SELECT ISNULL(FECHA_CHECKIN,'0') as FECCHECKIN,ISNULL(FECHA_CHECKOUT, '0') as FECCHECKOUT FROM RESERVAS WHERE ID = " + IdReserva + " ";
                DataSet ds = new Util().GetDataSetSimpleQuery(Query);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    string FechaCheckIn = ds.Tables[0].Rows[0]["FECCHECKIN"].ToString();
                    string FechaCheckOut = ds.Tables[0].Rows[0]["FECCHECKOUT"].ToString();
                    HtmlReturn = FechaCheckIn == "0" ? "<a class='btn btn-secondary btn-xs' href=JavaScript:RealizarCheckInOut(\'" + IdReserva + "\',\'IN\');>" +
                                                       "<i class='fas fa-arrow-alt-circle-left' style='font-size: 14px'>CheckIn</i></a>" : "<a class='btn btn-secondary btn-xs' href=JavaScript:RealizarCheckInOut(\'" + IdReserva + "\',\'OUT\');>" +
                                                                                                                                   "<i class='fas fa-arrow-alt-circle-right' style='font-size: 14px'>CheckOut</i></a>";
                }
                return HtmlReturn;
            }
            catch(Exception)
            {
                return "";
            }
            
        }
        public string Select_Galeria_MasterEN(int Tipo)
        {
            try
            {
                string Html = "";
                DataSet ds = new DBHotel().Select_Galeria(1);
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    if (File.Exists(HttpContext.Current.Server.MapPath("../" + row["LINKFOTO"].ToString())))
                    {
                        if (Tipo == 0)
                        {
                            //html para el footer
                            Html += " <a class='item-gallery-footer wrap-pic-w' href='../" + row["LINKFOTO"].ToString() + "' data-lightbox='gallery-footer'>" +
                                    "<img src='../" + row["LINKFOTO"].ToString() + "' alt='GALLERY' style='height: 98px;'>" +
                                "</a>";
                        }
                        else if (Tipo == 1)
                        {
                            //html para el header
                            Html += "<a class='item-gallery-sidebar wrap-pic-w' href='../" + row["LINKFOTO"].ToString() + "' data-lightbox='gallery-footer'>" +
                                        "<img src='../" + row["LINKFOTO"].ToString() + "' alt='GALLERY' style='height: 61px;'>" +
                                    "</a>";
                        }
                    }
                }
                return Html;
            }
            catch (Exception ex)
            {
                return "";
            }
        }
        public string Select_Galeria_Master(int Tipo)
        {
            try
            {
                string Html = "";
                DataSet ds = new DBHotel().Select_Galeria(1);
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    if (File.Exists(HttpContext.Current.Server.MapPath(row["LINKFOTO"].ToString())))
                    {
                        if (Tipo ==0)
                        {
                            Html += " <a class='item-gallery-footer wrap-pic-w' href='" + row["LINKFOTO"].ToString() + "' data-lightbox='gallery-footer'>" +
                                    "<img src='" + row["LINKFOTO"].ToString() + "' alt='GALLERY' style='height: 98px;'>" +
                                "</a>";
                        }
                        else if(Tipo == 1)
                        {
                            Html += "<a class='item-gallery-sidebar wrap-pic-w' href='"+ row["LINKFOTO"].ToString() + "' data-lightbox='gallery-footer'>"+
                                        "<img src='"+ row["LINKFOTO"].ToString() + "' alt='GALLERY' style='height: 61px;'>" +
                                    "</a>";
                        }
                    }
                }
                return Html;
            }
            catch(Exception ex)
            {
                return "";
            }
        }
        public string Select_Galeria()
        {
            try
            {
                string Html = "";
                string HtmlPage = "";
                string Classpag = "";
                DataSet ds = new DBHotel().Select_Galeria(0);
                DataTable[] splittedtables = ds.Tables[0].AsEnumerable()
                             .Select((row, index) => new { row, index })
                             .GroupBy(x => x.index / 21)
                             .Select(g => g.Select(x => x.row).CopyToDataTable())
                             .ToArray();
                string Display = "";
                for (int i = 0; i < splittedtables.Length; i++)
                {
                    if (i == 0)
                    {
                        Display = "normal";
                        Classpag = "active-pagination";
                    }
                    else
                    {
                        Classpag = "";
                        Display = "none";
                    }
                        
                    Html += "<div class='wrap-gallery isotope-grid flex-w p-l-25 p-r-25' id='page" + i + "' style='display:" + Display + "; '>";
                    DataTable dt = splittedtables[i];
                    foreach (DataRow row in dt.Rows)
                    {
                        if (File.Exists(HttpContext.Current.Server.MapPath(row["LINKFOTO"].ToString())))
                        {
                            Html += "<div class='item-gallery isotope-item bo-rad-10 hov-img-zoom food' >" +
                                "<img src='" + row["LINKFOTO"].ToString() + "' alt='IMG-GALLERY' style='height: 290px;'>" +

                                "<div class='overlay-item-gallery trans-0-4 flex-c-m'>" +
                                    "<a class='btn-show-gallery flex-c-m fa fa-search' href='" + row["LINKFOTO"].ToString() + "' data-lightbox='gallery'></a>" +
                                "</div>" +
                            "</div>";
                        }
                        
                    }

                    Html += "</div>";
                    HtmlPage += "<a href='JavaScript:Page(" + i + ")' id='Pag" + i + "' class='item-pagination flex-c-m trans-0-4 " + Classpag + "'>" + (i + 1) + "</a>";


                }
                Html += " <div class='pagination flex-c-m flex-w p-l-15 p-r-15 m-t-24 m-b-50'>" +
                                HtmlPage+
                            "</div>";
                return Html;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
        public string Select_Galeria_EN()
        {
            try
            {
                string Html = "";
                string HtmlPage = "";
                string Classpag = "";
                DataSet ds = new DBHotel().Select_Galeria(0);
                DataTable[] splittedtables = ds.Tables[0].AsEnumerable()
                             .Select((row, index) => new { row, index })
                             .GroupBy(x => x.index / 21)
                             .Select(g => g.Select(x => x.row).CopyToDataTable())
                             .ToArray();
                string Display = "";
                for (int i = 0; i < splittedtables.Length; i++)
                {
                    if (i == 0)
                    {
                        Display = "normal";
                        Classpag = "active-pagination";
                    }
                    else
                    {
                        Classpag = "";
                        Display = "none";
                    }

                    Html += "<div class='wrap-gallery isotope-grid flex-w p-l-25 p-r-25' id='page" + i + "' style='display:" + Display + "; '>";
                    DataTable dt = splittedtables[i];
                    foreach (DataRow row in dt.Rows)
                    {
                        if(File.Exists(HttpContext.Current.Server.MapPath("../" + row["LINKFOTO"].ToString())))
                        {
                            Html += "<div class='item-gallery isotope-item bo-rad-10 hov-img-zoom food' >" +
                               "<img src='../" + row["LINKFOTO"].ToString() + "' alt='IMG-GALLERY' style='height: 290px;'>" +

                               "<div class='overlay-item-gallery trans-0-4 flex-c-m'>" +
                                   "<a class='btn-show-gallery flex-c-m fa fa-search' href='../" + row["LINKFOTO"].ToString() + "' data-lightbox='gallery'></a>" +
                               "</div>" +
                           "</div>";
                        }
                       
                    }

                    Html += "</div>";
                    HtmlPage += "<a href='JavaScript:Page(" + i + ")' id='Pag" + i + "' class='item-pagination flex-c-m trans-0-4 " + Classpag + "'>" + (i + 1) + "</a>";


                }
                Html += " <div class='pagination flex-c-m flex-w p-l-15 p-r-15 m-t-24 m-b-50'>" +
                                HtmlPage +
                            "</div>";
                return Html;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public string Select_Carusel()
        {
            try
            {
                string Html = "";
                int Item = 1;
                DataSet ds = new DBHotel().Select_Carusel();
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    if (File.Exists(HttpContext.Current.Server.MapPath(row["LINKFOTO"].ToString())))
                    {
                        Html += "<div class='item-slick1 item" + Item + "-slick1' style='background-image: url("+ row["LINKFOTO"].ToString() + ");'>" +
                                "<div class='wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150 p-b-170'>" +
                                    "<span class='caption1-slide1 txt1 t-center animated visible-false m-b-15' data-appear='fadeInDown'>"+ row["DESCRIPCION"].ToString() + "</span>" +
                                    "<h2 class='caption2-slide1 tit1 t-center animated visible-false m-b-37' data-appear='fadeInUp'>"+ row["DESCRIPCION2"].ToString() + "</h2>" +
                                    "<div class='wrap-btn-slide1 animated visible-false' data-appear='zoomIn'>" +
                                        "<a href='Reserva.aspx' class='btn1 flex-c-m size1 txt3 trans-0-4'>Reservar</a>" +
                                    "</div>" +
                                "</div>" +
                            "</div>";
                        Item++;
                    }
                }
                return Html;
            }
            catch(Exception ex)
            {
                return ex.Message;
            }
        }

        public string Select_Carusel_EN()
        {
            try
            {
                string Html = "";
                int Item = 1;
                DataSet ds = new DBHotel().Select_Carusel();
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    if (File.Exists(HttpContext.Current.Server.MapPath("../" + row["LINKFOTO"].ToString())))
                    {
                        Html += "<div class='item-slick1 item" + Item + "-slick1' style='background-image: url(../" + row["LINKFOTO"].ToString() + ");'>" +
                                    "<div class='wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150 p-b-170'>" +
                                        "<span class='caption1-slide1 txt1 t-center animated visible-false m-b-15' data-appear='fadeInDown'>" + row["DESCRIPCION_EN"].ToString() + "</span>" +
                                        "<h2 class='caption2-slide1 tit1 t-center animated visible-false m-b-37' data-appear='fadeInUp'>" + row["DESCRIPCION2_EN"].ToString() + "</h2>" +
                                        "<div class='wrap-btn-slide1 animated visible-false' data-appear='zoomIn'>" +
                                            "<a href='Reserva.aspx' class='btn1 flex-c-m size1 txt3 trans-0-4'>Reserve</a>" +
                                        "</div>" +
                                    "</div>" +
                                "</div>";
                        Item++;
                    }
                }
                return Html;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public DataSet Select_Galeria_Edit()
        {
            return new DBHotel().Select_Galeria_Edit();
        }

        public class Usuario
        {
            public string NombreUsuario { get; set; }
            public int IdUsuario { get; set; }
            public string Email { get; set; }
            public int IdTipoUsuario { get; set; }
            public string TipoUsuario { get; set; }
            public string Nombres { get; set; }
            public string Apellidos { get; set; }
            public string username { get; set; }

        }
    }
}
