<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/MasterUsuario.Master" AutoEventWireup="true" CodeBehind="MisCursos.aspx.cs" Inherits="CodeMentor.AspxUsuario.MisCursos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!----------------------- CONTENEDOR PRINCIPAL -------------------------->

    <div class="container Bienvenida">
        
        <!---------------------- BIENVENIDA AL USUARIO ---------------------->

        <div class="row-cols-1 RowBienvenida text-center">
            <div>
                <h2>¡Vamos a aprender <%: InfoUser.Nombre.ToUpperInvariant() %>!</h2>
            </div>
        </div>

        <% if (CursosInscripto != null) { %>
        
            <!------------------ MOSTRAR CURSOS INSCRIPTOS ------------------->

            <div class="row-cols-1 Cursando">

                <div style="padding: 2%">
                    <h3 class="CursandoH3">Mis cursos:</h3>
                </div>

                <div class="row col-md">
                    <% foreach (var curso in CursosInscripto) { %>
                        <div class="card CardCompleta">
                            <div style="border-radius: 15px; overflow: hidden; width: 100%; height: 245px">
                                <% ImageCurso.ImageUrl = curso.UrlPortada; %>
                                <asp:Image ID="ImageCurso" class="card-img-top" Style="height: 100%; width: 100%" alt="Img Curso" runat="server" />
                            </div>
                            <div class="BodyCard">
                                <div class="row" style="margin-top: 1%">
                                    <div class="col-6">
                                        <h5 style="margin-top: 1%" class="card-title"><%: curso.Nombre %></h5>
                                    </div>
                                    <div class="col-6">
                                        <a href="Reproduccion.aspx" Style="width: 100%" class="btn btn-outline-dark">Ir al Curso</a>
                                    </div>
                                </div>
                                <div>
                                    <% BarraProgreso(curso.IdCurso); %>
                                    <p>Progreso</p>
                                    <div class="progress">
                                        <div class="progress-bar" role="progressbar" runat="server" id="BarraProgresoCurso" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <p runat="server" id="pProgreso"></p>
                                </div>
                            </div>
                        </div>
                    <% } %>
                </div>
            </div>
        <% } else { %>
        
            <!------------------ SIN CURSOS INSCRIPTOS ------------------->

            <div class="row col Cursando" style="background-color: white; margin: 0">
                <div class="mb-3" style="margin-top: 3%">
                    <h3 style="margin-left: 9.7%">No se ha inscripto a ningún curso.</h3>
                </div>
                <div class="mb-3" style="margin-top: 2.5%;">
                    <a href="InicioRegistrado.aspx" class="btn btn-dark" style="margin-left: 9.8%">Ver Cursos disponibles</a>
                </div>
            </div>
            <div style="margin-top: 20%"></div>
        <% } %>
    </div>

    <!------------------ ESTILOS ------------------->

        <style>
        .Bienvenida {
            margin: 0;
            border-radius: 10px;
            padding: 0;
            max-width: 100%
        }

        .Cursando {
            border-radius: 10px;
        }

        .ImgCursosInscrip {
            margin: 1%;
            max-width: fit-content;
        }

        .imgCard {
            width: 100%;
            height: 151px;
            max-height: 100%;
            max-width: 100%;
        }

        .BodyCard {
            border-radius: 5px;
            flex-direction: column;
            justify-content: center;
            margin-top: 8%;
            margin-left: 2.5%;
            margin-right: 2.5%;
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
            padding: 0;
            width: 23rem;
            margin-top: 0.5%;
            margin-left: 10.3%;
            height: fit-content;
            border-radius: 20px;
        }
    </style>

</asp:Content>
