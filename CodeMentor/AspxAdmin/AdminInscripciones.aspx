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
            margin: 30px auto;
            width: 80%;
        }

        .button-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin: 20px 0;
        }

        .gridview-container {
            width: 100%;
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
                    padding: 12px;
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
            margin: 30px 0;
            text-align: center;
        }

        .row {
            margin: 10px 0;
        }
    </style>
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
