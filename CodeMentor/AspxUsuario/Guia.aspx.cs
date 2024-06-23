using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CodeMentor.AspxUsuario.Ayuda
{
    public partial class Guia : System.Web.UI.Page
    {
        public Curso CursoManejo { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Obtenercurso();
            
            }
        }
        public void Obtenercurso()
        {
            if (Request.QueryString["ComoInscribirse"] == null)
            {
                return;
            }
            int idCurso = int.Parse(Request.QueryString["ComoInscribirse"]);
            var GestionCurso = new CursosGestion();
            if (GestionCurso.Existencia(idCurso) == null)
            {
                return;
            }

            CursoManejo = GestionCurso.Existencia(idCurso);

        }
    }
}