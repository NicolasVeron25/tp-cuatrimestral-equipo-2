﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/MasterUsuario.Master" AutoEventWireup="true" CodeBehind="PerfilUsuario.aspx.cs" Inherits="CodeMentor.PerfilUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card">
                    <div class="card-header">
                        <h3>User Details</h3>
                    </div>
                    <div class="card-body">
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
                            <label >Fecha de Nacimiento:</label>
                            <asp:Label ID="LblFechaNacimiento" runat="server" CssClass="form-control"></asp:Label>
                        </div>
                        <div class="form-group">
                            <label >País:</label>
                            <asp:Label ID="LblPais" runat="server" CssClass="form-control"></asp:Label>
                        </div>
                        <div class="form-group">
                            <label ">Celular:</label>
                            <asp:Label ID="LblCelular" runat="server" CssClass="form-control"></asp:Label>
                        </div>
                        <div class="form-group">
                            <label >Sexo:</label>
                            <asp:Label ID="LblSexo" runat="server" CssClass="form-control"></asp:Label>
                        </div>
                        <div class="form-group">
                            <label > Foto de Perfil:</label>
                            <asp:Image id="ImgPerfil" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
