using Dominio;
using Negocio;
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
        public Usuario UsuarioSession { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
          /*  if (!Validaciones.Seguridad.Login(Session["Usuario"]))
            
            {
                Response.Redirect("Ingresar.aspx");
            }
          */
            if (!IsPostBack)
            {
                // ObtenerUsuarioconDatos();
                // LlenarLista();
                BarraProgreso();
            }
           
        }
        public void BarraProgreso( )
        {
            //OBTENER A PARTIR DE UNIDADES FINALIZADAS. 
            //simulo dato  
            string progreso = "90%";
            BarraProgresoCurso.Style.Add("width", progreso); // obtner dato mediante calculo
            pProgreso.InnerText = progreso;
        }
        public void ObtenerUsuarioconDatos()
        {
            var UserGestion = new UsuariosGestion();
            UsuarioSession = (Usuario)Session["Usuario"];
            InfoUser = new InformacionUsuario();
            InfoUser = UserGestion.ObtenerDatos(UsuarioSession.IdUsuario);
        }
        public void LlenarLista()
        {
            var CursoGestion = new CursosGestion();
            CursosInscripto = new List<Curso>();
            CursosInscripto = CursoGestion.CursosInscripto(UsuarioSession.IdUsuario);
        }
        
    }

}
