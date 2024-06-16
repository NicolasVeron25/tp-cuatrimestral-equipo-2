<%@ Page Title="SeccionPreguntas
    "
    Language="C#" MasterPageFile="~/Masters/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="AdminPreguntas.aspx.cs" Inherits="CodeMentor.AdminAspx.AdminPreguntas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .Black {
            color: black;
            border: solid 1px black;
        }
    </style>
    <asp:ScriptManager runat="server" />

    <div class="container mt-5">
        <h2 class="mb-4">Administración de Preguntas y Respuestas</h2>

        <asp:Panel runat="server" ID="PanelNavegacion">

            <nav class="nav nav-pills ">
                <asp:Button Text="Ultima Pregunta" CssClass=" nav-item  nav-link Black" runat="server" ID="BtnUltimaPreg" OnClick="BtnUltimaPreg_Click" />

                <asp:Button Text="Sin Responder" CssClass=" nav-item  nav-link Black" Style="margin-left: 1%" runat="server" />

                <a class="nav-link dropdown-toggle Black" data-toggle="dropdown" style="margin-left: 1%" role="button" aria-haspopup="true" aria-expanded="false">Por Cursos </a>
                <div class="dropdown-menu">
                    <asp:Repeater runat="server" ID="RptCursos">
                        <ItemTemplate>

                            <asp:Button Text='<%#Eval("Nombre")%>' CssClass="dropdown-item" runat="server" ID="BtnSeleccionCurso" CommandName="ObtenerCurso"
                                CommandArgument='<%# Eval("IdCurso") %>' />
                            <!-- Llenamos cual dll -->
                        </ItemTemplate>
                    </asp:Repeater>

                    <a class="dropdown-item" href="#" style="border-top: solid 1px grey">Ver Todas</a>
                </div>
                <a class="nav-item nav-link Black" href="#" style="margin-left: 1%">Ultima Semana</a>
            </nav>

        </asp:Panel>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <!-- ULTIMA PREGUNTA-->
                <asp:Panel runat="server" ID="PanelUltima">
                    <div class="row col-10" style="margin-top: 2%">
                        <div class="list-group">
                            <h4>Realizada en : <%:UltimaPregunta.NombreCurso %></h4>
                            <div class="list-group-item" style="margin-bottom: 2%; border-radius: 15px">

                                <div class="d-flex w-100 justify-content-between" style="margin-top: 0.8%">

                                    <h5 class="mb-1"><%:UltimaPregunta.TituloPregunta %></h5>

                                    <small><%:UltimaPregunta.NombreApellidoUser %></small>
                                </div>
                                <p class="mb-1"><%:UltimaPregunta.CuerpoPregunta %></p>

                                <small><%:UltimaPregunta.FechaPregunta %></small>

                                <!--si posee respuesta -->
                                <%if (UltimaPregunta.IdRespuesta != null)
                                    {  %>
                                <div class="ml-4 mt-3">
                                    <div class="card" style="border-radius: 15px">
                                        <div class="card-body">
                                            <%TxtUltimaModificarCuerpoRespuesta.Text = UltimaPregunta.CuerpoRespuesta; %>

                                            <asp:TextBox ID="TxtUltimaModificarCuerpoRespuesta" runat="server" TextMode="MultiLine" Style="background-color: white" Rows="5" CssClass="form-control" placeholder="Modificar respuesta" />


                                            <small><%:UltimaPregunta.FechaRespuesta %></small>
                                        </div>
                                    </div>
                                </div>
                                <div class="mb-3" style="margin-top: 1.5%">
                                    <asp:Button Text="Cancelar" OnClick="BtnUltimaPreg_Click" CssClass="btn btn-danger" ID="BtnUltimaCancelarCambios" runat="server" />
                                    <asp:Button Text="Modificar Respuesta" Style="background-color: #fad6a5; border: solid 0.3px" CssClass="btn" ID="BtnUltimaModificarRespuesta" OnClick="BtnUltimaModificarRespuesta_Click" runat="server" />
                                    <asp:Button Text="Guardar Cambios" Style="" CssClass="btn btn-dark" ID="BtnUltimaGuardarCambios" runat="server" OnClick="BtnUltimaGuardarCambios_Click" />
                                </div>
                                <%}
                                    else
                                    {  %>
                                <!-- si  NO posee respuesta-->
                                <div class="ml-4 mt-3">
                                    <div class="card" style="border-radius: 15px">
                                        <div class="card-body">

                                            <asp:TextBox ID="TxtUltimaCuerpoRespuesta" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control" placeholder="Responder" />
                                        </div>
                                    </div>
                                </div>
                                <div class="mb-3" style="margin-top: 1.5%">
                                    <asp:Button Text="Enviar Respuesta" Style="background-color: #fad6a5" CssClass="btn btn-light" ID="BtnUltimaEnviarRespuesta" OnClick="BtnUltimaEnviarRespuesta_Click" runat="server" />
                                </div>
                                <%} %>
                            </div>
                        </div>
                    </div>
                </asp:Panel>


                <div class="list-group">
                    <a href="#" class="list-group-item list-group-item-action flex-column align-items-start active">
                        <div class="d-flex w-100 justify-content-between">
                            <h5 class="mb-1">List group item heading</h5>
                            <small>3 days ago</small>
                        </div>
                        <p class="mb-1">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                        <small>Donec id elit non mi porta.</small>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
                        <div class="d-flex w-100 justify-content-between">
                            <h5 class="mb-1">List group item heading</h5>
                            <small class="text-muted">3 days ago</small>
                        </div>
                        <p class="mb-1">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                        <small class="text-muted">Donec id elit non mi porta.</small>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
                        <div class="d-flex w-100 justify-content-between">
                            <h5 class="mb-1">List group item heading</h5>
                            <small class="text-muted">3 days ago</small>
                        </div>
                        <p class="mb-1">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                        <small class="text-muted">Donec id elit non mi porta.</small>
                    </a>
                </div>





                <!-- Sección de Preguntas sin Responder -->
                <asp:Panel runat="server" ID="PanelSinResponder">
                    <div class="accordion mt-4" id="accordionSinResponder">
                        <asp:Repeater ID="RptPreguntasSinResponder" runat="server">
                            <ItemTemplate>
                                <div class="card">
                                    <div class="card-header" id="heading<%# Eval("IdPregunta") %>">
                                        <h2 class="mb-0">
                                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapse<%# Eval("IdPregunta") %>" aria-expanded="true">
                                                <%# Eval("Titulo") %>
                                            </button>
                                        </h2>
                                    </div>
                                    <div id="collapse<%# Eval("IdPregunta") %>" class="collapse" aria-labelledby="heading<%# Eval("IdPregunta") %>" data-parent="#accordionSinResponder">
                                        <div class="card-body">
                                            <p><%# Eval("Cuerpo") %></p>
                                            <small class="text-muted"><%# Eval("Fecha") %></small>
                                            <br />
                                            <!-- PREGUNTAS SIN RESPONDER -->
                                            <asp:Button ID="btnResponderPregunta" runat="server" CssClass="btn btn-success mr-2" Text="Responder" CommandName="ResponderPregunta" CommandArgument='<%# Eval("IdPregunta") %>' />
                                            <asp:Button ID="btnEliminarPregunta" runat="server" CssClass="btn btn-danger" Text="Eliminar" CommandName="EliminarPregunta" CommandArgument='<%# Eval("IdPregunta") %>' />
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </asp:Panel>



                <!-- Sección de Preguntas por Curso -->
                <asp:Panel runat="server">
                    <div class="tab-pane fade" id="por-curso" role="tabpanel" aria-labelledby="por-curso-tab">

                        <div class="accordion mt-4" id="accordionCurso<%# Eval("IdCurso") %>">
                            <asp:Repeater ID="RptPreguntasCurso" runat="server">
                                <ItemTemplate>
                                    <div class="card">
                                        <div class="card-header" id="headingCurso<%# Eval("IdPregunta") %>">
                                            <h2 class="mb-0">
                                                <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseCurso<%# Eval("IdPregunta") %>" aria-expanded="true">
                                                    <%# Eval("Titulo") %>
                                                </button>
                                            </h2>
                                        </div>
                                        <div id="collapseCurso<%# Eval("IdPregunta") %>" class="collapse" aria-labelledby="headingCurso<%# Eval("IdPregunta") %>" data-parent="#accordionCurso<%# Eval("IdCurso") %>">
                                            <div class="card-body">
                                                <p><%# Eval("Cuerpo") %></p>
                                                <small class="text-muted"><%# Eval("Fecha") %></small>
                                                <br />
                                                <!-- PREGUNTAS X CURSO -->

                                                <asp:Button ID="btnResponderPregunta" runat="server" CssClass="btn btn-success mr-2" Text="Responder" CommandName="ResponderPregunta" CommandArgument='<%# Eval("IdPregunta") %>' />
                                                <asp:Button ID="btnEliminarPregunta" runat="server" CssClass="btn btn-danger" Text="Eliminar" CommandName="EliminarPregunta" CommandArgument='<%# Eval("IdPregunta") %>' />
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

</asp:Content>
