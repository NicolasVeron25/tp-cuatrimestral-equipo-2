using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
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
                llenarLenguajes();
            }
        }
        public void llenarLenguajes()
        {
            var lenguajeGestion = new LenguajesGestion();
            ListaLenguajes = lenguajeGestion.ListarLenguajes();
            DgwLenguajes.DataSource = ListaLenguajes;
            DgwLenguajes.DataBind();
        }
        protected void DgwLenguajes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // agregar la logica para manejar otras acciones en el Gridview
        }
        protected void btnAgregarLenguaje_Click(object sender, EventArgs e)
        {
            var nuevoLenguaje = new Lenguaje { Nombre = txtNuevoLenguaje.Text };
            var lenguajeGestion = new LenguajesGestion();
            lenguajeGestion.InsertarLenguaje(nuevoLenguaje);

            // Refresca la lista de lenguajes
            llenarLenguajes();

            // Refresca la paagina para mostrar los cambios
            Response.Redirect(Request.RawUrl);
        }
        protected void ddlAZ_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedItem = int.Parse(ddlAZ.SelectedValue);
            llenarLenguajes();
            if (selectedItem == 1)
            {
                ListaLenguajes = ListaLenguajes.OrderByDescending(x => x.Nombre).ToList();
            }
            else
            {
                ListaLenguajes = ListaLenguajes.OrderBy(x => x.Nombre).ToList();
            }
            DgwLenguajes.DataSource = ListaLenguajes;
            DgwLenguajes.DataBind();
        }
    }
}