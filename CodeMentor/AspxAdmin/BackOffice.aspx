<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="BackOffice.aspx.cs" Inherits="CodeMentor.BackOffice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1> Hello! Estás en el Backoffice</h1>
    <asp:Panel runat="server" Style="margin: 0 auto; max-width: 800px;">
        <div class="d-grid gap-2">
            <asp:TextBox runat="server" />
  <button class="btn btn-primary" type="button">Modificar</button>
            <asp:TextBox runat="server" />
  <button class="btn btn-primary" type="button">Modificar</button>
            <asp:TextBox runat="server" />
  <button class="btn btn-primary" type="button">Modificar</button>
</div>
 
    </asp:Panel>
</asp:Content>

<% - el contenido de backoffice es una prueba%>
