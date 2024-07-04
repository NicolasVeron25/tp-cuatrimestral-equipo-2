<%@ Page Title="CursoDiseño" Language="C#" MasterPageFile="~/Masters/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="AdminCursoRev.aspx.cs" Inherits="CodeMentor.AspxAdmin.AdminCursoRev" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        body {
            font-family: 'Arial', sans-serif;
        }

        .container-custom {
            background-color: #ffffff;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }

        .header-custom {
            text-align: center;
            margin-bottom: 30px;
        }

            .header-custom h2 {
                font-size: 2.5rem;
                color: #2c3e50;
                margin-bottom: 10px;
            }

        .form-control-custom {
            margin-bottom: 20px;
        }

        .card-custom {
            border: none;
            margin-bottom: 20px;
        }

            .card-custom .card-body {
                padding: 20px;
                background-color: #f5f5f5;
                border-radius: 8px;
            }

        .card-title-custom {
            font-size: 1.2rem;
            color: #2980b9;
            margin-bottom: 10px;
        }

        .btn-custom {
            border-radius: 8px;
            padding: 10px 20px;
        }

        .btn-primary-custom {
            background-color: #2980b9;
            border: none;
            border-radius: 8px;
            padding: 10px 20px;
            transition: background-color 0.3s ease;
            color: #ffffff;
        }

            .btn-primary-custom:hover {
                background-color: #1c5980;
            }

        .btn-danger-custom {
            background-color: #c0392b;
            color: #ffffff;
            border: none;
            border-radius: 8px;
            padding: 5px 10px;
        }

            .btn-danger-custom:hover {
                background-color: #a93226;
            }

        .accordion-custom .accordion-item {
            border: none;
            margin-bottom: 15px;
        }

        .accordion-header-custom {
            background-color: #2980b9;
            color: #ffffff;
            padding: 10px 15px;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

            .accordion-header-custom:hover {
                background-color: #1c5980;
            }

        .accordion-body-custom {
            background-color: #ffffff;
            border: 1px solid #dddddd;
            border-radius: 8px;
            padding: 20px;
        }

        .list-group-item-custom {
            border: none;
            padding: 15px;
            border-bottom: 1px solid #dddddd;
        }
    </style>
    <asp:ScriptManager runat="server" />
    <div class="container container-custom">
        <div class="header-custom">
            <h2><%: CursoDto.Nombre %></h2>
            <asp:TextBox runat="server" ID="TxtModifNombre" style="width:71%; font-size:large;margin-left:15%;" CssClass="text-center form-control form-control-custom" placeholder="Modificar Nombre" />
        </div>

        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card card-custom">
                    <div class="card-body">
                        <h5 class="card-title card-title-custom">Descripción del Curso</h5>
                        <p id="PDescripcion" runat="server" class="card-text"><%: CursoDto.Descripcion %></p>
                        <asp:TextBox runat="server" ID="TxtModifDescripcion" CssClass="form-control form-control-custom" TextMode="MultiLine" Rows="5" placeholder="Modificar Descripción" />
                    </div>
                </div>

                <div class="card card-custom">
                    <div class="card-body">
                        <h5 class="card-title card-title-custom">Categoría</h5>
                        <p class="card-text"><%: CursoDto.NombreCategoria %></p>
                        <asp:DropDownList runat="server" ID="DdlCategorias" CssClass="form-select form-control-custom"></asp:DropDownList>
                    </div>
                </div>

                <div class="card card-custom">
                    <div class="card-body">
                        <h5 class="card-title card-title-custom">Importe</h5>
                        <p class="card-text"><%: CursoDto.ImporteFormateado %></p>
                        <asp:TextBox runat="server" ID="TxtModifImporte" CssClass="form-control form-control-custom" placeholder="Modificar Importe" />
                    </div>
                </div>

                <div class="card card-custom">
                    <div class="card-body">
                        <h5 class="card-title card-title-custom">Requisitos</h5>
                        <p class="card-text"><%: CursoDto.Requisitos %></p>
                        <asp:TextBox runat="server" ID="TxtModifRequisitos" CssClass="form-control form-control-custom" placeholder="Modificar Requisitos" />

                    </div>
                </div>
                <div>
                    <asp:Button Text="Modificar Informacion" ID="BtnModificar" OnClick="BtnModificar_Click" runat="server" CssClass="btn btn-primary-custom" />

                    <asp:Button Text="Guardar Cambios" CssClass="btn btn-success btn-custom" ID="BtnGuardarCambios" OnClick="BtnGuardarCambios_Click" runat="server" />
                    <asp:Button Text="Cancelar" CssClass="btn btn-danger btn-custom" ID="BtnCancelarCambios" OnClick="BtnCancelarCambios_Click" runat="server" />
                </div>
            </div>

        </div>
    </div>
    <div class="container container-custom">

        <div class="d-flex justify-content-between mb-3">
            <button class="btn btn-primary-custom w-45" data-bs-toggle="modal" data-bs-target="#modalUnidad">Añadir o editar Unidad</button>
            <button class="btn btn-danger-custom w-45" data-bs-toggle="modal" data-bs-target="#modalEliminarUnidad">Eliminar Unidad</button>
        </div>

        <div class="accordion" id="acordeonClases">
    <% foreach (var unidad in CursoDto.Unidades)
        {
            var unidadId = "unidad" + unidad.IdUnidad;%>

    <div class="accordion-item">

        <!-- ENCABEZADO DE ACORDEON: INDICA NUMERO Y NOMBRE DE UNIDAD -->
        <h2 class="accordion-header">
            <button style="font-size: 1.2rem; color: #2980b9" class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#<%:unidadId%>" aria-expanded="true" aria-controls="<%:unidadId %>">
                <%:unidad.Numero%>. <%:unidad.Nombre%>
            </button>
        </h2>

        <!-- CUERPO DEL ACORDEON: INDICA LAS CLASES DE LA UNIDAD-->
        <div id="<%:unidadId%>" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
            <div class="accordion-body">
                <ul class="list-group">

                    <!-- FOREACH DE LISTA PARA CARGAR TODAS LAS CLASES DE LA UNIDAD -->
                    <%  foreach (var clase in ListarClases(unidad.IdUnidad))
                        { %>
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        <div>
                            <%: clase.Numero %>. <%: clase.Descripcion %>
                        </div>

                    </li>
                    <%}%>
                </ul>
            </div>

        </div>
    </div>
    <%}%>
</div>

    </div>


</asp:Content>

