using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CodeMentor.AspxAdmin
{
    public partial class AdminLenguajes : System.Web.UI.Page
    {
        public List<Lenguaje> ListaLenguajes { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarLenguajes();
            }
        }

        private void CargarLenguajes()
        {
            var lenguajeGestion = new LenguajesGestion();
            ListaLenguajes = lenguajeGestion.ListarLenguajes();
            if (ListaLenguajes == null)
            {
                ListaLenguajes = new List<Lenguaje>();
            }
        }

        protected void btnAgregarLenguaje_Click(object sender, EventArgs e)
        {
            var nuevoLenguaje = new Lenguaje { Nombre = txtNuevoLenguaje.Text };
            var lenguajeGestion = new LenguajesGestion();
            lenguajeGestion.InsertarLenguaje(nuevoLenguaje);

            // Refrescar la lista de lenguajes
            CargarLenguajes();

            // Refrescar la página para mostrar los cambios
            Response.Redirect(Request.RawUrl);
        }
        protected void btnModificarLenguaje_Click(Object sender, EventArgs e)
        {

        }

        protected void btnEliminarLenguaje_Click(Object sender, EventArgs e)
        {

        }
    }
}
