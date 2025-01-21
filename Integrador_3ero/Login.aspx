<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Integrador_3ero.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Inicio de Sesión</title>
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
        <header class="d-flex justify-content-between align-items-center">
            <img src="Imagenes/Component 8.png" alt="Logo">
            <nav>
                <ul>
                    <li>
                        <asp:HyperLink ID="lnk_inicios" runat="server" NavigateUrl="~/Home.aspx" CssClass="custom-link">Inicio</asp:HyperLink></li>
                    <li>
                        <asp:Button ID="btn_registrar" runat="server" Text="Registrarse" CssClass="btn custom-danger" OnClick="btn_registrar_Click" />
                    </li>
                </ul>
            </nav>
        </header>
        <main class="container-fluid d-flex justify-content-center align-items-center" style="height: 80vh; background-image: url('Imagenes/1656014482777.jpg'); background-size: cover; background-position: center; background-color: rgba(0, 0, 0, 0.5); background-blend-mode: darken;">
            <div class="p-4" style="background-color: rgba(255, 255, 255, 0.8); border-radius: 10px; width: 400px;">
                <h2 class="text-center mb-4" style="color: #1B565A;">Iniciar Sesión</h2>
                <!-- Todos los inputs convertidos en asp:TextBox -->
                <div class="mb-3">
                    <label for="txtCorreo" class="form-label">Correo</label>
                    <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control" placeholder="Ingrese su correo"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="txtContrasenia" class="form-label">Contraseña</label>
                    <asp:TextBox ID="txtContrasenia" runat="server" TextMode="Password" CssClass="form-control" placeholder="Ingrese su contraseña"></asp:TextBox>
                </div>
                <div class="mb-3 d-flex justify-content-between align-items-center">
                    <!-- Checkbox para ver contraseña -->
                    <div class="form-check">
                        <input
                            type="checkbox"
                            class="form-check-input"
                            id="chk_ver_contra"
                            onclick="togglePassword();" />
                        <label class="form-check-label" for="chk_ver_contra">Ver contraseña</label>
                    </div>
                    <!-- Link para olvidaste tu contraseña -->
                    <div>
                        <asp:HyperLink ID="lnkForgotPassword" runat="server" NavigateUrl="~/RecuperarContrasenia.aspx" CssClass="custom-link">¿Olvidaste tu contraseña?</asp:HyperLink>
                    </div>
                </div>
                <div class="mb-3 text-center">
                    <span class="class="remaining-attempts">Intentos restantes: </span>
                    <asp:Label ID="lbl_intentos" runat="server" CssClass="fw-bold text-danger" Text=""></asp:Label>
                </div>
                <div class="text-center mb-3">
                    <asp:Label ID="lbl_mensaje" runat="server" CssClass="form-text" ForeColor="Red"></asp:Label>
                </div>
                <div class="d-grid gap-2">
                    <asp:Button ID="btnIniciarSesion" runat="server" Text="Iniciar Sesión" CssClass="btn custom-danger" OnClick="btnIniciarSesion_Click" />
                    <asp:Button ID="btnRegistrarse" runat="server" Text="Registrarse" CssClass="btn custom-danger" OnClick="btn_registrar_Click" />
                </div>
            </div>
        </main>
        <footer class="text-white py-4">
            <div class="container">
                <div class="decorative-line">
                    <div class="dot"></div>
                    <div class="line"></div>
                </div>
                <div class="social-media text-center mt-3">
                    <a href="#">
                        <img src="Imagenes/stash_social-facebook-light.png" alt="Facebook"></a>
                    <a href="#">
                        <img src="Imagenes/ion_social-whatsapp.png" alt="WhatsApp"></a>
                    <a href="#">
                        <img src="Imagenes/simple-line-icons_social-instagram.png" alt="Instagram"></a>
                </div>
                <p class="text-center">&copy; 2024 Gear Solutions</p>
            </div>
        </footer>
    </form>
    <script>
        function togglePassword() {
            // Obtén los elementos de los campos de contraseña
            const txtContrasenia = document.getElementById('<%= txtContrasenia.ClientID %>');

            // Verifica si el tipo es "password" y alterna a "text" o viceversa
            if (txtContrasenia.type === "password") {
                txtContrasenia.type = "text";
            } else {
                txtContrasenia.type = "password";
            }
        }
    </script>
    <script>
        // Función para reproducir el mensaje de TTS
        const addMessage = () => {
            const message = new SpeechSynthesisUtterance("Se encuentra en la pagina de Iniciar Sesion.");
            message.lang = 'es-ES'; // Configura el idioma (español)
            speechSynthesis.speak(message);
        }

        // Ejecuta la función cuando la página termina de cargar
        window.addEventListener("load", () => addMessage());
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
