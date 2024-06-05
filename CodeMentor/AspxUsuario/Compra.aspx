<%@ Page Title="Compra" Language="C#" MasterPageFile="~/Masters/MasterUsuario.Master" AutoEventWireup="true" CodeBehind="Compra.aspx.cs" Inherits="CodeMentor.Compra" %>

<asp:Content ID="Content" ContentPlaceHolderID="head" runat="server">
  

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-top: 5%">
        <div class="card">
            <div class="card-header">
                <h3>
                    <asp:Label ID="lblName" runat="server" Text="Nombre del Producto"></asp:Label></h3>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-4 ">
                        <div>
                            <!-- levantar desde bd tambien-->
                            <asp:Image ID="imgProduct" ImageUrl="https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/C_Programming_Language.svg/695px-C_Programming_Language.svg.png" runat="server" CssClass="img-fluid" />

                        </div>
                    </div>
                    <div class="col-md-8 ">
                        <div style="margin-left: 15%; margin-top: 5%">
                            <!-- es relativo a la card los %-->
                            <div>
                                <asp:Label Text="Mostrar desde Base Datos" CssClass="form-control-lg" runat="server" />

                            </div>
                            <div>
                                <asp:Label Text="Mostrar desde Base Datos" CssClass="form-control-lg" runat="server" />
                            </div>
                            <div>
                                <asp:Label Text="Mostrar desde Base Datos" CssClass="form-control-lg" runat="server" />
                            </div>
                            <div>
                                <asp:Label Text="Mostrar desde Base Datos" CssClass="form-control-lg" runat="server" />
                            </div>
                            <div>
                                <asp:Label Text="Mostrar desde Base Datos" CssClass="form-control-lg" runat="server" />
                            </div>
                            <div>
                                <asp:Label Text="Mostrar desde Base Datos" CssClass="form-control-lg" runat="server" />
                            </div>
                        </div>
                        <div style="margin-left: 15%; margin-top: 5%">
                            <asp:Button style="margin-left:3%" Text="Abonar Curso" runat="server" CssClass="btn btn-dark"/>
                        </div>
                    </div>

                </div>
            </div>


        </div>
    </div>
   


</asp:Content>

