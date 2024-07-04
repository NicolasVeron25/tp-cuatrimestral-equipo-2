<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="AdminUsuarios.aspx.cs" Inherits="CodeMentor.AdminAspx.AdminUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" class="curso-contenedor">


    <div class="container mt-5">
        <h1 class="text-center">ADMINISTRACIÓN USUARIOS</h1>

        <div class="row mt-4 justify-content-center">
            <!-- Botón de Ver Usuarios y Cantidad de Usuarios -->
            <div class="">
                <div class="card text-center col-md-8" style="margin-left:16.5%;margin-bottom:2%">

                    <div class="panel-container">
                        <asp:Panel runat="server">
                            <asp:Button ID="btnVerUsuarios" CssClass="btn btn-primary btn-lg btn-block custom-button mb-3" runat="server" OnClick="btnVerUsuarios_Click" Text="Ver Usuarios Inscriptos" />
                            <asp:Label ID="lblCantUsuarios" CssClass="custom-label" runat="server" Text=""></asp:Label>
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-4 justify-content-center">

            <!-- GridView de Usuarios -->
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header bg-primary text-white text-center">
                        <h3>Usuarios Inscriptos</h3>
                    </div>
                    <div class="card-body">
                        <asp:Panel runat="server">
                            <asp:GridView ID="gviewUsuarios" OnSelectedIndexChanged="gviewUsuarios_SelectedIndexChanged" DataKeyNames="Idusuario" CssClass="table table-bordered table-hover" runat="server" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:BoundField HeaderText="Idusuario" DataField="Idusuario" HeaderStyle-CssClass="d-none" ItemStyle-CssClass="d-none" />
                                    <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                                    <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
                                    <asp:BoundField HeaderText="País" DataField="Pais" />
                                    <asp:TemplateField HeaderText="Eliminar">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkEliminar" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>

                            <asp:Button ID="btnConfirmaEliminacion" CssClass="btn btn-outline-danger btn-block mt-2" Text="Confirma Eliminación" OnClick="btnConfirmaEliminacion_Click" runat="server" />
                            <asp:Button ID="btnOcultar" CssClass="btn btn-outline-secondary btn-block mt-2" runat="server" Text="Ocultar Grilla" OnClick="btnOcultar_Click" />
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <style>
        .custom-button {
            font-size: 20px;
            font-weight: bold;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            padding: 15px;
            transition: background-color 0.3s, transform 0.3s;
        }

            .custom-button:hover {
                background-color: #0056b3;
                transform: scale(1.05);
            }

        .custom-label {
            display: block;
            margin-top: 15px;
            font-size: 18px;
            font-weight: bold;
            color: #007bff;
            text-align: center;
        }

        .panel-container {
            text-align: center;
            padding: 20px;
            border-radius: 10px;
            max-width: 400px;
            margin: 0 auto;
        }

        .curso-contenedor {
            max-width: 1200px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .card {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .card-body {
            padding: 20px;
        }

        .table {
            margin-top: 20px;
        }
    </style>
</asp:Content>