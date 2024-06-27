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
        public static InfoUsuarioDto MapearUsuario(Usuario user, InformacionUsuario userDatos) //para no usar autommaping por tema de tiempos .
        {
            var DtoUser = new InfoUsuarioDto();
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
