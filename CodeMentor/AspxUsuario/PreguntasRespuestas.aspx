<%@ Page Title="Preguntas" Language="C#" MasterPageFile="~/Masters/MasterUsuario.Master" AutoEventWireup="true" CodeBehind="PreguntasRespuestas.aspx.cs" Inherits="CodeMentor.PreguntasRespuestas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" />

    <asp:Panel runat="server" ID="PanelUltimasPreg">
        <div class="row" style="margin-top: 2%; margin-left: 20%">
            <div class="col-6">
                <h3>Preguntas en : <%:CursoActual.Nombre %> </h3>

            </div>
        </div>
        <!-- filtros y opciones -->
        <div class="row mb-3" style="margin-top: 1%">
            <div class="col-3" style="margin-left: 20.5%">
                <asp:TextBox runat="server" CssClass="form-control" ID="BtnFiltrarPreguntas" placeholder="Buscar" />
            </div>
            <div class="col-md-6 text-right">

                <asp:Button runat="server" class="btn btn-primary" Text="Nueva pregunta" ID="BtnAñadirPregunta" OnClick="BtnAñadirPregunta_Click" />
                <asp:Button runat="server" class="btn btn-secondary" Text="Ver mis preguntas" ID="BtnVerPreguntasUsuario" OnClick="BtnVerPreguntasUsuario_Click" />
                <asp:Button runat="server" class="btn btn-secondary" Text="Ver Todas las preguntas" OnClick="BtnVerTodas_Click" ID="BtnVerTodas" />

            </div>
        </div>
    </asp:Panel>

    <asp:Panel runat="server" ID="PanelPreguntas">

        <div class="row col-8" style="margin-left: 20%; margin-bottom: 7%">

            <div class="list-group">

                <%foreach (var preg in ListadoPreguntasRespuestas)
                    { %>

                <div class="list-group-item" style="margin-bottom: 2%; border-radius: 15px; border: solid lightgrey 1px;">
                    <div class="d-flex w-100 justify-content-between" style="margin-top: 0.8%">
                        <h5 class="mb-1"><%:preg.TituloPregunta %></h5>
                        <div class="mb-3">
                        <small><%:preg.NombreApellidoUser%></small>

                        <%if (!ObtenerRespuesta(preg.IdPregunta) && ViendoUsuarios){ %>
                        <a href="PreguntaDetalle.aspx?Modificar=<%:preg.IdPregunta %>">
                            <img src="https://static.thenounproject.com/png/3082103-200.png" style="width: 30px; height: 30px" />
                        </a>

                        <% } %>
                            </div>
                    </div>
                    <p class="mb-1"><%:preg.CuerpoPregunta%></p>

                    <small><%:preg.FechaPregunta %></small>

                    <%if (ObtenerRespuesta(preg.IdPregunta))
                        {  %>
                    <div class="ml-4 mt-3">
                        <div class="card" style="border-radius: 15px">
                            <div class="card-body">
                                <p class="card-text"><%:preg.CuerpoRespuesta %></p>

                                <small class="text-muted">Respondido por : <%:Validaciones.Helper.ObtenerNombreAdmin() %> </small>
                                <small><%:preg.FechaRespuesta %></small>

                            </div>
                        </div>
                    </div>

                    <%}
                        else
                        {  %>
                    <div class="ml-4 mt-3">
                        <div class="card" style="border-radius: 15px">
                            <div class="card-body">
                                <h6 style="color: cornflowerblue">Consulta pendiente de Respuesta.</h6>

                            </div>
                        </div>
                    </div>
                    <%} %>
                </div>



                <% } %>
                <!-- validar aca si no existen preguntas todavia-->

            </div>
        </div>




    </asp:Panel>



    <asp:Panel runat="server" ID="PanelNuevaPregunta">

        <div class="row " style="margin-top: 5%; margin-bottom: 10%">
            <div class="col-6" style="margin-left: 20.5%">
                <div class="mb-3">
                    <h3>Ingrese su Pregunta</h3>
                </div>
                <div class="form-group">
                    <label for="titulo">Título de la Pregunta</label>
                    <asp:TextBox ID="TxtTitulo" runat="server" CssClass="form-control" placeholder="Ingresa el título de tu pregunta" />
                </div>
                <div class="form-group">
                    <label for="cuerpo">Cuerpo de la Pregunta</label>
                    <asp:TextBox ID="TxtCuerpo" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control"  placeholder="Describe tu pregunta en detalle" />
                </div>
                <div class="form-group " style="margin-top: 2%">
                    <asp:Button ID="BtnGuardarPregunta" runat="server" CssClass="btn btn-primary" Text="Guardar Pregunta" OnClick="BtnGuardarPregunta_Click" />
                    <asp:Button ID="BtnCancelarAñadirPregunta" runat="server" CssClass="btn btn-secondary" Text="Cancelar" OnClick="BtnCancelarAñadirPregunta_Click" />
                </div>
            </div>
        </div>

    </asp:Panel>




</asp:Content>
