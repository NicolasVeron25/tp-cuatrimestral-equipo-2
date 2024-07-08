using Dominio;
using Dominio.DataTransferObjects;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CodeMentor.AspxAdmin
{
    public partial class AdminCategoria : System.Web.UI.Page
    {
        public List<Categoria> ListaCategorias { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                llenarCategorias();
            }
        }
        public void llenarCategorias()
        {
            var cateGestion = new CategoriasGestion();
            ListaCategorias = cateGestion.ListarCategorias();
            DgwCategorias.DataSource = ListaCategorias;
            DgwCategorias.DataBind();
        }
        protected void ddlAZ_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedItem = int.Parse(ddlAZ.SelectedValue);
            llenarCategorias();
            if (selectedItem == 1)
            {
                ListaCategorias = ListaCategorias.OrderByDescending(x => x.Nombre).ToList();

            }
            else
            {
                ListaCategorias = ListaCategorias.OrderBy(x => x.Nombre).ToList();

            }
            DgwCategorias.DataSource = ListaCategorias;
            DgwCategorias.DataBind();
        }
    }
}