using CodeMentor.AspxUsuario;
using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CodeMentor
{
    public partial class MasterUsuario : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //page contiene objeto(el aspx) a la cual se ejecuta la pagina hija
            //prop page = objeto = puedo manejar accesos a cada pagina mediante

            if (!(Page is Ingresar || Page is Registrar || Page is Default )) //ACA SOLO PUEDE ACCEDER SI NO ESTA LOGUEADO
            {
                // si la pagina NO ES alguna de esas

                if (!Validaciones.Seguridad.Login(Session["Usuario"])) // si no esta logueado , no puede entrar a las paginas de usuario
                {
                    Response.Redirect("Ingresar.aspx", false);
                }
            }
            else // AHORA SI NO ES UNA DE ESAS ES XQUE ES INGRESAR O REGISTRAR
            {
                if (Validaciones.Seguridad.Login(Session["Usuario"]))
                {
                    Response.Redirect("InicioRegistrado.aspx", false); // SI YA ESTA LOGUEADO , NO PUEDE VOLVER A INGRESAR
                }

            }

        }

        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();//limpia la session
            Response.Redirect("Inicio.aspx", false); //redirige a la pagina de login
        }
    }
}