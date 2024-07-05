﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Dominio.DataTransferObjects;
using Dominio.DTOS;
using Negocio;
using Validaciones.Logicas;

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
                    lblCantUsuarios.Text = "Total : " +listaUsuarios.Count.ToString();
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
            InscripcionesGestionDto inscripcion = new InscripcionesGestionDto();


            foreach (GridViewRow row in gviewUsuarios.Rows)
            {
                CheckBox chkEliminar = (CheckBox)row.FindControl("chkEliminar");
                int idUsuario = (int)gviewUsuarios.DataKeys[row.RowIndex].Value;
                EliminarUsuarioValidacion validador = new EliminarUsuarioValidacion();
                    var existe = validador.Validate(inscripcion);
                var error = existe.Errors.FirstOrDefault(x => x.PropertyName == "IdInscripcion");
                if (chkEliminar != null && chkEliminar.Checked)
                {
                    if (!existe.IsValid)
                    {
                        userGestion.EliminarUsuario(idUsuario);

                    }
                    else
                    {
                        ErrorEliminar.InnerText = error.ErrorMessage;
                        ErrorEliminar.Visible = true;
                        // informar que el usuario esta inscripto en algun curso
                        return;
                    }


                }
            }

            // Refrescar la grilla después de eliminar usuarios
            List<InfoUsuarioDto> listaUsuarios = userGestion.ListarUsuarios();
            gviewUsuarios.DataSource = listaUsuarios;
            gviewUsuarios.DataBind();

            lblCantUsuarios.Text ="Total : " + listaUsuarios.Count.ToString();
        }
    }
}
