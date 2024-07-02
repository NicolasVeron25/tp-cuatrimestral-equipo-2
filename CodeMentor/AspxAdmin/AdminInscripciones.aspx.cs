using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio.DTOS;
using Negocio;

namespace CodeMentor.AspxAdmin
{
    public partial class AdminInscripciones1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_VerInscripciones_Click(object sender, EventArgs e)
        {
         InscripcionesGestion inscripcion = new InscripcionesGestion();             
            List<InscripcionesGestionDto> list = inscripcion.ListarInscripciones();
            GridViewInscripciones.DataSource = list;
            GridViewInscripciones.DataBind();
            

        }
    }
}