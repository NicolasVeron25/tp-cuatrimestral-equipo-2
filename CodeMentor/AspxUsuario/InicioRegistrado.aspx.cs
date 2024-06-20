using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CodeMentor
{
    public partial class InicioRegistrado : System.Web.UI.Page
    {
        public List<Curso> ListaCursos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            var CursoGestion = new CursosGestion();
            ListaCursos = CursoGestion.Listado();
        }

        
    }
}