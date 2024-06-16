using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    internal class ClaseGestion
    {
        public Clase ClaseUnidad(int IdUnidad)
        {
            var Acceso = new ConexionBD();
            try
            {
                string query = "Select Id,Descripcion from clases where IdUnidad = @idunidad";
                Acceso.SetQuery(query);
                Acceso.SetParametro("@idunidad", IdUnidad);
                Acceso.EjecutarLectura();
                var clase = new Clase();
                if (Acceso.Lector.Read())
                {
                    clase.IdClase = (int)Acceso.Lector["Id"];
                    clase.Descripcion = (string)Acceso.Lector["Descripcion"];
                }
                return clase; // si no encuentra nada, devuelve un objeto vacio
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

        public List<Clase> ListarClases()
        {
            var Acceso = new ConexionBD();
            try
            {
                string query = "Select Id,descripcion from Clases";
                Acceso.SetQuery(query);
                Acceso.EjecutarLectura();
                var ListaClase = new List<Clase>();
                while (Acceso.Lector.Read())
                {
                    var clase = new Clase();
                    clase.IdClase = (int)Acceso.Lector["Id"];
                    clase.Descripcion = (string)Acceso.Lector["Descripcion"];                   
                    ListaClase.Add(clase);
                }
                return ListaClase;
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


        public void InsertarClase(Clase clase) 
        {
            var Acceso = new ConexionBD();
            try
            {
                string query = "Insert into Clases (Descripcion) values (@Descripcion)";
                Acceso.SetQuery(query);
                Acceso.SetParametro("@Descripcion", clase.Descripcion);
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
        public void ModificarClase(Clase clase)
        {
            var Acceso = new ConexionBD();
            try
            {
                string query = "Update Clases set Descripcion = @Descripcion where IdClase = @Id";
                Acceso.SetQuery(query);
                Acceso.SetParametro("@Descripcion", clase.Descripcion);
                Acceso.SetParametro("@Id", clase.IdClase);
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


        public void EliminarClase(int Id)
        {
            var Acceso = new ConexionBD();
            try
            {
                string query = "Delete from Clase where IdClase = @Id";
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



