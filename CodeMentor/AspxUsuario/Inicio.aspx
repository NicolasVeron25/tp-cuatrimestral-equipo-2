﻿<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Masters/MasterUsuario.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="CodeMentor.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="carouselExampleIndicators" class="carousel slide">
        <div class="carousel-indicators">

            <button type="button"   data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="https://mir-s3-cdn-cf.behance.net/project_modules/fs/79731568097599.5b50bca477735.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="https://mir-s3-cdn-cf.behance.net/project_modules/fs/79731568097599.5b50bca477735.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="https://mir-s3-cdn-cf.behance.net/project_modules/fs/79731568097599.5b50bca477735.jpg" class="d-block w-100" alt="...">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

    <div class="container mt-5">
        <div class="row">
            <div class="col-md-4">
                <div class="card" style="width: 18rem;">
                    <img src="https://i.ibb.co/QpRmqBx/codementor-isotipo-electric-indigo.png" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">CURSO</h5>
                        <p>Breve descripcion del curso</p>
                        <a href="DetalleCurso.aspx" class="btn btnBonito">Ver</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card" style="width: 18rem;">
                    <img src="https://i.ibb.co/QpRmqBx/codementor-isotipo-electric-indigo.png" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">CURSO</h5>
                        <p>Breve descripcion del curso</p>
                        <a href="DetalleCurso.aspx"  class="btn btnBonito">Ver</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card" style="width: 18rem;">
                    <img src="https://i.ibb.co/QpRmqBx/codementor-isotipo-electric-indigo.png" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">CURSO</h5>
                        <p>Breve descripcion del curso</p>
                        <a href="DetalleCurso.aspx" class="btn btnBonito">Ver</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
