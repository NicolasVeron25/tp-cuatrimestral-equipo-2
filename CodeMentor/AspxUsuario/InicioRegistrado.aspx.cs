using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using iTextSharp.text;
using iTextSharp.text.pdf;

namespace CodeMentor.AspxUsuario
{
    public partial class InicioRegistrado : System.Web.UI.Page
    {
        public List<Curso> ListaCursosInscripto { get; set; }
        public List<Curso> ListaNoInscripto { get; set; }
        public Usuario UsuarioActual { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ObtenerUsuario();

                CargarCursos();
                CargarCursosNoFinalizados();
            }

        }
        public void CargarCursosNoFinalizados()
        {
            var CursoGestion = new CursosGestion();
            ListaNoInscripto = new List<Curso>();
            ListaNoInscripto = CursoGestion.CursosNOInscripto(UsuarioActual.IdUsuario);

        }

        private void ObtenerUsuario()
        {
            if (Session["Usuario"] != null)
            {
                UsuarioActual = (Usuario)Session["Usuario"];
                if (UsuarioActual == null)
                {
                    Response.Redirect("Ingresar.aspx");
                }
            }
            else
            {
                Response.Redirect("Ingresar.aspx");
            }

        }
        public void CargarCursos()
        {
            var CursoGestion = new CursosGestion();
            ListaCursosInscripto = CursoGestion.CursosInscripto(UsuarioActual.IdUsuario);
        }

        protected void TxtFiltroCursos_TextChanged(object sender, EventArgs e)
        {
            CargarCursos();
            ListaCursosInscripto = ListaCursosInscripto.FindAll(x => x.Nombre.ToLower().Contains(TxtFiltroCursos.Text.ToLower()));
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            CargarCursos();
            CargarCursosNoFinalizados();
            ListaCursosInscripto = ListaCursosInscripto.FindAll(x => x.Nombre.ToLower().Contains(TxtFiltroCursos.Text.ToLower()));
            ListaNoInscripto = ListaNoInscripto.FindAll(x => x.Nombre.ToLower().Contains(TxtFiltroCursos.Text.ToLower()));
        }

        protected void btnGenerar_Click(object sender, EventArgs e)
        {

            string nombre = "PEPITO ARNALDO";

            // Crear un documento PDF
            Document pdfDoc = new Document(PageSize.A4, 50, 50, 25, 25);
            MemoryStream memoryStream = new MemoryStream();
            PdfWriter writer = PdfWriter.GetInstance(pdfDoc, memoryStream);

            pdfDoc.Open();

            // Agregar contenido al PDF
            Paragraph title = new Paragraph("Certificado de Participación", new Font(Font.FontFamily.HELVETICA, 22, Font.BOLD));
            title.Alignment = Element.ALIGN_CENTER;
            pdfDoc.Add(title);

            pdfDoc.Add(new Paragraph("\n\n"));

            Paragraph nombreUsuario = new Paragraph("Este certificado se otorga a:", new Font(Font.FontFamily.HELVETICA, 16, Font.NORMAL));
            nombreUsuario.Alignment = Element.ALIGN_CENTER;
            pdfDoc.Add(nombreUsuario);

            pdfDoc.Add(new Paragraph("\n"));

            // Crear un Chunk con el nombre del usuario y el estilo deseado
            Chunk nombreDinamicoChunk = new Chunk(nombre, new Font(Font.FontFamily.HELVETICA, 18, Font.BOLDITALIC));
            Paragraph nombreDinamico = new Paragraph(nombreDinamicoChunk);
            nombreDinamico.Alignment = Element.ALIGN_CENTER;
            pdfDoc.Add(nombreDinamico);

            pdfDoc.Add(new Paragraph("\n\n"));

            Paragraph body = new Paragraph("En reconocimiento a su destacada participación en nuestro evento.", new Font(Font.FontFamily.HELVETICA, 14, Font.NORMAL));
            body.Alignment = Element.ALIGN_CENTER;
            pdfDoc.Add(body);

            pdfDoc.Add(new Paragraph("\n\n"));

            Paragraph fecha = new Paragraph("Fecha: " + DateTime.Now.ToString("dd/MM/yyyy"), new Font(Font.FontFamily.HELVETICA, 12, Font.NORMAL));
            fecha.Alignment = Element.ALIGN_RIGHT;
            pdfDoc.Add(fecha);

            pdfDoc.Close();

            byte[] bytes = memoryStream.ToArray();
            memoryStream.Close();

            // Enviar el PDF al navegador
            Response.ContentType = "application/pdf";
            Response.AddHeader("Content-Disposition", "attachment; filename=Certificado.pdf");
            Response.BinaryWrite(bytes);
            Response.End();
        }
    }
}
