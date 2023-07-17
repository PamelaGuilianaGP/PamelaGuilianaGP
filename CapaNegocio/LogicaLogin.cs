using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;

namespace CapaNegocio
{
    public class LogicaLogin
    {
        public string Login(string Usuario,string Password)
        {
            try
            {
                string Resp="";
                DataSet ds = new BDLogin().Login(Usuario, Password);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    Resp = ds.Tables[0].Rows[0]["Respuesta"].ToString();
                }
                return Resp;
            }
            catch (Exception ex)
            {
                return "Ocurrio un error , si persiste comunicarse con el administrador";
            } 
        }
        public string Select_Datos_Usuarios(string NombreUsuario,int IdUsuario)
        {
            string Resp = "";
            DataSet ds = new BDLogin().Select_Datos_Usuarios(NombreUsuario);
            if (ds.Tables[0].Columns.Count>1)
            {
                bool Flag = false;
                string NewPass = new Util().RandomString(10);
                if (ds.Tables[0].Rows[0]["CORREO"].ToString() != "")
                {
                    int RespRegis = new BDLogin().Cambia_Contraseña(Convert.ToInt32(ds.Tables[0].Rows[0]["ID"].ToString()),
                                                                    NewPass);

                    if (RespRegis > 0)
                    {
                        Flag = new Util().EnviaCorreoRecuperar_Contraseña(ds.Tables[0].Rows[0]["CORREO"].ToString(),
                                                                      ds.Tables[0].Rows[0]["NOMBRES"].ToString() + " " + ds.Tables[0].Rows[0]["APELLIDOS"].ToString(),
                                                                      NewPass,
                                                                      NombreUsuario);
                        if (Flag)
                            Resp = "Verique su correo:" + ds.Tables[0].Rows[0]["CORREO"].ToString() + " se le acaba de enviar una contraseña temporal";
                        else
                            Resp = "No se ha podido enviar el correo por favor vuelva a intentar, si persiste el error comuniquese con el Administrador";
                    }
                    else
                        Resp = "Ocurrri un error , si persiste comuniquese con el administrador";

                }
                else
                    Resp = "El usuario no cuenta con correo";
                
               
            }
            else
                Resp = ds.Tables[0].Rows[0]["Respuesta"].ToString();

            return Resp;
        }
    }
}
