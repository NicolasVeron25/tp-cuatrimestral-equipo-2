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
            if (!IsPostBack)
            {
                List<InfoUsuarioDto> listaUsuarios = new List<InfoUsuarioDto>();
                UsuariosGestion userGestion = new UsuariosGestion();
                listaUsuarios = userGestion.ListarUsuarios();
                gviewUsuarios.DataSource = listaUsuarios;
                gviewUsuarios.DataBind();
                gviewUsuarios.Visible = false;
                btnOcultar.Visible = false;
                btnConfirmaEliminacion.Visible = false;
                if (listaUsuarios.Count != 0)
                {
                    lblCantUsuarios.Text = listaUsuarios.Count.ToString();
                }
            }
        }

        protected void btnVerUsuarios_Click(object sender, EventArgs e)
        {
            gviewUsuarios.Visible = true;
            btnOcultar.Visible = true;
            btnConfirmaEliminacion.Visible = true;
            UsuariosGestion n = new UsuariosGestion();
        }

        protected void btnOcultar_Click(object sender, EventArgs e)
        {
            gviewUsuarios.Visible = false;
            btnOcultar.Visible = false;
            btnConfirmaEliminacion.Visible = false;
        }

        protected void gviewUsuarios_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void btnConfirmaEliminacion_Click(object sender, EventArgs e)
        {
            UsuariosGestion userGestion = new UsuariosGestion();
            foreach (GridViewRow row in gviewUsuarios.Rows)
            {
                CheckBox chkEliminar = (CheckBox)row.FindControl("chkEliminar");
                if (chkEliminar != null && chkEliminar.Checked)
                {
                    //int idUsuario = Convert.ToInt32(gviewUsuarios.DataKeys[row.RowIndex].Value);
                    int idUsuario = (int)gviewUsuarios.DataKeys[row.RowIndex].Value;
                    //userGestion.EliminarTablaInformacion(idUsuario);
                }
            }

            // Refrescar la grilla después de eliminar usuarios
            List<InfoUsuarioDto> listaUsuarios = userGestion.ListarUsuarios();
            gviewUsuarios.DataSource = listaUsuarios;
            gviewUsuarios.DataBind();
            lblCantUsuarios.Text = listaUsuarios.Count.ToString();
        }
    }
}
