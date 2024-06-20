<%@ Page Title="titulo" Language="C#" MasterPageFile="~/Masters/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="AdminCursos.aspx.cs" Inherits="CodeMentor.AdminAspx.AdminCursos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Repeater runat="server" ID="repRepetidor" >
        <ItemTemplate>
            <div class="col">
                <div class="card">
                    <img src="<%#Eval("UrlPortada") %>"   class="card-img-top" alt="...." />
                    <div class="card-body">
                        <div class="card-text">
                    <p class="card-title"> <%#Eval("Nombre") %></p>
                            <h5 class="card-title"> Descripcion </h5>
                            <p class="card-text"> <%#Eval("Descripcion") %></p>
                                  <h5 class="card-title"> Requisitos </h5>
                            <p class="card-text"> <%#Eval("Requisitos") %></p>
                            <asp:Button ID="ButtonModificar" runat="server"  CssClass="btn-success" Text="Modificar" CommandArgument='<%#Eval("IdCurso")%>' CommandName="CursoId" OnClick="ButtonModificar_Click" />
                        </div>
                    </div>
                </div>

            </div>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>


  <%--      public int IdCurso { get; set; }

        public string Nombre { get; set; } 

        public string Descripcion { get; set; }

        public string Requisitos { get; set; } 

        public decimal Importe { get; set; }

        public string UrlPortada { get; set; } 

        public int IdCategoria { get; set; }

        public DateTime? FechaCreacion { get; set; } // ? = acepta nulos--%>