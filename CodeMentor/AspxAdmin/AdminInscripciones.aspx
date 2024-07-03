﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="AdminInscripciones.aspx.cs" Inherits="CodeMentor.AspxAdmin.AdminInscripciones1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .center-horizontal {
            text-align: center;
            margin-top: 10px; /* Reduced margin */
        }

        .content-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 10px auto; /* Reduced margin */
            width: 80%;
        }

        .button-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: #f8f9fa;
            padding: 15px; /* Reduced padding */
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Reduced box shadow */
            width: 300px;
            margin: 1px 0; /* Reduced margin */
        }

        .button-container button {
            width: 100%;
            margin: 1px 0; /* Reduced margin between buttons */
        }

        .gridview-container {
            width: 80%;
            margin: 10px 0; /* Reduced margin */
            text-align: center;
        }

        .gridview-container .grid {
            width: 100%;
            border-collapse: collapse;
            margin: 0 auto;
        }

        .gridview-container .grid th,
        .gridview-container .grid td {
            padding: 8px; /* Reduced padding */
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
            margin: 10px 0; /* Reduced margin */
            text-align: center;
        }

        .row {
            margin: 5px 0; /* Further reduced margin */
        }
    </style>
     <h2 class="mb-4" style="margin-left: 20%">ADMINISTRACION INSCRIPCIONES</h2>
     
        <div class="row col-8" style="margin-left: 20%; margin-bottom: 7%">
                <div class="button-container">
                    <h3>Acciones</h3>
                    <asp:Panel runat="server">
                        <asp:Button ID="btn_VerInscripciones" runat="server" CssClass="btn btn-outline-primary" OnClick="btn_VerInscripciones_Click" Text="Ver todas las inscripciones" />
                        <asp:Button ID="btn_ModificarInscripion" runat="server" CssClass="btn btn-outline-primary" Text="Modificar Inscripción" />
                        <asp:Button ID="btnEliminar" CssClass="btn btn-danger" OnClick="btnEliminar_Click" runat="server" Text="Eliminar Inscripcion" />
                    </asp:Panel>
                </div>

            <div class="content-container">
                <div class="gridview-container">
                    <asp:GridView ID="GridViewInscripciones" DataKeyNames="IdInscripcion" CssClass="grid" runat="server" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                            <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
                            <asp:BoundField HeaderText="Curso" DataField="NombreCurso" />
                            <asp:TemplateField HeaderText="Eliminar">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkEliminar" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:Button ID="btnOcultar" CssClass="btn btn-outline-dark" runat="server" Text="Ocultar grilla" OnClick="btnOcultar_Click" />
                </div>
            </div>
        </div>

</asp:Content>
