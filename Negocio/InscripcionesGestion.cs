using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using Dominio.DTOS;

namespace Negocio
{
    internal class InscripcionesGestion
    {

        public List<InscripcionesGestionDto> ListarInscripciones() 
        {
            ConexionBD AccesoBD = new ConexionBD();

            try
            {
                string query = "SELECT i.APELLIDO , i.NOMBRE, c.NOMBRE as NombreCurso, ins.IDINSCRIPCION  FROM INFORMACION_USUARIO i INNER JOIN INSCRIPCIONES ins on ins.IDUSUARIO=i.IDUSUARIO INNER JOIN CURSOS c on c.IDCURSO=ins.IDCURSO";
                AccesoBD.SetQuery(query);         
                AccesoBD.EjecutarLectura();
                var ListaInscripciones = new List<InscripcionesGestionDto>();
                while (AccesoBD.Lector.Read())
                {
              InscripcionesGestionDto inscripcion= new InscripcionesGestionDto();
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

       






    }
}


