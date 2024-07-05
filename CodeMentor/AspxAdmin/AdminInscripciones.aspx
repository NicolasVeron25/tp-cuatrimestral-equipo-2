<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="AdminInscripciones.aspx.cs" Inherits="CodeMentor.AspxAdmin.AdminInscripciones1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../Content/AdminInscripciones.css" rel="stylesheet" />
    <div class="container mt-5">
        <div class="row col">

            <h2 class="mb-4 text-center">ADMINISTRACIÓN INSCRIPCIONES</h2>
            <div class="button-container center-horizontal">
                <h3>Acciones</h3>
                <asp:Panel runat="server">
                    <asp:Button ID="btn_VerInscripciones" runat="server" CssClass="btn btn-primary btn-block mt-2" OnClick="btn_VerInscripciones_Click" Text="Ver todas las inscripciones" />
                    <asp:Button ID="btn_HabilitarInscripion" runat="server" CssClass="btn btn-primary btn-block mt-2" Text="Habilitar Inscripción" />
                    <asp:Button ID="btnEliminar" CssClass="btn btn-danger btn-block mt-2" OnClick="btnEliminar_Click" runat="server" Text="Eliminar Inscripción" />
                </asp:Panel>
            </div>
            <div class="content-container">
                <div class="gridview-container">
                    <asp:GridView ID="GridViewInscripciones" DataKeyNames="IdInscripcion" CssClass="grid table table-striped" runat="server" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                            <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
                            <asp:BoundField HeaderText="Curso" DataField="NombreCurso" />
                            <asp:TemplateField HeaderText="Eliminar">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkEliminar" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Habilitar">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkHabilitar" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:Button ID="btnOcultar" CssClass="btn btn-outline-dark mt-3" runat="server" Text="Ocultar grilla" OnClick="btnOcultar_Click" />
                </div>
            </div>
        </div>


    </div>

</asp:Content>
