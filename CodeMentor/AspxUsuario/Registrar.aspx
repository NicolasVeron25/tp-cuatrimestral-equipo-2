<%@ Page Title="Registrar" Language="C#" MasterPageFile="~/Masters/MasterUsuario.Master" AutoEventWireup="true" CodeBehind="Registrar.aspx.cs" Inherits="CodeMentor.Registrar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <!----------------------- CONTENEDOR PRINCIPAL -------------------------->

    <div class="container d-flex justify-content-center align-items-center min-vh-100">

        <!----------------------- REGISTRO -------------------------->

        <div class="row border rounded-5 p-3 bg-white shadow box-area">

            <!-------------------------- BOX DE REGISTRO (DATOS) ---------------------------->

            <div class="col-md-12 right-box">
                <div class="row align-items-center">
                    <div class="header-text mb-4 text-center">
                        <h2>Registrarse</h2>
                        <p>¡Únete a nuestra comunidad!</p>
                    </div>

                    <div class="input-group mb-3">
                        <asp:TextBox runat="server" type="text" class="form-control form-control-lg bg-light fs-6" placeholder="Nombre" ID="TxtNombre" />
                    </div>
                    <div class="input-group mb-3">
                        <asp:TextBox runat="server" type="text" class="form-control form-control-lg bg-light fs-6" placeholder="Apellido" ID="TxtApellido" />
                    </div>
                    <div class="input-group mb-3">
                        <asp:TextBox runat="server" type="date" class="form-control form-control-lg bg-light fs-6" placeholder="Fecha de Nacimiento" ID="TxtFechaNacimiento" />
                    </div>
                    <div class="input-group mb-3">
                        <asp:TextBox runat="server" type="email" class="form-control form-control-lg bg-light fs-6" placeholder="Correo Electrónico" ID="TxtEmail" />
                    </div>
                    <div class="input-group mb-3">
                        <asp:TextBox runat="server" type="password" class="form-control form-control-lg bg-light fs-6" placeholder="Contraseña" ID="TxtPass" />
                    </div>
                    <div class="input-group mb-3">
                        <asp:TextBox runat="server" type="password" class="form-control form-control-lg bg-light fs-6" placeholder="Repetir Contraseña" ID="TxtRepetirPass" />
                    </div>

                    <div class="input-group mb-3">
                        <div>
                            <asp:Label Text="Pais : " CssClass=" form-control form-label bg-light fs-6 " runat="server"></asp:Label>
                        </div>
                        <div>
                            <asp:DropDownList runat="server" ID="DdlPais" CssClass="form-select  form-control-lg bg-light fs-6">
                            </asp:DropDownList>

                        </div>

                    </div>
                    <div class="input-group mb-3">
                        <asp:TextBox runat="server" class="form-control form-control-lg bg-light fs-6" type="tel" placeholder="Numero Celular " ID="TxtCelular" />

                    </div>
                    <div class="input-group mb-3">
                        <div>
                            <asp:Label Text="Sexo : " CssClass=" form-control form-label bg-light fs-6 "  style="margin-right:20px" runat="server"></asp:Label>
                        </div>
                        <div style="margin-left: 40px">
                            <asp:DropDownList runat="server" ID="DdlSexo" CssClass="form-select  form-control-lg bg-light fs-6" >
                            </asp:DropDownList>


                        </div>

                    </div>
                    <div class="input-group mb-3">
                        <asp:Button Text="Registrarse" ID="BtnRegistro" OnClick="BtnRegistro_Click" runat="server" CssClass="btn btnBonito btn-lg btn-primary w-100 fs-6" />
                    </div>
                    <div class="row">
                        <small>¿Ya tienes una cuenta? <a href="Ingresar.aspx">Ingresar</a></small>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-------------------------- ESTILOS ---------------------------->

    <style>
        /*------------ CONTENEDOR DE REGISTRO ------------*/

        .box-area { /*MANTIENE TODO EN UN RECUADRO MAS CHICO*/
            width: 465px;
        }

        /*------------ BOX DE REGISTRO ------------*/

        .right-box {
            padding: 40px 30px 40px 40px;
        }

        /*------------ MODIFICACIONES PARA PANTALLAS MÁS CHICAS ------------*/

        @media only screen and (max-width: 768px) { /*SIN ESTAS MODIFICACIONES EL FORMULARIO SE ROMPE AL ACHICAR LA PANTALLA*/
            .box-area {
                margin: 0 10px;
            }

            .right-box {
                padding: 20px;
            }
        }
    </style>

</asp:Content>
