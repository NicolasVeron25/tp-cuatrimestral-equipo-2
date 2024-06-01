﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Curso
    {
        public int Idcurso { get; set; }

        public string Nombre { get; set; } 

        public string Descripcion { get; set; }

        public string Requisitos { get; set; } 

        public decimal Importe { get; set; }

        public string UrlPortada { get; set; } 

        public int Idcategoria { get; set; }

        public DateTime? FechaCreacion { get; set; } // ? = acepta nulos

    }
}
