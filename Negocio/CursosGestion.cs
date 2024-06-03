using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class CursosGestion
    {
        
        public Curso Existencia(int Id)
        {
            ConexionBD AccesoBD = new ConexionBD();

            try
            {
                AccesoBD.setQuery("SELECT * from CURSOS as c WHERE c.IDCURSO=@IdCurso");
                AccesoBD.setParametro("@IdCurso", Id);
                AccesoBD.ejecutarLectura();
                if (AccesoBD.Lector.Read())
                {
                    Curso curso = new Curso();
                    curso.Idcurso = Id;
                    curso.Nombre = (string)AccesoBD.Lector["NOMBRE"];
                    curso.Descripcion = (string)AccesoBD.Lector["DESCRIPCION"];
                    curso.Requisitos = (string)AccesoBD.Lector["REQUISITOS"];
                    curso.Importe = (decimal)AccesoBD.Lector["IMPORTE"];
                    curso.UrlPortada = (string)AccesoBD.Lector["URL_PORTADA"];
                    curso.Idcategoria = (int)AccesoBD.Lector["IDCATEGORIA"];
                    curso.FechaCreacion = (DateTime)AccesoBD.Lector["FECHA_CREACION"];
                    return curso;
                }
                else
                {
                    return null;
                }
            }

            catch (Exception ex)
            {
                throw ex;

            }

            finally
            {
                AccesoBD.cerrarConexion();
            }


        }

        public List<Curso> Listado()
        {
            ConexionBD AccesoBD = new ConexionBD();
            List<Curso> listCurso = new List<Curso>();

            try
            {
                AccesoBD.setQuery("SELECT * from CURSOS as c WHERE c.IDCURSO=@IdCurso");               
                AccesoBD.ejecutarLectura();
                while (AccesoBD.Lector.Read())
                {
                    Curso curso = new Curso();
                    curso.Idcurso = (int)AccesoBD.Lector["IDCURSO"];
                    curso.Nombre = (string)AccesoBD.Lector["NOMBRE"];
                    curso.Descripcion = (string)AccesoBD.Lector["DESCRIPCION"];
                    curso.Requisitos = (string)AccesoBD.Lector["REQUISITOS"];
                    curso.Importe = (decimal)AccesoBD.Lector["IMPORTE"];
                    curso.UrlPortada = (string)AccesoBD.Lector["URL_PORTADA"];
                    curso.Idcategoria = (int)AccesoBD.Lector["IDCATEGORIA"];
                    curso.FechaCreacion = (DateTime)AccesoBD.Lector["FECHA_CREACION"];
                    listCurso.Add(curso);
                }
               return listCurso;
            }

            catch (Exception ex)
            {
                throw ex;

            }

            finally
            {
                AccesoBD.cerrarConexion();
            }

        }   



    }
}


