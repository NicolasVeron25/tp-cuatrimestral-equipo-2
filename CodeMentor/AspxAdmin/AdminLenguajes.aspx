<%@ Page Title="Administracion de Lenguajes" Language="C#" MasterPageFile="~/Masters/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="AdminLenguajes.aspx.cs" Inherits="CodeMentor.AspxAdmin.AdminLenguajes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager runat="server" />
    <%--CONTENEDOR PRINCIPAL--%>
    <div class="container mt-5">

        <%--TITULO DE LA PAGINA--%>
        <h2 class="mb-4" style="margin-left: 20%">Administración de Lenguajes de Programación</h2>
        <%--SECCION DE LENGUAJES--%>
        <div class="row col-8" style="margin-left: 20%; margin-bottom: 7%">

            <div class="list-group">

                <%--PRIMER BOTON DE LENGUAJES--%>
                <button type="button" class="list-group-item list-group-item-action" aria-current="true" id="botonLenguajes">
                    <h5 class="mb-1 text-lg-center">Lenguajes</h5>
                </button>

                <%--LISTA DE LENGUAJES--%>
                <%foreach (var lenguaje in ListaLenguajes)
                    {%>
                <li class="list-group-item list-group-item-action d-flex justify-content-between align-items-center">
                    <%:lenguaje.Nombre%>
                    <div class="ml-auto">
                        <img src="https://static.thenounproject.com/png/3082103-200.png" class="iconoModificacion" data-toggle="modal" data-target="#modalModificarLenguaje" />
                        <img src="https://static.thenounproject.com/png/392999-200.png" class="iconoEliminacion" data-toggle="modal" data-target="#modalEliminarLenguaje" />
                    </div>
                </li>
                <%}%>
                <hr />
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalAgregarLenguaje">Agregar</button>
            </div>
        </div>
    </div>

    <%--MODAL DE AGREGAR--%>
    <div class="modal fade" id="modalAgregarLenguaje" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Agregar lenguaje</h5>
                    <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="txtNuevoLenguaje">Nombre:</label>
                        <asp:TextBox ID="txtNuevoLenguaje" runat="server" CssClass="form-control" />
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnAgregarLenguaje" runat="server" CssClass="btn btn-primary" Text="Agregar" OnClick="btnAgregarLenguaje_Click" />
                </div>
            </div>
        </div>
    </div>

    <%--MODAL MODIFICAR--%>
    <div class="modal fade" id="modalModificarLenguaje" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel2">Modificar lenguaje</h5>
                    <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Texto</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <asp:Button ID="btnModificarLenguaje" runat="server" CssClass="btn btn-primary" Text="Modificar" OnClick="btnModificarLenguaje_Click" />
                </div>
            </div>
        </div>
    </div>

    <%--MODAL ELIMINAR--%>
    <div class="modal fade" id="modalEliminarLenguaje" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel3" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel3">Eliminar lenguaje</h5>
                    <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Texto</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <asp:Button ID="btnEliminarLenguaje" runat="server" CssClass="btn btn-danger" Text="Eliminar" OnClick="btnEliminarLenguaje_Click" />
                </div>
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

