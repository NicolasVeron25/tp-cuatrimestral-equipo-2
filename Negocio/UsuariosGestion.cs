using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class UsuariosGestion
    {




        public Usuario ValidarYObtenerUser(string email, string password)
        {
           var Acceso = new ConexionBD();
            try
            {
                Acceso.setQuery("SELECT IDUsuario,Email,Pass,Es_Admin,Fecha_Creacion FROM USUARIOS WHERE Email = @Email");
                Acceso.setParametro("@Email", email);
                Acceso.ejecutarLectura();

                if (Acceso.Lector.Read())
                {
                    string PassBd = (string)Acceso.Lector["Pass"];
                    if (PassBd != null)
                    {
                        if (PassBd == password)
                        {
                            

                            Usuario user = new Usuario();
                            user.IdUsuario = (int)Acceso.Lector["IDUsuario"];
                            user.Email = email;
                            user.Pass = password;
                            user.EsAdmin = (bool)Acceso.Lector["Es_Admin"];
                            user.FechaCreacion = (DateTime)Acceso.Lector["Fecha_Creacion"];
                            return user;
                        }
                        else
                        {
                            return null; // si passwords no coinciden
                        }
                    }
                    else
                    {
                        return null; // si no existe una pass , email invalido , devuelvo null
                    }
                }
                else
                {
                    return null; // error al leer la bd
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                Acceso.cerrarConexion();
            }
        }

        public void ResetPassword(string email, string newPass)
        {
             var Acceso = new ConexionBD();

            try
            {
                Acceso.setQuery("UPDATE USUARIOS SET PASS = @NewPass WHERE EMAIL = @EditEmail");
                Acceso.setParametro("@EditEmail", email);
                Acceso.setParametro("@NewPass", newPass);
                Acceso.ejecutarLectura();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                Acceso.cerrarConexion();
            }


        }
    }
}
