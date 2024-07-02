using Dominio;
using Negocio;
using Org.BouncyCastle.Asn1.Ocsp;
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
            if (!IsPostBack && Request.QueryString["idClase"] == null)
            {
                var CursoGestion = new CursosGestion();
                var UnidadGestion = new UnidadGestion();
                var ClaseGestion = new ClaseGestion();

                    //// Revisar
                    //if (!int.TryParse(Request.QueryString["idCurso"], out int idCurso))
                    //{
                    //    // Si idCurso no es un numero valido redirigir a la pagina de inicio
                    //    Response.Redirect("Inicio.aspx");
                    //    return;
                    //}

                    llenarCurso();
                    LlenarUnidadesRpt();
                    // Obtener la lista de unidades para el curso actual

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

            if(Request.QueryString["idClase"] != null)
            {
                var idClase = int.Parse(Request.QueryString["idClase"]);
                var ClaseGestion = new ClaseGestion();




                var clase = ClaseGestion.ListarClases().FirstOrDefault(c => c.IdClase == idClase);

                var GestionUnidades = new UnidadGestion();
                ListaUnidades = GestionUnidades.Listado().Where(u => u.IdUnidad == clase.IdUnidad).ToList();
                //llenar cursos 
                var GestionCurso = new CursosGestion();
                CursoActual = GestionCurso.Existencia(ListaUnidades.FirstOrDefault().IdCurso);


                MostrarVideo(clase.UrlVideo);
            }
        }
        public List<Clase> ListarClases(int IdUnidad) {
            var ClaseGestion = new ClaseGestion();
            return ClaseGestion.ObtenerClasesPorUnidad(IdUnidad);

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
            ListaUnidades = unidadGestion.ObtenerUnidadesPorCurso(int.Parse(Request.QueryString["idCurso"]));
        }
   


        private void MostrarVideo(string urlVideo)
        {
            videoFrame.Text = urlVideo;
        }

    
    }
}