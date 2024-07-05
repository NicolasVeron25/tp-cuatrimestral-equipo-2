using Dominio;
using Dominio.DataTransferObjects;
using Negocio;
using System;
using System.Collections.Generic;
using System.Drawing.Printing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Validaciones;

namespace CodeMentor.AspxAdmin
{
    public partial class EdicionCurso : System.Web.UI.Page
    {
        public CursosAdminDto Curso { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CursoEdicion"] != null)
                {
                 Curso =(CursosAdminDto) Session["CursoEdicion"];
                }
                else
                {
                    Response.Redirect("BackOffice.aspx",false);
                }
                PUnidadNueva.Visible = false;
                PUnidadInvalida.Visible = false;
                PClaseNueva.Visible = false;
            }
        }
        protected void TxtNumeroUnidad_TextChanged(object sender, EventArgs e)
        {
            Curso = (CursosAdminDto)Session["CursoEdicion"];

            //lleno demas con numero de unidad
            if (TxtNumeroUnidad.Text != "")
            {
                int numeroUni = int.Parse(TxtNumeroUnidad.Text);
                if (numeroUni > 0)
                {
                    TxtNumeroUnidad.Text = TxtNumeroUnidad.Text;

                    //existe en bd
                    if (Curso.Unidades.Exists(u => u.Numero == numeroUni)) // exists = existe
                    {
                        var unidad = Curso.Unidades.FirstOrDefault(u => u.Numero == numeroUni);
                        TxtNombreUnidad.Text = unidad.Nombre;
                        TxtDescripcionUnidad.Text = unidad.Descripcion;
                        PUnidadNueva.Visible = false;

                    }
                    else
                    {
                        //no existe en bd
                        PUnidadNueva.Visible = true;
                        PUnidadNueva.InnerText = "Se asignara el numero en base a las unidades existentes";
                        TxtNombreUnidad.Text = "Ingrese nueva unidad";
                        TxtDescripcionUnidad.Text = "Ingrese descripcion de la nueva unidad";
                    }



                }
                else
                {
                    //ingreso algo invalido
                    TxtNumeroUnidad.Text = "0";
                    PUnidadNueva.Visible = true;
                    PUnidadNueva.InnerText = "Ingrese un valor Valido";
                    TxtNombreUnidad.Text = "Ingrese nueva unidad";
                    TxtDescripcionUnidad.Text = "Ingrese descripcion de la nueva unidad";
                }

            }
        }
        protected void TxtNroUnidadClase_TextChanged(object sender, EventArgs e)
        {
            Curso = (CursosAdminDto)Session["CursoEdicion"];

            if(TxtNroUnidadClase.Text != "")
            {
                int numeroUni = int.Parse(TxtNroUnidadClase.Text);
                if (numeroUni > 0)
                {
                    TxtNroUnidadClase.Text = TxtNroUnidadClase.Text;

                    //existe en bd
                    if (Curso.Unidades.Exists(u => u.Numero == numeroUni)) // exists = existe
                    {
                        var unidad = Curso.Unidades.FirstOrDefault(u => u.Numero == numeroUni);
                        TxtNombreUnidadClase.Text = "Unidad : " + unidad.Nombre;
                        PUnidadInvalida.Visible = false;
                        Session.Add("UnidadClase", unidad);
                    }
                    else
                    {
                      PUnidadInvalida.InnerText = "Unidad Inexistente";
                        PUnidadInvalida.Visible = true;
                        TxtNombreUnidadClase.Text = "Ingrese unidad Valida";
                        
                    }
                }
                else
                {
                    TxtNombreUnidadClase.Text = "Ingrese unidad Valida";
                    //numero invalido
                    PUnidadInvalida.InnerText = "Ingrese un valor valido";
                    PUnidadInvalida.Visible = true;
                    TxtNroUnidadClase.Text = "0";


                }
            }
        }
        protected void TxtNumeroClase_TextChanged(object sender, EventArgs e)
        {
            if (Session["UnidadClase"] != null)
            {
                Curso = (CursosAdminDto)Session["CursoEdicion"];

                if (TxtNumeroClase.Text != "")
                {
                    int numeroClase = int.Parse(TxtNumeroClase.Text);
                    if (numeroClase > 0)
                    {
                        int numUnidad = int.Parse(TxtNroUnidadClase.Text);
                        //obtengo la clase
                        //OJO = EL KEY ES EL NUMERO DE UNIDAD, NO EL ID
                        //OBTENGO ID DE UNIDAD
                        int idUnidad= Curso.Unidades.FirstOrDefault(u => u.Numero == numUnidad).IdUnidad;
                                                                       //cual vector le paso la posicion.          
                        Clase clase = Curso.UnidadesClasesDiccionario[idUnidad].FirstOrDefault(c => c.Numero == numeroClase);
                        if (clase != null)
                        {
                            //quiere editar existente
                            TxtDescripcionClase.Text = clase.Descripcion;
                           
                            TxtUrlVideoClase.Text = Helper.LimpiarUrlVideo(clase.UrlVideo);
                            PClaseNueva.Visible = false;

                        }
                        else
                        {
                            //quiere agregar clase nueva
                            TxtDescripcionClase.Text = "Ingrese Descripcion";
                            TxtUrlVideoClase.Text = "Ingrese Url Video";
                            PClaseNueva.InnerText = "Se asignara el numero en base a las clases existentes";
                            PClaseNueva.Visible = true;
                        }
                    }
                    else
                    {
                        TxtDescripcionClase.Text = "Ingrese Descripcion";
                        TxtUrlVideoClase.Text = "Ingrese Url Video";
                        PClaseNueva.InnerText = "Ingrese valor valido";
                        PClaseNueva.Visible = true;
                        TxtNumeroClase.Text = "0";
                    }
                }
            }
            else
            {
                //no ingreso unidad
            }
        }
        protected void BtnEliminarUnidad_Click(object sender, EventArgs e)
        {

        }

        protected void BtnGuardarUnidad_Click(object sender, EventArgs e)
        {

        }

        protected void BtnEliminarClase_Click(object sender, EventArgs e)
        {

        }

      
    }
}