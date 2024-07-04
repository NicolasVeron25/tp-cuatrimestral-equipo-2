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
    public partial class AdminCertificados : System.Web.UI.Page
    {
        public List<Certificacion> ListaCertificaciones { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                llenarCertificaciones();
            }
        }
        private void llenarCertificaciones()
        {
            var certiicacionGestion = new CertificacionesGestion();
            ListaCertificaciones = certiicacionGestion.ObtenerTodasLasCertificaciones();
        }
    }
}

