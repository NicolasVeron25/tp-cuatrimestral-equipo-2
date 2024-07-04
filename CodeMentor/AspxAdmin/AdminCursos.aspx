<%@ Page Title="titulo" Language="C#" MasterPageFile="~/Masters/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="AdminCursos.aspx.cs" Inherits="CodeMentor.AdminAspx.AdminCursos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

        <div class="row col-12">
            <h2 class="mb-4 text-center">Cursos </h2>
            <asp:GridView runat="server" ID="DgwCursos" OnRowCommand="DgwCursos_RowCommand" AutoGenerateColumns="False" CssClass=" form-control  table table-hover">
                <Columns>
                    <asp:BoundField DataField="IdCurso"  Visible="false" />

                    <asp:BoundField DataField="Nombre" HeaderText="Nombre del Curso" Visible="True" />
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripción" Visible="True" />
                    <asp:BoundField DataField="NombreCategoria" HeaderText="Categoria" Visible="True" />
                    <asp:BoundField DataField="ImporteFormateado" HeaderText="Precio" Visible="True" />
                    <asp:BoundField DataField="CantidadInscriptos" HeaderText="Inscriptos" Visible="True" />

                    <asp:TemplateField HeaderText="Accion" Visible="True">
                        <ItemTemplate>
                            <asp:Button  ID="btnEditar" runat="server" Text="Visualizar" CommandName="Visualizar" CommandArgument='<%#Eval("IdCurso") %>' CssClass="btn btn-primary btn-sm " />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        <a href="AñadirCurso.aspx" class="btn btn-lg btn-primary mb-5">Agregar Curso </a>

        </div>
    </div>

</asp:Content>

