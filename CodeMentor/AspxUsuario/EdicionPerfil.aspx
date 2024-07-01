 <%@ Page Title="" Language="C#" MasterPageFile="~/Masters/MasterUsuario.Master" AutoEventWireup="true" CodeBehind="EdicionPerfil.aspx.cs" Inherits="CodeMentor.AspxUsuario.EdicionPerfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <style>
        body {
            font-family: Arial, sans-serif; 
        }

        .edit-profile-container {
            max-width: 800px; 
            margin: 50px auto; 
            background-color: #ffffff; 
            border-radius: 10px; 
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1); 
            padding: 30px; 
        }

        .edit-profile-header {
            text-align: center;
            margin-bottom: 30px; 
        }

        .edit-profile-form {
            text-align: left; 
        }

        .form-group {
            margin-bottom: 20px; 
        }

        .form-control2 {
            background-color: #f8f9fa;
            border: none; 
            font-weight: normal; 
            color: #495057; 
            border:0.2px solid grey;
        }

        .form-control:focus {
            box-shadow: none;
        }

        .save-button {
            text-align: center; 
        }

        .profile-img {
            width: 200px; 
            height: 200px; 
            border-radius: 50%; 
            object-fit: cover; 
            margin: 0 auto 20px; 
            display: block; 
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .error{
            color: red;
            font-size: 14px;
        
        }
    </style>
        <div class="container edit-profile-container">
            <div class="edit-profile-header">
                <h2>Editar Perfil</h2>
            </div>
            <div class="edit-profile-form">
                <div class="form-group">
                    <label>Nombre:</label>
                    <asp:TextBox ID="TxtNombre" runat="server" CssClass=" form-control form-control2"></asp:TextBox>
                    <p class="error " id="PNombreError" visible="false" runat="server"></p>

                </div>
                <div class="form-group">
                    <label>Apellido:</label>
                    <asp:TextBox ID="TxtApellido" runat="server" CssClass=" form-control form-control2"></asp:TextBox>
                    <p class="error " id="PApellidoError" visible="false" runat="server"></p>

                </div>
                <div class="form-group">
                    <label>Celular:</label>
                    <asp:TextBox ID="TxtCelular" runat="server" CssClass=" form-control form-control2"></asp:TextBox>
                    <p class="error " id="PCelularError" visible="false" runat="server"></p>

                </div>
                <div class="form-group">
                    <label>Imagen de Perfil:</label>
                         <input Id="TxtCargaImagen" runat="server"  class="form-control" type="file" />

                    <asp:Image style="margin-top:3%" ID="ImgPerfil" runat="server"  CssClass="profile-img" />
                </div>
            </div>
            <div class="save-button">
                <asp:Button ID="BtnGuardar" runat="server" Text="Guardar Cambios" CssClass="btn btn-primary" OnClick="BtnGuardar_Click" />
            </div>
        </div>
</asp:Content>
