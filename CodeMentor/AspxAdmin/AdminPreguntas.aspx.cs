using System;
using Dominio;
using Negocio;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio.DataTransferObjects;

namespace CodeMentor.AdminAspx
{
    public partial class AdminPreguntas : System.Web.UI.Page
    {
        PreguntasGestion PregGestion = new PreguntasGestion();
        UsuariosGestion UsuarioGestion = new UsuariosGestion();
        CursosGestion CursoGestion = new CursosGestion();
        RespuestasGestion RespGestion = new RespuestasGestion();
        public PreguntaRespuestaDto UltimaPregunta { get; set; }



        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LLenarUltimaPregunta(0);
                LLenarPreguntasSinResponder();
                LLenarPreguntasPorCurso();
                PregGestion = new PreguntasGestion();
                LLenarCursos();
                OcultarUltima();

            }
        }
        public void OcultarUltima() {
            BtnUltimaGuardarCambios.Visible = false;
            BtnUltimaCancelarCambios.Visible= false;
            TxtUltimaModificarCuerpoRespuesta.Enabled = false;
        }
        public void ObtenerUsuario(int idUser)
        {

            var UsuarioGestion = new UsuariosGestion();
            var Usuario = UsuarioGestion.ObtenerDatos(idUser);
        }
        public void LLenarUltimaPregunta(int Identificador, int IdCurso = 0) // x defecto 0 .Sino busca el curso!
        {
            // a futuro= llenar campos con AutoMappers si se llega el tiempo
            
            /* 0 = Ultima Pregunta  
             * 1= Pregunta sin responder
             * 2= Pregunta por Curso
             */


            //llenamos las props que maneja el DTO
            var Pregunta= new Pregunta();
            if (Identificador == 0)
            {
                Pregunta = PregGestion.UltimaPregunta();
            }
            if (Identificador ==1)
            {

            }

            var Usuario = UsuarioGestion.ObtenerDatos(Pregunta.IdUsuario);
            var Curso = CursoGestion.Existencia(Pregunta.IdCurso);
            var Respuesta = RespGestion.Existencia(Pregunta.IdPregunta);

            UltimaPregunta = new PreguntaRespuestaDto
            {
                IdPregunta = Pregunta.IdPregunta,
                IdCurso = Pregunta.IdCurso,
                NombreCurso = Curso.Nombre,
                IdUsuario = Pregunta.IdUsuario,
                NombreApellidoUser = Usuario.Nombre + " " + Usuario.Apellido,
                FechaPregunta = Pregunta.Fecha,
                TituloPregunta = Pregunta.Titulo,
                CuerpoPregunta = Pregunta.Cuerpo,
                IdRespuesta = null,
                CuerpoRespuesta = null,
                FechaRespuesta = null,
            };

            if (Respuesta != null) // si existe una respuesta la cargo!
            {
                UltimaPregunta.IdRespuesta = Respuesta.IdRespuesta;
                UltimaPregunta.CuerpoRespuesta = Respuesta.Cuerpo;
                UltimaPregunta.FechaRespuesta = Respuesta.Fecha;
            }
        }

        #region DataSource/Bind Repeaters
        private void LLenarCursos()
        {
            var CursoGestion = new CursosGestion();
            RptCursos.DataSource = CursoGestion.Listado();
            RptCursos.DataBind();
        }
        private void LLenarPreguntasSinResponder()
        {

            var Preguntas = PregGestion.SinRespuestas();
            RptPreguntasSinResponder.DataSource = Preguntas;
            RptPreguntasSinResponder.DataBind();


        }

        private void LLenarPreguntasPorCurso()
        {
            // Aquí obtienes los datos de las preguntas por curso
            var PregCursos = PregGestion.ListadoPreguntas(1);

            RptPreguntasCurso.DataSource = PregCursos;
            RptPreguntasCurso.DataBind();
        }

        #endregion

        #region Metodos


        #endregion
        protected void BtnUltimaPreg_Click(object sender, EventArgs e)
        {
            LLenarUltimaPregunta(0);
            TxtUltimaModificarCuerpoRespuesta.Enabled = false;

            PanelUltima.Visible = true;
            PanelSinResponder.Visible = false;
          //  PanelPorCurso.Visible = false;

        }

        protected void BtnUltimaEnviarRespuesta_Click(object sender, EventArgs e)
        {
            if(string.IsNullOrEmpty(TxtUltimaCuerpoRespuesta.Text))
            {
                return;
            }
            var Resp = new Respuesta();
            Resp.Cuerpo= TxtUltimaCuerpoRespuesta.Text;
            Resp.IdPregunta = UltimaPregunta.IdPregunta;
            RespGestion.AltaRespuesta(Resp);


        }

        protected void BtnUltimaModificarRespuesta_Click(object sender, EventArgs e)
        {
            LLenarUltimaPregunta(0);
            BtnUltimaGuardarCambios.Visible = true;
            BtnUltimaModificarRespuesta.Visible = false;
            BtnUltimaCancelarCambios.Visible = true;
            TxtUltimaModificarCuerpoRespuesta.Enabled = true;

        }

        protected void BtnUltimaGuardarCambios_Click(object sender, EventArgs e)
        {
            LLenarUltimaPregunta(0);
            string Cuerpo = TxtUltimaModificarCuerpoRespuesta.Text;
            var Resp = new Respuesta();
            Resp.IdRespuesta = UltimaPregunta.IdRespuesta.Value;
            Resp.Cuerpo = Cuerpo;
            Resp.Fecha = DateTime.Now; //actualizamos la fecha tambien
            Resp.IdPregunta= UltimaPregunta.IdPregunta;
            RespGestion.ModificarRespuesta(Resp);
           Response.Redirect("AdminPreguntas.aspx");

        }
    }
}