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
    public partial class Reproduccion : System.Web.UI.Page
    {
        public Curso CursoActual { get; set; }
        public List<Unidad> ListaUnidades { get; set; }
        public Dictionary<int, List<Clase>> ClasesPorUnidad { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var CursoGestion = new CursosGestion();
                var UnidadGestion = new UnidadGestion();
                var ClaseGestion = new ClaseGestion();

                try
                {
                    //// Revisar
                    //if (!int.TryParse(Request.QueryString["idCurso"], out int idCurso))
                    //{
                    //    // Si idCurso no es un numero valido redirigir a la pagina de inicio
                    //    Response.Redirect("Inicio.aspx");
                    //    return;
                    //}

                    llenarCurso();

                    // Obtener la lista de unidades para el curso actual
                    ListaUnidades = UnidadGestion.ObtenerUnidadesPorCurso(idCurso) ?? new List<Unidad>();

                    // Inicializar el diccionario para almacenar las clases por unidad
                    ClasesPorUnidad = new Dictionary<int, List<Clase>>();

                    // Obtener las clases para cada unidad
                    foreach (var unidad in ListaUnidades)
                    {
                        var clases = ClaseGestion.ObtenerClasesPorUnidad(unidad.IdUnidad);
                        ClasesPorUnidad[unidad.IdUnidad] = clases ?? new List<Clase>();
                    }

                    // Mostrar el video de la primera clase si existe
                    if (ClasesPorUnidad.Count > 0)
                    {
                        var primeraClase = ClasesPorUnidad.First().Value.FirstOrDefault();
                        if (primeraClase != null)
                        {
                            MostrarVideo(primeraClase.UrlVideo);
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Redirect("Error.aspx?mensaje=" + HttpUtility.UrlEncode(ex.Message));
                }
            }
        }

        public void llenarCurso()
        {

            var CursoGestion = new CursosGestion();
            int idCurso = 0;

            if (Request.QueryString["idCurso"] != null)
            {
                idCurso = int.Parse((Request.QueryString["idCurso"]));
                CursoActual = CursoGestion.Existencia(idCurso);

            }
            else
            {
                Response.Redirect("Inicio.aspx", false);
            }

            if (CursoActual == null)
            {
                // Si el curso no existe redirigir a la pagina de inicio
                Response.Redirect("Inicio.aspx");
                return;
            }
        }

        public void LlenarUnidadesRpt()
        {
            var unidadGestion = new UnidadGestion();
            RptUnidades.DataSource = unidadGestion.ObtenerUnidadesPorCurso(CursoActual.IdCurso);
            RptUnidades.DataBind();
        }


        protected void ReproducirClase_Click(object sender, EventArgs e)
        {
            // Llenar lo mismo que en el ispostback
            // pero copn el id de clase que obtengo con el command argument


            LinkButton btn = (LinkButton)sender;
            string videoUrl = btn.CommandArgument;
            MostrarVideo(videoUrl);
        }

        private void MostrarVideo(string urlVideo)
        {
            videoFrame.Text = urlVideo;
        }
    }