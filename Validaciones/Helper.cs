using Dominio;
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
