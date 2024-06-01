using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Respuesta
    {
        public int Idrespuesta { get; set; }

        public int Idpregunta { get; set; }

        public string Cuerpo { get; set; }

        public DateTime? Fecha { get; set; }
    }
}
