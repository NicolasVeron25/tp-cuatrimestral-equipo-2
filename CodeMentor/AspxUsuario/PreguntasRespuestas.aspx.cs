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
using Dominio.DataTransferObjects;
using System.Runtime.InteropServices.WindowsRuntime;

namespace CodeMentor
{
    public partial class PreguntasRespuestas : System.Web.UI.Page
    {
        public bool ViendoUsuarios { get; set;}
        public InformacionUsuario UsuarioActual { get; set; }
        public List<PreguntaRespuestaDto> ListadoPreguntasRespuestas { get; set; }
        public Curso CursoActual { get; set; }

        private PreguntasGestion PregGestion = new PreguntasGestion();

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
                LLenarPreguntasRespuestas();
                LlenarUltimasDos();
                PanelPreguntasUsuario.Visible = false;
                PanelNuevaPregunta.Visible = false;

            }

        }
        public void LlenarUltimasDos()
        {
            ListadoPreguntasRespuestas = ListadoPreguntasRespuestas.Take(2).ToList();
        }

        public void ObtenerUsuario()
        {
            UsuarioActual = Validaciones.Helper.ObtenerDatos(Session["Usuario"]);

        }
        public int ObtenerCursoActual()
        {
            var CursoGestion = new CursosGestion();
            try
            {
                if (Request.QueryString["IdCurso"] == null) { Response.Redirect("InicioRegistrado.aspx"); }

                int idCurso = int.Parse(Request.QueryString["IdCurso"]); // CAMBIAR A SESSION PARA RESTRINGIR ACCESO VIA URL! 
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


        public bool ObtenerRespuesta(int idPregunta)
        {
            var RespuestaGestion = new RespuestasGestion();
            try
            {
                var RespuestaExiste = RespuestaGestion.Existencia(idPregunta);
                if (RespuestaExiste == null)
                {
                    return false;
                }
                return true;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void BtnVerTodas_Click(object sender, EventArgs e)
        {

            ObtenerCursoActual();

            LLenarPreguntasRespuestas();

        }

        protected void BtnVerPreguntasUsuario_Click(object sender, EventArgs e)
        {
            ObtenerUsuario();
            ObtenerCursoActual();
            LLenarPreguntasRespuestas();
            ListadoPreguntasRespuestas = ListadoPreguntasRespuestas.Where(x => x.IdUsuario == UsuarioActual.Idusuario && x.IdCurso == CursoActual.IdCurso).ToList();
            ViendoUsuarios = true;
        }

        protected void BtnAñadirPregunta_Click(object sender, EventArgs e)
        {
            ObtenerUsuario();
            ObtenerCursoActual();
            PanelNuevaPregunta.Visible = true;

            PanelPreguntas.Visible = false;
        }

        protected void BtnCancelarAñadirPregunta_Click(object sender, EventArgs e)
        {

            ObtenerUsuario();
            ObtenerCursoActual();

            Response.Redirect("Preguntasrespuestas.aspx?IdCurso=" + CursoActual.IdCurso);
        }


        protected void BtnGuardarPregunta_Click(object sender, EventArgs e)
        {
            //validar nulo vacio 
            var Pregunta = new Pregunta();
            Pregunta.Titulo = TxtTitulo.Text;
            Pregunta.Cuerpo = TxtCuerpo.Text;
            ObtenerCursoActual();
            Pregunta.IdCurso = CursoActual.IdCurso;
            ObtenerUsuario();

            Pregunta.IdUsuario = UsuarioActual.Idusuario;
            var PregGestion = new PreguntasGestion();
            PregGestion.AltaPregunta(Pregunta);

            Response.Redirect("Preguntasrespuestas.aspx?IdCurso=" + CursoActual.IdCurso);

        }

        public void LLenarPreguntasRespuestas()
        {

            var UsuarioGestion = new UsuariosGestion();
            var CursoGestion = new CursosGestion();
            var RespGestion = new RespuestasGestion();

            //recorro todas preguntas existentes 
            ListadoPreguntasRespuestas = new List<PreguntaRespuestaDto>();

            foreach (var pregunta in PregGestion.ListadoPreguntas(CursoActual.IdCurso))
            {
                var Usuario = UsuarioGestion.ObtenerDatos(pregunta.IdUsuario);
                var Curso = CursoGestion.Existencia(pregunta.IdCurso);
                var Respuesta = RespGestion.Existencia(pregunta.IdPregunta);

                var PreguntaRespuesta = new PreguntaRespuestaDto
                {
                    IdPregunta = pregunta.IdPregunta,
                    IdCurso = pregunta.IdCurso,
                    NombreCurso = Curso.Nombre,
                    IdUsuario = pregunta.IdUsuario,
                    NombreApellidoUser = Usuario.Nombre + " " + Usuario.Apellido,
                    FechaPregunta = pregunta.Fecha,
                    TituloPregunta = pregunta.Titulo,
                    CuerpoPregunta = pregunta.Cuerpo,
                    IdRespuesta = null,
                    CuerpoRespuesta = null,
                    FechaRespuesta = null,
                };
                if (Respuesta != null)
                {
                    PreguntaRespuesta.IdRespuesta = Respuesta.IdRespuesta;
                    PreguntaRespuesta.CuerpoRespuesta = Respuesta.Cuerpo;
                    PreguntaRespuesta.FechaRespuesta = Respuesta.Fecha;
                }
                ListadoPreguntasRespuestas.Add(PreguntaRespuesta);
            }
            ListadoPreguntasRespuestas = ListadoPreguntasRespuestas.OrderByDescending(x => x.FechaPregunta).ToList(); //ORDENAMOS POR FECHA RECIENTE!

        }

      



       
    }
}