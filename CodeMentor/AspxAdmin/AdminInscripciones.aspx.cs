using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio.DataTransferObjects;
using Dominio.DTOS;
using iTextSharp.text;
using Negocio;

namespace CodeMentor.AspxAdmin
{
    public partial class AdminInscripciones1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<InscripcionesGestionDto> list = new List<InscripcionesGestionDto>();
                InscripcionesGestion inscripcion = new InscripcionesGestion();
                list = inscripcion.ListarInscripciones();
                GridViewInscripciones.DataSource = list;
                GridViewInscripciones.DataBind();
                GridViewInscripciones.Visible = false;
                btnOcultar.Visible = false;

            }
        }
        /*
         
         */
        protected void btn_VerInscripciones_Click(object sender, EventArgs e)
        {

            GridViewInscripciones.Visible = true;
            btnOcultar.Visible = true;


        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {


            InscripcionesGestion inscripcion = new InscripcionesGestion();
            foreach (GridViewRow row in GridViewInscripciones.Rows)
            {
                CheckBox chkEliminar = (CheckBox)row.FindControl("chkEliminar");
                if (chkEliminar != null && chkEliminar.Checked)
                {

                    int idInscripcion = (int)GridViewInscripciones.DataKeys[row.RowIndex].Value;
                    inscripcion.EliminarInscripcion(idInscripcion);
                }
            }

            //Refrescar la grilla después de eliminar inscripciones
            List<InscripcionesGestionDto> listainscripcion = inscripcion.ListarInscripciones();
            GridViewInscripciones.DataSource = listainscripcion;
            GridViewInscripciones.DataBind();

        }

        protected void btnOcultar_Click(object sender, EventArgs e)
        {
            GridViewInscripciones.Visible = false;
            btnOcultar.Visible = false;
        }
    }
}
