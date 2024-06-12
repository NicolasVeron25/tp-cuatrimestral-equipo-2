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
    public partial class Registrar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Validaciones.Seguridad.Login(Session["Usuario"]))
            {
                Response.Redirect("InicioRegistrado.aspx", false);
            }
            if (!IsPostBack)
            {
                DdlListaPaises();
                DdlLlenarSexo();

            }
            //FALTA FOTO DE PERFIL QUE INGRESE!!
            //OPCION DE VER CONTRASEÑA
            //VALIDACION COINCIDENCIA DE PASS 
            //VALIDACION FECHA NACIMIENTO NO SER MAYOR A LA ACTUAL  O MINIMO 18 AÑOS
            //PROBAR HACER CON FLUENT  VALIDATION

        }


        protected void BtnRegistro_Click(object sender, EventArgs e)
        {
            InsertarUsuario();
            Response.Redirect("InicioRegistrado.aspx", false);

        }

        private void InsertarUsuario()
        {

            try
            {
                var User = new Usuario();
                User.Email = TxtEmail.Text;
                User.Pass = TxtPass.Text;
                var UserDatos = new InformacionUsuario();
                UserDatos.Nombre = TxtNombre.Text;
                UserDatos.Apellido = TxtApellido.Text;
                UserDatos.FechaNacimiento = DateTime.Parse(TxtFechaNacimiento.Text);
                UserDatos.IdPais = int.Parse(DdlPais.SelectedValue);
                UserDatos.Celular = TxtCelular.Text;
                UserDatos.Sexo = DdlSexo.SelectedValue;


                //ADMIN = DEFAULT 0 EN BD, FECHA CREACION DEFAULT EN BD
                var UsuarioGestion = new UsuariosGestion();
              int IdInsertado=  UsuarioGestion.InsertarUsuarioSP(User.Email,User.Pass,UserDatos);

                //GUARDAR ID EN SESSION
                User.IdUsuario = IdInsertado;
                Session.Add("Usuario", User);
                

            }
            catch (Exception ex)
            {
                throw ex;   
                //ALGO ACA..
            }
         
        }
        private void DdlLlenarSexo()
        {
           var Sexo = new List<string>();
            Sexo.Add("Masculino");
            Sexo.Add("Femenino");
            DdlSexo.DataSource = Sexo;
            DdlSexo.DataBind();

        }
        private void DdlListaPaises() //metodos accesibles en este aspx nomas
        {
            var PaisesGestion = new PaisesGestion();

            DdlPais.DataSource = PaisesGestion.ListadoPaises();
            DdlPais.DataTextField = "Nombre";
            DdlPais.DataValueField = "IdPais";
            DdlPais.DataBind();
        }

    }
}