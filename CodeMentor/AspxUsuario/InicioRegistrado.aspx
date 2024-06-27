<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/MasterUsuario.Master" AutoEventWireup="true" CodeBehind="InicioRegistrado.aspx.cs" Inherits="CodeMentor.AspxUsuario.InicioRegistrado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusquedaCursos" runat="server">
    <asp:Panel runat="server" ID="PanelBusquedaCursos" CssClass="col">
        <div class="d-flex justify-content-center">
            <div class="d-flex">
                <div class="input-group" style="background: white; border-radius: 20px">
                    <asp:TextBox runat="server" Placeholder="Buscar cursos" CssClass="form-control" ID="TxtFiltroCursos" OnTextChanged="TxtFiltroCursos_TextChanged" Style="border: none; background: white" />
                    <asp:LinkButton ID="btnSearch" runat="server" CssClass="btn " OnClick="btnSearch_Click">
                        <asp:Image ID="imgSearch" runat="server" ImageUrl="https://cdn.icon-icons.com/icons2/774/PNG/512/search_icon-icons.com_64617.png"
                            AlternateText="Search" Style="width: 26px; height: 26px;" />
                    </asp:LinkButton>
                </div>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .card-img-top-wrapper {
            position: relative;
            width: 100%;
            padding-top: 100%;
            overflow: hidden;
        }

        .img-cuadrada {
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .card {
            margin: 0 auto;
        }

        .title {
            text-align: center;
            font-weight: bolder;
            color: var(--electric-indigo);
        }
    </style>
    <div class="container mt-5">


        <!--CURSOS SIN COMPLETAR DEL USUARIO-->
        <div class="row">

            <!--TITULO-->
            <div class="title mb-5">
                <h5>(Cargar cursos que no termino)</h5>
                <h1>CONTINUAR APRENDIENDO</h1>
                <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-backpack-fill" viewBox="0 0 16 16">
                    <path d="M5 13v-3h4v.5a.5.5 0 0 0 1 0V10h1v3z" />
                    <path d="M6 2v.341C3.67 3.165 2 5.388 2 8v5.5A2.5 2.5 0 0 0 4.5 16h7a2.5 2.5 0 0 0 2.5-2.5V8a6 6 0 0 0-4-5.659V2a2 2 0 1 0-4 0m2-1a1 1 0 0 1 1 1v.083a6 6 0 0 0-2 0V2a1 1 0 0 1 1-1m0 3a4 4 0 0 1 3.96 3.43.5.5 0 1 1-.99.14 3 3 0 0 0-5.94 0 .5.5 0 1 1-.99-.14A4 4 0 0 1 8 4M4.5 9h7a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5h-7a.5.5 0 0 1-.5-.5v-4a.5.5 0 0 1 .5-.5" />
                </svg>
            </div>

            <!----------------------- FOREACH DE CARDS PARA CARGAR TODOS LOS CURSOS -------------------------->

            <% foreach (var curso in ListaCursos)
                { %>
            <div class="col-md-2 mb-5">
                <div class="card h-100">
                    <div class="card-img-top-wrapper">
                        <img src="<%:curso.UrlPortada %>" class="card-img-top img-cuadrada" alt="...">
                    </div>
                    <div class="card-body">
                        <h5 class="card-title"><%:curso.Nombre %></h5>
                        <a href="DetalleCurso.aspx?idCurso=<%:curso.IdCurso %>" class="btn btnBonito">Ver detalles</a>
                    </div>
                </div>
            </div>
            <%}%>
        </div>

        <hr />

        <!--CURSOS DE LA PLATAFORMA-->
        <div class="row mt-5">

            <!--TITULO-->
            <div class="title mb-5">
                <h5>(Cargar cursos en los cuales no se inscribio)</h5>
                <h1>APRENDER MAS</h1>
                <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-cart-plus-fill" viewBox="0 0 16 16">
                    <path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0m7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0M9 5.5V7h1.5a.5.5 0 0 1 0 1H9v1.5a.5.5 0 0 1-1 0V8H6.5a.5.5 0 0 1 0-1H8V5.5a.5.5 0 0 1 1 0" />
                </svg>
            </div>

            <!----------------------- FOREACH DE CARDS PARA CARGAR TODOS LOS CURSOS -------------------------->

            <% foreach (var curso in ListaCursos)
                { %>
            <div class="col-md-2 mb-5">
                <div class="card h-100">
                    <div class="card-img-top-wrapper">
                        <img src="<%:curso.UrlPortada %>" class="card-img-top img-cuadrada" alt="...">
                    </div>
                    <div class="card-body">
                        <h5 class="card-title"><%:curso.Nombre %></h5>
                        <a href="DetalleCurso.aspx?idCurso=<%:curso.IdCurso %>" class="btn btnBonito">Ver detalles</a>
                    </div>
                </div>
            </div>
            <%}%>
        </div>

    </div>

</asp:Content>

