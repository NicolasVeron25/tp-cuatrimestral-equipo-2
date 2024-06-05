<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/MasterUsuario.Master" AutoEventWireup="true" CodeBehind="InicioRegistrado.aspx.cs" Inherits="CodeMentor.InicioRegistrado" %>

<asp:Content ID="ContentRegistrado" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div class="container ">

        <div class="row">
            <div class="col-md-12">
                <h1 class="text-center  ">Bienvenido a CodeMentor</h1>
            </div>
            <div class="col-mb-4">
                <h2>SE RECARGAN EN UN FOR EACH . NO REPLICAR DIRECTO</h2>
                <div class="card" style="width: 25rem;">
                    <img src="https://media.licdn.com/dms/image/C4E12AQEOW8HLRbGzeg/article-cover_image-shrink_720_1280/0/1520636373448?e=2147483647&v=beta&t=JgWVMQ4mCB-v5pwcvxPQbMmPAaKth6tusDzqKukWXUs" class="card-img-top" alt="...">
                    <div class="card-body">
                        <div>
                            <h5 class="card-title">Curso de Programacion en C#</h5>

                        </div>
                        <div style="margin-top: 18px">
                            <p class="card-text">Bienvenido al curso de C#. Este curso está diseñado para proporcionar a los estudiantes una comprensión sólida de los conceptos fundamentales y avanzados de C#, desde la sintaxis básica hasta el desarrollo de aplicaciones complejas.</p>

                        </div>
                        <div style="margin-top: 30px">
                            <a href="DetalleCurso.Aspx" style="margin-right: 50px; margin-left: 30px" class="btn btn-primary">Ver Contenido </a>
                            <a href="Compra.aspx" class="btn btn-primary">Comprar Curso </a>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!--  ACA VALIDAR SI EXISTE UN CURSO COMPRADO POR ESTE USUARIO y mostrar algo.. como continuar curso o algo asi-->
        <div class="row">
            <div class=""></div>

        </div>


    </div>








</asp:Content>
