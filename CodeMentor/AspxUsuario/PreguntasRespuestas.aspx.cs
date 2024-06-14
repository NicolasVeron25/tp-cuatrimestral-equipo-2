using Dominio;
using Negocio;
using Validaciones;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.SqlServer.Server;

namespace CodeMentor
{
    public partial class PreguntasRespuestas : System.Web.UI.Page
    {

        public List<Pregunta> ListadoPreguntas { get; set; }
        public Respuesta RespuestaFront { get; set; }
        
        public Curso CursoActual { get; set; }

        public InformacionUsuario UsuarioActual { get; set; }


        public bool VerTodas { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Validaciones.Seguridad.Login(Session["Usuario"]))
            {

                Response.Redirect("Ingresar.aspx");
            }
            if (!IsPostBack)
            {
                if (ObtenerCursoActual() == 0)
                {
                    Response.Redirect("InicioRegistrado.aspx");
                }
                UsuarioActual = Validaciones.Helper.ObtenerDatos(Session["Usuario"]);
                LlenarListadoPreguntas();
                PanelNuevaPregunta.Visible = false;
                PanelPreguntasUsuario.Visible = false;
                VerTodas = false;
            }

            
        }

     
        public int ObtenerCursoActual()
        {
            var CursoGestion = new CursosGestion();
            try
            {
                int idCurso = int.Parse(Request.QueryString["IdCurso"]); // CAMBIAR A SESSION PARA RESTRINGIR ACCESO VIA URL! 
                if (idCurso == null) { Response.Redirect("InicioRegistrado.aspx"); }
                CursoActual = CursoGestion.Existencia(idCurso);
                if (CursoGestion == null)
                {

                    return 0;
                }
                return 1;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void LlenarListadoPreguntas()
        {
            var PregGestion = new PreguntasGestion();
            try
            {
                ListadoPreguntas = PregGestion.ListadoPreguntas(CursoActual.IdCurso);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public void ObtenerRespuesta(int idPregunta)
        {
            var RespuestaGestion = new RespuestasGestion();
            try
            {
                RespuestaFront = RespuestaGestion.Existencia(idPregunta);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void BtnVerTodas_Click(object sender, EventArgs e)
        {
            UsuarioActual = Validaciones.Helper.ObtenerDatos(Session["Usuario"]);

            ObtenerCursoActual();
            LlenarListadoPreguntas();
            PanelPreguntasRespuestas.Visible = true;
            PanelPreguntasUsuario.Visible = false;

            VerTodas = true;
        }

        protected void BtnVerPreguntasUsuario_Click(object sender, EventArgs e)
        {
            UsuarioActual = Validaciones.Helper.ObtenerDatos(Session["Usuario"]);

            ObtenerCursoActual();
            LlenarListadoPreguntas();
            List<Pregunta> ListadoPreguntasAux = ListadoPreguntas.Where(x => x.IdUsuario == UsuarioActual.Idusuario && x.IdCurso == CursoActual.IdCurso).ToList();
            if (ListadoPreguntasAux != null)
                ListadoPreguntas = ListadoPreguntasAux; // LLENO CON PREGUNTAS DE ESTE USUARIO

            PanelPreguntasRespuestas.Visible = false;
            PanelPreguntasUsuario.Visible = true;

        }

        protected void BtnAñadirPregunta_Click(object sender, EventArgs e)
        {
            PanelNuevaPregunta.Visible = true;

            PanelUltimasPreg.Visible = false;
            PanelPreguntasRespuestas.Visible = false;

        }

        protected void BtnCancelarAñadirPregunta_Click(object sender, EventArgs e)
        {
            PanelNuevaPregunta.Visible = false;

            PanelUltimasPreg.Visible = true;
            PanelPreguntasRespuestas.Visible = true;
            UsuarioActual = Validaciones.Helper.ObtenerDatos(Session["Usuario"]);
            VerTodas = true;
            ObtenerCursoActual();
            LlenarListadoPreguntas();
        }


        protected void BtnGuardarPregunta_Click(object sender, EventArgs e)
        {
            //validar nulo vacio 
            var Pregunta = new Pregunta();
            Pregunta.Titulo = TxtTitulo.Text;
            Pregunta.Cuerpo = TxtCuerpo.Text;
            Pregunta.IdCurso = CursoActual.IdCurso;
            Pregunta.IdUsuario = UsuarioActual.Idusuario;
            var PregGestion = new PreguntasGestion();
            PregGestion.AltaPregunta(Pregunta);

        }



        protected void BtnModificarPregunta_Click(object sender, EventArgs e)
        {
            /*
            if (!(string.IsNullOrEmpty(LblTituloPregunta.Text)) && !(string.IsNullOrEmpty(LblCuerpoPregunta.Text)))
            {

                var PregGestion = new PreguntasGestion();
                var PreguntaModificar = new Pregunta();
                PregGestion.ModificarPregunta(PreguntaModificar);
            }*/

        }


    }
}