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
                        <input type="text" class="form-control form-control-lg bg-light fs-6" placeholder="Nombre">
                    </div>
                    <div class="input-group mb-3">
                        <input type="text" class="form-control form-control-lg bg-light fs-6" placeholder="Apellido">
                    </div>
                    <div class="input-group mb-3">
                        <input type="date" class="form-control form-control-lg bg-light fs-6" placeholder="Fecha de Nacimiento">
                    </div>
                    <div class="input-group mb-3">
                        <input type="email" class="form-control form-control-lg bg-light fs-6" placeholder="Correo Electrónico">
                    </div>
                    <div class="input-group mb-3">
                        <input type="password" class="form-control form-control-lg bg-light fs-6" placeholder="Contraseña">
                    </div>
                    <div class="input-group mb-3">
                        <input type="password" class="form-control form-control-lg bg-light fs-6" placeholder="Repetir Contraseña">
                    </div>
                    <div class="input-group mb-3">
                        <select class="form-control form-control-lg bg-light fs-6">
                            <option value="" disabled selected>País</option>
                            <option value="Argentina">Argentina</option>
                            <option value="Brasil">Brasil</option>
                            <option value="Uruguay">Uruguay</option>
                            <option value="Otro">Otro</option>
                        </select>
                    </div>
                    <div class="input-group mb-3">
                        <input type="tel" class="form-control form-control-lg bg-light fs-6" placeholder="Celular">
                    </div>
                    <div class="input-group mb-3">
                        <select class="form-control form-control-lg bg-light fs-6">
                            <option value="" disabled selected>Sexo</option>
                            <option value="Masculino">Masculino</option>
                            <option value="Femenino">Femenino</option>
                            <option value="Otro">Otro</option>
                        </select>
                    </div>
                    <div class="input-group mb-3">
                        <button class="btn btn-lg btn-primary w-100 fs-6">Registrarse</button>
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
