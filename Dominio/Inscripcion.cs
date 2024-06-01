using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Inscripcion
    {
        public int Idinscripcion { get; set; }

        public int Idcurso { get; set; }

        public int Idusuario { get; set; }

        public DateTime? Fecha { get; set; } // SE CARGA EN BD
    }
}
