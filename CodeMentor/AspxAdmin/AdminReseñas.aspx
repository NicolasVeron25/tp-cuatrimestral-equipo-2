<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="AdminReseñas.aspx.cs" Inherits="CodeMentor.AspxAdmin.AdminReseñas1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
      <div style="background-color: darkslategrey">
      <div class="center-horizontal">
          <h1>ADMINISTRACION RESEÑAS</h1>
      </div>
      <hr />
      <hr />
      <div class="content-container">
          <div class="image-container">
              <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXM6JRn74x-toORmpolS2OYsCfqH5kWqXT2w&s" alt="Descripción de la imagen" style="width: 200px; height: 200px;" />
          </div>
          <div class="button-container" style="background-color: azure">
              <asp:Panel runat="server">
                  <asp:Button ID="btnVerReseñas" CssClass="btn btn-outline-primary" runat="server" OnClick="btnVerUsuarios_Click" Text="Ver Reseñas" />
                  <asp:Button ID="btnEliminarReseñas" CssClass="btn btn-outline-danger" Text="Eliminar Reseñas" runat="server" />
              </asp:Panel>
          </div>
      </div>
  </div>
</asp:Content>
