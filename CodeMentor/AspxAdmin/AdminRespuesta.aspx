<%@ Page Title="Respuesta
    " Language="C#" MasterPageFile="~/Masters/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="AdminRespuesta.aspx.cs" Inherits="CodeMentor.AspxAdmin.AdminRespuesta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <style>
    body {
    font-family: 'Roboto', sans-serif;
    color: #333;
}

h3 {
    color: #333;
    margin-bottom: 30px;
}

.list-group-item {
    border: 1px solid #e0e0e0;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
    border-radius: 15px;
    transition: transform 0.3s, box-shadow 0.3s;
    background-color: #fff;
    margin-bottom: 20px;
}

.list-group-item:hover {
    transform: scale(1.02);
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
}

.card {
    border: none;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
    border-radius: 15px;
    transition: transform 0.3s, box-shadow 0.3s;
}



.card-body {
    padding: 20px;
}

.card-text {
    color: #333;
}

.btn-danger, .btn-primary, .btn-success {
    border-radius: 15px;
    padding: 10px 20px;
    transition: background-color 0.3s, color 0.3s, box-shadow 0.3s;
}

.btn-danger:hover, .btn-primary:hover, .btn-success:hover {
    box-shadow: 0 4px 10px rgba(0, 123, 255, 0.3);
}

.form-control {
    border: 1px solid #ced4da;
    border-radius: 4px;
    transition: border-color 0.3s, box-shadow 0.3s;
}

.form-control:focus {
    border-color: #80bdff;
    outline: 0;
    box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
}
</style>
    <div class="container">
    <div class="row" style="margin-top:10%">
        <asp:ScriptManager runat="server" />

        <asp:UpdatePanel runat="server">
            <ContentTemplate>

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

                        <% if (Preg.IdRespuesta != null) { %>
                        <div class="ml-4 mt-3">
                            <div class="card" style="border-radius: 15px">
                                <div class="card-body">
                                    <asp:TextBox runat="server" ID="TxtRespuestaModificar" Style="background: white" CssClass="form-control form-text" TextMode="MultiLine" Rows="5" />
                                    <small><%:Preg.FechaRespuesta %></small>
                                </div>
                            </div>
                            <div style="margin-top: 1%">
                                <a href="AdminPreguntas.aspx" class="btn btn-danger">Volver</a>
                                <asp:Button runat="server" Text="Modificar" CssClass="btn btn-primary" ID="BtnModificar" OnClick="BtnModificar_Click" />
                                <asp:Button runat="server" Text="Guardar Cambios" CssClass="btn btn-success" ID="BtnGuardarCambios" OnClick="BtnGuardarCambios_Click" />
                            </div>
                        </div>
                        <% } else { %>
                        <div class="ml-4 mt-3">
                            <div class="card" style="border-radius: 15px">
                                <div class="card-body">
                                    <asp:TextBox runat="server" ID="TxtRespuesta" CssClass="form-control" PlaceHolder="Responda" TextMode="MultiLine" Rows="5" />
                                </div>
                            </div>
                            <div style="margin-top: 1%">
                                <a href="AdminPreguntas.aspx" class="btn btn-danger">Volver</a>
                                <asp:Button Text="Enviar" CssClass="btn btn-success" ID="BtnEnviarRespuesta" OnClick="BtnEnviarRespuesta_Click" runat="server" />
                            </div>
                        </div>
                        <% } %>
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</div>

</asp:Content>
