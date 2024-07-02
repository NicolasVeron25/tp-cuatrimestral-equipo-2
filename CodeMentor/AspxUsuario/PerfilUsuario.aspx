<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/MasterUsuario.Master" AutoEventWireup="true" CodeBehind="PerfilUsuario.aspx.cs" Inherits="CodeMentor.PerfilUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        body {
            font-family: Arial, sans-serif; /* Fuente principal */
        }

        .profile-container {
            max-width: 1000px;
            margin: 50px auto;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1); /* Sombra suave */
            padding: 30px;
        }

        .profile-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .profile-img {
            width: 300px; /* Ancho de la imagen */
            height: 300px; /* Altura de la imagen */
            border-radius: 50%;
            object-fit: cover;
            margin: 0 auto 20px;
            display: block;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .profile-info {
            text-align: center;
            margin-bottom: 20px;
        }

            .profile-info label {
                font-weight: bold;
                color: #6c757d;
            }

            .profile-info .form-control {
                background-color: #f8f9fa; /* Color de fondo suave para campos */
                border: none;
                font-weight: normal;
                text-align: center;
                color: #495057;
            }
    </style>
    <div class="container profile-container" style="margin-top: 6.5%; margin-bottom: 8%">
        <div class="profile-header">
            <h2>Mi Perfil</h2>
        </div>
        <div class="row">
            <div class="col-md-4">
                <asp:Image runat="server" ID="ImgPerfil" class="profile-img" alt="Imagen de Perfil" />
            </div>
            <div class="col-md-8 profile-info">
                <div class="form-group">
                    <label>Email:</label>
                    <asp:Label ID="LblEmail" runat="server" CssClass="form-control"></asp:Label>
                </div>
                <div class="form-group">
                    <label>Nombre:</label>
                    <asp:Label ID="LblNombre" runat="server" CssClass="form-control"></asp:Label>
                </div>
                <div class="form-group">
                    <label>Apellido:</label>
                    <asp:Label ID="LblApellido" runat="server" CssClass="form-control"></asp:Label>
                </div>
                <div class="form-group">
                    <label>Fecha de Nacimiento:</label>
                    <asp:Label ID="LblFechaNacimiento" runat="server" CssClass="form-control"></asp:Label>
                </div>
                <div class="form-group">
                    <label>País:</label>
                    <asp:Label ID="LblPais" runat="server" CssClass="form-control"></asp:Label>
                </div>
                <div class="form-group">
                    <label>Celular:</label>
                    <asp:Label ID="LblCelular" runat="server" CssClass="form-control"></asp:Label>
                </div>
                <div class="form-group">
                    <label>Sexo:</label>
                    <asp:Label ID="LblSexo" runat="server" CssClass="form-control"></asp:Label>
                </div>
            </div>
        </div>
        <div class="edit-button">
            <a href="EdicionPerfil.aspx"  class="btn btn-primary">Editar Perfil</a>
        </div>
    </div>
</asp:Content>
