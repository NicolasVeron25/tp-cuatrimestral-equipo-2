using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using Dominio.DTOS;

namespace Negocio
{
    public class InscripcionesGestion
    {
        public int CantCertificaciones()
        {
            ConexionBD conexionBD = new ConexionBD();
            try
            {
                string query = "SELECT COUNT(IDCERTIFICACIONES) FROM CERTIFICACIONES";
                conexionBD.SetQuery(query);
                conexionBD.EjecutarLectura();
                conexionBD.Lector.Read();
                int cant = (int)conexionBD.Lector[0];
                return cant;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                conexionBD.CerrarConexion();
            }
        }

        public int CantidadInscriptos(int IdCurso=0)
        {
            ConexionBD AccesoBD = new ConexionBD();
            try
            {
                string query = "";
                if (IdCurso == 0)
                {
                    query = "SELECT COUNT(IDINSCRIPCION) FROM INSCRIPCIONES";
                }
                else
                {
                    query = "SELECT COUNT(IDINSCRIPCION) FROM INSCRIPCIONES WHERE IDCURSO= @IdCurso";
                    AccesoBD.SetParametro("@IdCurso", IdCurso);

                }
                    AccesoBD.SetQuery(query);
                AccesoBD.EjecutarLectura();
                AccesoBD.Lector.Read();
                int cant = (int)AccesoBD.Lector[0];
                return cant;
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
        public List<InscripcionesGestionDto> ListarInscripciones()
        {
            ConexionBD AccesoBD = new ConexionBD();

            try
            {
                string query = "SELECT i.APELLIDO , i.NOMBRE, c.NOMBRE as NombreCurso, ins.IDINSCRIPCION  FROM INFORMACION_USUARIO i INNER JOIN INSCRIPCIONES ins on ins.IDUSUARIO=i.IDUSUARIO INNER JOIN CURSOS c on c.IDCURSO=ins.IDCURSO WHERE ins.BAJA=0";
                AccesoBD.SetQuery(query);
                AccesoBD.EjecutarLectura();
                var ListaInscripciones = new List<InscripcionesGestionDto>();
                while (AccesoBD.Lector.Read())
                {
                    InscripcionesGestionDto inscripcion = new InscripcionesGestionDto();

                    inscripcion.Nombre = (string)AccesoBD.Lector["NOMBRE"];
                    inscripcion.Apellido = (string)AccesoBD.Lector["APELLIDO"];
                    inscripcion.NombreCurso = (string)AccesoBD.Lector["NombreCurso"];
                    inscripcion.IdInscripcion = (int)AccesoBD.Lector["IDINSCRIPCION"];

                    ListaInscripciones.Add(inscripcion);
                }
                return ListaInscripciones;
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

        public void InsertarInscripcion(Inscripcion insc)
        {
            var Acceso = new ConexionBD();
            try
            {
                string query = "INSERT INTO INSCRIPCIONES (IDCURSO,IDUSUARIO,FECHA) VALUES(@NombreCurso,@IdUsuario,@Fecha)";
                Acceso.SetQuery(query);
                Acceso.SetParametro("@NombreCurso", insc.IdCurso);
                Acceso.SetParametro("@IdUsuario", insc.IdUsuario);
                Acceso.SetParametro("@Fecha", insc.Fecha);

                Acceso.EjecutarAccion();
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

        public void ModificarInscripcion(Inscripcion insc)
        {
            ConexionBD Acceso = new ConexionBD();

            try
            {
                Acceso.SetQuery("UPDATE INSCRIPCIONES SET IDCURSO = @IDCurso, IDUSUARIO = @IDUsuario, FECHA = @Fecha WHERE IDINSCRIPCION=@IDInscripcion");
                Acceso.SetParametro("@IDInscripcion", insc.IdInscripcion);
                Acceso.SetParametro("IDCURSO", insc.IdCurso);
                Acceso.SetParametro("IDUSUARIO", insc.IdUsuario);
                Acceso.SetParametro("FECHA", insc.Fecha);
                Acceso.EjecutarAccion();


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

        public void EliminarInscripcion(int Id)
        {
            ConexionBD Acceso = new ConexionBD();

            try
            {
                Acceso.SetQuery("UPDATE INSCRIPCIONES  SET BAJA=1 WHERE IDINSCRIPCION=@IDInscripcion ");
                Acceso.SetParametro("@IDInscripcion", Id);
                Acceso.EjecutarAccion();

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

        public bool Existencia(int Id)
        {
            ConexionBD AccesoBD = new ConexionBD();

            try
            {
                AccesoBD.SetQuery("SELECT IDINSCRIPCION,IDCURSO,IDUSUARIO,FECHA,BAJA FROM INSCRIPCIONES WHERE IDUSUARIO=@IdUsuario");
                AccesoBD.SetParametro("@IdUsuario", Id);
                AccesoBD.EjecutarLectura();
                if (AccesoBD.Lector.Read())
                {
         
                    return true;
                }
                else
                {
                    return false;
                }
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