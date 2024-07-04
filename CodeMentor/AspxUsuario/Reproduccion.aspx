<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/MasterUsuario.Master" AutoEventWireup="true" CodeBehind="Reproduccion.aspx.cs" Inherits="CodeMentor.Reproduccion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- CONTENEDOR PRINCIPAL -->
    <div class="container mt-4">
        <div class="row">

            <!-- VIDEO, TITULO Y DESCRIPCION -->
            <div class="col-md-8">

                <!-- VIDEO -->
                <div class="ratio ratio-16x9 mb-4">
                    <asp:Literal ID="videoFrame" runat="server"></asp:Literal>
                </div>

                <!-- BARRA DE PROGRESO -->
                <div class="progress mt-4">
                    <div id="progressBar" class="progress-bar bg-info" role="progressbar" style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                </div>

                <!-- TITULO -->
                <h3 id="curso-titulo"><%: CursoActual.Nombre %></h3>

                <!-- DESCRIPCION -->
                <p id="videoDescription"><%: CursoActual.Descripcion %></p>

                <%--PREGUNTAD Y RESPUESTAS--%>

            </div>

            <!-- UNIDADES Y CLASES -->
            <div class="col-md-4">
                <div class="accordion" id="acordeonClases">

                    <!-- FOREACH DE LISTA PARA CARGAR TODAS LAS UNIDADES DEL CURSO -->
                    <% foreach (var unidad in ListaUnidades)
                        {
                            var unidadId = "unidad" + unidad.IdUnidad;%>

                    <div class="accordion-item">

                        <!-- ENCABEZADO DE ACORDEON: INDICA NUMERO Y NOMBRE DE UNIDAD -->
                        <h2 class="accordion-header">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#<%:unidadId%>" aria-expanded="true" aria-controls="<%:unidadId %>">
                                <%:unidad.Numero%>. <%:unidad.Nombre%>
                            </button>
                        </h2>

                        <!-- CUERPO DEL ACORDEON: INDICA LAS CLASES DE LA UNIDAD-->
                        <div id="<%:unidadId%>" class="accordion-collapse collapse " data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <ul class="list-group">

                                    <!-- FOREACH DE LISTA PARA CARGAR TODAS LAS CLASES DE LA UNIDAD -->
                                    <%  foreach (var clase in ListarClases(unidad.IdUnidad))
                                        { %>
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                        <div>
                                            <%: clase.Numero %>. <%: clase.Descripcion %>
                                        </div>
                                        <div class="d-flex align-items-center">

                                            <a href="Reproduccion.aspx?IdClase=<%:clase.IdClase %>" class="btn btn-link text-decoration-none text-reset" role="button">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-play-circle-fill icon-indigo" viewBox="0 0 16 16">
                                                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M6.79 5.093A.5.5 0 0 0 6 5.5v5a.5.5 0 0 0 .79.407l3.5-2.5a.5.5 0 0 0 0-.814z" />
                                                </svg>
                                            </a>

                                            <input class="form-check-input me-1" type="checkbox" style="width: 30px; height: 30px;" value="" id="checkbox_<%: clase.IdClase %>">
                                        </div>
                                    </li>
                                    <%}%>
                                </ul>
                            </div>

                        </div>
                    </div>
                    <%}%>
                </div>
            </div>
        </div>
    </div>

    <!-- BOOTSTRAP PARA QUE FUNCIONEN BIEN LOS DESPLEGABLES -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>

    <!-- ESTILOS -->
    <style>
        #curso-titulo {
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
            background-color: var(--platinum);
        }

        .list-group {
            border: none;
            outline: none;
            padding-left: 0;
            list-style: none;
        }

        .list-group-item {
            background-color: var(--platinum);
            font-weight: bold;
            border: none;
            outline: none;
        }

        .icon-indigo {
            color: var(--electric-indigo); /* Cambia el color del ícono a indigo */
            transition: color 0.3s ease; /* Agrega una transición suave al color */
        }

            .icon-indigo:hover {
                color: indigo; /* Cambia el color al pasar el mouse */
            }

        .progress {
            height: 30px; /* Altura de la barra de progreso */
            margin-bottom: 20px; /* Espaciado inferior */
        }

    </style>

</asp:Content>
