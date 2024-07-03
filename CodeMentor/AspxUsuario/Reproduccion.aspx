<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/MasterUsuario.Master" AutoEventWireup="true" CodeBehind="Reproduccion.aspx.cs" Inherits="CodeMentor.Reproduccion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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

                <!-- TITULO -->
                <h3 id="curso-titulo"><%: CursoActual.Nombre %></h3>

                <!-- DESCRIPCION -->
                <p id="videoDescription"><%: CursoActual.Descripcion %></p>

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

                                            <a href="Reproduccion.aspx?IdClase=<%:clase.IdClase %>">Reproducir</a>
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
            color: var(--electric-indigo);
        }
    </style>

</asp:Content>
