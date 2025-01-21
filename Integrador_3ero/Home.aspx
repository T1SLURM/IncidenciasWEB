<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Integrador_3ero.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Gear Solutions</title>
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
            justify-content: space-between; /* Separa el logo y la barra de navegación */
            align-items: center;
            padding: 10px 20px;
            height: 10vh;
        }

            header .logo-container {
                display: flex;
                justify-content: flex-start;
            }

        nav {
            display: flex; /* Flexbox para alinear los elementos dentro de la barra de navegación */
            justify-content: space-between; /* Alinea los enlaces a la izquierda y los botones a la derecha */
            width: 100%; /* Asegura que la barra de navegación ocupe todo el ancho */
        }

            nav ul {
                display: flex;
                list-style: none;
                margin: 0;
                padding: 0;
                width: 100%; /* Asegura que la lista ocupe todo el ancho */
                justify-content: flex-start; /* Alinea los elementos a los extremos */
            }

                nav ul li {
                    margin-left: 20px;
                    display: flex;
                    align-items: center;
                }

        header nav ul li a,
        header nav ul li .btn {
            color: white;
            text-decoration: none;
            transition: color 0.3s ease;
        }

            header nav ul li a:hover,
            header nav ul li .btn:hover {
                color: #1410EF;
                text-decoration: underline;
            }

        header img {
            width: 5rem;
            height: 5rem;
            object-fit: cover;
            object-position: center;
        }

        #boton_inicio{
            padding-left: 48%;
        }


        main {
            padding: 20px;
        }

        .intro, .services, .performance {
            margin-bottom: 40px;
        }

            .intro img, .performance img {
                max-width: 100%;
            }

        .service-icons {
            display: flex;
            justify-content: space-between;
        }

            .service-icons .service {
                text-align: center;
            }

        footer {
            background-color: #1B565A;
            color: white;
            padding: 20px;
        }

        .footer-links {
            display: flex;
            justify-content: space-between;
        }

            .footer-links div {
                margin-right: 20px;
            }

            .footer-links h3 {
                margin-top: 0;
            }

            .footer-links ul {
                list-style: none;
                margin: 0;
                padding: 0;
            }

                .footer-links ul li {
                    margin-bottom: 10px;
                }

                    .footer-links ul li a {
                        color: white;
                        text-decoration: none;
                    }

        .faq a {
            color: white; /* Color normal de los enlaces */
            text-decoration: none; /* Sin subrayado */
            transition: color 0.3s ease; /* Animación suave */
        }

            .faq a:hover {
                color: #1410EF; /* Color deseado al hacer hover */
                text-decoration: underline; /* Subrayado opcional */
            }

        .company a {
            color: white; /* Color normal de los enlaces */
            text-decoration: none; /* Sin subrayado */
            transition: color 0.3s ease; /* Animación suave */
        }

            .company a:hover {
                color: #1410EF; /* Color deseado al hacer hover */
                text-decoration: underline; /* Subrayado opcional */
            }

        .support a {
            color: white; /* Color normal de los enlaces */
            text-decoration: none; /* Sin subrayado */
            transition: color 0.3s ease; /* Animación suave */
        }

            .support a:hover {
                color: #1410EF; /* Color deseado al hacer hover */
                text-decoration: underline; /* Subrayado opcional */
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

        .performance {
            position: relative;
            text-align: center;
            color: white;
        }

        .image-container {
            position: relative;
            display: inline-block;
        }

            .image-container img {
                width: 100%; /* Ajusta el tamaño al contenedor */
                height: auto;
            }

            .image-container h2 {
                position: absolute;
                top: 50%; /* Centrado vertical */
                left: 50%; /* Centrado horizontal */
                transform: translate(-50%, -50%); /* Ajuste exacto para centrar */
                background-color: rgba(0, 0, 0, 0.5); /* Fondo semitransparente */
                padding: 10px 20px;
                border-radius: 8px;
                font-size: 1.5rem;
            }

        .auto-style1 {
            left: 54%;
            top: 36700%;
            width: 502px;
        }

        .why-choose-us {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 2rem;
            background-color: #0F3437;
            color: white;
        }

            .why-choose-us .content {
                flex: 1;
                margin-right: 2rem;
            }

                .why-choose-us .content h2 {
                    font-size: 2rem;
                    margin-bottom: 1rem;
                }

                .why-choose-us .content p {
                    font-size: 1rem;
                    line-height: 1.6;
                }

            .why-choose-us .image {
                flex: 1;
                text-align: center;
            }

                .why-choose-us .image img {
                    max-width: 100%;
                    height: auto;
                    border-radius: 8px;
                }

        .services {
            text-align: center;
            padding: 40px 20px;
            font-family: Arial, sans-serif;
            background-color: #ffffff;
        }

            .services h2 {
                font-size: 2em;
                color: #184a50; /* Color principal */
                margin-bottom: 10px;
            }

            .services p {
                font-size: 1.2em;
                color: #333333; /* Color del texto */
                margin-bottom: 30px;
            }

        .service-icons {
            display: flex;
            justify-content: center;
            gap: 50px;
            flex-wrap: wrap; /* Adaptable a pantallas pequeñas */
        }

        .service {
            text-align: center;
            max-width: 150px;
        }

            .service img {
                max-width: 100%;
                height: auto;
                margin-bottom: 10px;
            }

            .service p {
                font-size: 1em;
                color: #000000; /* Texto de los títulos */
                margin-top: 5px;
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
                    <li><a href="#services">Servicios</a></li>
                    <li><a href="#">Soluciones</a></li>
                    <li><a href="#">Contáctanos</a></li>
                    <li><a href="#">Ayuda</a></li>
                    <li id="boton_inicio">
                        <asp:Button ID="btn_iniciarSesion" runat="server" Text="Inicio de Sesión" CssClass="btn custom-danger" OnClick="btn_iniciarSesion_Click" />
                    </li>
                    <li id="boton_registro">
                        <asp:Button ID="btn_registrar" runat="server" Text="Registrarse" CssClass="btn custom-danger" OnClick="btn_registrar_Click" />
                    </li>
                </ul>
            </nav>
        </header>


        <main class="container">
            <section class="why-choose-us row">
                <div class="content col-md-6">
                    <h2>¿Por qué elegirnos?</h2>
                    <p>Con el propósito de brindar una mejor atención a los usuarios, se pone a disposición la página web de <strong>MESA DE AYUDA</strong>, en donde van a encontrar los manuales de usuario, protocolo de gestión a las solicitudes.</p>
                </div>
                <div class="image">
                    <img src="Imagenes/mockup-imac-gestion-incidencias-fotor-bg-remover-2024121210114 1.png" alt="Interfaz de Mesa de Ayuda">
                </div>
            </section>
            <section id="services">
            </section>

            <section class="services">
                <h2>Contamos con los mejores servicios</h2>
                <p>Reunimos experiencia de usuario, diseño e ingeniería de software para ofrecer soluciones específicas que resuelvan problemas.</p>
                <div class="service-icons">
                    <div class="service">
                        <img src="Imagenes\Group.png" alt="Servicio Técnico">
                        <p>Servicio Técnico</p>
                    </div>
                    <div class="service">
                        <img src="Imagenes\game-icons_pc.png" alt="Mantenimiento de Equipos">
                        <p>Mantenimiento de Equipos</p>
                    </div>
                    <div class="service">
                        <img src="Imagenes\emojione-v1_three-networked-computers.png" alt="Gestión de Redes">
                        <p>Gestión de Redes</p>
                    </div>
                </div>
            </section>


            <section class="performance">
                <div class="image-container">
                    <img src="Imagenes\\empresa-de-software-1170x731-1.jpg" alt="Team Working">
                    <h2 class="auto-style1">Mejore el rendimiento de su equipo de trabajo</h2>
                </div>
            </section>

        </main>
        <footer class="text-white py-4">
            <div class="container">
                <div class="footer-links row">
                    <div class="faq col-md-4">
                        <h3>Preguntas Frecuentes</h3>
                        <ul>
                            <li><a href="#">¿Cómo se maneja la privacidad?</a></li>
                            <li><a href="#">¿Comentarios de Clientes?</a></li>
                        </ul>
                    </div>
                    <div class="company col-md-4">
                        <h3>Empresa</h3>
                        <ul>
                            <li><a href="#">Comentarios de Clientes</a></li>
                        </ul>
                    </div>
                    <div class="support col-md-2">
                        <h3>Soporte</h3>
                        <ul>
                            <li><a href="#">Soporte Técnico</a></li>
                        </ul>
                    </div>
                </div>
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
        // Función para reproducir el mensaje de TTS
        const addMessage = () => {
            const message = new SpeechSynthesisUtterance("Bienvenido a FiXManagement.");
            message.lang = 'in-EN'; // Configura el idioma (español)
            speechSynthesis.speak(message);
        }

        // Ejecuta la función cuando la página termina de cargar
        window.addEventListener("load", () => addMessage());
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
