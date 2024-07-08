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
        public Usuario UsuarioActual { get; set; }
        public Curso CursoManejo { get; set; }
        //public Inscripcion inscripcion { get; set; }

        public InscripcionesGestion nuevaInscripcion { get; set; }
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

        protected void BtnGenerarInscripcion_Click(object sender, EventArgs e)
        {
        InscripcionesGestion inscripcion = new InscripcionesGestion();
              Inscripcion inscripcion1 = new Inscripcion();
            inscripcion1.IdCurso = int.Parse(Request.QueryString["ComoInscribirse"]);
            UsuarioActual = (Usuario)Session["Usuario"];
            inscripcion1.IdUsuario=UsuarioActual.IdUsuario;
            inscripcion.InsertarInscripcion(inscripcion1);

        }
    }
}