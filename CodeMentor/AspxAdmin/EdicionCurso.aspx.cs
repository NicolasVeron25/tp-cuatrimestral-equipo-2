using Dominio;
using Dominio.DataTransferObjects;
using Negocio;
using System;
using System.Collections.Generic;
using System.Drawing.Printing;
using System.Linq;
using System.Runtime.InteropServices;
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
                    Curso = (CursosAdminDto)Session["CursoEdicion"];
                }
                else
                {
                    Response.Redirect("BackOffice.aspx", false);
                }
                PUnidadNueva.Visible = false;
                PUnidadInvalida.Visible = false;
                PClaseNueva.Visible = false;
                BtnConfirmarEliminacion.Visible = false;
                PEliminanClases.Visible = false;
                BtnConfirmarEliminarClase.Visible = false;
                PEliminaSeguro.Visible = false;
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
            PEliminaSeguro.Visible = false;
            Curso = (CursosAdminDto)Session["CursoEdicion"];

            if (TxtNroUnidadClase.Text != "")
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
            PEliminanClases.Visible = false;

            if (Session["UnidadClase"] != null)
            {
                Curso = (CursosAdminDto)Session["CursoEdicion"];

                if (TxtNumeroClase.Text != "" )
                {
                    int numeroClase = int.Parse(TxtNumeroClase.Text);
                    if (numeroClase > 0)
                    {
                        Unidad uni = (Unidad)Session["UnidadClase"];
                        int numUnidad = uni.Numero;
                        //obtengo la clase
                        //OJO = EL KEY ES EL NUMERO DE UNIDAD, NO EL ID
                        //OBTENGO ID DE UNIDAD
                        int idUnidad = Curso.Unidades.FirstOrDefault(u => u.Numero == numUnidad).IdUnidad;
                        //cual vector le paso la posicion.          
                        Clase clase = Curso.UnidadesClasesDiccionario[idUnidad].FirstOrDefault(c => c.Numero == numeroClase);
                        if (clase != null)
                        {
                            //quiere editar existente
                            TxtDescripcionClase.Text = clase.Descripcion;

                            TxtUrlVideoClase.Text = clase.UrlVideo;  // simplemente pongo el contenido de la clase normal!
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
            BtnConfirmarEliminacion.Visible = true;
            BtnEliminarUnidad.Visible = false;
            PEliminanClases.Visible = true;
            PEliminanClases.InnerText = "¿ESTA SEGURO? SE ELIMINARAN TODAS LAS CLASES DE ESTA UNIDAD.";

        }

        protected void BtnGuardarUnidad_Click(object sender, EventArgs e)
        {
            //actualizar o agregar
            Curso = (CursosAdminDto)Session["CursoEdicion"];
            if (TxtNumeroUnidad.Text != "0")
            {
                int numeroUni = int.Parse(TxtNumeroUnidad.Text);
                if (Curso.Unidades.Exists(u => u.Numero == numeroUni)) // si existe esa unidad
                {

                    var unidad = Curso.Unidades.FirstOrDefault(u => u.Numero == numeroUni);
                    unidad.Nombre = TxtNombreUnidad.Text;
                    unidad.Descripcion = TxtDescripcionUnidad.Text;
                    var unidadGestion = new UnidadGestion();
                    unidadGestion.ModificarUnidad(unidad);
                    Curso = Helper.LlenaryMapearCursosAdminDto().FirstOrDefault(c => c.IdCurso == Curso.IdCurso); //actualizo la lista en session
                }
                else
                {
                    //agregar
                    var unidad = new Unidad();
                    unidad.Nombre = TxtNombreUnidad.Text;
                    unidad.Descripcion = TxtDescripcionUnidad.Text;

                    int ultimoNumero = Curso.Unidades.Last().Numero;
                    unidad.Numero = ultimoNumero + 1;
                    var unidadGestion = new UnidadGestion();

                    unidadGestion.InsertarUnidad(unidad);

                    Curso.Unidades.Add(unidad);
                }
                Session.Add("CursoEdicion", Curso);
                Response.Redirect("EdicionCurso.aspx", false);
            }

        }


        protected void BtnConfirmarEliminacion_Click(object sender, EventArgs e)
        {
            int idEliminar = int.Parse(TxtNumeroUnidad.Text);
            Curso = (CursosAdminDto)Session["CursoEdicion"];
            if (Curso.Unidades.Exists(u => u.Numero == idEliminar))
            {
                var unidadGestion = new UnidadGestion();
                unidadGestion.EliminarUnidad(idEliminar);

                Curso.Unidades.RemoveAll(u => u.Numero == idEliminar);//actualizo la lista en session
                Session.Add("CursoEdicion", Curso);
                Response.Redirect("EdicionCurso.aspx", false);
            }
        }

        protected void BtnGuardarClase_Click(object sender, EventArgs e)
        {
            //edita clase
            Curso = (CursosAdminDto)Session["CursoEdicion"];
            var claseGestion = new ClaseGestion();
            int numUnidad = int.Parse(TxtNroUnidadClase.Text);
            int numClase = int.Parse(TxtNumeroClase.Text);
            int idUnidad = Curso.Unidades.FirstOrDefault(u => u.Numero == numUnidad).IdUnidad;

            Clase clase = Curso.UnidadesClasesDiccionario[idUnidad].FirstOrDefault(c => c.Numero == numClase);
            if (clase != null)
            {
                clase.Descripcion = TxtDescripcionClase.Text;
                clase.UrlVideo = TxtUrlVideoClase.Text;
                claseGestion.ModificarClase(clase);
                Curso = Helper.LlenaryMapearCursosAdminDto().FirstOrDefault(c => c.IdCurso == Curso.IdCurso);
                Session.Add("CursoEdicion", Curso);
                Response.Redirect("EdicionCurso.aspx", false);
            }
            else
            {
                //agregar clase
                var claseNueva = new Clase();
                claseNueva.Descripcion = TxtDescripcionClase.Text;
                claseNueva.UrlVideo = TxtUrlVideoClase.Text;
                claseNueva.Numero = Curso.UnidadesClasesDiccionario[idUnidad].Last().Numero + 1;
                claseNueva.IdUnidad = idUnidad;
                claseGestion.InsertarClase(claseNueva);
                Curso = Helper.LlenaryMapearCursosAdminDto().FirstOrDefault(c => c.IdCurso == Curso.IdCurso);
                Session.Add("CursoEdicion", Curso);
                Response.Redirect("EdicionCurso.aspx", false);
            }

        }

        protected void BtnConfirmarEliminarClase_Click(object sender, EventArgs e)
        {
            //elimina clase
            Curso = (CursosAdminDto)Session["CursoEdicion"];
            var claseGestion = new ClaseGestion();
            int numUnidad = int.Parse(TxtNroUnidadClase.Text);
            int numClase = int.Parse(TxtNumeroClase.Text);
            int idUnidad = Curso.Unidades.FirstOrDefault(u => u.Numero == numUnidad).IdUnidad;
            Clase clase = Curso.UnidadesClasesDiccionario[idUnidad].FirstOrDefault(c => c.Numero == numClase);
            if (clase != null)
            {
                claseGestion.EliminarClase(clase.IdClase);
                Curso.UnidadesClasesDiccionario[idUnidad].Remove(clase);
                Curso = Helper.LlenaryMapearCursosAdminDto().FirstOrDefault(c => c.IdCurso == Curso.IdCurso);
                Session.Add("CursoEdicion", Curso);
                Response.Redirect("EdicionCurso.aspx", false);
            }


        }

        protected void BtnEliminarClase_Click(object sender, EventArgs e)
        {
            PEliminaSeguro.Visible = true;
            BtnConfirmarEliminarClase.Visible = true;
            BtnEliminarClase.Visible = false;
            PEliminaSeguro.InnerText = "¿ESTA SEGURO? ESTA ACCION NO TENDRA VUELTA ATRAS.";
        }

    }
}