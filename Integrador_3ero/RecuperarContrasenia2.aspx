﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecuperarContrasenia2.aspx.cs" Inherits="Integrador_3ero.RecuperarContrasenia2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Recuperar Contraseña</title>
    <style>
        body {
            background-color: #1B565A;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        section {
            margin-bottom: 40px;
        }

        header {
            background-color: #1B565A;
            color: white;
            display: flex;
            justify-content: space-between;
            padding: 10px 20px;
            overflow: hidden;
            height: 10vh;
        }

            header .logo {
                font-size: 24px;
            }

        nav ul {
            display: flex;
            list-style: none;
            margin: 0;
            padding: 0;
        }

            nav ul li {
                margin-right: 20px;
                display: flex; /* Activa flexbox para alinear hijos */
                align-items: center; /* Centra el contenido del <li> verticalmente */
            }

        header nav ul li a {
            color: white; /* Color normal de los enlaces */
            text-decoration: none; /* Sin subrayado */
            transition: color 0.3s ease; /* Animación suave para el cambio de color */
            align-items: center;
        }

            header nav ul li a:hover {
                color: #1410EF; /* Color deseado al hacer hover (ejemplo: dorado) */
                text-decoration: underline; /* Subrayado opcional */
            }

        header img {
            width: 5rem; /* Asegura que la imagen ocupe todo el ancho del header */
            height: 5rem; /* Asegura que la imagen ocupe toda la altura del header */
            object-fit: cover; /* Ajusta la imagen sin deformarla */
            object-position: center; /* Centra la imagen en caso de que no llene perfectamente */
        }

        main {
            padding: 20px;
            height: 656px;
        }

        footer {
            background-color: #1B565A;
            color: white;
            padding: 20px;
        }

        .social-media {
            display: flex;
            justify-content: center;
            margin: 20px 0;
        }

            .social-media a {
                margin-right: 10px;
            }

            .social-media img {
                height: 24px;
                width: 24px;
            }

        footer p {
            text-align: center;
            margin: 0;
        }

        .decorative-line {
            display: flex;
            align-items: center;
        }

            .decorative-line .line {
                flex-grow: 1; /* La línea ocupa todo el espacio disponible */
                height: 2px; /* Grosor de la línea */
                background-color: #DF4D0F; /* Color de la línea */
            }

        /* Personalización del botón */
        .btn.custom-danger {
            background-color: #1B4159; /* Color de fondo personalizado */
            border-color: #1B4159; /* Color del borde */
            color: white; /* Color del texto */
        }

            /* Estilo al pasar el mouse */
            .btn.custom-danger:hover {
                background-color: #3D7598; /* Color de fondo al hacer hover */
                border-color: #1B4159; /* Color del borde al hacer hover */
                color: white; /* Asegura que el texto sea visible */
            }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <header class="d-flex justify-content-between align-items-center">
                    <img src="Imagenes/eqweqwe 1.png" alt="Logo" style="width: 110px; height: auto;">
                    <nav>
                        <ul>
                            <li>
                                <asp:HyperLink ID="lnk_inicios" runat="server" NavigateUrl="~/Home.aspx" CssClass="custom-link">Inicio</asp:HyperLink>
                            </li>
                            <li>
                                <asp:Button ID="btn_iniciarSesion" runat="server" Text="Inicio de Sesión" CssClass="btn custom-danger" OnClick="btn_iniciarSesion_Click" />
                            </li>
                            <li>
                                <asp:Button ID="btn_registrar" runat="server" Text="Registrarse" CssClass="btn custom-danger" OnClick="btn_registrar_Click" />
                            </li>
                        </ul>
                    </nav>
                </header>
                <main class="d-flex justify-content-center align-items-center flex-grow-1" style="background-image: url('Imagenes/1656014482777.jpg'); background-size: cover; background-position: center; background-color: rgba(0, 0, 0, 0.5); background-blend-mode: darken;">
                    <div class="p-4" style="background-color: rgba(255, 255, 255, 0.8); border-radius: 10px; width: 400px;">
                        <h2 class="text-center mb-4" style="color: #1B565A;">Recuperar Contraseña</h2>
                        <div class="mb-3">
                            <label for="txtCodigo" class="form-label">Código</label>
                            <asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control" placeholder="Ingrese el Código"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label for="txtContrasenia" class="form-label">Contraseña</label>
                            <asp:TextBox ID="txtContrasenia" runat="server" TextMode="Password" CssClass="form-control" placeholder="Ingrese su contraseña"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label for="txtContraseniaV" class="form-label">Confirmar Contraseña</label>
                            <asp:TextBox ID="txtContraseniaV" runat="server" TextMode="Password" CssClass="form-control" placeholder="Confirmar contraseña"></asp:TextBox>
                        </div>
                        <div class="mb-3 d-flex justify-content-between align-items-center">
                            <div class="form-check">
                                <input type="checkbox" class="form-check-input" id="chk_ver_contra" onclick="togglePassword();" />
                                <label class="form-check-label" for="chk_ver_contra">Ver contraseña</label>
                            </div>
                        </div>
                        <div class="text-center mb-3">
                            <asp:Label ID="lbl_mensaje" runat="server" CssClass="form-text" Text=""></asp:Label>
                        </div>
                        <div class="d-grid gap-2">
                            <asp:Button ID="btn_cambiar_pass" runat="server" Text="Cambiar Contraseña" CssClass="btn custom-danger" OnClick="btn_cambiar_pass_Click" />
                        </div>
                        <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="3000" Enabled="false" />
                    </div>
                </main>

            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
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
    <script>
        // Función para reproducir el mensaje de TTS
        const addMessage = () => {
            const message = new SpeechSynthesisUtterance("Se encuentra en la pagina de Cambiar su contraseña");
            message.lang = 'es-ES'; // Configura el idioma (español)
            speechSynthesis.speak(message);
        }

        // Ejecuta la función cuando la página termina de cargar
        window.addEventListener("load", () => addMessage());
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
