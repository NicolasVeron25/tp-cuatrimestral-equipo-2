<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/MasterUsuario.Master" AutoEventWireup="true" CodeBehind="DetalleCurso.aspx.cs" Inherits="CodeMentor.AspxUsuario.DetalleCurso" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!----------------------- CONTENEDOR PRINCIPAL -------------------------->

    <div class="container d-flex justify-content-center align-items-start mt-5">
        <div class="row curso-contenedor">

            <!-------------------------- IMAGEN, TITULO Y DESCRIPCION ---------------------------->

            <div class="col-md-6 mb-4">
                <div class="curso-detalles">
                    <img src="https://i.ibb.co/GcYcNGy/programming-background-with-person-working-with-codes-computer.jpg" class="curso-imagen" alt="Imagen del Curso">
                    <div class="curso-titulo mt-3">
                        Nombre del curso
                    </div>
                    <div class="curso-descripcion mt-2">
                        Breve descripcion del curso.
                    </div>
                </div>
            </div>

            <!-------------------------- UNIDADES Y CLASES ---------------------------->

            <div class="col-md-6">
                <div class="accordion accordion-flush" id="accordionFlushExample">
                    <div class="accordion-item">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                                Accordion Item #1
                            </button>
                        </h2>
                        <div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                            <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the first item's accordion body.</div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                                Accordion Item #2
                            </button>
                        </h2>
                        <div id="flush-collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                            <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the second item's accordion body. Let's imagine this being filled with some actual content.</div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                                Accordion Item #3
                            </button>
                        </h2>
                        <div id="flush-collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                            <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the third item's accordion body. Nothing more exciting happening here in terms of content, but just filling up the space to make it look, at least at first glance, a bit more representative of how this would look in a real-world application.</div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <!-------------------------- ESTILOS ---------------------------->

    <style>
        /*-------------------------- ESTILOS DE DETALLES ()----------------------------*/

        .curso-contenedor {
            max-width: 1000px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .curso-detalles {
            text-align: center;
        }

        .curso-imagen {
            width: 100%;
            height: auto;
            border-radius: 5px;
        }

        .curso-titulo {
            font-size: 24px;
            font-weight: bold;
            margin-top: 20px;
        }

        .curso-descripcion {
            font-size: 16px;
            margin-top: 10px;
        }

        .accordion-button {
            color: var(--white);
            background-color: var(--electric-indigo);
            font-weight: bold;
        }

            .accordion-button:not(.collapsed) {
                color: var(--white);
                background-color: var(--electric-indigo);
            }

        .accordion-body {
            background-color: var(--platinum);
        }
    </style>

</asp:Content>
