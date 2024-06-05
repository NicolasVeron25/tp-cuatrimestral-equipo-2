using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Validaciones
{
    public class Seguridad
    {
        public static bool Login(object usuario) //se lo pasa desde Session
        {
            Usuario user = usuario != null ? (Usuario)usuario : null; // valida si es null o no y transforma de object a Usuario

            if (user != null )
            {
                return true;

            }
            else
            {
                return false;
            }


        }

    }
}
