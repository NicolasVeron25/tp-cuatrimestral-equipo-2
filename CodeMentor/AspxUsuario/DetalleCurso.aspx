<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/MasterUsuario.Master" AutoEventWireup="true" CodeBehind="DetalleCurso.aspx.cs" Inherits="CodeMentor.AspxUsuario.DetalleCurso" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!----------------------- CONTENEDOR PRINCIPAL -------------------------->

    <div class="container d-flex justify-content-center align-items-start mt-5 mb-5">
        <div class="row curso-contenedor">

            <!-------------------------- DETALLES DEL CURSO ---------------------------->

            <div class="col-md-6 mb-4">
                <div class="curso-detalles text-lg-start">
                    <div class="curso-imagen-wrapper">
                        <img src="<%:CursoActual.UrlPortada %>" class="curso-imagen img-cuadrada" alt="Imagen del Curso">
                    </div>
                    <div class="curso-titulo mt-3 mb-5">
                        <%:CursoActual.Nombre %>
                    </div>
                    <div class="curso-descripcion mt-3">
                        <h4>Descripcion:</h4>
                        <p><%:CursoActual.Descripcion %></p>
                    </div>
                    <div class="curso-requisitos mt-3">
                        <h4>Requisitos:</h4>
                        <p><%:CursoActual.Requisitos %></p>
                    </div>
                    <div>
                        <div class="dropdown-center">
                            <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Lenguajes
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Action</a></li>
                                <li><a class="dropdown-item" href="#">Action two</a></li>
                                <li><a class="dropdown-item" href="#">Action three</a></li>
                            </ul>
                        </div>
                    </div>
                    <hr />
                    <div class="curso-costo mt-3">
                        <h4>Costo:</h4>
                        <p>$<%:CursoActual.Importe %></p>
                    </div>
                </div>
            </div>

            <!-------------------------- UNIDADES Y CLASES ---------------------------->

            <div class="col-md-6">
                <div class="accordion" id="accordionExample">

                    <!----------------------- FOREACH DE ACORDEON PARA CARGAR TODAS LAS UNIDADES DEL CURSO -------------------------->

                    <%foreach (var unidad in ListaUnidades)
                        {%>
                    <% var unidadId = "unidad" + unidad.IdUnidad; %>

                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#<%:unidadId %>" aria-expanded="true" aria-controls="<%:unidadId %>">
                                    <%:unidad.Numero %>. <%:unidad.Nombre %>
                                </button>
                            </h2>
                            <div id="<%:unidadId %>" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <ul class="list-group">

                                        <!----------------------- FOREACH DE LISTA PARA CARGAR TODAS LAS CLASES DE LA UNIDAD -------------------------->

                                        <% if (ClasesPorUnidad.ContainsKey(unidad.IdUnidad))
                                           {

                                               foreach (var clase in ClasesPorUnidad[unidad.IdUnidad])
                                               { %>

                                                    <li class="list-group-item"><%:clase.Numero %>. <%:clase.Descripcion %></li>
                                        <%    } 
                                           } %>

                                    </ul>
                                </div>
                            </div>
                        </div>

                    <%}%>
                </div>
            </div>

        </div>
    </div>


    <!-------------------------- ESTILOS ---------------------------->

    <style>
        .curso-contenedor {
            max-width: 1000px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .curso-detalles {
            text-align: center;
        }

        .curso-imagen-wrapper {
            position: relative;
            width: 100%;
            padding-top: 100%;
            overflow: hidden;
        }

        .curso-imagen {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .curso-titulo {
            font-size: 24px;
            font-weight: bold;
            margin-top: 20px;
        }

        .accordion-button {
            color: var(--white);
            background-color: var(--electric-indigo);
            font-weight: bold;
        }

            .accordion-button:not(.collapsed) {
                color: var(--white);
                background-color: var(--electric-indigo);
            }

        .accordion-body {
            background-color: var(--aquamarine);
        }

        .list-group {
            border: none; 
            outline: none; 
            padding-left: 0; 
            list-style: none; 
        }

            .list-group-item {
                background-color: var(--aquamarine);
                font-weight: bold;
                border: none; 
                outline: none; 
            }

    </style>

</asp:Content>
