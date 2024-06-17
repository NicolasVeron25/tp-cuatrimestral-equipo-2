using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using Dominio.DataTransferObjects;

namespace Negocio
{
    public class ReseñaGestion
    {
        
      public List<ReseñasDto> ListarReseñas(int IdCurso)
        {
            ConexionBD Acceso = new ConexionBD();
            List<ReseñasDto> listareseña = new List<ReseñasDto>();
            try
            {
                Acceso.SetQuery("SELECT iu.APELLIDO, iu.NOMBRE,c.NOMBRE as NOMBRECURSO,,r.PUNTAJE,r.DESCRIPCION FROM INFORMACION_USUARIO iu INNER JOIN INSCRIPCIONES i on i.IDUSUARIO=iu.IDUSUARIO INNER JOIN RESEÑAS r on r.IDINSCRIPCION=i.IDINSCRIPCION INNER JOIN CURSOS c on c.IDCURSO=i.IDCURSO WHERE c.IDCURSO=@IDCurso");
                Acceso.EjecutarLectura();
                while (Acceso.Lector.Read()) {
                ReseñasDto reseña = new ReseñasDto();
                    reseña.ApellidoUsuario = (string)Acceso.Lector["APELLIDO"];
                    reseña.NombreUsuario = (string)Acceso.Lector["NOMBRE"];
                    reseña.NombreCurso = (string)Acceso.Lector["NOMBRECURSO"];
                    reseña.Puntaje = (int)Acceso.Lector["PUNTAJE"];
                    reseña.Descripcion = (string)Acceso.Lector["DESCRIPCION"];
                    listareseña.Add(reseña);
                        }
                return listareseña;
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
        public void InsertarReseña(Reseña reseña)
        {
            var Acceso = new ConexionBD();
            try
            {
      
                Acceso.SetQuery("INSERT INTO RESEÑAS  (IDINSCRIPCION,IDCURSO,PUNTAJE,DESCRIPCION) VALUES (@IDInscripcion,@IDCurso,@Puntaje,@Descripcion)");
                Acceso.SetParametro("@IDInscripcion", reseña.IdInscripcion);
                Acceso.SetParametro("@IDCurso", reseña.IdCurso);
                Acceso.SetParametro("@Puntaje",reseña.Puntaje);
                Acceso.SetParametro("@Descripcion", reseña.Descripcion);
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

        public void ModificarReseña(Reseña Reseña)
        {
            var Acceso = new ConexionBD();
            try
            {
                
                Acceso.SetQuery("UPDATE RESEÑAS SET PUNTAJE=@Puntaje, DESCRIPCION=@Descripcion WHERE IDRESEÑA=@IDReseña");
                Acceso.SetParametro("@Puntaje", Reseña.Puntaje);
                Acceso.SetParametro("@Descripcion", Reseña.Descripcion);
                Acceso.SetParametro("@IDReseña", Reseña.IdReseña);
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


        public void EliminarReseña(int Id)
        {
            var Acceso = new ConexionBD();
            try
            {
   
                Acceso.SetQuery("DELETE FROM RESEÑAS WHERE IDRESEÑA=@IDReseña");
                Acceso.SetParametro("@IDReseña", Id);
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
