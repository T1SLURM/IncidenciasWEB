<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="paginaUsuario.aspx.cs" Inherits="Integrador_3ero.paginaUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Usuario</title>
    <link rel="stylesheet" href="css/Registro_Incidecia.css">
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header class="top-bar">
            <nav>
                <a href="#">Servicios</a>
                <a href="#">Soluciones</a>
                <a href="#">Contáctanos</a>
                <a href="#">Ayuda</a>
            </nav>
            <div class="user-info">
                <span>Juan</span>
            </div>
        </header>

        <div class="container">
            <!-- Sidebar -->
            <aside class="sidebar">
                <div class="logo">
                    <h2>GEAR SOLUTIONS</h2>
                </div>
                <nav>
                    <ul>
                        <li class="active">Vista General</li>
                        <li>Mi Perfil</li>
                        <li>Tickets</li>
                        <li>Buscar</li>
                    </ul>
                </nav>
                <asp:Button ID="btnCerrarSesion" runat="server" Text="Cerrar Sesión" CssClass="cerrar-sesion-btn" OnClick="btnCerrarSesion_Click" />
            </aside>

            <!-- Main Content -->
            <main class="content">
                <section class="incident-section">
                    <div class="incident-form">
                        <h1>Reportar Incidencias</h1>
                        <label for="categoria">Categoría:</label>
                        <select id="categoria">
                            <option value="general">General</option>
                        </select>
                        <label for="resumen">Título:</label>
                        <input type="text" id="resumen" placeholder="Titulo">
                        <label for="descripcion">Descripción:</label>
                        <textarea id="descripcion" rows="4" placeholder="Descripción"></textarea>
                        <button type="submit">Enviar</button>
                    </div>

                    <div class="incident-image">
                        <img src="Imagenes/referencia.png" alt="Imagen de referencia">
                        <button>Seleccione</button>
                        <button>Ver</button>
                    </div>
                </section>
            </main>
        </div>

        <!-- Footer -->
        <footer>
            <p>Términos y condiciones de uso</p>
            <p>Política de Privacidad</p>
            <p>Gestionar cookies</p>
        </footer>
    </form>
</body>
</html>
