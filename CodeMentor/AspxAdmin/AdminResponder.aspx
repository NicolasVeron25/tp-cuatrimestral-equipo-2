﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="AdminResponder.aspx.cs" Inherits="CodeMentor.AspxAdmin.AdminResponder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" />

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="container">

                <div class="row col-12" style="margin-left: 50%; margin-top: 20%">
                    <div class="mb-3">
                        <h3>Responder : </h3>
                    </div>
                    <div class="list-group">

                        <div class="list-group-item" style="margin-bottom: 2%; border-radius: 15px; border: solid lightgrey 1px;">
                            <div class="d-flex w-100 justify-content-between" style="margin-top: 0.8%">
                                <h5 class="mb-1"><%:Preg.TituloPregunta %></h5>
                                <div class="mb-3">
                                    <small><%:Preg.NombreApellidoUser%></small>
                                    
                                            </div>
                            </div>
                            <p class="mb-1"><%:Preg.CuerpoPregunta%></p>

                            <small><%:Preg.FechaPregunta %></small>

                            <%if (Preg.IdRespuesta != null)
                                {  %>
                            <div class="ml-4 mt-3 ">
                                <div class="card" style="border-radius: 15px">
                                    <div class="card-body">
                                       
                                        <asp:TextBox runat="server" Id="TxtRespuestaModificar" style="background:white"  CssClass=" form-control form-text" TextMode="MultiLine" Rows="5" />

                                        <small><%:Preg.FechaRespuesta %></small>

                                    </div>
                                </div>
                                <div style="margin-top: 1%">
                                    <a href="AdminPreguntas.aspx" class="btn btn-danger">Volver</a>
                                    <asp:Button runat="server" Text="Modificar" CssClass="btn btn-primary" ID="BtnModificar" OnClick="BtnModificar_Click" />
                                    <asp:Button runat="server" Text="Guardar Cambios" CssClass="btn btn-success" ID="BtnGuardarCambios" OnClick="BtnGuardarCambios_Click" />
                                    
                                </div>


                            </div>

                            <%}
                                else
                                {  %>
                            <div class="ml-4 mt-3">
                                <div class="card" style="border-radius: 15px">
                                    <div class="card-body">

                                        <asp:TextBox runat="server" ID="TxtRespuesta" PlaceHolder="Responda" TextMode="MultiLine" Rows="5" />
                                    </div>
                                </div>
                                <div style="margin-top: 1%">
                                    <a href="AdminPreguntas.aspx" class="btn btn-danger">Volver</a>
                                    <asp:Button Text="Enviar " CssClass="btn btn-success" ID="BtnEnviarRespuesta" OnClick="BtnEnviarRespuesta_Click" runat="server" />

                                </div>
                            </div>
                            <%} %>
                        </div>
                    </div>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
