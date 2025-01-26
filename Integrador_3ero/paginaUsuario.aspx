<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="paginaUsuario.aspx.cs" Inherits="Integrador_3ero.paginaUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Página Administrador</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="css/StyleSheet1.css">
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
        .show>.mi-boton.dropdown-toggle {
            color: #000000;
            background-color: #d39e00;
            border-color: #c69500;
        }

        .mi-boton:not(:disabled):not(.disabled):active:focus,
        .mi-boton:not(:disabled):not(.disabled).active:focus,
        .show>.mi-boton.dropdown-toggle:focus {
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
        .show>.mi-boton-exito.dropdown-toggle {
            color: #000;
            /* Mantener letra negra */
            background-color: #1e7e34;
            border-color: #1c7430;
        }

        .mi-boton-exito:not(:disabled):not(.disabled):active:focus,
        .mi-boton-exito:not(:disabled):not(.disabled).active:focus,
        .show>.mi-boton-exito.dropdown-toggle:focus {
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
        .show>.mi-boton-peligro.dropdown-toggle {
            color: #000;
            /* Mantener letra negra */
            background-color: #bd2130;
            border-color: #b21f2d;
        }

        .mi-boton-peligro:not(:disabled):not(.disabled):active:focus,
        .mi-boton-peligro:not(:disabled):not(.disabled).active:focus,
        .show>.mi-boton-peligro.dropdown-toggle:focus {
            box-shadow: 0 0 0 0.2rem rgba(220, 53, 69, 0.5);
        }


        /* Main Content */
        .content {
            width: 80%;
            padding: 20px;
            background-color: #f4f4f4;
        }

        .welcome-section {
            text-align: center;
            margin-bottom: 20px;
            position: relative;
            color: white;
        }

        .welcome-section img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 8px;
        }

        .welcome-section .welcome-text {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: white;
            font-size: 3rem;
            font-weight: bold;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.8);
        }

        .card-container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            gap: 30px;
            padding: 20px;
        }

        .card {
            background-color: white;
            padding: 30px;
            text-align: center;
            border-radius: 10px;
            box-shadow: 0 6px 10px rgba(0, 0, 0, 0.15);
            width: 300px;
            /* Ancho fijo */
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        .card h2 {
            margin-top: 0;
            font-size: 1.8rem;
            font-weight: bold;
        }

        .card p {
            margin: 15px 0;
            font-size: 1rem;
            color: #333;
        }

        .card button {
            background-color: #005b6e;
            color: white;
            padding: 10px 15px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            font-size: 1rem;
            transition: background-color 0.3s;
        }

        .card button:hover {
            background-color: #007b8a;
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

        .tickets-section {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .filters {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .filters input,
        .filters select {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .tickets-table {
            border-collapse: collapse;
        }

        .tickets-table thead {
            background-color: #005b6e;
            color: white;
        }

        .tickets-table th,
        .tickets-table td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }

        .tickets-table tbody tr:nth-child(odd) {
            background-color: #f9f9f9;
        }

        .tickets-table tbody tr:nth-child(even) {
            background-color: #e6e6e6;
        }

        .tickets-table td button {
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .tickets-table td button.view {
            background-color: #007bff;
            color: white;
        }

        .tickets-table td button.edit {
            background-color: #ffc107;
            color: white;
        }

        .tickets-table td button.delete {
            background-color: #dc3545;
            color: white;
        }

        .busqu-container {
            display: flex;
            flex: 1;
            margin-left: 500px;
            /* Ajusta el valor según sea necesario */
        }




        header img {
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
        }

        .section-container {
            width: 80%;
            /* Ajusta el ancho de la sección contenedora */
            margin: 0 auto;
            /* Centra la sección en la página */
            position: relative;
            left: 130px;
        }

        .header-line {
            border-bottom: 2px solid #000;
            /* Ajusta el color y grosor según tus necesidades */
            position: relative;
            width: 100%;
            /* La línea se ajusta al ancho de la sección */
            left: 4px;
        }

        .nuevo-container {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 1000px;
            position: relative;
            left: 375px;
        }

        .nuevo-container h2 {
            margin-bottom: 0px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
        }

        .form-group select,
        .form-group input[type="text"],
        .form-group textarea {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            resize: none;
        }

        .form-group textarea {
            height: 80px;
        }

        .image-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }

        .image-section img {
            max-width: 60px;
            max-height: 60px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .image-section button {
            padding: 8px 15px;
            border: none;
            border-radius: 5px;
            background-color: #00264d;
            color: #fff;
            cursor: pointer;
        }

        .image-section button:hover {
            background-color: #00509e;
        }

        .submit-btn {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #00264d;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .submit-btn:hover {
            background-color: #00509e;
        }

        .titulo-line {
            border-bottom: 2px solid #000;
            margin-bottom: 50px;
            margin: 0 auto;
            width: 100%;
        }


        .busqu-container {
            width: 80%;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .search-bar {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 20px;
            gap: 10px;
        }

        .search-bar input[type="text"],
        .search-bar select {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 25%;
        }

        .search-bar input::placeholder {
            color: #aaa;
        }

        .knowledge-base {
            border-top: 2px solid #ffa500;
            padding-top: 20px;
        }

        .knowledge-base h3 {
            margin-bottom: 20px;
            color: #333;
            text-align: center;
        }

        .knowledge-base .row {
            display: flex;
            justify-content: space-between;
            gap: 20px;
        }

        .knowledge-base .column {
            flex: 1;
        }

        .knowledge-base ul {
            list-style: none;
            padding: 0;
        }

        .knowledge-base ul li {
            margin-bottom: 10px;
            color: #555;
        }

        .knowledge-base ul li:hover {
            text-decoration: underline;
            cursor: pointer;
        }

        .search-container {
            display: flex;
            align-items: center;
        }

        .search-container input,
        .search-container select {
            margin-right: 10px;
            padding: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .search-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
            position: relative;
            left: 360px;
        }

        .opciones {
            position: relative;
            left: 360px;
        }

        .separator {
            border: none;
            border-top: 2px solid black;
            margin: 10px 0;
            width: 55%;
            position: relative;
            left: 360px;
        }

        .knowledge-base {
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #fff;
            padding: 20px;
            box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            margin: auto;
        }

        .knowledge-base h1 {
            font-size: 20px;
            margin-bottom: 10px;
            color: #333;
        }

        .divider {
            height: 3px;
            background-color: orange;
            margin: 10px 0 20px 0;
            border-radius: 5px;
        }

        .columns {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
        }

        .column {
            font-size: 14px;
            color: #333;
        }

        .column h2 {
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 10px;
            color: #000;
        }

        .column ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .column ul li {
            margin-bottom: 5px;
            line-height: 1.5;
        }

        .editar_card {
            max-width: 500px;
            margin: 20px auto;
            padding: 20px;
            background-color: #007baf;
            border-radius: 10px;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
            color: white;
        }

        .editar_card h2 {
            font-size: 20px;
            text-align: center;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-size: 14px;
            margin-bottom: 5px;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: none;
            font-size: 14px;
            box-shadow: inset 1px 1px 5px rgba(0, 0, 0, 0.2);
        }

        .form-group input[readonly] {
            background-color: #e0e0e0;
        }

        .form-group input[type="password"] {
            background-color: white;
        }

        .btn {
            display: block;
            width: 100%;
            padding: 10px;
            font-size: 16px;
            font-weight: bold;
            color: white;
            background-color: #005f85;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
            margin-top: 10px;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #004766;
        }

        .titulo {
            text-align: center;
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #333;
        }

        hr {
            border: none;
            border-top: 1px solid black;
            margin: 10px 0 20px;
        }

        .ticket-container {
            max-width: 800px;
            margin: auto;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
        }

        .ticket-header {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
            text-align: left;
        }

        .ticket-divider {
            border: none;
            border-top: 1px solid black;
            margin: 10px 0 20px;
        }

        .ticket-details {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .ticket-info {
            font-size: 14px;
            color: #333;
        }

        .ticket-image {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .ticket-image img {
            width: 100px;
            height: 100px;
            object-fit: contain;
            margin-bottom: 10px;
        }

        .ticket-image button {
            background-color: #007baf;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
            margin: 5px 0;
        }

        .ticket-image button:hover {
            background-color: #005f85;
        }

        .ticket-form-section {
            background-color: #20b2aa;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
        }

        .ticket-form-group {
            display: flex;
            gap: 20px;
            margin-bottom: 15px;
        }

        .ticket-form-section input,
        .ticket-form-section textarea {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: none;
            font-size: 14px;
            box-shadow: inset 1px 1px 5px rgba(0, 0, 0, 0.2);
        }

        .ticket-form-section textarea {
            resize: none;
        }

        .ticket-btn-update {
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

        .ticket-btn-update:hover {
            background-color: #003647;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <contenttemplate>


                <header>
                    <img src="Imagenes/1.png" alt="Logo">
                </header>
                <div class="sidebar">
                    <h4>Vista General</h4>
                    <a href="#" data-target="inicio"><i class="bi bi-house-door-fill icon"></i>Inicio</a>
                    <a href="#" data-target="perfil"><i class="bi bi-people-fill icon"></i>Mi perfil</a>
                    <a href="#" data-target="editarperfil"><i class="bi bi-people-fill icon"></i>Editar mi perfil</a>
                    <a href="#" data-target="tickets"><i class="bi bi-person-badge-fill icon"></i>Mis tickets</a>
                    <a href="#" data-target="nuevo"><i class="bi bi-check-circle-fill icon"></i>Nuevo ticket</a>
                    <a href="#" data-target="editar"><i class="bi bi-tags-fill icon"></i>Editar ticket</a>
                    <a href="#" data-target="buscar"><i class="bi bi-laptop-fill icon"></i>Buscar ticket</a>

                    <div class="cerrar-sesion-btn-container">
                        <asp:Button ID="btnCerrarSesion" runat="server" Text="Cerrar Sesión"
                            CssClass="cerrar-sesion-btn" OnClick="btnCerrarSesion_Click" />
                    </div>

                </div>


                <div class="main-content">
                    <div id="inicio" class="section" style="display: block;">

                        <section class="welcome-section">
                            <img src="Imagenes/Rectangle 39.jpg" alt="Fondo">
                            <div class="welcome-text">Bienvenido Max</div>
                        </section>

                        <section class="card-container">
                            <div class="card">
                                <h2>Tickets</h2>
                                <p>Visualiza el estado de tus tickets</p>
                                <button>Tickets </button>
                            </div>
                            <div class="card">
                                <h2>Nuevo ticket</h2>
                                <p>Crear nuevo ticket</p>
                                <button>Tickets</button>
                            </div>
                            <div class="card">
                                <h2>Busqueda</h2>
                                <p>Busca la solución en nuestra base de conocimiento</p>
                                <button>Tickets</button>
                            </div>

                        </section>


                    </div>
                </div>

                <div id="editarperfil" class="section" style="display: none;">
                    <div>
                        <br />
                        <br />
                    </div>
                    <div class="Titulo">
                        Mi Perfil
                        <hr />
                    </div>
                    <div class="editar_card">
                        <h2>Detalles de la Incidencia</h2>
                        <div class="form-group">
                            <label for="txtNombre">Nombre:</label>
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Text="Kevin"
                                ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtCorreo">Correo:</label>
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Text="Kevin@gmail.com"
                                ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtCedula">Cédula:</label>
                            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" Text="178*******7"
                                ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtTelefono">Teléfono:</label>
                            <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" Text="0962724834">
                            </asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtContrasena1">Contraseña:</label>
                            <asp:TextBox ID="txtContrasena1" runat="server" CssClass="form-control" TextMode="Password"
                                Text="********"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtContrasena2">Contraseña:</label>
                            <asp:TextBox ID="txtContrasena2" runat="server" CssClass="form-control" TextMode="Password"
                                Text="********"></asp:TextBox>
                        </div>
                        <asp:Button ID="btnActualizar" runat="server" CssClass="btn" Text="Actualizar" OnClick="btnActualizar_Click"/>
                    </div>
                </div>



                <div id="tickets" class="section" style="display: none;">
                    <div>
                        <br />
                        <br />
                    </div>
                    <section class="section-container">
                        <h2>Mis tickets</h2>
                        <div class="header-line"></div>
                    </section>
                    <div>

                        <asp:HiddenField ID="iddc" runat="server" />
                        <table class="tickets-table" align="center">
                            <tr>

                                <td class="grid">
                                    <asp:GridView ID="GridView1" AutoGenerateColumns="False" runat="server"
                                        BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px"
                                        CellPadding="4" CssClass="auto-style6" ForeColor="Black" CellSpacing="2">
                                        <Columns>
                                            <asp:BoundField DataField="ci_id" HeaderText="Id" />
                                            <asp:BoundField DataField="ci_nombre" HeaderText="Nombre" />
                                            <asp:BoundField DataField="ci_cedula" HeaderText="Cedula" />
                                            <asp:BoundField DataField="ci_correo" HeaderText="Correo" />
                                            <asp:BoundField DataField="ci_password" HeaderText="Contraseña" />
                                            <asp:BoundField DataField="ci_direccion" HeaderText="Direccion" />
                                            <asp:BoundField DataField="ci_bloqueado" HeaderText="Estado" />
                                            <asp:TemplateField HeaderText="Imagen">
                                                <ItemTemplate>
                                                    <asp:Image ID="Image2" runat="server"
                                                        ImageUrl='<%# "data:image/png;base64," + Eval("ci_problema_base64") %>'
                                                        Style="width: 100px; height: 100px;" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ci_ticket" HeaderText="Tipo" />
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="btnActualizar" CausesValidation="false"
                                                        runat="server" Text="Actualizar"
                                                        CommandArgument='<%# Eval("ci_id") %>' class="btn btn-dark" OnClick="btnActualizar_Click1" />
                                                    <asp:Button ID="Eliminar" CausesValidation="false" runat="server"
                                                        Text="Eliminar" CommandArgument='<%# Eval("ci_id") %>'
                                                        class="btn btn-dark" OnClick="Eliminar_Click" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <FooterStyle BackColor="#CCCCCC" />
                                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                                        <RowStyle BackColor="White" />
                                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                        <SortedAscendingHeaderStyle BackColor="#808080" />
                                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                        <SortedDescendingHeaderStyle BackColor="#383838" />
                                    </asp:GridView>
                                </td>

                            </tr>
                        </table>

                    </div>

                </div>

                <div id="nuevo" class="section" style="display: none;">
                    <div>
                        <br />
                        <br />
                    </div>
                    <div class="nuevo-container">
                        <section class="titulo-container">
                            <h2>Registrar incidencias</h2>
                            <div class="titulo-line"></div>
                        </section>
                        <form>
                            <div class="form-group">
                                <label for="categoria">Categoría:</label>
                                <select id="categoria" name="categoria">
                                    <option value="general">General</option>
                                    <option value="tecnica">Técnica</option>
                                    <option value="soporte">Soporte</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="titulo">Título:</label>
                                <input type="text" id="titulo" name="titulo" placeholder="Ingrese el título">
                            </div>
                            <div class="form-group">
                                <label for="descripcion">Descripción:</label>
                                <textarea id="descripcion" name="descripcion"
                                    placeholder="Ingrese la descripción"></textarea>
                            </div>
                            <div class="image-section">
                                <img src="placeholder.png" alt="Imagen seleccionada">
                                <div>
                                    <button type="button">Seleccione</button>
                                    <button type="button">Ver</button>
                                </div>
                            </div>
                            <button type="submit" class="submit-btn">Enviar</button>
                        </form>
                    </div>


                </div>

                <div id="editar" class="section" style="display: none;">
                    <div>
                        <br />
                        <br />
                    </div>
                    <div class="ticket-container">
                        <div class="ticket-header">Editar ticket</div>
                        <hr class="ticket-divider" />
                        <div class="ticket-details">
                            <div class="ticket-info">
                                <p><strong>Categoría:</strong> Software</p>
                                <p><strong>Fecha:</strong> 20-01-2025</p>
                                <p><strong>Título:</strong> Visual</p>
                                <p><strong>Descripción:</strong> No carga el visual</p>
                            </div>
                            <div class="ticket-image">
                                <img src="https://via.placeholder.com/100" alt="Imagen de ticket" />
                                <button type="button">Seleccione</button>
                                <button type="button">Ver</button>
                            </div>
                        </div>
                        <div class="ticket-form-section">
                            <div class="ticket-form-group">
                                <asp:TextBox ID="txtCategoria" runat="server" CssClass="form-control"
                                    placeholder="Categoría"></asp:TextBox>
                                <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" placeholder="Fecha">
                                </asp:TextBox>
                            </div>
                            <div class="ticket-form-group">
                                <asp:TextBox ID="txtTitulo" runat="server" CssClass="form-control" placeholder="Título">
                                </asp:TextBox>
                                <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control"
                                    TextMode="MultiLine" Rows="4" placeholder="Descripción"></asp:TextBox>
                            </div>
                            <asp:Button ID="Button1" runat="server" CssClass="ticket-btn-update" Text="Actualizar"/>
                        </div>
                    </div>
                </div>

                <div id="buscar" class="section" style="display: none;">
                    <div class="search-title">Buscar</div>
                    <hr class="separator" />
                    <div class="opciones">
                        <asp:TextBox ID="txtBuscar" runat="server" Placeholder="Buscar..."></asp:TextBox>
                        <asp:DropDownList ID="ddlCategoria" runat="server">
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlTipo" runat="server">
                        </asp:DropDownList>
                    </div>
                    <div class="knowledge-base">
                        <h1>Base de Conocimiento</h1>
                        <div class="divider"></div>
                        <div class="columns">
                            <div class="column">
                                <h2>Problemas comunes</h2>
                                <ul>
                                    <li>Error: contraseña incorrecta.</li>
                                    <li>No tengo permisos para abrir un archivo.</li>
                                    <li>Problemas de rendimiento en la plataforma.</li>
                                    <li>Sin acceso a internet.</li>
                                </ul>
                            </div>
                            <div class="column">
                                <h2>Errores Técnicos</h2>
                                <ul>
                                    <li>Detalles de error #98765.</li>
                                    <li>Error 500 en el servidor.</li>
                                    <li>Requisitos para el sistema X.</li>
                                </ul>
                            </div>
                            <div class="column">
                                <h2>Categorías o Áreas</h2>
                                <ul>
                                    <li>Errores de aplicación en el sistema contable.</li>
                                    <li>Reparación de laptops.</li>
                                    <li>Corte de internet en oficinas.</li>
                                    <li>Error en correo corporativo.</li>
                                </ul>
                            </div>
                            <div class="column">
                                <h2>Soluciones</h2>
                                <ul>
                                    <li>Cómo recuperar mi contraseña.</li>
                                    <li>Errores frecuentes en el sistema de facturación.</li>
                                    <li>Solución temporal para caídas de red.</li>
                                </ul>
                            </div>
                        </div>
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
                <%--<script>
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
                </script>--%>
            </contenttemplate>
        </asp:UpdatePanel>

    </form>
</body>

</html>

