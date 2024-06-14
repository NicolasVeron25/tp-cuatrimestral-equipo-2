﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class CursosGestion
    {
        public List<Curso> CursosInscripto(int IdUsuario) // uso : solo mostrar los cursos que esta inscripto el usuario
        {
            ConexionBD AccesoBD = new ConexionBD();

            try
            {
                string query = "SELECT C.IDCURSO ,C.NOMBRE,C.URL_PORTADA FROM CURSOS AS C INNER JOIN INSCRIPCIONES AS I ON I.IDCURSO = C.IDCURSO WHERE I.IDUSUARIO = @IDUSER";
                AccesoBD.SetQuery(query);
                AccesoBD.SetParametro("@IDUSER", IdUsuario);    
                AccesoBD.EjecutarLectura();
                var ListCursos= new List<Curso>();
                while (AccesoBD.Lector.Read())
                {
                    Curso curso = new Curso();
                    curso.IdCurso = (int)AccesoBD.Lector["IDCURSO"];
                    curso.Nombre = (string)AccesoBD.Lector["NOMBRE"];
                    curso.UrlPortada = (string)AccesoBD.Lector["URL_PORTADA"];
                    ListCursos.Add(curso);
                }
                return ListCursos; // List usa Interfaz Ienum asique podemos retornarla. 
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
        public Curso Existencia(int Id)
        {
            ConexionBD AccesoBD = new ConexionBD();

            try
            {
                AccesoBD.SetQuery("SELECT NOMBRE,DESCRIPCION,REQUISITOS,IMPORTE,URL_PORTADA,IDCATEGORIA,FECHA_CREACION from CURSOS as c WHERE c.IDCURSO=@IdCurso");
                AccesoBD.SetParametro("@IdCurso", Id);
                AccesoBD.EjecutarLectura();
                if (AccesoBD.Lector.Read())
                {
                    Curso curso = new Curso();
                    curso.IdCurso = Id;
                    curso.Nombre = (string)AccesoBD.Lector["NOMBRE"];
                    curso.Descripcion = (string)AccesoBD.Lector["DESCRIPCION"];
                    curso.Requisitos = (string)AccesoBD.Lector["REQUISITOS"];
                    curso.Importe = (decimal)AccesoBD.Lector["IMPORTE"];
                    curso.UrlPortada = (string)AccesoBD.Lector["URL_PORTADA"];
                    curso.IdCategoria = (int)AccesoBD.Lector["IDCATEGORIA"];
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
                AccesoBD.CerrarConexion();
            }


        }

        public List<Curso> Listado()
        {
            ConexionBD AccesoBD = new ConexionBD();
            List<Curso> listCurso = new List<Curso>();

            try
            {
                AccesoBD.SetQuery("SELECT IDCURSO NOMBRE,DESCRIPCION,REQUISITOS,IMPORTE,URL_PORTADA,IDCATEGORIA,FECHA_CREACION from CURSOS as c WHERE ");
                AccesoBD.EjecutarLectura();
                while (AccesoBD.Lector.Read())
                {
                    Curso curso = new Curso();
                    curso.IdCurso = (int)AccesoBD.Lector["IDCURSO"];
                    curso.Nombre = (string)AccesoBD.Lector["NOMBRE"];
                    curso.Descripcion = (string)AccesoBD.Lector["DESCRIPCION"];
                    curso.Requisitos = (string)AccesoBD.Lector["REQUISITOS"];
                    curso.Importe = (decimal)AccesoBD.Lector["IMPORTE"];
                    curso.UrlPortada = (string)AccesoBD.Lector["URL_PORTADA"];
                    curso.IdCategoria = (int)AccesoBD.Lector["IDCATEGORIA"];
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
                AccesoBD.CerrarConexion();
            }

        }



    }
}


