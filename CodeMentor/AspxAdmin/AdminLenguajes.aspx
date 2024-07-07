<%@ Page Title="Administracion de Lenguajes" Language="C#" MasterPageFile="~/Masters/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="AdminLenguajes.aspx.cs" Inherits="CodeMentor.AspxAdmin.AdminLenguajes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="../Content/AdminCursos.css" rel="stylesheet" />

    <%--CONTENEDOR PRINCIPAL--%>
    <div class="container" style="margin-top: 2%">

        <%--TITULO DE LA PAGINA--%>
        <div class="row">
            <div class="col-12 text-center mb-2">
                <h2 class="title">Lenguajes</h2>
            </div>
        </div>

        <%--FILTROS--%>
        <div class="row">
            <p class="mb-3">Ordenar por:</p>
            <div class="col-3 d-flex align-items-center">
                <asp:DropDownList OnSelectedIndexChanged="ddlAZ_SelectedIndexChanged" ID="ddlAZ" AutoPostBack="true" runat="server" CssClass="form-control form-select btn-secondary mb-3">
                    <asp:ListItem Text="A-Z" Value="2" />
                    <asp:ListItem Text="Z-A" Value="1" />
                </asp:DropDownList>
            </div>
            <div class="col-3 text-end">
                <a href="#" class="btn btn-primary mb-3" data-toggle="modal" data-target="#modalAgregarLenguaje">Agregar</a>
            </div>
        </div>

        <%--LENGUAJES--%>
        <div class="row">
            <div class="col-12">
                <asp:GridView runat="server" ID="DgwLenguajes" OnRowCommand="DgwLenguajes_RowCommand" AutoGenerateColumns="False" CssClass="table-custom">
                    <Columns>
                        <asp:BoundField DataField="IdLenguaje" Visible="false" />
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre del Lenguaje" Visible="True" />
                        <asp:TemplateField HeaderText="Accion" Visible="True">
                            <ItemTemplate>
                                <%--<asp:Button ID="btnEditar" runat="server" Text="Visualizar" CommandName="Visualizar" CommandArgument='<%#Eval("IdCurso") %>' CssClass="btn-visualizar" />--%>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <%--MODAL DE AGREGAR--%>
        <div class="modal fade" id="modalAgregarLenguaje" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Agregar lenguaje</h5>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="txtNuevoLenguaje">Nombre:</label>
                            <asp:TextBox ID="txtNuevoLenguaje" runat="server" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnAgregarLenguaje" runat="server" CssClass="btn btn-primary" Text="Agregar" OnClick="btnAgregarLenguaje_Click" />
                        <button type="button" class="btn btn-danger" data-dismiss="modal" aria-label="Close">Cancelar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

