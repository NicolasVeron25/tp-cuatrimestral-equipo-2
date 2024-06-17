using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.DataTransferObjects
{
    public class ReseñasDto
    {
        public string NombreUsuario { get; set; }

        public string ApellidoUsuario { get; set; }

        public string NombreCurso { get; set; }

        public int Puntaje { get; set; }

        public string Descripcion { get; set; }

    }
}
