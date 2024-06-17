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
    public partial class AdminUsuarios : System.Web.UI.Page
    {
        List<InformacionUsuario> listaUsuarios = new List<InformacionUsuario>();
        UsuariosGestion userGestion = new UsuariosGestion();
        protected void Page_Load(object sender, EventArgs e)
        {
             listaUsuarios = userGestion.ListarUsuarios();                 
            if (listaUsuarios.Count == 0)
            {
                lblCantUsuarios.Text = "0";
            }
            else
            {
            lblCantUsuarios.Text = listaUsuarios.Count.ToString();

            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void btnVerUsuarios_Click(object sender, EventArgs e)
        {
            
        }
    }
  
}