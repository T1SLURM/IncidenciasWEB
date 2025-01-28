<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="paginaTecnico.aspx.cs" Inherits="Integrador_3ero.paginaTecnico" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Página Técnico</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet"/>
    <link rel="stylesheet" href="css/StyleSheet1.css"/>
    <style>
        .cerrar-sesion-btn {
            margin-top: auto;
            display: inline-flex;
            align-items: center;
            color: inherit;
            text-decoration: none;
            background: none;
            border: none;
            font-size: inherit;
            cursor: pointer;
        }

            .cerrar-sesion-btn i {
                margin-right: 8px;
                /* Espaciado entre el icono y el texto */
            }

            .cerrar-sesion-btn:hover {
                color: #ff0000;
                /* Cambia este color según el estilo que desees al pasar el ratón */
            }



        /*boton de editar*/
        .mi-boton {
            color: #000000;
            background-color: #ffc107;
            border-color: #ffc107;
            display: inline-block;
            font-weight: 400;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            user-select: none;
            border: 1px solid transparent;
            padding: 0.375rem 0.75rem;
            font-size: 1rem;
            line-height: 1.5;
            border-radius: 0.375rem;
            transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        }

            .mi-boton:hover {
                color: #000000;
                background-color: #e0a800;
                border-color: #d39e00;
            }

            .mi-boton:focus,
            .mi-boton.focus {
                color: #000000;
                background-color: #e0a800;
                border-color: #d39e00;
                box-shadow: 0 0 0 0.2rem rgba(255, 193, 7, 0.5);
            }

            .mi-boton:disabled,
            .mi-boton.disabled {
                color: #000000;
                background-color: #ffc107;
                border-color: #ffc107;
                opacity: 0.65;
            }

            .mi-boton:not(:disabled):not(.disabled):active,
            .mi-boton:not(:disabled):not(.disabled).active,
            .show > .mi-boton.dropdown-toggle {
                color: #000000;
                background-color: #d39e00;
                border-color: #c69500;
            }

                .mi-boton:not(:disabled):not(.disabled):active:focus,
                .mi-boton:not(:disabled):not(.disabled).active:focus,
                .show > .mi-boton.dropdown-toggle:focus {
                    box-shadow: 0 0 0 0.2rem rgba(255, 193, 7, 0.5);
                }



        /*boton de activar*/
        .mi-boton-exito {
            color: #000;
            /* Color de letra negra */
            background-color: #28a745;
            border-color: #28a745;
            display: inline-block;
            font-weight: 400;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            user-select: none;
            border: 1px solid transparent;
            padding: 0.375rem 0.75rem;
            font-size: 1rem;
            line-height: 1.5;
            border-radius: 0.375rem;
            transition: background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        }

            .mi-boton-exito:hover {
                color: #000;
                /* Mantener letra negra */
                background-color: #218838;
                border-color: #1e7e34;
            }

            .mi-boton-exito:focus,
            .mi-boton-exito.focus {
                color: #000;
                /* Mantener letra negra */
                background-color: #218838;
                border-color: #1e7e34;
                box-shadow: 0 0 0 0.2rem rgba(40, 167, 69, 0.5);
            }

            .mi-boton-exito:disabled,
            .mi-boton-exito.disabled {
                color: #000;
                /* Mantener letra negra */
                background-color: #28a745;
                border-color: #28a745;
                opacity: 0.65;
            }

            .mi-boton-exito:not(:disabled):not(.disabled):active,
            .mi-boton-exito:not(:disabled):not(.disabled).active,
            .show > .mi-boton-exito.dropdown-toggle {
                color: #000;
                /* Mantener letra negra */
                background-color: #1e7e34;
                border-color: #1c7430;
            }

                .mi-boton-exito:not(:disabled):not(.disabled):active:focus,
                .mi-boton-exito:not(:disabled):not(.disabled).active:focus,
                .show > .mi-boton-exito.dropdown-toggle:focus {
                    box-shadow: 0 0 0 0.2rem rgba(40, 167, 69, 0.5);
                }



        /*boton de eliminar*/
        .mi-boton-peligro {
            color: #000;
            /* Color de letra negra */
            background-color: #dc3545;
            border-color: #dc3545;
            display: inline-block;
            font-weight: 400;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            user-select: none;
            border: 1px solid transparent;
            padding: 0.375rem 0.75rem;
            font-size: 1rem;
            line-height: 1.5;
            border-radius: 0.375rem;
            transition: background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        }

            .mi-boton-peligro:hover {
                color: #000;
                /* Mantener letra negra */
                background-color: #c82333;
                border-color: #bd2130;
            }

            .mi-boton-peligro:focus,
            .mi-boton-peligro.focus {
                color: #000;
                /* Mantener letra negra */
                background-color: #c82333;
                border-color: #bd2130;
                box-shadow: 0 0 0 0.2rem rgba(220, 53, 69, 0.5);
            }

            .mi-boton-peligro:disabled,
            .mi-boton-peligro.disabled {
                color: #000;
                /* Mantener letra negra */
                background-color: #dc3545;
                border-color: #dc3545;
                opacity: 0.65;
            }

            .mi-boton-peligro:not(:disabled):not(.disabled):active,
            .mi-boton-peligro:not(:disabled):not(.disabled).active,
            .show > .mi-boton-peligro.dropdown-toggle {
                color: #000;
                /* Mantener letra negra */
                background-color: #bd2130;
                border-color: #b21f2d;
            }

                .mi-boton-peligro:not(:disabled):not(.disabled):active:focus,
                .mi-boton-peligro:not(:disabled):not(.disabled).active:focus,
                .show > .mi-boton-peligro.dropdown-toggle:focus {
                    box-shadow: 0 0 0 0.2rem rgba(220, 53, 69, 0.5);
                }



        /*carta incidencias*/
        .card {
            margin: 10px auto;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            font-size: 0.9rem;
        }

        .card-title {
            font-size: 2rem;
            font-weight: bold;
        }

        .card-text {
            font-size: 1.2rem;
            margin: 5px 0;
        }

        .card img {
            border-radius: 5px;
            object-fit: cover;
            height: 100px;
            width: 100%;
        }

        .text-body-secondary {
            color: #6c757d;
            font-size: 0.85rem;
        }

        /*header user info*/
        .userinfo {
            /* Añade tus propiedades de estilo aquí */
            color: #ffff;
            position: absolute;
            top: 10px;
            /* Ajusta este valor según sea necesario */
            right: 10px;
            /* Ajusta este valor según sea necesario */
            background-color: #1B4159;
            padding: 8px;
            border-radius: 5px;
        }


        /*editar perfilestilos*/
        .perfil-container {
            max-width: 500px;
            margin: auto;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
        }

        .perfil-header {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
            text-align: left;
        }

        .perfil-divider {
            border: none;
            border-top: 1px solid black;
            margin: 10px 0 20px;
        }

        .perfil-form {
            background-color: #007baf;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
            color: white;
        }

            .perfil-form .perfil-group {
                margin-bottom: 15px;
            }

            .perfil-form label {
                display: block;
                font-size: 14px;
                margin-bottom: 5px;
            }

            .perfil-form input {
                width: 100%;
                padding: 10px;
                border-radius: 5px;
                border: none;
                font-size: 14px;
                box-shadow: inset 1px 1px 5px rgba(0, 0, 0, 0.2);
            }

                .perfil-form input[readonly] {
                    background-color: #e0e0e0;
                }

        .perfil-btn-update {
            display: block;
            width: 100%;
            padding: 10px;
            font-size: 16px;
            font-weight: bold;
            color: white;
            background-color: #004766;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
            margin-top: 10px;
            transition: background-color 0.3s;
        }

            .perfil-btn-update:hover {
                background-color: #003647;
            }

        /*solucionar estilos*/
        .solucion-container {
            max-width: 500px;
            margin: auto;
            background-color: #007baf;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
            color: white;
        }

        .solucion-header {
            font-size: 20px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }

        .solucion-group {
            margin-bottom: 15px;
        }

            .solucion-group label {
                display: block;
                font-size: 14px;
                margin-bottom: 5px;
            }

            .solucion-group input,
            .solucion-group textarea {
                width: 100%;
                padding: 10px;
                border-radius: 5px;
                border: none;
                font-size: 14px;
                color: black;
                box-shadow: inset 1px 1px 5px rgba(0, 0, 0, 0.2);
            }

                .solucion-group input[type="date"] {
                    background-color: white;
                }

        .solucion-btn-update {
            display: block;
            width: 100%;
            padding: 10px;
            font-size: 16px;
            font-weight: bold;
            color: white;
            background-color: #004766;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
            margin-top: 10px;
            transition: background-color 0.3s;
        }

            .solucion-btn-update:hover {
                background-color: #003647;
            }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server"></asp:UpdatePanel>
        <contenttemplate>


            <header>
                <img src="Imagenes/1.png" alt="Logo"/>
                <div class="userinfo">
                    <i class="bi bi-person-circle"></i>
                    <span>Juan</span>
                </div>
            </header>
            <div class="sidebar">
                <h4>Vista General</h4>
                <a href="#" data-target="inicio"><i class="bi bi-house-door-fill icon"></i>Inicio</a>
                <a href="#" data-target="perfil"><i class="bi bi-person-badge-fill icon"></i>Perfil</a>
                <a href="#" data-target="editar perfil"><i class="bi bi-pen"></i>
                    </i>Editar mi
                        perfil</a>
                <a href="#" data-target="tickets"><i class="bi bi-tags-fill icon"></i>Tickets</a>
                <a href="#" data-target="Solucionar"><i class="bi bi-tools"></i>
                    </i>Solucionar tickets</a>
                <div class="cerrar-sesion-btn-container">
                    <i class="bi bi-box-arrow-right icon"></i>
                    <asp:Button ID="btnCerrarSesion" runat="server" Text="Cerrar Sesión"
                        CssClass="cerrar-sesion-btn" OnClick="btnCerrarSesion_Click" />
                </div>

            </div>


            <div class="main-content">
                <div id="inicio" class="section" style="display: block;">
                    <div class="welcome-banner">
                        <img src="Imagenes/Rectangle 39.jpg" alt="Banner de Bienvenida" class="banner-image"/>
                        <asp:Label ID="lblBienvenido" runat="server" CssClass="banner-text" Text="Bienvenido Max">
                        </asp:Label>
                    </div>

                    <div class="d-flex justify-content-between align-items-start flex-wrap">
                        <!-- Contenedor de las tarjetas principales -->
                        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4"
                            style="max-width: 50%; margin: 0 auto;">
                            <div class="col">
                                <div class="card yellow">
                                    <div class="card-body">
                                        <i class="bi bi-file-earmark-plus"></i>
                                        <h6>Registro</h6>
                                        <p>
                                            <asp:Label ID="lbl_inc_registradas" runat="server" Text=""></asp:Label>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="card cyan">
                                    <div class="card-body">
                                        <i class="bi bi-person-check"></i>
                                        <h6>Asignados</h6>
                                        <p>
                                            <asp:Label ID="lbl_inc_asignadas" runat="server" Text=""></asp:Label>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="card blue">
                                    <div class="card-body">
                                        <i class="bi bi-gear"></i>
                                        <h6>En Proceso</h6>
                                        <p>
                                            <asp:Label ID="lbl_inc_proceso" runat="server" Text=""></asp:Label>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="card green">
                                    <div class="card-body">
                                        <i class="bi bi-clipboard-check icon"></i>
                                        <h6>Finalizados</h6>
                                        <p>
                                            <asp:Label ID="lbl_inc_finalizadas" runat="server" Text=""></asp:Label>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!-- Contenedor de las tarjetas secundarias -->
                        <div class="derecha">
                            <!-- Acceso Directo -->
                            <div class="card">
                                <div class="card-body">
                                    <h5>Acceso Directo</h5>
                                    <ul>
                                        <li><i class="bi bi-ticket"></i>Ver tickets</li>
                                        <li><i class="bi bi-tools"></i>Solucionar Ticket</li>

                                    </ul>
                                </div>
                            </div>
                            <!-- Ticket Recientes -->
                            <div class="card">
                                <div class="card-body">
                                    <h5>Ticket Recientes</h5>
                                    <ul>
                                        <li><i class="bi bi-chat"></i>Problemas con Figma</li>
                                        <li><i class="bi bi-chat-dots"></i>Problemas con Visual</li>
                                    </ul>
                                </div>
                            </div>
                            <!-- Mantenimiento del sistema -->

                        </div>
                    </div>
                </div>

                <div id="perfil" class="section" style="display: none;">
                    <div>
                        <br />
                        <br />
                    </div>
                    <div class="perfil-container">
                        <div class="perfil-header">Mi Perfil</div>
                        <hr class="perfil-divider" />
                        <div class="perfil-info">
                            <div class="info">
                                <p><strong>Nombre:</strong> Kevin</p>
                                <p><strong>Correo:</strong> Kevin@gmail.com</p>
                                <p><strong>Cédula:</strong> 178*******7</p>
                                <p><strong>Teléfono:</strong> 0962724834</p>
                                <p><strong>Contraseña:</strong> ********************</p>
                            </div>
                            <div class="profile-picture">
                                <img src="https://via.placeholder.com/100" alt="Foto de perfil"/>
                            </div>
                        </div>
                        <div class="perfil-button">
                            <asp:Button ID="btnEditar" runat="server" Text="Editar" OnClick="btnEditar_Click" />
                        </div>
                    </div>


                </div>

                <div id="editar perfil" class="section" style="display: none;">
                    <div>
                        <br />
                        <br />
                    </div>
                    <div class="perfil-container">
                        <div class="perfil-header">Editar mi perfil</div>
                        <hr class="perfil-divider" />
                        <div class="perfil-form">
                            <div class="perfil-group">
                                <label for="txtNombre">Nombre:</label>
                                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" Text="Kevin"
                                    ReadOnly="true"></asp:TextBox>
                            </div>
                            <div class="perfil-group">
                                <label for="txtCorreo">Correo:</label>
                                <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control"
                                    Text="Kevin@gmail.com" ReadOnly="true"></asp:TextBox>
                            </div>
                            <div class="perfil-group">
                                <label for="txtCedula">Cédula:</label>
                                <asp:TextBox ID="txtCedula" runat="server" CssClass="form-control"
                                    Text="178*******7" ReadOnly="true"></asp:TextBox>
                            </div>
                            <div class="perfil-group">
                                <label for="txtTelefono">Teléfono:</label>
                                <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control"
                                    Text="0962724834"></asp:TextBox>
                            </div>
                            <div class="perfil-group">
                                <label for="txtContrasena1">Contraseña:</label>
                                <asp:TextBox ID="txtContrasena1" runat="server" CssClass="form-control"
                                    TextMode="Password" Text="********"></asp:TextBox>
                            </div>
                            <div class="perfil-group">
                                <label for="txtContrasena2">Contraseña:</label>
                                <asp:TextBox ID="txtContrasena2" runat="server" CssClass="form-control"
                                    TextMode="Password" Text="********"></asp:TextBox>
                            </div>
                            <asp:Button ID="btnActualizar" runat="server" CssClass="perfil-btn-update"
                                Text="Actualizar" OnClick="btnActualizar_Click" />
                        </div>
                    </div>
                </div>

                <div id="tickets" class="section" style="display: none;">
                </div>

                <div id="Solucionar" class="section" style="display: none;">
                    <div>
                        <br />
                        <br />
                    </div>
                    <div class="solucion-container">
                        <div class="solucion-header">Nueva solución</div>
                        <div class="solucion-group">
                            <label for="txtTitulo">Título:</label>
                            <asp:TextBox ID="txtTitulo" runat="server" CssClass="form-control"
                                Text="Problemas de Acceso"></asp:TextBox>
                        </div>
                        <div class="solucion-group">
                            <label for="txtSolucion">Solución:</label>
                            <asp:TextBox ID="txtSolucion" runat="server" CssClass="form-control"
                                TextMode="MultiLine" Rows="3" Text="No funciona acceder a la plataforma">
                            </asp:TextBox>
                        </div>
                        <div class="solucion-group">
                            <label for="txtFecha">Fecha de solución:</label>
                            <asp:TextBox ID="txtFecha" runat="server" CssClass="form-control" TextMode="Date">
                            </asp:TextBox>
                        </div>
                        <asp:Button ID="Button1" runat="server" CssClass="solucion-btn-update"
                            Text="Actualizar" OnClick="Button1_Click"/>
                    </div>
                </div>

                <div id="cerrar" class="section" style="display: none;">
                    <h2>Cerrar Sesión</h2>
                    <p>Gracias por usar el sistema. ¡Hasta luego!</p>
                </div>

            </div>
            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    const links = document.querySelectorAll(".sidebar a");
                    const sections = document.querySelectorAll(".section");

                    links.forEach(link => {
                        link.addEventListener("click", function (e) {
                            e.preventDefault();

                            // Obtiene el atributo data-target para identificar la sección
                            const target = this.getAttribute("data-target");

                            // Oculta todas las secciones
                            sections.forEach(section => {
                                section.style.display = "none";
                            });

                            // Muestra la sección seleccionada
                            const targetSection = document.getElementById(target);
                            if (targetSection) {
                                targetSection.style.display = "block";
                            } else {
                                alert("Sección no encontrada");
                            }
                        });
                    });
                });

            </script>
        </contenttemplate>

    </form>
</body>

</html>
