<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="paginaTecnico.aspx.cs" Inherits="Integrador_3ero.paginaTecnico" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Página Técnico</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/StyleSheet1.css" />
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

        /*estilos Bienvenida*/
        .Bienvenida-content {
            flex: 1;
            padding: 20px;
            background-color: #f5f5f5;
        }

        .Bienvenida-section {
            border-bottom: 1px solid #ddd;
            padding-bottom: 20px;
            margin-bottom: 20px;
        }

        .card-container-bienvenida {
            display: flex;
            gap: 20px;
            margin-bottom: 30px;
        }

        .card {
            flex: 1;
            padding: 20px;
            border-radius: 10px;
            color: #333;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .card-yellow {
            background-color: #ffdd65;
        }

        .card-purple {
            background-color: #a5a6f6;
        }

        .card-green {
            background-color: #98e0a8;
        }

        .card-red {
            background-color: #ff9f9f;
        }

        .card-title {
            font-size: 18px;
            margin-bottom: 15px;
        }

        .card-number {
            font-size: 32px;
            font-weight: bold;
        }

        .task-list {
            background-color: white;
            border-radius: 10px;
            padding: 15px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .search-section {
            display: flex;
            margin-bottom: 20px;
            gap: 10px;
        }

        .search-input {
            flex: 1;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .priority-dropdown {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            min-width: 200px;
        }

        .task-item {
            padding: 15px;
            border-bottom: 1px solid #eee;
            display: flex;
            align-items: center;
        }

        .priority-badge {
            padding: 5px 15px;
            border-radius: 20px;
            color: white;
            font-size: 14px;
            margin-right: 15px;
            width: 40px;
            text-align: center;
        }

        .high {
            background-color: #ff7f7f;
        }

        .low {
            background-color: #98e0a8;
        }

        .medium {
            background-color: #ffdd65;
        }

        .task-id {
            font-weight: bold;
            margin-right: 10px;
        }

        .task-description {
            color: #777;
            font-size: 14px;
            margin-top: 5px;
        }

        .user-profile {
            position: absolute;
            top: 20px;
            right: 20px;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            overflow: hidden;
        }

            .user-profile img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }
        /*Fin de bienvenida*/

        /*Estilos tabla*/
        .tabla-content {
            flex: 1;
            padding: 20px;
            background-color: #f5f5f5;
        }

        .page-title {
            border-bottom: 1px solid #ddd;
            padding-bottom: 20px;
            margin-bottom: 20px;
            font-size: 28px;
        }

        .search-box {
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 5px;
            background-color: #fff;
            margin-bottom: 20px;
            display: flex;
            gap: 10px;
        }

        .search-input {
            display: flex;
            align-items: center;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 5px 10px;
            flex: 1;
        }

            .search-input input {
                border: none;
                outline: none;
                padding: 5px;
                width: 100%;
                font-size: 14px;
            }

        .dropdown {
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 10px;
            min-width: 180px;
            background-color: #fff;
            position: relative;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
        }

        th {
            background-color: #2b5954;
            color: white;
            padding: 15px;
            text-align: left;
        }

        td {
            padding: 15px;
            border-bottom: 1px solid #eee;
        }

        .status-pill {
            padding: 6px 15px;
            border-radius: 20px;
            display: inline-block;
            text-align: center;
            font-size: 14px;
            min-width: 100px;
        }

        .resolved {
            background-color: #a8e6a8;
            color: #2e7d32;
        }

        .in-progress {
            background-color: #fff176;
            color: #ff8f00;
        }

        .open {
            background-color: #e0e0e0;
            color: #616161;
        }

        .priority-pill {
            padding: 6px 15px;
            border-radius: 20px;
            display: inline-block;
            text-align: center;
            font-size: 14px;
            min-width: 80px;
        }

        .high {
            background-color: #ffcdd2;
            color: #c62828;
        }

        .medium {
            background-color: #fff9c4;
            color: #f9a825;
        }

        .action-icons {
            display: flex;
            gap: 10px;
            justify-content: center;
        }

            .action-icons a {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                width: 30px;
                height: 30px;
                border-radius: 50%;
                background-color: #f5f5f5;
            }

                .action-icons a:hover {
                    background-color: #e0e0e0;
                }
        /*Fin estilos tabla*/

        /*Estilos solucion*/


        /* Contenido */
        .content-solucionar {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            width: 100%;
        }

        .incident-info {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

            .incident-info div {
                background: #ECECEC;
                padding: 20px;
                border-radius: 10px;
                width: 48%;
                min-height: 150px;
            }

        .incident-details {
            background: #EAEAEA;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            width: 100%;
        }

        .resolution-section {
            background: #EAEAEA;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            width: 100%;
        }

        .btn-cancel {
            background-color: #D9534F;
            color: white;
            padding: 12px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 140px;
            font-size: 16px;
        }

        .btn-submit {
            background-color: #103D4A;
            color: white;
            padding: 12px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 140px;
            font-size: 16px;
        }

        .buttons {
            display: flex;
            gap: 15px;
            justify-content: center;
            margin-top: 20px;
        }

        .form-control {
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin-top: 5px;
            font-size: 16px;
        }
        /*Estlos solucion*/

        /*Editar estilos*/
        /* Contenedor principal */

        /* Contenido */
        .content {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            width: 100%;
        }

        .profile-container {
            display: flex;
            align-items: center;
            flex-direction: column;
            margin-bottom: 20px;
        }

        .profile-image img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 10px;
            margin-left: 33px;
        }

        .profile-buttons {
            display: flex;
            gap: 10px;
        }

            .profile-buttons button {
                padding: 10px 15px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
            }

        .btn-change {
            background-color: #103D4A;
            color: white;
        }

        .btn-delete {
            background-color: #D9534F;
            color: white;
        }

        .form-group {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
        }

            .form-group div {
                width: 48%;
            }

        .form-control {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin-top: 5px;
            font-size: 16px;
        }

        .buttons {
            display: flex;
            gap: 15px;
            justify-content: center;
            margin-top: 20px;
        }

        .btn-save {
            background-color: #103D4A;
            color: white;
            padding: 12px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 140px;
            font-size: 16px;
        }

        .btn-cancel {
            background-color: #D9534F;
            color: white;
            padding: 12px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 140px;
            font-size: 16px;
        }
        /*fin editar estilos*/

        /*Estilo perfil*/

        .perfil-content {
            flex: 1;
            padding: 20px;
            background-color: white;
            display: flex;
            gap: 20px;
        }

        .profile-sidebar {
            width: 300px;
            border: 1px solid #ddd;
            border-radius: 10px;
            overflow: hidden;
            height: fit-content;
        }

        .profile-picture {
            display: flex;
            justify-content: center;
            padding: 20px;
        }

            .profile-picture img {
                width: 120px;
                height: 120px;
                border-radius: 50%;
                object-fit: cover;
            }

        .profile-info {
            text-align: center;
            padding: 0 20px 20px;
        }

        .profile-name {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .profile-email {
            font-size: 14px;
            color: #666;
            margin-bottom: 20px;
        }

        .edit-profile-btn {
            background-color: #2962ff;
            color: white;
            border: none;
            border-radius: 50px;
            padding: 10px 0;
            width: 100%;
            font-size: 16px;
            cursor: pointer;
            margin-bottom: 20px;
        }

        .profile-menu {
            border-top: 1px solid #ddd;
        }

        .profile-menu-item {
            padding: 15px 20px;
            border-bottom: 1px solid #ddd;
            cursor: pointer;
        }

        .profile-details {
            flex: 1;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .details-card {
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 20px;
        }

        .details-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .details-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }

        .details-label {
            font-weight: bold;
        }

        .connected-status {
            color: #4caf50;
        }
        /*Fin estilos perfil*/

        /*Calificar estilos*/


        .header-cal {
            background-color: var(--primary-color);
            color: var(--text-color);
            padding: 15px 20px;
            display: flex;
            justify-content: flex-end;
            align-items: center;
        }

        .user-info {
            display: flex;
            align-items: center;
            background-color: rgba(255, 255, 255, 0.1);
            padding: 8px 15px;
            border-radius: 30px;
        }

        .user-avatar {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .card-container-cal {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin-top: 20px;
        }

        .card-cal {
            background-color: var(--secondary-color);
            border-radius: 10px;
            padding: 20px;
            color: var(--text-color);
            width: calc(50% - 10px);
            box-sizing: border-box;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .client-info {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .client-avatar {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            margin-right: 15px;
            object-fit: cover;
        }

        .client-details h3 {
            margin: 0;
            font-size: 18px;
        }

        .client-details p {
            margin: 5px 0 0;
            opacity: 0.8;
        }

        .rating-box {
            background-color: white;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 15px;
        }

        .rating-title {
            color: #333;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .rating-value {
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: #333;
        }

        .rating-stars {
            color: #ffc107;
            font-size: 24px;
        }

        .rating-detail {
            display: flex;
            justify-content: space-between;
            margin: 10px 0;
            color: #333;
        }

        .comments-box {
            background-color: white;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 15px;
            color: #333;
        }

        .comments-title {
            font-weight: bold;
            margin-bottom: 10px;
        }

        .comments-text {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 15px;
        }

        .service-info {
            display: flex;
            justify-content: space-between;
            margin-top: 15px;
            color: white;
        }
        /*Fin calificar estilos*/
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">

            <ContentTemplate>
                <header>
                    <img src="Imagenes/1.png" alt="Logo" />
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
                    <a href="#" data-target="calificaciones"><i class="bi bi-star"></i>
                        </i>Calificaciones tickets</a>
                    <div class="cerrar-sesion-btn-container">
                        <i class="bi bi-box-arrow-right icon"></i>
                        <asp:Button ID="btnCerrarSesion" runat="server" Text="Cerrar Sesión"
                            CssClass="cerrar-sesion-btn" OnClick="btnCerrarSesion_Click" />
                    </div>

                </div>


                <div class="main-content">
                    <div id="inicio" class="section" style="display: block;">
                        <div class="Bienvenida-content">
                            <div class="user-profile">
                                <img src="images/profile.jpg" alt="User Profile" />
                            </div>

                            <div class="Bienvenida-section">
                                <h1>Bienvenido</h1>
                            </div>

                            <div class="card-container-bienvenida">
                                <div class="card card-yellow">
                                    <div class="card-title">Pendientes</div>
                                    <div class="card-number">12</div>
                                </div>

                                <div class="card card-purple">
                                    <div class="card-title">En Progreso</div>
                                    <div class="card-number">5</div>
                                </div>

                                <div class="card card-green">
                                    <div class="card-title">Completadas</div>
                                    <div class="card-number">10</div>
                                </div>

                                <div class="card card-red">
                                    <div class="card-title">Criticas</div>
                                    <div class="card-number">2</div>
                                </div>
                            </div>

                            <div class="task-list">
                                <div class="search-section">
                                    <asp:TextBox ID="txtSearch" runat="server" CssClass="search-input" placeholder="Buscar tareas..."></asp:TextBox>
                                    <asp:DropDownList ID="ddlPriority" runat="server" CssClass="priority-dropdown">
                                        <asp:ListItem Text="Seleccione prioridad" Value=""></asp:ListItem>
                                        <asp:ListItem Text="Alta" Value="high"></asp:ListItem>
                                        <asp:ListItem Text="Media" Value="medium"></asp:ListItem>
                                        <asp:ListItem Text="Baja" Value="low"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <div class="task-item">
                                    <div class="priority-badge high">Alta</div>
                                    <div>
                                        <div><span class="task-id">#ID-001-Error en la bios</span></div>
                                        <div class="task-description">Al encender el ordenador no sio la imagen inicial sino que entro en la BIOS</div>
                                    </div>
                                </div>

                                <div class="task-item">
                                    <div class="priority-badge low">Baja</div>
                                    <div>
                                        <div><span class="task-id">#ID-002-Cambio de teclado</span></div>
                                        <div class="task-description">Se debe cambiar el teclado por uno nuevo</div>
                                    </div>
                                </div>

                                <div class="task-item">
                                    <div class="priority-badge medium">Baja</div>
                                    <div>
                                        <div><span class="task-id">#ID-003-Daño en pantalla</span></div>
                                        <div class="task-description">Se debe cambiar el teclado por uno nuevo</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div id="perfil" class="section" style="display: none;">
                        <div class="perfil-content">
                            <div class="profile-sidebar">
                                <div class="profile-picture">
                                    <asp:Image ID="imgProfilePic" runat="server" ImageUrl="Imagenes/35f6716adc65383508eca7cfda5b5594.jpg" AlternateText="Profile Picture" />
                                </div>
                                <div class="profile-info">
                                    <div class="profile-name">
                                        <asp:Literal ID="litProfileName" runat="server">Max Maldonado</asp:Literal>
                                    </div>
                                    <div class="profile-email">
                                        <asp:Literal ID="litProfileEmail" runat="server">maxmaldonado@gmail.com</asp:Literal>
                                    </div>
                                    <asp:Button ID="btnEditProfile" runat="server" Text="Editar Perfil" CssClass="edit-profile-btn" />
                                </div>
                                <div class="profile-menu">
                                    <div class="profile-menu-item">
                                        <asp:LinkButton ID="lnkConfiguracion" runat="server">Configuración</asp:LinkButton>
                                    </div>
                                    <div class="profile-menu-item">
                                        <asp:LinkButton ID="lnkNotificacion" runat="server">Notificación</asp:LinkButton>
                                    </div>
                                    <div class="profile-menu-item">
                                        <asp:LinkButton ID="lnkPrivacidad" runat="server">Privacidad y Seguridad</asp:LinkButton>
                                    </div>
                                    <div class="profile-menu-item">
                                        <asp:LinkButton ID="lnkAyuda" runat="server">Ayuda</asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                            <div class="profile-details">
                                <div class="details-card">
                                    <div class="details-title">Información Personal</div>
                                    <div class="details-grid">
                                        <div>
                                            <div class="details-label">Nombre</div>
                                            <asp:Literal ID="litNombre" runat="server">Max Maldonado</asp:Literal>
                                        </div>
                                        <div>
                                            <div class="details-label">Correo</div>
                                            <asp:Literal ID="litCorreo" runat="server">maxmaldonado@gmail.com</asp:Literal>
                                        </div>
                                        <div>
                                            <div class="details-label">Celular</div>
                                            <asp:Literal ID="litCelular" runat="server">+593961758460</asp:Literal>
                                        </div>
                                        <div>
                                            <div class="details-label">Ubicación</div>
                                            <asp:Literal ID="litUbicacion" runat="server">Ecuador, Quito</asp:Literal>
                                        </div>
                                    </div>
                                </div>

                                <div class="details-card">
                                    <div class="details-title">Detalles</div>
                                    <div class="details-grid">
                                        <div>
                                            <div class="details-label">Usuario</div>
                                            <asp:Literal ID="litUsuario" runat="server">Max09</asp:Literal>
                                        </div>
                                        <div>
                                            <div class="details-label">Fecha de Nacimiento</div>
                                            <asp:Literal ID="litFechaNacimiento" runat="server">09-12-1997</asp:Literal>
                                        </div>
                                        <div>
                                            <div class="details-label">Lenguaje</div>
                                            <asp:Literal ID="litLenguaje" runat="server">Español</asp:Literal>
                                        </div>
                                    </div>
                                </div>

                                <div class="details-card">
                                    <div class="details-title">Cuentas Conectadas</div>
                                    <div class="details-grid">
                                        <div>
                                            <div class="details-label">Google</div>
                                            <asp:Literal ID="litGoogle" runat="server"><span class="connected-status">Conectado</span></asp:Literal>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>


                    <div id="editar perfil" class="section" style="display: none;">
                        <div class="content-perfil">
                            <div class="content">
                                <h2>Configuración de perfil</h2>

                                <div class="profile-container">
                                    <div class="profile-image">
                                        <img src="Imagenes/35f6716adc65383508eca7cfda5b5594.jpg" alt="Perfil">
                                        <div class="profile-buttons">
                                            <button class="btn-change">Cambiar</button>
                                            <button class="btn-delete">Eliminar</button>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div>
                                        <label>Nombre</label><input type="text" class="form-control">
                                    </div>
                                    <div>
                                        <label>Apellido</label><input type="text" class="form-control">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div>
                                        <label>Correo</label><input type="email" class="form-control">
                                    </div>
                                    <div>
                                        <label>Teléfono</label><input type="text" class="form-control">
                                    </div>
                                </div>

                                <div class="buttons">
                                    <button class="btn-save">Guardar</button>
                                    <button class="btn-cancel">Cancelar</button>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div id="tickets" class="section" style="display: none;">
                        <div class="tabla-content">
                            <h1 class="page-title">Asignados</h1>

                            <div class="search-box">
                                <div class="search-input">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                                    </svg>
                                    <asp:TextBox ID="TextBox1" runat="server" placeholder="Buscar..."></asp:TextBox>
                                </div>

                                <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="dropdown">
                                    <asp:ListItem Text="Categoría" Value=""></asp:ListItem>
                                    <asp:ListItem Text="Software" Value="software"></asp:ListItem>
                                    <asp:ListItem Text="Hardware" Value="hardware"></asp:ListItem>
                                    <asp:ListItem Text="Redes" Value="redes"></asp:ListItem>
                                </asp:DropDownList>

                                <asp:DropDownList ID="ddlEstado" runat="server" CssClass="dropdown">
                                    <asp:ListItem Text="Estado" Value=""></asp:ListItem>
                                    <asp:ListItem Text="Resuelto" Value="resuelto"></asp:ListItem>
                                    <asp:ListItem Text="En Progreso" Value="en-progreso"></asp:ListItem>
                                    <asp:ListItem Text="Abierto" Value="abierto"></asp:ListItem>
                                </asp:DropDownList>

                                <asp:DropDownList ID="ddlPrioridad" runat="server" CssClass="dropdown">
                                    <asp:ListItem Text="Prioridad" Value=""></asp:ListItem>
                                    <asp:ListItem Text="Alta" Value="alta"></asp:ListItem>
                                    <asp:ListItem Text="Media" Value="media"></asp:ListItem>
                                    <asp:ListItem Text="Baja" Value="baja"></asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <table>
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nombre</th>
                                        <th>Categoría</th>
                                        <th>Estado</th>
                                        <th>Fecha Asignado</th>
                                        <th>Prioridad</th>
                                        <th>Acción</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>001</td>
                                        <td>Teclado dañado</td>
                                        <td>Software</td>
                                        <td><span class="status-pill resolved">Resuelto</span></td>
                                        <td>22-03-2025</td>
                                        <td><span class="priority-pill medium">Media</span></td>
                                        <td>
                                            <div class="action-icons">
                                                <a href="DetailView.aspx?id=001">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                                                    </svg>
                                                </a>
                                                <a href="EditTask.aspx?id=001">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                                                    </svg>
                                                </a>
                                                <a href="javascript:void(0);" onclick="DeleteTask(001)">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                                                    </svg>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>002</td>
                                        <td>Actualizar software</td>
                                        <td>Hardware</td>
                                        <td><span class="status-pill in-progress">En Progreso</span></td>
                                        <td>23-03-2025</td>
                                        <td><span class="priority-pill high">Alta</span></td>
                                        <td>
                                            <div class="action-icons">
                                                <a href="DetailView.aspx?id=002">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                                                    </svg>
                                                </a>
                                                <a href="EditTask.aspx?id=002">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                                                    </svg>
                                                </a>
                                                <a href="javascript:void(0);" onclick="DeleteTask(002)">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                                                    </svg>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>003</td>
                                        <td>Falta de permiso</td>
                                        <td>Software</td>
                                        <td><span class="status-pill resolved">Resuelto</span></td>
                                        <td>22-03-2025</td>
                                        <td><span class="priority-pill medium">Media</span></td>
                                        <td>
                                            <div class="action-icons">
                                                <a href="DetailView.aspx?id=003">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                                                    </svg>
                                                </a>
                                                <a href="EditTask.aspx?id=003">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                                                    </svg>
                                                </a>
                                                <a href="javascript:void(0);" onclick="DeleteTask(003)">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                                                    </svg>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>004</td>
                                        <td>Sin Internet</td>
                                        <td>Redes</td>
                                        <td><span class="status-pill open">Abierto</span></td>
                                        <td>24-03-2025</td>
                                        <td><span class="priority-pill high">Alta</span></td>
                                        <td>
                                            <div class="action-icons">
                                                <a href="DetailView.aspx?id=004">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                                                    </svg>
                                                </a>
                                                <a href="EditTask.aspx?id=004">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                                                    </svg>
                                                </a>
                                                <a href="javascript:void(0);" onclick="DeleteTask(004)">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                                                    </svg>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>005</td>
                                        <td>Actualización de virus</td>
                                        <td>Software</td>
                                        <td><span class="status-pill resolved">Resuelto</span></td>
                                        <td>13-03-2025</td>
                                        <td><span class="priority-pill medium">Media</span></td>
                                        <td>
                                            <div class="action-icons">
                                                <a href="DetailView.aspx?id=005">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                                                    </svg>
                                                </a>
                                                <a href="EditTask.aspx?id=005">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                                                    </svg>
                                                </a>
                                                <a href="javascript:void(0);" onclick="DeleteTask(005)">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                                                    </svg>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                            <asp:HiddenField ID="hdnDeleteTaskId" runat="server" />
                            <asp:LinkButton ID="lnkDeleteTask" runat="server" OnClick="lnkDeleteTask_Click" Style="display: none;"></asp:LinkButton>
                        </div>
                    </div>


                    <div id="Solucionar" class="section" style="display: none;">
                        <div class="solucionar-content">
                            <div class="content-solucionar">
                                <h2>Resolver Incidencia ID-001</h2>

                                <div class="incident-info">
                                    <div>
                                        <h4>Detalles de la incidencia</h4>
                                        <p>
                                            <strong>Juan Perez</strong><br>
                                            Reportado: 22 de febrero 2025, 14:01
                                        </p>
                                        <p>
                                            <strong>Error en la BIOS</strong><br>
                                            Al intentar encender la máquina no dio el inicio correspondiente sino que entró a la BIOS.
                                        </p>
                                    </div>
                                    <div>
                                        <h4>Información</h4>
                                        <p><strong>Prioridad:</strong> Alta</p>
                                        <p><strong>Categoría:</strong> Software</p>
                                    </div>
                                </div>

                                <div class="resolution-section">
                                    <h4>Resolución</h4>
                                    <label>Estado</label>
                                    <select class="form-control">
                                        <option>Seleccione</option>
                                    </select>

                                    <label>Resolución</label>
                                    <textarea class="form-control" placeholder="Descripción"></textarea>

                                    <label>Adjuntar archivos</label>
                                    <input type="file" class="form-control">
                                </div>

                                <div class="buttons">
                                    <button class="btn-cancel">Cancelar</button>
                                    <button class="btn-submit">Registrar</button>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div id="calificaciones" class="section" style="display: none;">
                        <div class="content-cal">
                            <div class="card-container-cal">
                                <asp:Repeater ID="rptClientReviews" runat="server">
                                    <ItemTemplate>
                                        <div class="card-cal">
                                            <h2>Calificación del Cliente</h2>
                                            <div class="client-info">
                                                <img src='<%# Eval("ClientPhoto") %>' alt="Client" class="client-avatar" />
                                                <div class="client-details">
                                                    <h3><%# Eval("ClientName") %></h3>
                                                    <p>Cliente</p>
                                                </div>
                                            </div>

                                            <div class="rating-box">
                                                <div class="rating-title">Calificación General</div>
                                                <div class="rating-value">
                                                    <div><%# Eval("GeneralRating") %> de 5</div>
                                                    <div class="rating-stars">
                                                        <%# GetStarsHtml(Convert.ToInt32(Eval("GeneralRating"))) %>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="rating-box">
                                                <div class="rating-detail">
                                                    <div>Puntualidad</div>
                                                    <div class="rating-stars">
                                                        <%# GetStarsHtml(Convert.ToInt32(Eval("PunctualityRating"))) %>
                                                    </div>
                                                </div>
                                                <div class="rating-detail">
                                                    <div>Profesionalismo</div>
                                                    <div class="rating-stars">
                                                        <%# GetStarsHtml(Convert.ToInt32(Eval("ProfessionalismRating"))) %>
                                                    </div>
                                                </div>
                                                <div class="rating-detail">
                                                    <div>Calidad de trabajo</div>
                                                    <div class="rating-stars">
                                                        <%# GetStarsHtml(Convert.ToInt32(Eval("QualityRating"))) %>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="comments-box">
                                                <div class="comments-title">Comentarios del Cliente:</div>
                                                <div class="comments-text">
                                                    <%# Eval("Comments") %>
                                                </div>
                                            </div>

                                            <div class="service-info">
                                                <div>
                                                    <div>Fecha del Servicio:</div>
                                                    <div>Tipo de servicio:</div>
                                                </div>
                                                <div style="text-align: right;">
                                                    <div><%# Eval("ServiceDate") %></div>
                                                    <div><%# Eval("ServiceType") %></div>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>

                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

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
        <script>
            // Función para reproducir el mensaje de TTS
            const addMessage = () => {
                const message = new SpeechSynthesisUtterance("Se encuentra en la pagina de Técnico");
                message.lang = 'es-ES'; // Configura el idioma (español)
                speechSynthesis.speak(message);
            }

            // Ejecuta la función cuando la página termina de cargar
            window.addEventListener("load", () => addMessage());
        </script>
        </contenttemplate>

    </form>
</body>

</html>
