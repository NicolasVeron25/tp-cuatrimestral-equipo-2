<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/MasterUsuario.Master" AutoEventWireup="true" CodeBehind="MisCursos.aspx.cs" Inherits="CodeMentor.AspxUsuario.MisCursos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .Bienvenida {
            margin: 0;
            background-color: #f8f9fa;
            border-radius: 10px;
            padding: 0;
            max-width: 100%
        }

        .Cursando {
            background-color: #FDFDFD;
            border-radius: 10px;
        }

        .ImgCursosInscrip {
            margin-top: 2.3%;
            padding-right: 3%;
            max-width: fit-content;
        }

        .BodyCard {
            border-top: solid 1px #f3f3f3;
            border-radius: 5px;
        }

        .RowBienvenida {
            padding-left: 2.7%;
            padding-bottom: 2.7%;
            padding-top: 2.7%
        }

        .HolaUser {
            padding-left: 8%;
        }

        .CursandoH3 {
            padding-top: 1%;
            padding-left: 2%;
            margin-left: 6.5%
        }

        .CardCompleta {
            width: 25rem;
            margin-top: 0.5%;
            margin-left: 10.3%;
            margin-bottom: 8%;
        }
    </style>

    <div class="container Bienvenida" style="font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif">
        <div class="row-cols-1 RowBienvenida ">
            <div>
                <h2 style="margin-left: 8%">Hola de nuevo (Nombre User) ! %></h2>
            </div>

        </div>

        <div class="row-cols-1 Cursando" style="background-color: white;">
            <div class="" style="background-color: white; padding: 2%">
                <h3 class="CursandoH3">Cursando</h3>

            </div>
            <div class=" row-cols-3 ">
               <!-- <%// foreach (var curso in CursosInscripto)
                   // {  %>


                <div class="card CardCompleta">
                    <%//:ImageCurso.ImageUrl = curso.UrlPortada %>
                    <asp:Image ID="ImageCurso" class="card-img-top ImgCursosInscrip" alt="Img Curso" runat="server" />
                    <div class="card-body BodyCard">
                        <div class="row" style="margin-top: 1%">
                            <div class=" col-6">
                                <h5 style="margin-top: 1%" class="card-title"><%//:curso.Nombre %></h5>
                            </div>
                            <div class="col-6">
                                <asp:Button Text="Ir al Curso" href="Reproduccion.Aspx" Style="width: 100%" CssClass="btn btn-outline-dark " runat="server" />
                            </div>
                        </div>

                        <div>
                            <p>Progreso</p>
                            <div class="progress">
                                <div class="progress-bar" role="progressbar" runat="server" id="BarraProgresoCurso" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <p runat="server" id="pProgreso"></p>
                   <%//BarraProgreso(curso.id) %>
                        </div>
                    </div>
                </div>
                <%//} %>
                <!-- EJEMPLO -->
                <div class="card CardCompleta">
                    <asp:Image ID="Image1" ImageUrl="https://www.ibm.com/content/dam/adobe-cms/instana/media_logo/Java.component.complex-narrative-xl.ts=1692900329414.png/content/adobe-cms/es/es/products/instana/supported-technologies/java-monitoring/_jcr_content/root/table_of_contents/body/content_section_styled/content-section-body/complex_narrative/logoimage" class="card-img-top ImgCursosInscrip" alt="Img Curso" runat="server" />
                    <div class="card-body BodyCard">
                        <div class="row" style="margin-top: 1%">
                            <div class=" col-6">
                                <h5 style="margin-top: 1%" class="card-title">Curso de Java</h5>
                            </div>
                            <div class="col-6">
                                <asp:Button Text="Ir al Curso" href="Reproduccion.Aspx" Style="width: 100%" CssClass="btn btn-outline-dark " runat="server" />
                            </div>
                        </div>

                        <div>
                            <p>Progreso</p>
                            <div class="progress">
                                <div class="progress-bar" role="progressbar" runat="server" id="Div1" aria-valuenow="25" style="width:30%" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <p runat="server" id="p">30%</p>
                        </div>
                    </div>
                </div>

            </div>


        </div>
    </div>
</asp:Content>
