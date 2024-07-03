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

        // Metodos
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Request.QueryString["idClase"] == null)
            {
                
                llenarCursoActual();
                llenarUniudades();
                llenarClases();

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

            if (Request.QueryString["idClase"] != null)
            {
                var idClase = int.Parse(Request.QueryString["idClase"]);
                var ClaseGestion = new ClaseGestion();
                var clase = ClaseGestion.ListarClases().FirstOrDefault(c => c.IdClase == idClase);

                var GestionUnidades = new UnidadGestion();
                ListaUnidades = GestionUnidades.Listado().Where(u => u.IdUnidad == clase.IdUnidad).ToList();

                //llenar cursos 
                var GestionCurso = new CursosGestion();
                CursoActual = GestionCurso.Existencia(ListaUnidades.FirstOrDefault().IdCurso);

                llenarUnidades(CursoActual.IdCurso);

                // MUESTRO EL VIDEO
                MostrarVideo(clase.UrlVideo);
            }
        }
        public List<Clase> ListarClases(int IdUnidad)
        {
            var ClaseGestion = new ClaseGestion();
            return ClaseGestion.ObtenerClasesPorUnidad(IdUnidad);
        }
        public void llenarCursoActual()
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
                // Si el curso es nulo redirecciona al inicio redirigir a la pagina de inicio
                Response.Redirect("Inicio.aspx", false);
            }

            if (CursoActual == null)
            {
                // Si el curso no existe redirigir a la pagina de inicio
                Response.Redirect("Inicio.aspx");
                return;
            }
        }
        public void llenarUniudades() // Llena las unidades por primera vez en la pagina con el id de curso que se recibe por url
        {
            var UnidadGestion = new UnidadGestion();
            ListaUnidades = UnidadGestion.ObtenerUnidadesPorCurso(int.Parse(Request.QueryString["idCurso"]));
        }
        public void llenarUnidades(int idCurso) // Llena las unidades luego de refrescar la pagina con otra clase
        {
            var UnidadGestion = new UnidadGestion();
            ListaUnidades = UnidadGestion.ObtenerUnidadesPorCurso(idCurso);
        }
        public void llenarClases()
        {
            // Inicializar el diccionario para almacenar las clases por unidad
            var ClaseGestion = new ClaseGestion();
            ClasesPorUnidad = new Dictionary<int, List<Clase>>();

            // Obtener las clases para cada unidad
            foreach (var unidad in ListaUnidades)
            {
                var clases = ClaseGestion.ObtenerClasesPorUnidad(unidad.IdUnidad);
                ClasesPorUnidad[unidad.IdUnidad] = clases ?? new List<Clase>();
            }
        }
        private void MostrarVideo(string urlVideo)
        {
            videoFrame.Text = urlVideo;
        }
    }
}