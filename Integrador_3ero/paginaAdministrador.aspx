<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="paginaAdministrador.aspx.cs" Inherits="Integrador_3ero.paginaAdministrador" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Página Administrador</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/StyleSheet1.css" />

    <!-- Incluir el CDN de SweetAlert2fdfdfdf -->
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.5.1/dist/sweetalert2.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.5.1/dist/sweetalert2.all.min.js"></script>



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
                margin-right: 8px; /* Espaciado entre el icono y el texto */
            }

            .cerrar-sesion-btn:hover {
                color: #ff0000; /* Cambia este color según el estilo que desees al pasar el ratón */
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

            .mi-boton:focus, .mi-boton.focus {
                color: #000000;
                background-color: #e0a800;
                border-color: #d39e00;
                box-shadow: 0 0 0 0.2rem rgba(255, 193, 7, 0.5);
            }

            .mi-boton:disabled, .mi-boton.disabled {
                color: #000000;
                background-color: #ffc107;
                border-color: #ffc107;
                opacity: 0.65;
            }

            .mi-boton:not(:disabled):not(.disabled):active, .mi-boton:not(:disabled):not(.disabled).active,
            .show > .mi-boton.dropdown-toggle {
                color: #000000;
                background-color: #d39e00;
                border-color: #c69500;
            }

                .mi-boton:not(:disabled):not(.disabled):active:focus, .mi-boton:not(:disabled):not(.disabled).active:focus,
                .show > .mi-boton.dropdown-toggle:focus {
                    box-shadow: 0 0 0 0.2rem rgba(255, 193, 7, 0.5);
                }



        /*boton de activar*/
        .mi-boton-exito {
            color: #000; /* Color de letra negra */
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
                color: #000; /* Mantener letra negra */
                background-color: #218838;
                border-color: #1e7e34;
            }

            .mi-boton-exito:focus, .mi-boton-exito.focus {
                color: #000; /* Mantener letra negra */
                background-color: #218838;
                border-color: #1e7e34;
                box-shadow: 0 0 0 0.2rem rgba(40, 167, 69, 0.5);
            }

            .mi-boton-exito:disabled, .mi-boton-exito.disabled {
                color: #000; /* Mantener letra negra */
                background-color: #28a745;
                border-color: #28a745;
                opacity: 0.65;
            }

            .mi-boton-exito:not(:disabled):not(.disabled):active, .mi-boton-exito:not(:disabled):not(.disabled).active,
            .show > .mi-boton-exito.dropdown-toggle {
                color: #000; /* Mantener letra negra */
                background-color: #1e7e34;
                border-color: #1c7430;
            }

                .mi-boton-exito:not(:disabled):not(.disabled):active:focus, .mi-boton-exito:not(:disabled):not(.disabled).active:focus,
                .show > .mi-boton-exito.dropdown-toggle:focus {
                    box-shadow: 0 0 0 0.2rem rgba(40, 167, 69, 0.5);
                }



        /*boton de eliminar*/
        .mi-boton-peligro {
            color: #000; /* Color de letra negra */
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
                color: #000; /* Mantener letra negra */
                background-color: #c82333;
                border-color: #bd2130;
            }

            .mi-boton-peligro:focus, .mi-boton-peligro.focus {
                color: #000; /* Mantener letra negra */
                background-color: #c82333;
                border-color: #bd2130;
                box-shadow: 0 0 0 0.2rem rgba(220, 53, 69, 0.5);
            }

            .mi-boton-peligro:disabled, .mi-boton-peligro.disabled {
                color: #000; /* Mantener letra negra */
                background-color: #dc3545;
                border-color: #dc3545;
                opacity: 0.65;
            }

            .mi-boton-peligro:not(:disabled):not(.disabled):active, .mi-boton-peligro:not(:disabled):not(.disabled).active,
            .show > .mi-boton-peligro.dropdown-toggle {
                color: #000; /* Mantener letra negra */
                background-color: #bd2130;
                border-color: #b21f2d;
            }

                .mi-boton-peligro:not(:disabled):not(.disabled):active:focus, .mi-boton-peligro:not(:disabled):not(.disabled).active:focus,
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>




        <header>
            <img src="Imagenes/1.png" alt="Logo"/>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div id="toastDiv" runat="server" class="toast align-items-center text-bg-primary border-0 position-fixed"
                        role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="true" data-bs-delay="2000"
                        style="display: none; z-index: 2000;">
                        <div class="d-flex">
                            <div class="toast-body">
                                <asp:Label ID="lbl_toast_mensaje" runat="server" Text=""></asp:Label>
                            </div>
                            <button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </header>
        <div class="sidebar">
            <h4>Vista General</h4>
            <a href="#" data-target="inicio"><i class="bi bi-house-door-fill icon"></i>Inicio</a>
            <a href="#" data-target="usuarios"><i class="bi bi-people-fill icon"></i>Usuarios</a>
            <a href="#" data-target="Perfiles"><i class="bi bi-person-badge-fill icon"></i>Perfiles de Usuarios</a>
            <a href="#" data-target="Estado"><i class="bi bi-check-circle-fill icon"></i>Estados de Usuarios</a>
            <a href="#" data-target="TiposIncidencias"><i class="bi bi-tags-fill icon"></i>Tipos de Incidencias</a>
            <a href="#" data-target="Equipos"><i class="bi bi-laptop-fill icon"></i>Equipos</a>
            <a href="#" data-target="CategoriasInci"><i class="bi bi-collection-fill icon"></i>Categorias de Incidencias</a>
            <a href="#" data-target="EstadosInci"><i class="bi bi-arrow-repeat icon"></i>Estados de Incidencias</a>
            <a href="#" data-target="Incidencias"><i class="bi bi-exclamation-triangle-fill icon"></i>Incidencias</a>
            <div class="cerrar-sesion-btn-container">
                <i class="bi bi-box-arrow-right icon"></i>
                <asp:Button ID="btnCerrarSesion" runat="server" Text="Cerrar Sesión" CssClass="cerrar-sesion-btn" OnClick="btnCerrarSesion_Click" />
            </div>

        </div>


        <div class="main-content">
            <div id="inicio" class="section" style="display: block;">
                <div class="welcome-banner">
                    <img src="Imagenes/Rectangle 39.jpg" alt="Banner de Bienvenida" class="banner-image" />
                    <asp:Label ID="lblBienvenido" runat="server" CssClass="banner-text" Text="Bienvenido Max"></asp:Label>
                </div>

                <div class="d-flex justify-content-between align-items-start flex-wrap">
                    
                    <!-- Contenedor de las tarjetas principales -->
                    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4" style="max-width: 50%; margin: 0 auto;">
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
                                    <li><i class="bi bi-people"></i>Nuevo Grupo</li>
                                    <li><i class="bi bi-ticket"></i>Nuevo Ticket</li>
                                    <li><i class="bi bi-folder"></i>Nueva categoría</li>
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
                        <div class="card">
                            <div class="card-body">
                                <h5>Mantenimiento del sistema

                                </h5>
                                <asp:Button ID="btn_mantenimiento" runat="server" Text="" CssClass="mi-boton" OnClick="btn_mantenimiento_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="usuarios" class="section" style="display: none;">
                <asp:UpdatePanel ID="UpdatePanelUsuarios" runat="server">
                    <ContentTemplate>


                        <div>
                            <br />
                            <br />
                        </div>
                        <h2 style="text-align: center;">Usuarios</h2>
                        <div class="form-container">
                            <asp:TextBox ID="id_usuario" runat="server" Visible="false"></asp:TextBox>
                            <div class="form-group">
                                <label for="txtNombre">Nombre:</label>
                                <asp:TextBox ID="txtNombre" runat="server" CssClass="text-input" Placeholder="Ingresa tu nombre"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="txtApellido">Apellido:</label>
                                <asp:TextBox ID="txtApellido" runat="server" CssClass="text-input" Placeholder="Ingresa tu apellido"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="txtCorreo">Correo:</label>
                                <asp:TextBox ID="txtCorreo" runat="server" CssClass="text-input" Placeholder="Ingresa tu correo" TextMode="Email"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="txtApellido">Fecha De Nacimiento:</label>
                                <asp:TextBox ID="txtFecha" runat="server" CssClass="text-input" Placeholder="Ingresa tu fecha de nacimiento" TextMode="Date"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="txtCedula">Cédula de Identidad</label>
                                <asp:TextBox ID="txtCedula" runat="server" CssClass="form-control" placeholder="Ingrese su Cedula de Identidad"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="txtContrasenia">Contraseña</label>
                                <asp:TextBox ID="txtContrasenia" runat="server" TextMode="Password" CssClass="form-control" placeholder="Ingrese su contraseña"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="txtContraseniaV">Confirmar Contraseña</label>
                                <asp:TextBox ID="txtContraseniaV" runat="server" TextMode="Password" CssClass="form-control" placeholder="Confirmar contraseña"></asp:TextBox>
                            </div>
                            <div class="mb-3 d-flex justify-content-between align-items-center">
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="chk_ver_contra" onclick="togglePassword();" />
                                    <label class="form-check-label" for="chk_ver_contra">Ver contraseña</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="ddlPerfil">Perfil:</label>
                                <asp:DropDownList ID="ddlPerfil" runat="server" CssClass="dropdown">
                                </asp:DropDownList>
                            </div>
                            <div class="text-center mb-3">
                                <asp:Label ID="lbl_mensaje_usuario" runat="server" CssClass="form-text" ForeColor="Red"></asp:Label>
                            </div>
                            <asp:Button ID="btnEnviar" runat="server" Text="Agregar" CssClass="submit-button" OnClick="btnEnviar_UsuarioClick" />
                            <div class="d-flex justify-content-center">
                                <asp:Button ID="btnLimpiar_usuario" runat="server" Text="Limpiar Selección" CssClass="btn btn-warning" OnClick="btnLimpiar_usuario_Click" Enabled="false" />
                            </div>
                        </div>
                        <asp:GridView ID="gvUsuarios" runat="server" AllowPaging="true" PageSize="4" OnPageIndexChanging="gvUsuarios_PageIndexChanging" AutoGenerateColumns="False"
                            CssClass="table" HeaderStyle-BackColor="#f2f2f2"
                            HeaderStyle-ForeColor="Black" RowStyle-HorizontalAlign="Center" BorderWidth="1px"
                            Width="100%" GridLines="Both" OnRowDataBound="gvUsuarios_RowDataBound">
                            <Columns>

                                <asp:BoundField DataField="usu_id" HeaderText="ID" />


                                <asp:BoundField DataField="usu_nombre" HeaderText="Nombre" />


                                <asp:BoundField DataField="usu_apellido" HeaderText="Apellido" />


                                <asp:BoundField DataField="usu_fecha_nacimiento" HeaderText="Fecha N." />


                                <asp:BoundField DataField="usu_correo" HeaderText="Correo" />


                                <asp:BoundField DataField="estado" HeaderText="Estado" />


                                <asp:BoundField DataField="rol" HeaderText="Rol" />


                                <asp:TemplateField HeaderText="Acciones">
                                    <ItemTemplate>
                                        <asp:Button ID="btnSeleccionar_usuario" runat="server" Text="Editar" CommandName="Editar" CommandArgument='<%# Eval("usu_id") %>' CssClass="mi-boton" OnClick="btnSeleccionar_usuario_Click" />

                                        <asp:Button ID="btnEliminar_usuario" runat="server" Text="Eliminar" CommandName="Eliminar" CommandArgument='<%# Eval("usu_id") %>' CssClass="mi-boton-peligro" OnClick="btnEliminar_usuario_Click1" />

                                        <asp:Button ID="btnActivar_usuario" runat="server" Text="Activar" CommandName="Activar" CommandArgument='<%# Eval("usu_id") %>' CssClass="mi-boton-exito" OnClick="btnActivar_usuario_Click" />

                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div id="Perfiles" class="section" style="display: none;">
                <asp:UpdatePanel ID="UpdatePanelPerfiles" runat="server">
                    <ContentTemplate>


                        <div>
                            <br />
                            <br />
                        </div>
                        <h2 style="text-align: center;">Perfiles de Usuarios</h2>
                        <div class="form-container">
                            <asp:TextBox ID="id_perfil" runat="server" Visible="false"></asp:TextBox>
                            <div class="form-group">
                                <label for="txtNombrePerfil">Nombre:</label>
                                <asp:TextBox ID="txtNombrePerfil" runat="server" CssClass="text-input" Placeholder="Ingresa el nombre del Perfil"></asp:TextBox>
                            </div>
                            <div class="text-center mb-3">
                                <asp:Label ID="lbl_mensajePerfil" runat="server" CssClass="form-text" Text=""></asp:Label>
                            </div>
                            <asp:Button ID="btn_Agregar_Perfil" runat="server" Text="Agregar" CssClass="submit-button" OnClick="btn_Agregar_Perfil_Click" />
                            <div class="d-flex justify-content-center">
                                <asp:Button ID="btnLimpiarPerfil" runat="server" Text="Limpiar Selección" CssClass="btn btn-warning" OnClick="btnLimpiarPerfil_Click" Enabled="false" />
                            </div>
                        </div>
                        <asp:GridView ID="grvPerfiles" runat="server" AutoGenerateColumns="False"
                            CssClass="table" HeaderStyle-BackColor="#f2f2f2"
                            HeaderStyle-ForeColor="Black" RowStyle-HorizontalAlign="Center" BorderWidth="1px"
                            Width="100%" GridLines="Both">
                            <Columns>
                                <asp:BoundField DataField="per_id" HeaderText="ID" />
                                <asp:BoundField DataField="per_nombre" HeaderText="Nombre" />
                                <asp:TemplateField HeaderText="Acciones">
                                    <ItemTemplate>
                                        <asp:Button ID="btnEditarPerfil" runat="server" Text="Editar" CommandName="Editar" CommandArgument='<%# Eval("per_id") %>' CssClass="mi-boton" OnClick="btnEditarPerfil_Click" />
                                        <asp:Button ID="btnEliminarPerfil" runat="server" Text="Eliminar" CommandName="Eliminar" CommandArgument='<%# Eval("per_id") %>' CssClass="mi-boton-peligro" Enabled="false" />

                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div id="Estado" class="section" style="display: none;">
                <asp:UpdatePanel ID="UpdatePanelEstado" runat="server">
                    <ContentTemplate>


                        <div>
                            <br />
                            <br />
                        </div>
                        <h2 style="text-align: center;">Estados de Usuarios</h2>
                        <div class="form-container">
                            <asp:TextBox ID="id_estado" runat="server" Visible="false"></asp:TextBox>
                            <div class="form-group">
                                <label for="txtNombreEstado">Nombre:</label>
                                <asp:TextBox ID="txtNombreEstado" runat="server" CssClass="text-input" Placeholder="Ingresa el nombre del Estado"></asp:TextBox>
                            </div>
                            <div class="text-center mb-3">
                                <asp:Label ID="lbl_mensaje" runat="server" CssClass="form-text" Text=""></asp:Label>
                            </div>
                            <asp:Button ID="btn_agregar_estado_usuario" runat="server" Text="Agregar" CssClass="submit-button" OnClick="btn_agregar_estado_usuario_Click" />
                            <div class="d-flex justify-content-center">
                                <asp:Button ID="btn_limpiarEstado" runat="server" Text="Limpiar Selección" CssClass="btn btn-warning" OnClick="btn_limpiarEstado_Click" Enabled="false" />
                            </div>
                        </div>
                        <asp:GridView ID="grvEstadosUsuarios" runat="server" AutoGenerateColumns="False"
                            CssClass="table" HeaderStyle-BackColor="#f2f2f2"
                            HeaderStyle-ForeColor="Black" RowStyle-HorizontalAlign="Center" BorderWidth="1px"
                            Width="100%" GridLines="Both">
                            <Columns>
                                <asp:BoundField DataField="est_id" HeaderText="ID" />
                                <asp:BoundField DataField="est_nombre" HeaderText="Nombre" />
                                <asp:TemplateField HeaderText="Acciones">
                                    <ItemTemplate>
                                        <asp:Button ID="btnEditarEstado" runat="server" Text="Editar" CommandName="Editar" CommandArgument='<%# Eval("est_id") %>' CssClass="mi-boton" OnClick="btnEditarEstado_Click" />
                                        <asp:Button ID="btnEliminarEstado" runat="server" Text="Eliminar" CommandName="Eliminar" CommandArgument='<%# Eval("est_id") %>' CssClass="mi-boton-peligro" Enabled="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div id="TiposIncidencias" class="section" style="display: none;">
                <asp:UpdatePanel ID="UpdatePanelTiposIncidencias" runat="server">
                    <ContentTemplate>


                        <div>
                            <br />
                            <br />
                        </div>
                        <h2 style="text-align: center;">Tipos de Incidencias</h2>
                        <div class="form-container">
                            <asp:TextBox ID="id_tipo_incidencia" runat="server" Visible="false"></asp:TextBox>
                            <div class="form-group">
                                <label for="txtTipodeIncidencia">Nombre:</label>
                                <asp:TextBox ID="txtTipodeIncidencia" runat="server" CssClass="text-input" Placeholder="Ingresa el nombre del tipo de la incidencia"></asp:TextBox>
                            </div>
                            <div class="text-center mb-3">
                                <asp:Label ID="lbl_mensajeTI" runat="server" CssClass="form-text" Text=""></asp:Label>
                            </div>
                            <asp:Button ID="btn_agregar_tipo_incidencia" runat="server" Text="Agregar" CssClass="submit-button" OnClick="btn_agregar_tipo_incidencia_Click1" />
                            <div class="d-flex justify-content-center">
                                <asp:Button ID="btnLimpiar_tipos_incidencias" runat="server" Text="Limpiar Selección" CssClass="btn btn-warning" OnClick="btnLimpiar_tipos_incidencias_Click" Enabled="false" />
                            </div>
                        </div>
                        <asp:GridView ID="grvTipoIncidencia" runat="server" AutoGenerateColumns="False"
                            CssClass="table" HeaderStyle-BackColor="#f2f2f2"
                            HeaderStyle-ForeColor="Black" RowStyle-HorizontalAlign="Center" BorderWidth="1px"
                            Width="100%" GridLines="Both">
                            <Columns>
                                <asp:BoundField DataField="tip_id" HeaderText="ID" />
                                <asp:BoundField DataField="tip_nombre" HeaderText="Nombre" />
                                <asp:TemplateField HeaderText="Acciones">
                                    <ItemTemplate>
                                        <asp:Button ID="btnEditarTipoIncidencia" runat="server" Text="Editar" CommandName="Editar" CommandArgument='<%# Eval("tip_id") %>' CssClass="mi-boton" OnClick="btnEditarTipoIncidencia_Click" />
                                        <asp:Button ID="btnEliminarTipoIncidencia" runat="server" Text="Eliminar" CommandName="Eliminar" CommandArgument='<%# Eval("tip_id") %>' CssClass="mi-boton-peligro" Enabled="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div id="Equipos" class="section" style="display: none;">
                <asp:UpdatePanel ID="UpdatePanelEquipos" runat="server">
                    <ContentTemplate>


                        <div>
                            <br />
                            <br />
                        </div>
                        <h2 style="text-align: center;">Equipos</h2>
                        <div class="form-container">
                            <asp:TextBox ID="id_equipo" runat="server" Visible="false"></asp:TextBox>
                            <div class="form-group">
                                <label for="txtNombreEquipo">Nombre:</label>
                                <asp:TextBox ID="txtNombreEquipo" runat="server" CssClass="text-input" Placeholder="Ingresa el nombre del equipo"></asp:TextBox>
                            </div>
                            <div class="text-center mb-3">
                                <asp:Label ID="lbl_mensajeE" runat="server" CssClass="form-text" Text=""></asp:Label>
                            </div>
                            <asp:Button ID="btn_agregar_equipo" runat="server" Text="Agregar" CssClass="submit-button" OnClick="btn_agregar_equipo_Click" />
                            <div class="d-flex justify-content-center">
                                <asp:Button ID="btn_limpiar_equipo" runat="server" Text="Limpiar Selección" CssClass="btn btn-warning" OnClick="btn_limpiar_equipo_Click" Enabled="false" />
                            </div>
                        </div>
                        <asp:GridView ID="grvEquipos" runat="server" AutoGenerateColumns="False"
                            CssClass="table" HeaderStyle-BackColor="#f2f2f2"
                            HeaderStyle-ForeColor="Black" RowStyle-HorizontalAlign="Center" BorderWidth="1px"
                            Width="100%" GridLines="Both">
                            <Columns>
                                <asp:BoundField DataField="equ_id" HeaderText="ID" />
                                <asp:BoundField DataField="equ_nombre" HeaderText="Nombre" />
                                <asp:TemplateField HeaderText="Acciones">
                                    <ItemTemplate>
                                        <asp:Button ID="btnEditarEquipo" runat="server" Text="Editar" CommandName="Editar" CommandArgument='<%# Eval("equ_id") %>' CssClass="mi-boton" OnClick="btnEditarEquipo_Click" />
                                        <asp:Button ID="btnEliminarEquipo" runat="server" Text="Eliminar" CommandName="Eliminar" CommandArgument='<%# Eval("equ_id") %>' CssClass="mi-boton-peligro" Enabled="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div id="CategoriasInci" class="section" style="display: none;">
                <asp:UpdatePanel ID="UpdatePanelCategoriasInci" runat="server">
                    <ContentTemplate>


                        <div>
                            <br />
                            <br />
                        </div>
                        <h2 style="text-align: center;">Categorias Incidencias</h2>
                        <div class="form-container">
                            <asp:TextBox ID="id_categoria_inci" runat="server" Visible="false"></asp:TextBox>
                            <div class="form-group">
                                <label for="txtNombreCatInci">Nombre:</label>
                                <asp:TextBox ID="txtNombreCatInci" runat="server" CssClass="text-input" Placeholder="Ingresa el nombre de la categoría"></asp:TextBox>
                            </div>
                            <div class="text-center mb-3">
                                <asp:Label ID="lbl_mensajeCI" runat="server" CssClass="form-text" Text=""></asp:Label>
                            </div>
                            <asp:Button ID="btn_agregar_catInci" runat="server" Text="Agregar" CssClass="submit-button" OnClick="btn_agregar_catInci_Click" />
                            <div class="d-flex justify-content-center">
                                <asp:Button ID="btnLimpiar_categoria_incidencia" runat="server" Text="Limpiar Selección" CssClass="btn btn-warning" OnClick="btnLimpiar_categoria_incidencia_Click" Enabled="false" />
                            </div>
                        </div>
                        <asp:GridView ID="grvCatInci" runat="server" AutoGenerateColumns="False"
                            CssClass="table" HeaderStyle-BackColor="#f2f2f2"
                            HeaderStyle-ForeColor="Black" RowStyle-HorizontalAlign="Center" BorderWidth="1px"
                            Width="100%" GridLines="Both">
                            <Columns>
                                <asp:BoundField DataField="cat_id" HeaderText="ID" />
                                <asp:BoundField DataField="cat_nombre" HeaderText="Nombre" />
                                <asp:TemplateField HeaderText="Acciones">
                                    <ItemTemplate>
                                        <asp:Button ID="btnEditarCatInci" runat="server" Text="Editar" CommandName="Editar" CommandArgument='<%# Eval("cat_id") %>' CssClass="mi-boton" OnClick="btnEditarCatInci_Click" />
                                        <asp:Button ID="btnEliminarCatInci" runat="server" Text="Eliminar" CommandName="Eliminar" CommandArgument='<%# Eval("cat_id") %>' CssClass="mi-boton-peligro" Enabled="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div id="EstadosInci" class="section" style="display: none;">
                <asp:UpdatePanel ID="UpdatePanelEstadosInci" runat="server">
                    <ContentTemplate>


                        <div>
                            <br />
                            <br />
                        </div>
                        <h2 style="text-align: center;">Estados Incidencias</h2>
                        <div class="form-container">
                            <asp:TextBox ID="id_est_inci" runat="server" Visible="false"></asp:TextBox>
                            <div class="form-group">
                                <label for="txtNombreEstInci">Nombre:</label>
                                <asp:TextBox ID="txtNombreEstInci" runat="server" CssClass="text-input" Placeholder="Ingresa el nombre del estado"></asp:TextBox>
                            </div>
                            <div class="text-center mb-3">
                                <asp:Label ID="lbl_mensajeEI" runat="server" CssClass="form-text" Text=""></asp:Label>
                            </div>
                            <asp:Button ID="btn_agregar_estadoInci" runat="server" Text="Agregar" CssClass="submit-button" OnClick="btn_agregar_estadoInci_Click" />
                            <div class="d-flex justify-content-center">
                                <asp:Button ID="btnLimpiar_estados_inci" runat="server" Text="Limpiar Selección" CssClass="btn btn-warning" OnClick="btnLimpiar_estados_inci_Click" Enabled="false" />
                            </div>
                        </div>
                        <asp:GridView ID="grvEstInci" runat="server" AutoGenerateColumns="False"
                            CssClass="table" HeaderStyle-BackColor="#f2f2f2"
                            HeaderStyle-ForeColor="Black" RowStyle-HorizontalAlign="Center" BorderWidth="1px"
                            Width="100%" GridLines="Both">
                            <Columns>
                                <asp:BoundField DataField="esi_id" HeaderText="ID" />
                                <asp:BoundField DataField="esi_nombre" HeaderText="Nombre" />
                                <asp:TemplateField HeaderText="Acciones">
                                    <ItemTemplate>
                                        <asp:Button ID="btnEditarEstInci" runat="server" Text="Editar" CommandName="Editar" CommandArgument='<%# Eval("esi_id") %>' CssClass="mi-boton" OnClick="btnEditarEstInci_Click" />
                                        <asp:Button ID="btnEliminarEstInci" runat="server" Text="Eliminar" CommandName="Eliminar" CommandArgument='<%# Eval("esi_id") %>' CssClass="mi-boton-peligro" Enabled="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>




            <div id="Incidencias" class="section" style="display: none;">
                <asp:UpdatePanel ID="UpdatePanelIncidencias" runat="server">
                    <ContentTemplate>
                        <div>
                            <br />
                            <br />
                        </div>
                        <h2 style="text-align: center;">Incidencias</h2>
                        <!-- Button trigger modal -->
                        <asp:Button ID="btnAgregarInci" runat="server" Text="Agregar nueva Incidencia" CommandName="Agregar" CssClass="mi-boton-exito" OnClick="btnAgregarInci_Click" AutoPostBack="false" Enabled="true" />

                        <!-- Modal Agregar-->
                        <div class="modal fade" id="ModalAgregar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div>
                                <br />
                                <br />
                            </div>
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Nueva Incidencia</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <!-- Aquí puedes poner tu formulario o los campos necesarios -->
                                        <form>
                                            <div class="form-group">
                                                <label for="txtTituloIncidencia" class="col-form-label">Título:</label>
                                                <asp:TextBox ID="txtTituloIncidencia" runat="server" CssClass="form-control" Placeholder="Ingresa el título" />
                                            </div>
                                            <div class="form-group">
                                                <label for="txtDescripcionIncidencia" class="col-form-label">Descripción:</label>
                                                <asp:TextBox ID="txtDescripcionIncidencia" runat="server" CssClass="form-control" TextMode="MultiLine" Placeholder="Describe la incidencia"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="ddlCategoriaIncidencia" class="col-form-label">Categoría:</label>
                                                <asp:DropDownList ID="ddlCategoriaIncidencia" runat="server" CssClass="form-control">
                                                </asp:DropDownList>
                                            </div>
                                            <div class="form-group">
                                                <label for="ddlEquipoIncidencia" class="col-form-label">Equipo:</label>
                                                <asp:DropDownList ID="ddlEquipoIncidencia" runat="server" CssClass="form-control">
                                                </asp:DropDownList>
                                            </div>
                                            <div class="form-group">
                                                <label for="ddlTipoIncidencia" class="col-form-label">Tipo:</label>
                                                <asp:DropDownList ID="ddlTipoIncidencia" runat="server" CssClass="form-control">
                                                </asp:DropDownList>
                                            </div>
                                            <div class="form-group">
                                                <label for="ddlUsuarioIncidencia" class="col-form-label">Usuario:</label>
                                                <asp:DropDownList ID="ddlUsuarioIncidencia" runat="server" CssClass="form-control">
                                                </asp:DropDownList>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                        <asp:Button ID="btnAgregarIncidencia" runat="server" Text="Agregar" CssClass="btn btn-success" OnClick="btnAgregarIncidencia_Click" OnClientClick="closeModalAgregar(); return true;" />
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!-- Modal Asignar -->
                        <div class="modal fade" id="ModalAsignar" tabindex="-1" aria-labelledby="ModalAsignarLabel" aria-hidden="true" data-bs-backdrop="static">
                            <div>
                                <br />
                                <br />
                            </div>
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="ModalAsignarLabel">Asignar Técnico</h5>
                                        <!-- Eliminar el data-bs-dismiss="modal" para que no cierre el modal automáticamente -->
                                        <button type="button" class="btn-close" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <asp:TextBox ID="id_asignar_inci" runat="server" Visible="false"></asp:TextBox>
                                        <asp:Label ID="lbl_nombre_inci_asignar" runat="server" Text="Label"></asp:Label>
                                        <!-- Aquí puedes poner tu formulario o los campos necesarios -->
                                        <div class="form-group">
                                            <label for="ddlTecnicos">Técnicos:</label>
                                            <asp:DropDownList ID="ddlTecnicos" runat="server" CssClass="dropdown">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="text-center mb-3">
                                            <asp:Label ID="lbl_mensaje_incidencia_asignar" runat="server" CssClass="form-text" ForeColor="Red" Text=""></asp:Label>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <!-- Eliminar data-bs-dismiss en el botón cerrar -->
                                        <button type="button" class="btn btn-secondary" onclick="closeModal()">Cerrar</button>
                                        <asp:Button ID="btnAsignarTecnicoIncidencia" runat="server" Text="Asignar" CssClass="mi-boton-exito" OnClick="btnAsignarTecnicoIncidencia_Click" OnClientClick="closeModal(); return true;" />
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!-- Modal Resolver-->
                        <div class="modal fade" id="ModalResolver" tabindex="-1" aria-labelledby="ModalResolver" aria-hidden="true">
                            <div>
                                <br />
                                <br />
                            </div>
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Dar Respuesta Incidencia</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <!-- Aquí puedes poner tu formulario o los campos necesarios -->
                                        <asp:TextBox ID="id_inci_res" runat="server" Visible="false"></asp:TextBox>
                                        <div class="form-group">
                                            <label for="respuesta_incidencia" class="col-form-label">Respuesta:</label>
                                            <asp:TextBox ID="respuesta_incidencia" runat="server" CssClass="form-control" Placeholder="Describe la respuesta de la incidencia"></asp:TextBox>
                                            <asp:TextBox ID="txt1" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                        <asp:Button ID="btnResolverIncidencia" runat="server" Text="Resolver" CssClass="btn btn-success" OnClick="btnResolverIncidencia_Click" OnClientClick="closeModalResolver(); return true;" />
                                    </div>
                                </div>
                            </div>
                        </div>





                        <!-- Incidencias no asignadas -->
                        <h3 style="text-align: left;">Incidencias No Asignadas</h3>
                        <asp:Repeater ID="rptIncidencias" runat="server">
                            <ItemTemplate>
                                <div class="card mb-3" style="max-width: 540px;">
                                    <div class="row g-0">
                                        <div class="col-md-4">
                                            <div class="row g-1">
                                                <div class="col-6">
                                                    <img src="Imagenes/sin_imagen.png" class="img-fluid rounded-start" alt="Imagen de Incidencia 1">
                                                </div>
                                                <div class="col-6">
                                                    <img src="Imagenes/sin_imagen.png" class="img-fluid rounded-start" alt="Imagen de Incidencia 2">
                                                </div>
                                                <div class="col-6">
                                                    <img src="Imagenes/sin_imagen.png" class="img-fluid rounded-start" alt="Imagen de Incidencia 3">
                                                </div>
                                                <div class="col-6">
                                                    <img src="Imagenes/sin_imagen.png" class="img-fluid rounded-start" alt="Imagen de Incidencia 4">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="card-body">
                                                <h1 class="card-title"><%# Eval("inc_titulo") %></h1>
                                                <h5 class="card-text"><%# Eval("inc_descripcion") %></h5>
                                                <p class="card-text"><small class="text-body-secondary"><strong>F. Creación:</strong> <%# Eval("inc_fecha_creacion") %></small></p>
                                                <p class="card-text"><small class="text-body-secondary"><strong>F. Asignación:</strong> <%# Eval("inc_fecha_asignacion") %></small></p>
                                                <p class="card-text"><small class="text-body-secondary"><strong>F. Cierre:</strong> <%# Eval("inc_fecha_cierre") %></small></p>
                                                <asp:Button ID="btnAsignarInci" runat="server" Text="Asignar" CommandArgument='<%# Eval("inc_id") %>' CssClass="mi-boton-exito" OnClick="btnAsignarInci_Click" />
                                                <asp:Button ID="btnEditarInci" runat="server" Text="Editar" CommandName="Editar" CommandArgument='<%# Eval("inc_id") %>' CssClass="mi-boton" />
                                                <asp:Button ID="btnEliminarInci" runat="server" Text="Eliminar" CommandName="Eliminar" CommandArgument='<%# Eval("inc_id") %>' CssClass="mi-boton-peligro" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <!-- Incidencias asignadas -->
                        <h3 style="text-align: left;">Incidencias Asignadas</h3>
                        <asp:Repeater ID="rptIncidenciasAsignadas" runat="server">
                            <ItemTemplate>
                                <div class="card mb-3" style="max-width: 540px;">
                                    <div class="row g-0">
                                        <div class="col-md-4">
                                            <div class="row g-1">
                                                <div class="col-6">
                                                    <img src="Imagenes/sin_imagen.png" class="img-fluid rounded-start" alt="Imagen de Incidencia 1">
                                                </div>
                                                <div class="col-6">
                                                    <img src="Imagenes/sin_imagen.png" class="img-fluid rounded-start" alt="Imagen de Incidencia 2">
                                                </div>
                                                <div class="col-6">
                                                    <img src="Imagenes/sin_imagen.png" class="img-fluid rounded-start" alt="Imagen de Incidencia 3">
                                                </div>
                                                <div class="col-6">
                                                    <img src="Imagenes/sin_imagen.png" class="img-fluid rounded-start" alt="Imagen de Incidencia 4">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="card-body">
                                                <h1 class="card-title"><%# Eval("inc_titulo") %></h1>
                                                <h5 class="card-text"><%# Eval("inc_descripcion") %></h5>
                                                <p class="card-text"><small class="text-body-secondary"><strong>F. Creación:</strong> <%# Eval("inc_fecha_creacion") %></small></p>
                                                <p class="card-text"><small class="text-body-secondary"><strong>F. Asignación:</strong> <%# Eval("inc_fecha_asignacion") %></small></p>
                                                <p class="card-text"><small class="text-body-secondary"><strong>F. Cierre:</strong> <%# Eval("inc_fecha_cierre") %></small></p>
                                                <p class="card-text"><small class="text-body-secondary"><strong>Técnico</strong> <%# Eval("tec_id") %></small></p>
                                                <asp:Button ID="btnResolver" runat="server" Text="Resolver" CommandArgument='<%# Eval("inc_id") %>' CssClass="mi-boton-exito" OnClick="btnResolver_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <!-- Incidencias resueltas -->
                        <h3 style="text-align: left;">Incidencias Resueltas</h3>
                        <asp:Repeater ID="rptIncidenciasResueltas" runat="server">
                            <ItemTemplate>
                                <div class="card mb-3" style="max-width: 540px;">
                                    <div class="row g-0">
                                        <div class="col-md-4">
                                            <div class="row g-1">
                                                <div class="col-6">
                                                    <img src="Imagenes/sin_imagen.png" class="img-fluid rounded-start" alt="Imagen de Incidencia 1">
                                                </div>
                                                <div class="col-6">
                                                    <img src="Imagenes/sin_imagen.png" class="img-fluid rounded-start" alt="Imagen de Incidencia 2">
                                                </div>
                                                <div class="col-6">
                                                    <img src="Imagenes/sin_imagen.png" class="img-fluid rounded-start" alt="Imagen de Incidencia 3">
                                                </div>
                                                <div class="col-6">
                                                    <img src="Imagenes/sin_imagen.png" class="img-fluid rounded-start" alt="Imagen de Incidencia 4">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="card-body">
                                                <h1 class="card-title"><%# Eval("inc_titulo") %></h1>
                                                <h5 class="card-text"><%# Eval("inc_descripcion") %></h5>
                                                <p class="card-text"><small class="text-body-secondary"><strong>F. Creación:</strong> <%# Eval("inc_fecha_creacion") %></small></p>
                                                <p class="card-text"><small class="text-body-secondary"><strong>F. Asignación:</strong> <%# Eval("inc_fecha_asignacion") %></small></p>
                                                <p class="card-text"><small class="text-body-secondary"><strong>F. Cierre:</strong> <%# Eval("inc_fecha_cierre") %></small></p>
                                                <p class="card-text"><small class="text-body-secondary"><strong>Técnico:</strong> <%# Eval("tec_id") %></small></p>
                                                <p class="card-text"><small class="text-body-secondary"><strong>Respuesta:</strong> <%# Eval("inc_respuesta") %></small></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>




                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>





            <!-- 
            <div id="ver" class="section" style="display: none;">
                <div>
                    <br />
                    <br />
                </div>
                <h1>Tickets</h1>
                <div class="filtros">
                    <input type="text" placeholder="🔍 Buscar...">
                    <select>
                        <option value="categoria">Categoría</option>
                        <option value="hardware">Hardware</option>
                        <option value="software">Software</option>
                        <option value="diseno">Diseño Web</option>
                    </select>
                    <select>
                        <option value="fecha">Fecha</option>
                        <option value="reciente">Reciente</option>
                        <option value="antigua">Antigua</option>
                    </select>
                </div>

                <table>
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Categoría</th>
                            <th>Descripción</th>
                            <th>Opciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><span class="icon-info">!</span></td>
                            <td>Hardware</td>
                            <td>Partes físicas o componentes del sistema.</td>
                            <td class="acciones">
                                <i class="ver">👁️</i>
                                <i class="editar">✏️</i>
                                <i class="eliminar">🗑️</i>
                            </td>
                        </tr>
                        <tr>
                            <td><span class="icon-info">!</span></td>
                            <td>Software</td>
                            <td>Componentes lógicos necesarios para el sistema.</td>
                            <td class="acciones">
                                <i class="ver">👁️</i>
                                <i class="editar">✏️</i>
                                <i class="eliminar">🗑️</i>
                            </td>
                        </tr>
                        <tr>
                            <td><span class="icon-info">!</span></td>
                            <td>Diseño Web</td>
                            <td>Planificación, diseño e implementación de sitios web.</td>
                            <td class="acciones">
                                <i class="ver">👁️</i>
                                <i class="editar">✏️</i>
                                <i class="eliminar">🗑️</i>
                            </td>
                        </tr>
                        <tr>
                            <td><span class="icon-info">!</span></td>
                            <td>Aplicación</td>
                            <td>Aplicaciones o sitios web para proyectos específicos.</td>
                            <td class="acciones">
                                <i class="ver">👁️</i>
                                <i class="editar">✏️</i>
                                <i class="eliminar">🗑️</i>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div id="categoria" class="section" style="display: none;">
                <div>
                    <br />
                    <br />
                </div>
                <div class="form-container">
                    <h2>Reportar Incidencias</h2>
                    <form>
                        <div class="form-group">
                            <label for="categoria">Categoría:</label>
                            <select id="categoria" name="categoria">
                                <option value="general">General</option>
                                <option value="critica">Crítica</option>
                                <option value="soporte">Soporte</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="resumen">Resumen:</label>
                            <input type="text" id="resumen" name="resumen" placeholder="Escribe un resumen">
                        </div>
                        <div class="form-group">
                            <label for="descripcion">Descripción:</label>
                            <textarea id="descripcion" name="descripcion" placeholder="Escribe la descripción"></textarea>
                        </div>
                        <div class="buttons">
                            <div class="image-preview"></div>
                            <div>
                                <button type="button" class="select-button">Seleccione</button>
                                <button type="button" class="view-button">Ver</button>
                            </div>
                        </div>
                        <button type="submit" class="submit-button">Enviar</button>
                    </form>
                </div>
            </div>

            <div id="cerrar" class="section" style="display: none;">
                <h2>Cerrar Sesión</h2>
                <p>Gracias por usar el sistema. ¡Hasta luego!</p>
            </div>
-->

        </div>
        <script>
            // Función para reproducir el mensaje de TTS
            const addMessage = (mensaje) => {
                const message = new SpeechSynthesisUtterance(mensaje);
                message.lang = 'es-ES'; // Configura el idioma (español)
                speechSynthesis.speak(message);
            }

            window.addEventListener("load", () => {
                addMessage("Se encuentra en la página de Administrador");
            });

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

                            // Obtiene el nombre de la sección (o cualquier texto relevante)
                            const sectionName = targetSection.getAttribute("data-section-name") || targetSection.id;

                            // Reproduce el mensaje con el nombre de la sección
                            addMessage(`Estás en la sección: ${sectionName}`);
                        } else {
                            alert("Sección no encontrada");
                        }
                    });
                });
            });
        </script>

        <script>
            function togglePassword() {
                // Obtén los elementos de los campos de contraseña
                const passwordField = document.getElementById('<%= txtContrasenia.ClientID %>');
                const confirmPasswordField = document.getElementById('<%= txtContraseniaV.ClientID %>');

                // Alterna el tipo entre "password" y "text"
                if (passwordField.type === "password") {
                    passwordField.type = "text";
                    confirmPasswordField.type = "text";
                } else {
                    passwordField.type = "password";
                    confirmPasswordField.type = "password";
                }
            }
        </script>
        <script type="text/javascript">
            // Función JavaScript para cerrar el modal
            function closeModal() {
                $('#ModalAsignar').modal('hide'); // Cierra el modal
            }



            // Función para cerrar el modal
            function closeModalAgregar() {
                $('#ModalAgregar').modal('hide'); // Cierra el modal
            }

            // Función para cerrar el modal
            function closeModalResolver() {
                $('#ModalResolver').modal('hide'); // Cierra el modal
            }




        </script>

        <script>
            function showToast(type) {
                const toastElement = document.getElementById('<%= toastDiv.ClientID %>');

                // Establecer el color dependiendo del tipo
                if (type === 'success') {
                    toastElement.classList.remove('text-bg-primary');
                    toastElement.classList.add('text-bg-success'); // Color verde
                } else if (type === 'danger') {
                    toastElement.classList.remove('text-bg-primary');
                    toastElement.classList.add('text-bg-danger'); // Color rojo
                }

                // Mostrar el toast
                const toast = new bootstrap.Toast(toastElement);

                // Posicionar el toast en el centro superior con z-index alto
                toastElement.style.visibility = 'visible';
                toastElement.style.position = 'fixed';
                toastElement.style.top = '10px'; // Ajuste para centrar en la parte superior
                toastElement.style.left = '50%';  // Centrado horizontalmente
                toastElement.style.transform = 'translateX(-50%)';  // Centrado con respecto al 50%
                toastElement.style.zIndex = '1050'; // Asegura que el toast se muestre encima de otros elementos
                toastElement.style.display = 'block'; // Mostrar el toast
                toast.show(); // Mostrar el toast

                // Cerrar manualmente después de 2 segundos
                setTimeout(() => {
                    toast.hide();  // Ocultar el toast
                    toastElement.style.visibility = 'hidden';  // Ocultarlo visualmente
                    toastElement.style.position = 'absolute';  // Cambiar la posición para que no bloquee la UI
                    toastElement.style.display = 'none';  // Asegurarnos de que no ocupe espacio
                }, 3000);
            }
        </script>





        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>


        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />

        <!-- Bootstrap JS y Popper.js -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

    </form>
</body>
</html>
