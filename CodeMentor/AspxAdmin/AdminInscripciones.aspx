<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="AdminInscripciones.aspx.cs" Inherits="CodeMentor.AspxAdmin.AdminInscripciones1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .center-horizontal {
            text-align: center;
            margin-top: 20px;
        }

        .content-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 20px auto;
            width: 80%;
        }

        .button-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            width: 300px;
            margin: 20px 0;
        }

        .button-container button {
            width: 100%;
            margin: 10px 0;
        }

        .gridview-container {
            width: 80%;
            margin: 20px 0;
            text-align: center;
        }

        .gridview-container .grid {
            width: 100%;
            border-collapse: collapse;
            margin: 0 auto;
        }

        .gridview-container .grid th,
        .gridview-container .grid td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .gridview-container .grid th {
            background-color: #007bff;
            color: white;
        }

        .gridview-container .grid tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .gridview-container .grid tr:hover {
            background-color: #ddd;
        }

        .page-header {
            margin: 20px 0;
            text-align: center;
        }
    </style>

    <div class="page-header">
        <h1>ADMINISTRACION INSCRIPCIONES</h1>
        <hr />
    </div>

    <div class="content-container">
        <div class="button-container">
            <h3>Acciones</h3>
            <asp:Panel runat="server">
                <asp:Button ID="btn_VerInscripciones" runat="server" CssClass="btn btn-outline-primary" OnClick="btn_VerInscripciones_Click" Text="Ver todas las inscripciones" />
                <asp:Button ID="btn_ModificarInscripion" runat="server" CssClass="btn btn-outline-primary" Text="Modificar Inscripción" />
                <asp:Button ID="btn_EliminarInscripcion" runat="server" CssClass="btn btn-outline-danger" Text="Eliminar Inscripción" />
            </asp:Panel>
        </div>

        <div class="gridview-container">
            <asp:GridView ID="GridViewInscripciones" CssClass="grid" runat="server">
                <Columns>
                    <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                    <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
                    <asp:BoundField HeaderText="Curso" DataField="NombreCurso" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
