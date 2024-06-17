using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class UnidadGestion
    {
        public List<Unidad> ObtenerUnidadesPorCurso(int idCurso) // OBTENER UNIDADES DE UN CURSO
        {
            // Obtengo una lista de unidades asociados a un curso utilizando la tabla UNIDADES
            // Ya que peude ser mas de un lenguaje por curso

            var Acceso = new ConexionBD();
            try
            {

                string query = "SELECT IDUNIDAD, NUMERO, NOMBRE, DESCRIPCION, IDCURSO FROM UNIDADES WHERE IDCURSO = @idCurso";
                Acceso.SetQuery(query);
                Acceso.SetParametro("@idCurso", idCurso);
                Acceso.EjecutarLectura();
                var ListaUnidades = new List<Unidad>();

                while (Acceso.Lector.Read())
                {
                    var Uni = new Unidad();
                    Uni.IdUnidad = (int)Acceso.Lector["IDUNIDAD"];
                    Uni.Numero = (int)Acceso.Lector["NUMERO"];
                    Uni.Nombre = (string)Acceso.Lector["NOMBRE"];
                    Uni.Descripcion = (string)Acceso.Lector["DESCRIPCION"];
                    Uni.IdCurso = (int)Acceso.Lector["IDCURSO"];
                    ListaUnidades.Add(Uni);
                }

                return ListaUnidades; 

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
        public void InsertarUnidad(Unidad Uni) // ALTA UNIDAD
        {
            var Acceso = new ConexionBD();

            try
            {
                string query =  "INSERT INTO UNIDADES (NUMERO, NOMBRE, DESCRIPCION, IDCURSO) VALUES ( @Numero, @Nombre, @Descripcion, @IdCurso)";
                Acceso.SetQuery(query);
                Acceso.SetParametro("@Numero", Uni.Numero);
                Acceso.SetParametro("@Nombre", Uni.Nombre);
                Acceso.SetParametro("@Descripcion", Uni.Descripcion);
                Acceso.SetParametro("@IdCurso", Uni.IdCurso);
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
        public void ModificarUnidad(Unidad Uni) // MODIFICACION UNIDAD
        {
            var Acceso = new ConexionBD();
            try
            {

                string query = "UPDATE UNIDADES SET NUMERO = @Numero, NOMBRE = @Nombre, DESCRIPCION = @Descripcion, IDCURSO = @IdCurso WHERE IDUNIDAD = @Id";
                Acceso.SetQuery(query);
                Acceso.SetParametro("@Numero", Uni.Numero);
                Acceso.SetParametro("@Nombre", Uni.Nombre);
                Acceso.SetParametro("@Descripcion", Uni.Descripcion);
                Acceso.SetParametro("@IdCurso", Uni.IdCurso);
                Acceso.SetParametro("@Id", Uni.IdUnidad);
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
        public void EliminarUnidad(int Id) // BAJA UNIDAD
        {
            var Acceso = new ConexionBD();
            try
            {

                string query = "DELETE FROM UNIDADES WHERE IDUNIDAD = @Id";
                Acceso.SetQuery(query);
                Acceso.SetParametro("@Id", Id);
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
