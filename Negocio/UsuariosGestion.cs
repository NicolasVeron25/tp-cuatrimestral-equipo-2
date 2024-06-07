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

        //DEVUELVE EL ID INSERTADO. PORQUE ES NECESARIO PARA METERLO EN SESSION
        public int InsertarUsuarioSP(string email, string pass, InformacionUsuario datos)
        {
            var Acceso = new ConexionBD();
            try
            {
                Acceso.SetSP("SP_INSERTUSUARIO");
                Acceso.SetParametro("@Email", email);
                Acceso.SetParametro("@Pass", pass);
                Acceso.SetParametro("@Nombre", datos.Nombre);
                Acceso.SetParametro("@Apellido", datos.Apellido);
                Acceso.SetParametro("@FechaNacimiento", datos.FechaNacimiento);
                Acceso.SetParametro("@IdPais", datos.IdPais);
                Acceso.SetParametro("@Celular", datos.Celular);
                if (datos.Sexo == "Masculino")
                {
                    Acceso.SetParametro("@Sexo", "M");
                }
                else
                {
                    Acceso.SetParametro("@Sexo", "F");
                }
                return Acceso.EjecutarScalar(); //ejecuta el SP y devuelve el ID insertado
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                Acceso.CerrarConexion();

            }

        }
        public InformacionUsuario ObtenerDatos(int id)
        {
            var Acceso = new ConexionBD();
            var datos = new InformacionUsuario();

            try
            {

                Acceso.SetQuery("SELECT NOMBRE,APELLIDO,FECHA_NACIMIENTO,IDPAIS,CELULAR,SEXO,URL_FOTOPERFIL FROM INFORMACION_USUARIO WHERE IDUSUARIO = @ID");
                Acceso.SetParametro("@ID",id);
                Acceso.EjecutarLectura();
                if (Acceso.Lector.Read())
                {
                    datos.Nombre = (string)Acceso.Lector["NOMBRE"];
                    datos.Apellido = (string)Acceso.Lector["APELLIDO"];
                    datos.FechaNacimiento = (DateTime)Acceso.Lector["FECHA_NACIMIENTO"];
                    datos.IdPais = (int)Acceso.Lector["IDPAIS"];
                    datos.Celular = (string)Acceso.Lector["CELULAR"];
                    datos.Sexo = (string)Acceso.Lector["SEXO"];
                    //validamos nulidad x que es opcional la foto!
                    if (!(Acceso.Lector["URL_FOTOPERFIL"] is DBNull))
                    {
                        datos.UrlFotoPerfil = (string)Acceso.Lector["URL_FOTOPERFIL"];
                    }
                }
                return datos;

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                Acceso.CerrarConexion();
            }

        }

        public Usuario ValidarYObtenerUser(string email, string password)
        {
            var Acceso = new ConexionBD();
            try
            {
                Acceso.SetQuery("SELECT IDUsuario,Email,Pass,Es_Admin,Fecha_Creacion FROM USUARIOS WHERE Email = @Email");
                Acceso.SetParametro("@Email", email);
                Acceso.EjecutarLectura();

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
                Acceso.CerrarConexion();
            }
        }

        public void ResetPassword(string email, string newPass)
        {
            var Acceso = new ConexionBD();

            try
            {
                Acceso.SetQuery("UPDATE USUARIOS SET PASS = @NewPass WHERE EMAIL = @EditEmail");
                Acceso.SetParametro("@EditEmail", email);
                Acceso.SetParametro("@NewPass", newPass);
                Acceso.EjecutarLectura();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                Acceso.CerrarConexion();
            }


        }
    }
}
