using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Cursos
    {
        public int IdCurtso { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }        
        public string Requisitos { get; set; }
        public float Importe { get; set; }
        public int IdCategoria { get; set; }
        public string URLPortada { get; set; }
        public string FechaCreacion { get; set; }

    }
}
