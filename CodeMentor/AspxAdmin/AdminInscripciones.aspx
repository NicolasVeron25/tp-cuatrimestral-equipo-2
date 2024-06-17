<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="AdminUsuarios.aspx.cs" Inherits="CodeMentor.AdminAspx.AdminUsuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .center-horizontal {
            text-align: center;
            margin-top: 0; /* Asegúrate de que no haya margen superior */
        }
        .content-container {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            margin: 20px auto; /* Centrando horizontalmente */
            width: 60%; /* Ajusta el ancho según sea necesario */
        }
        .image-container {
            margin-right: 20px; /* Espacio entre la imagen y el contenedor de botones */
        }

        .button-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px; /* Ancho del contenedor */
        }
        .button-container button {
            width: 100%;
            margin: 10px 0; /* Espacio entre botones */
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    <div style="background-color:darkslategrey">
            <div class="center-horizontal">
        <h1 >ADMINISTRACION INSCRIPCIONES</h1>
    </div>
    <hr />
    <hr />
    <div class="content-container" >
        
        <div class="image-container">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROiqAjhAQ9k2PNVpa0-gJJym-tuBLhnL_tNA&s" alt="Descripción de la imagen" style="width: 200px; height: 200px;" />
        </div>
        <div class="button-container"style="background-color:azure ">
            <asp:Panel runat="server">
                <asp:Button ID="btn_VerInscripciones" runat="server" Cssclass="btn btn-outline-primary" Text="Ver todas las inscripciones" />
                <asp:Button ID="btn_ModificarInscripion" runat="server" Cssclass="btn btn-outline-primary" Text="Modificar Inscripcion" />              
                <asp:Button ID="btn_EliminarInscripcion" runat="server" Cssclass="btn btn-outline-danger" Text="Eliminar Inscripcion" />
                
            </asp:Panel>
        </div>
    </div>
    </div>
</asp:Content>
