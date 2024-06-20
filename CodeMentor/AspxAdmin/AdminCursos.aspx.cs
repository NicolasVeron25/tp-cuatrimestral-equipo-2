using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace CodeMentor.AdminAspx
{
    public partial class AdminCursos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CursosGestion curso = new CursosGestion();
            List<Curso> cursoList = curso.Listado();
            if (!IsPostBack)
            {
            repRepetidor.DataSource = cursoList;
            repRepetidor.DataBind();

            }

        }

        protected void ButtonModificar_Click(object sender, EventArgs e)
        {
            string valor = ((Button)sender).CommandArgument;
        }
    }
}