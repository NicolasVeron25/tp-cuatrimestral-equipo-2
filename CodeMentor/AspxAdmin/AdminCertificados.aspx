<%@ Page Title="Administración de Certificados  " Language="C#" MasterPageFile="~/Masters/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="AdminCertificados.aspx.cs" Inherits="CodeMentor.AspxAdmin.AdminCertificados" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager runat="server" />
    <%--CONTENEDOR PRINCIPAL--%>
    <div class="container mt-5">

        <%--TITULO DE LA PAGINA--%>
        <h2 class="mb-4" style="margin-left: 47%">Certificados</h2>
        <%--SECCION DE LENGUAJES--%>
        <div class="row col-8" style="margin-left: 20%; margin-bottom: 7%">

            <div class="list-group">

                <%--PRIMER BOTON DE LENGUAJES--%>
                <button type="button" class="list-group-item list-group-item-action" aria-current="true" id="botonLenguajes">
                    <h5 class="mb-1 text-lg-center">Certificados</h5>
                </button>

                <%--LISTA DE CERTIFICACIONES--%>
                <%foreach (var certificado in ListaCertificados)
                    {%>
                <li class="list-group-item list-group-item-action d-flex justify-content-between align-items-center">
                    <%:certificado.IdCertificacion%> , <%:certificado.Nombre %>, <%:certificado.Apellido %>, <%:certificado.NombreCurso %>
                </li>
                <%}%>

                <hr />
            </div>
        </div>
    </div>

    <%--ESTILOS--%>
    <style>
        #botonLenguajes {
            background-color: lightgray;
            color: black;
        }

        .iconoModificacion, .iconoEliminacion {
            width: 30px;
            height: 30px;
            margin-left: 10px;
        }

        .list-group-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
    </style>

</asp:Content>
