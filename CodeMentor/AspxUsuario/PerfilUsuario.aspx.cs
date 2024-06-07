using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CodeMentor
{
    public partial class PerfilUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Validaciones.Seguridad.Login(Session["Usuario"]))
            {
                Response.Redirect("Ingresar.aspx");
            }

            if (!IsPostBack)
            {
                LlenarDatos();
            }
        }


        private void LlenarDatos()
        {
            try
            {
                var user = (Usuario)Session["Usuario"];
                var DatosGestion = new UsuariosGestion();
                var Datos = DatosGestion.ObtenerDatos(user.IdUsuario);

                LblEmail.Text = user.Email;
                LblNombre.Text = Datos.Nombre;
                LblApellido.Text = Datos.Apellido;
                LblFechaNacimiento.Text = Datos.FechaNacimiento.ToString("dd/MM/yyyy");
                LblPais.Text = ObtenerPais(Datos.IdPais);
                LblCelular.Text = Datos.Celular;
                LblSexo.Text = Datos.SexoCompleto;
                if (Datos.UrlFotoPerfil != null)
                {
                    ImgPerfil.ImageUrl = Datos.UrlFotoPerfil;
                }
                else
                {
                    ImgPerfil.ImageUrl = "https://www.shutterstock.com/image-vector/image-icon-trendy-flat-style-600nw-643080895.jpg";
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
           


        }
        private string ObtenerPais(int id)
        {
            try
            {
                var Pais = new PaisesGestion();
                return Pais.ObtenerPais(id);
            }
            catch (Exception ex)
            {

                throw ex;
            }   
            
        }

    }
}