using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Reseña
    {
        public int Idreseña { get; set; }

        public int Idinscripcion { get; set; }

        public int Idcurso { get; set; }

        public int Puntaje { get; set; }

        public string Descripcion { get; set; }
    }
}
