using Dominio;
using Negocio;
using Validaciones;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CodeMentor.AspxUsuario
{

    public partial class MisCursos : System.Web.UI.Page
    {
        public List<Curso> CursosInscripto { get; set; }
        public InformacionUsuario InfoUser { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Validaciones.Seguridad.Login(Session["Usuario"]))
            
            {
                Response.Redirect("Ingresar.aspx");
            }
            if (!IsPostBack)
            {
               InfoUser=  Validaciones.Helper.ObtenerDatos(Session["Usuario"]);
                
                 LlenarLista();
            }
           
        }
        public void  BarraProgreso( int idCurso )
        {
            // obtengo cantidad de unidades primero
            var UserGestion = new UsuariosGestion();
            int Unidades = UserGestion.UnidadesXCurso(idCurso);

            // obtengo unidades finalizadas
            int UnidadesFinalizadas = UserGestion.UnidadesFinalizadas(idCurso, InfoUser.Idusuario).Count;

            //calculo progreso
            int Progreso = (UnidadesFinalizadas * 100) / Unidades;
            string progreso = Progreso.ToString() + "%";

            //simulo dato  
            BarraProgresoCurso.Style.Add("width", progreso); // obtner dato mediante calculo
            pProgreso.InnerText = progreso;


        }
       
        public void LlenarLista()
        {
            var CursoGestion = new CursosGestion();
            CursosInscripto = new List<Curso>();
            CursosInscripto = CursoGestion.CursosInscripto(InfoUser.Idusuario);
        }
        
    }

}
