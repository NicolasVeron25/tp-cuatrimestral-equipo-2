<%@ Page Title="Ingresar" Language="C#" MasterPageFile="~/Masters/MasterUsuario.Master" AutoEventWireup="true" CodeBehind="Ingresar.aspx.cs" Inherits="CodeMentor.Ingresar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!----------------------- CONTENEDOR PRINCIPAL -------------------------->

    <div class="container d-flex justify-content-center align-items-center min-vh-100">

        <!----------------------- LOGEO -------------------------->

        <div class="row border rounded-5 p-3 bg-white shadow box-area" style="margin-bottom:10%">

            <!--------------------------- BOX DE LA IZQUIERDA (IMAGEN) ----------------------------->

            <div class="col-md-6 rounded-4 d-flex justify-content-center align-items-center flex-column left-box">
                <div class="featured-image mb-3">
                    <img src="https://i.ibb.co/GcYcNGy/programming-background-with-person-working-with-codes-computer.jpg" class="img-fluid full-image">
                </div>
            </div>

            <!-------------------------- BOX LA DERECHA (DATOS) ---------------------------->

            <div class="col-md-6 right-box">
                <div class="row align-items-center">
                    <div class="header-text mb-4 text-center">
                        <h2>Bienvenido</h2>
                        <p>¿Con ganas de aprender?</p>
                    </div>

                    <div class="input-group mb-3">
                        <asp:TextBox ID="TxtEmailLogin" type="text" CssClass="form-control form-control-lg bg-light fs-6" placeholder="Correo electrónico" runat="server" />
                    </div>
                    <div class="input-group mb-1">
                        <asp:TextBox runat="server" Id="TxtPassLogin" type="password" CssClass="form-control form-control-lg bg-light fs-6" placeholder="Contraseña" /> 
                    </div>
                    <div>
                        <small  class="text-danger"> <asp:Label runat="server" ID="LblErrorLogin"  /></small>
                    </div>
                    <div class="input-group mb-5 d-flex justify-content-between">
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="formCheck">
                            <label for="formCheck" class="form-check-label text-secondary">
                                <small>Recordame</small>
                                <!-- Para esto tenemos que manjear cookies y eso en el document.. con JS. Revisar o Borrar dsps -->
                            </label>
                        </div>
                        <div class="forgot">
                            <small><a href="#">¿Olvidaste la contraseña?</a></small> <!-- Redirect a Aspx ResetPass-->
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <asp:Button Text="Ingresar" runat="server" ID="BtnLogin" OnClick="BtnLogin_Click" CssClass="btn btn-lg btn-primary w-100 fs-6"/>
                    </div>
                    <div class="row">
                        <small>¿Aún no te has registrado? <a href="Registrar.aspx">Registrarme</a></small>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-------------------------- ESTILOS ---------------------------->

    <style>
        /*------------ CONTENEDOR DE LOGEO ------------*/

        .box-area { /*MANTIENE TODO EN UN RECUADRO MAS CHICO*/
            width: 930px;
        }

        /*------------ BOX DE LA IZQUIERDA ------------*/

        .left-box {
            background: var(--electric-indigo);
            position: relative;
            overflow: hidden;
        }

        .full-image { /*HACE QUE LA IMAGEN OCUPE LA TOTALIDAD DE LA BOX*/
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /*------------ BOX DE LA DERECHA ------------*/

        .right-box {
            padding: 40px 30px 40px 40px;
        }

        /*------------ MODIFICACIONES PARA PANTALLAS MAS CHICAS ------------*/

        @media only screen and (max-width: 768px) { /*SIN ESTAS MODIFICACIONES LA IMAGEN SE ROMPE AL ACHICAR LA PANTALLA*/

            .box-area {
                margin: 0 10px;
            }

            .left-box {
                height: 100px;
                overflow: hidden;
            }

            .right-box {
                padding: 20px;
            }
        }
    </style>

</asp:Content>
