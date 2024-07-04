using Dominio;
using Dominio.DataTransferObjects;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Validaciones
{
    public static class Helper
    {
        //devuelve el DTO
        public static List<CursosAdminDto> LlenaryMapearCursosAdminDto()
        {
            //gestiones
            var cursoGestion = new CursosGestion();
            var UnidadesGestion = new UnidadGestion();
            var ClasesGestion = new ClaseGestion();
            var CategoriaGestion = new CategoriasGestion();
            var InscripcionGestion = new InscripcionesGestion();
            var LenguajesGestion = new LenguajesGestion();
            
            //listados necesarios
            var listaCursos = cursoGestion.Listado();
            var listaCursosDto = new List<CursosAdminDto>();
            
            //llenado de info
            foreach (var curso in listaCursos)
            {
                //info curso
                var cursoDto = new CursosAdminDto();
                cursoDto.IdCurso = curso.IdCurso;
                cursoDto.Nombre = curso.Nombre;
                cursoDto.Descripcion = curso.Descripcion;
                cursoDto.Requisitos = curso.Requisitos;
                cursoDto.Importe = curso.Importe;
                cursoDto.UrlPortada = curso.UrlPortada;
                cursoDto.IdCategoria = curso.IdCategoria;
                cursoDto.FechaCreacion = curso.FechaCreacion;
                //cats
               cursoDto.NombreCategoria = CategoriaGestion.ObtenerNombreCategoria(curso.IdCategoria);


                //info inscripciones
                cursoDto.CantidadInscriptos = InscripcionGestion.CantidadInscriptos(curso.IdCurso);
                
                //info lenguajes

                cursoDto.LenguajesAsociados = LenguajesGestion.ObtenerLenguajesPorCurso(curso.IdCurso);

                //info unidades y clases
                cursoDto.Unidades = UnidadesGestion.ObtenerUnidadesPorCurso(curso.IdCurso);
                //recorro unidades y asigno mediante clave valor al Dicc
                foreach (var unidad in cursoDto.Unidades)
                {
                    var clases = ClasesGestion.ObtenerClasesPorUnidad(unidad.IdUnidad);
                    cursoDto.UnidadesClasesDiccionario.Add(unidad.IdUnidad, clases);
                }

                listaCursosDto.Add(cursoDto);
            }

            return listaCursosDto;

        }
        public static InfoUsuarioDto MapearUsuario(Usuario user, InformacionUsuario userDatos) //para no usar autommaping por tema de tiempos .
        {
            var DtoUser = new InfoUsuarioDto();
            DtoUser.Idusuario = userDatos.Idusuario;
            DtoUser.UrlFotoPerfil = userDatos.UrlFotoPerfil;
            DtoUser.Nombre = userDatos.Nombre;
            DtoUser.Apellido = userDatos.Apellido;
            DtoUser.Email = user.Email;
            DtoUser.Celular = userDatos.Celular;
            DtoUser.FechaNacimiento = userDatos.FechaNacimiento;
            DtoUser.Pass = user.Pass;   
            return DtoUser;
        }

        public static InformacionUsuario ObtenerDatos(object user)
        {
            var UserGestion = new UsuariosGestion();
            var InfoUser = new InformacionUsuario();

            Usuario usuario = (Usuario)user;
            InfoUser = UserGestion.ObtenerDatos(usuario.IdUsuario);
            InfoUser.Idusuario = usuario.IdUsuario;
            return InfoUser;

        }

        public static string  ObtenerNombreAdmin()
        {
            var UserGestion = new UsuariosGestion();
            var infoAdmin = UserGestion.ObtenerAdmin();
            string nombre = infoAdmin.Nombre + " " + infoAdmin.Apellido;
            return nombre;

        }
     

    }
}
