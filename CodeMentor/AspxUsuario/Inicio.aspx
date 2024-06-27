<%@ Page Title="Home
    "Language="C#" MasterPageFile="~/Masters/MasterUsuario.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="CodeMentor.AspxUsuario.Inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content Id="Content3" runat="server" ContentPlaceHolderID="BusquedaCursos"> <!-- FILTRO PARA CURSOS UBICADO EN EL HEADER!-->
    <asp:Panel runat="server" ID="PanelBusquedaCursos" CssClass="col" >
    <div class="d-flex justify-content-center">
        <div class="d-flex">
            <div class="input-group" style="background: white; border-radius: 20px">
                <asp:TextBox runat="server" Placeholder="Buscar cursos" CssClass="form-control" OnTextChanged="TxtFiltroCursos_TextChanged" ID="TxtFiltroCursos" Style="border: none; background: white" />
                <asp:LinkButton ID="btnSearch" runat="server" CssClass="btn " OnClick="btnSearch_Click">
                    <asp:Image ID="imgSearch" runat="server" ImageUrl="https://cdn.icon-icons.com/icons2/774/PNG/512/search_icon-icons.com_64617.png"
                        AlternateText="Search" Style="width: 26px; height: 26px;" />
                </asp:LinkButton>
            </div>
        </div>
    </div>
</asp:Panel>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="carouselExampleIndicators" class="carousel slide mb-5">
        <div class="carousel-indicators">

            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="https://mir-s3-cdn-cf.behance.net/project_modules/fs/79731568097599.5b50bca477735.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="https://mir-s3-cdn-cf.behance.net/project_modules/fs/79731568097599.5b50bca477735.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="https://mir-s3-cdn-cf.behance.net/project_modules/fs/79731568097599.5b50bca477735.jpg" class="d-block w-100" alt="...">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

    <!----------------------- DIVISION CAROUSEL Y CURSOS -------------------------->

    <div class="text-center mb-5">
        <h1>NUESTROS CURSOS</h1>
    </div>

    <div class="container mt-5">
        <div class="row">

            <!----------------------- FOREACH DE CARDS PARA CARGAR TODOS LOS CURSOS -------------------------->

            <% foreach (var curso in ListaCursos)
                { %>
            <div class="col-md-3 mb-5">
                <div class="card h-100">
                    <div class="card-img-top-wrapper">
                        <img src="<%:curso.UrlPortada %>" class="card-img-top img-cuadrada" alt="...">
                    </div>
                    <div class="card-body">
                        <h5 class="card-title"><%:curso.Nombre %></h5>
                        <a href="DetalleCurso.aspx?idCurso=<%:curso.IdCurso %>" class="btn btnBonito">Ver curso</a>
                    </div>
                </div>
            </div>
            <%}%>
        </div>
    </div>

    <!----------------------- ESTILOS PARA QUE LA IMAGEN QUEDE CUADRADA-------------------------->

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
    </style>

</asp:Content>
