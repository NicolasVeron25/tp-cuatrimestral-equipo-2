using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Dominio.DataTransferObjects;
using Negocio;

namespace CodeMentor.AdminAspx
{
    public partial class AdminUsuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        List<InfoUsuarioDto> listaUsuarios = new List<InfoUsuarioDto>();
        UsuariosGestion userGestion = new UsuariosGestion();
        listaUsuarios = userGestion.ListarUsuarios();
            gviewUsuarios.DataSource = listaUsuarios;
            gviewUsuarios.DataBind();
            gviewUsuarios.Visible = false;
            btnOcultar.Visible = false;
            if (listaUsuarios.Count == 0)
            {
       
            lblCantUsuarios.Text = listaUsuarios.Count.ToString();
            }
         

        }

 

        protected void btnVerUsuarios_Click(object sender, EventArgs e)
        {
            gviewUsuarios.Visible = true;   
            btnOcultar.Visible=true;
            UsuariosGestion n= new UsuariosGestion();
            
        }

        protected void btnOcultar_Click(object sender, EventArgs e)
        {
            gviewUsuarios.Visible=false;
        }

        protected void gviewUsuarios_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
  
}