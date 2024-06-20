<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="AdminUsuarios.aspx.cs" Inherits="CodeMentor.AdminAspx.AdminUsuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" class="row curso-contenedor">
    <div style="background-color:darkslategrey" >
            <div class="center-horizontal col-md-6 mb-4">
        <h1 class="center-horizontal">ADMINISTRACION USUARIOS</h1>
   
                </div>
        <div class="row" >

        <div class="content-container col-6">
         
            <div class="button-container" style="background-color: azure">
                <asp:Panel runat="server" Class="center-horizontal">
                    <asp:Button ID="btnVerUsuarios" CssClass="btn btn-outline-primary m-2" runat="server" OnClick="btnVerUsuarios_Click" Text="Ver Usuarios inscriptos" />
                    <asp:Label ID="lblCantUsuarios" runat="server" text="" ></asp:Label>
         
                    <asp:Button ID="btnEliminarUsuarios" CSSclass="btn btn-outline-danger m-2" Text="Eliminar Usuario" runat="server" />

                 
                </asp:Panel>
            </div>
        </div>

        </div>
 
    </div>

    <section>
        <div class="row m-5">
            <h3> Informacion Users</h3>
        </div>
        <div class="row">

    <div Class="  container col-md-6 mb-4   ">
        <asp:Panel runat="server">
            <asp:GridView ID="gviewUsuarios" OnSelectedIndexChanged="gviewUsuarios_SelectedIndexChanged" DataKeyNames="Idusuario" CssClass=" table-bordered table-info table-warning  m-5" runat="server" AutoGenerateColumns="false">
                <Columns   >
                    <asp:BoundField   HeaderText="Idusuario" DataField="Idusuario" HeaderStyle-CssClass="oculto"  ItemStyle-CssClass="oculto"  />
                    <asp:BoundField   HeaderText="Nombre" DataField="Nombre" />
                    <asp:BoundField   HeaderText="Nombre" DataField="Apellido" />
                    <asp:BoundField   HeaderText="Pais" DataField="Pais" />
                    <asp:CommandField ShowSelectButton="true"  HeaderText="Comando"  SelectText="Eliminar" />
           <%--    --%>
            

                </Columns>

            </asp:GridView>
            <asp:Button ID="btnOcultar" CssClass="btn-dark  justify-content-sm-center" runat="server" OnClick="btnOcultar_Click" Text="Ocultar grilla" />

        </asp:Panel>

    </div>
        </div>

    </section>
        <style>
            .oculto{
                display:none;
            }
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
         .page-background {
     background-color: gray;
 }
            .curso-contenedor {
       max-width: 1000px;
       margin: 50px auto;
       padding: 20px;
       border: 1px solid #ddd;
       border-radius: 20px;
       background-color: #fff;
       box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
   }

    </style>
</asp:Content>
