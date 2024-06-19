using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class CertificacionesGestion
    {
        public Certificacion ObtenerCertificacionPorInscripcion(int idCertificacion) // OBTENER CERTIFICACION DE UNA INSCRIPCION
        {
            // Obtengo una Certificacion asociada a una inscripcion utilizando la tabla de CERTIFICACIONES
            var AccesoBD = new ConexionBD();

            try
            {
                string query = "SELECT IDCERTIFICACIONES, IDINSCRIPCION FROM CERTIFICACIONES WHERE IDCERTIFICACIONES = @idCertificacion";
                AccesoBD.SetQuery(query);
                AccesoBD.SetParametro("@idCertificacion", idCertificacion);
                AccesoBD.EjecutarLectura();

                if (AccesoBD.Lector.Read())
                {
                    Certificacion certi = new Certificacion();
                    certi.IdCertificacion = idCertificacion;
                    certi.IdInscripcion = (int)AccesoBD.Lector["IDINSCRIPCION"];
                    return certi;
                    
                }

                // Si no lee nada devuelve null
                return null;

            }
            catch (Exception ex)
            {
                throw ex;

            }
            finally
            {
                AccesoBD.CerrarConexion();

            }
        }
        public List<Certificacion> ObtenerCertificacionesPorUsuario(int idUsuario) // OBTENER CERTIFICACIONES DE UN USUARIO
        {
            // Obtengo una lista de Certificaciones asociados a un usuario utilizando la tabla CERTIFICACIONES, INSCRIPCIONES Y USUARIOS
            // Ya que peude ser mas de una certificacion por usuario

            var AccesoBD = new ConexionBD();
            try
            {
                string query = "SELECT C.IDCERTIFICACIONES, C.IDINSCRIPCION FROM CERTIFICACIONES C INNER JOIN INSCRIPCIONES I ON I.IDINSCRIPCION = C.IDINSCRIPCION INNER JOIN USUARIOS U ON U.IDUSUARIO = I.IDUSUARIO WHERE U.IDUSUARIO = @idUsuario";
                AccesoBD.SetQuery(query);
                AccesoBD.SetParametro("@idUsuario", idUsuario);
                AccesoBD.EjecutarLectura();
                var ListaCertificaciones = new List<Certificacion>();

                while (AccesoBD.Lector.Read())
                {
                    var certi = new Certificacion();
                    certi.IdCertificacion = (int)AccesoBD.Lector["IDCERTIFICACIONES"];
                    certi.IdInscripcion = (int)AccesoBD.Lector["IDINSCRIPCION"];
                    ListaCertificaciones.Add(certi);
                }

                return ListaCertificaciones;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                AccesoBD.CerrarConexion();
            }
        }
        public void InsertarCertificacion(Certificacion certi) // ALTA CERTIFICACION
        {
            var AccesoBD = new ConexionBD();

            try
            {
                string query = "INSERT INTO CERTIFICACIONES (IDINSCRIPCION) VALUES (@idInscripcion)";
                AccesoBD.SetQuery(query);
                AccesoBD.SetParametro("@idInscripcion", certi.IdInscripcion);
                AccesoBD.EjecutarAccion();

            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                AccesoBD.CerrarConexion();
            }
        }
        public void ModificarCertificacion(Certificacion certi) // MODIFICAR CERTIFICACION
        {
            var AccesoBD = new ConexionBD();
            try
            {
                string query = "UPDATE CERTIFICACIONES SET IDINSCRIPCION = @idInscripcion WHERE IDCERTIFICACIONES = @idCertificacion";
                AccesoBD.SetQuery(query);
                AccesoBD.SetParametro("@idCertificacion", certi.IdCertificacion);
                AccesoBD.EjecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                AccesoBD.CerrarConexion();
            }
        }
        public void EliminarCertificacion(int idCertificacion) // BAJA CERTIFICACION
        {
            var AccesoBD = new ConexionBD();
            try
            {
                string query = "DELETE FROM CERTIFICACIONES WHERE IDCERTIFICACIONES = @idCertificaciones";
                AccesoBD.SetQuery(query);
                AccesoBD.SetParametro("@idCertificaciones", idCertificacion);
                AccesoBD.EjecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                AccesoBD.CerrarConexion();
            }
        }
    }
}
