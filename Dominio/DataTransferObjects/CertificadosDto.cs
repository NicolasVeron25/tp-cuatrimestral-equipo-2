using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.DataTransferObjects
{
    public class CertificadosDto
    {
        public int IdCertificaciones { get; set; }
        public int IdInscripcion { get; set; }
        public string NombreApellido { get; set; }
        public string NombreCurso { get; set; }

    }
}
