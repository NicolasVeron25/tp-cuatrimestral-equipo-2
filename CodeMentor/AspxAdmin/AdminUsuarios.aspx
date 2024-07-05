<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="AdminUsuarios.aspx.cs" Inherits="CodeMentor.AdminAspx.AdminUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" class="curso-contenedor">

    <div class="container mt-5">
        <h1 class="text-center mb-5">Administración de Usuarios</h1>

        <!-- Botón de Ver Usuarios y Cantidad de Usuarios -->
        <div class="row justify-content-center mb-5">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-body text-center">
                        <asp:Button ID="btnVerUsuarios" CssClass="btn btn-primary btn-lg custom-button mb-3" runat="server" OnClick="btnVerUsuarios_Click" Text="Ver Usuarios " />
                        <asp:Label ID="lblCantUsuarios" CssClass="custom-label" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
        </div>

        <!-- GridView de Usuarios -->
    <div class="row justify-content-center">
        <div class="col-md-10">
            <div class="card ">
                <div class="card-header bg-primary text-white text-center">
                    <h3>Usuarios Inscriptos</h3>
                </div>
                <div class="card-body">
                    <asp:Panel runat="server">
                        <asp:GridView ID="gviewUsuarios" OnSelectedIndexChanged="gviewUsuarios_SelectedIndexChanged" DataKeyNames="Idusuario" CssClass="table table-hover table-striped" runat="server" AutoGenerateColumns="false">
                            <Columns>
                                <asp:BoundField HeaderText="Idusuario" DataField="Idusuario" HeaderStyle-CssClass="d-none" ItemStyle-CssClass="d-none" />
                                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                                <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
                                <asp:BoundField HeaderText="Email" DataField="Email" />
                                <asp:TemplateField HeaderText="Estado">
                                    <ItemTemplate>
                                        <%# Convert.ToBoolean(Eval("Baja")) ? "<i class='fas fa-times text-danger'></i>" : "<i class='fas fa-check text-success'></i>" %>
                                    </ItemTemplate>
                                </asp:TemplateField>


                                <asp:BoundField HeaderText="País" DataField="Pais" />
                                <asp:TemplateField HeaderText="Eliminar">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkEliminar" runat="server" CssClass="custom-checkbox" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <p class="text-danger" id="ErrorEliminar" visible="false" runat="server"></p>
                        <div class="d-flex justify-content-end mt-3">
                            <asp:Button ID="btnConfirmaEliminacion" CssClass="btn btn-danger me-2" Text="Confirma Eliminación" OnClick="btnConfirmaEliminacion_Click" runat="server" />
                            <asp:Button ID="btnOcultar" CssClass="btn btn-secondary" runat="server" Text="Ocultar Grilla" OnClick="btnOcultar_Click" />
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>
    </div>
    <style>
     
    

    .custom-checkbox + label {
        position: relative;
        padding-left: 30px;
        cursor: pointer;
        font-size: 18px;
        line-height: 24px;
        color: #333;
        user-select: none;
    }

    .custom-checkbox + label::before {
        content: '';
        position: absolute;
        left: 0;
        top: 0;
        width: 20px;
        height: 20px;
        border: 2px solid #555;
        background: #fff;
        border-radius: 3px;
        transition: background 0.3s, border-color 0.3s;
    }

    .custom-checkbox:checked + label::before {
        background: #555;
        border-color: #555;
    }

    .custom-checkbox:checked + label::after {
        content: '';
        position: absolute;
        left: 5px;
        top: 3px;
        width: 6px;
        height: 12px;
        border: solid #fff;
        border-width: 0 2px 2px 0;
        transform: rotate(45deg);
    }

    .card {
        border: none;
        border-radius: 10px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s;
    }

    .card:hover {
        transform: translateY(-5px);
    }

    .custom-button {
        background: #333;
        border: none;
        color: white;
        padding: 10px 20px;
        font-size: 16px;
        transition: background 0.3s, box-shadow 0.3s;
    }

    .custom-button:hover {
        background: #555;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }

    .custom-label {
        font-size: 16px;
        color: #666;
        margin-top: 10px;
    }
        .form-check-input {
            width: 1.5rem;
            height: 1.5rem;
            cursor: pointer;
        }

        .table .fas {
            font-size: 1.5rem;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-right: 50%;
        }

        .text-danger {
            color: #dc3545 !important;
        }

        .text-success {
            color: #28a745 !important;
        }

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

        .card {
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
        }

            .card:hover {
                transform: translateY(-10px);
            }

        .card-header {
            color: #fff;
        }

        .table-hover tbody tr:hover {
            background-color: #f1f1f1;
        }

        .btn-danger {
            background-color: #dc3545;
            border: none;
            transition: background-color 0.3s, transform 0.3s;
        }

            .btn-danger:hover {
                background-color: #c82333;
                transform: scale(1.05);
            }

        .btn-secondary {
            background-color: #6c757d;
            border: none;
            transition: background-color 0.3s, transform 0.3s;
        }

            .btn-secondary:hover {
                background-color: #5a6268;
                transform: scale(1.05);
            }

        .text-danger {
            font-size: 14px;
            margin-top: 10px;
        }
    </style>
</asp:Content>
