<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="paginaUsuario.aspx.cs" Inherits="Integrador_3ero.paginaUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Página Administrador</title>
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
            width: 260px;
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

        .sidebar {
            width: 250px;
            float: left;
        }

        .section {
            margin-left: 260px; 
            margin-top: 40px; 
        }

        /*Estilo ver inicdencia*/



        .ticket-container {
            background-color: #f0f0f0;
            border-radius: 10px;
            padding: 25px;
            margin: 20px 0;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .ticket-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }

        .ticket-title {
            font-size: 24px;
            font-weight: bold;
        }

        .ticket-date {
            color: #666;
            font-size: 14px;
            margin-top: 5px;
        }

        .status-badges {
            display: flex;
            gap: 10px;
        }

        .badge {
            padding: 8px 15px;
            border-radius: 20px;
            font-size: 14px;
            font-weight: 500;
        }

        .badge-critical {
            background-color: #ffb3b3;
            color: #cc0000;
        }

        .badge-complete {
            background-color: #b3ffb3;
            color: #008800;
        }

        .ticket-content {
            display: flex;
            gap: 20px;
            margin-top: 20px;
        }

        .ticket-details {
            flex: 2;
        }

        .ticket-section {
            background-color: white;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
        }

        .section-title {
            font-weight: bold;
            margin-bottom: 15px;
            font-size: 18px;
        }

        .ticket-metadata {
            flex: 1;
        }

        .metadata-item {
            margin-bottom: 15px;
        }

        .metadata-label {
            font-weight: bold;
            margin-bottom: 5px;
        }

        .metadata-value {
            color: #555;
        }

        .file-attachment {
            display: flex;
            align-items: center;
            background-color: #f8f8f8;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 10px;
            margin-top: 10px;
        }

        .file-icon {
            margin-right: 10px;
        }

        .comments-box {
            width: 100%;
            height: 100px;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 10px;
            resize: vertical;
        }

        /*Fin estilos ver inidencias*/

        /*Estilos ver perfil*/
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
        /*Fin estilos ver perfil*/

        /*Estilos editar perfil*/
        .editar-content {
            flex: 1;
            padding: 20px;
            background-color: #fafafa;
            display: flex;
            justify-content: center;
            align-items: flex-start;
        }

        .edit-profile-card {
            width: 100%;
            max-width: 800px;
            border: 1px solid #ddd;
            border-radius: 10px;
            overflow: hidden;
            background-color: white;
        }

        .card-header {
            background-color: #1e5958;
            color: white;
            padding: 20px;
            font-size: 22px;
            text-align: center;
        }

        .profile-section-editar {
            padding: 20px;
            display: flex;
            align-items: center;
            background-color: #f5f5f5;
            border-bottom: 1px solid #ddd;
        }

        .profile-picture-editar {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            overflow: hidden;
            position: relative;
            margin-right: 20px;
        }

        .profile-picture img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .camera-icon {
            position: absolute;
            bottom: 0;
            right: 0;
            background-color: white;
            border-radius: 50%;
            width: 30px;
            height: 30px;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
            border: 1px solid #ddd;
        }

        .profile-info {
            display: flex;
            flex-direction: column;
        }

        .profile-name {
            font-size: 20px;
            font-weight: bold;
        }

        .profile-email {
            font-size: 14px;
            color: #666;
        }

        .form-section {
            padding: 20px;
        }

        .form-row {
            display: flex;
            gap: 20px;
            margin-bottom: 20px;
        }

        .form-group {
            flex: 1;
        }

        .form-label {
            display: block;
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 8px;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }

        .security-section {
            background-color: #f5f5f5;
            padding: 20px;
        }

        .security-title {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .security-option {
            padding: 15px;
            background-color: white;
            border-radius: 5px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            cursor: pointer;
        }

        .option-detail {
            color: #666;
            font-size: 14px;
            margin-top: 5px;
        }

        .button-section {
            padding: 20px;
            display: flex;
            justify-content: flex-end;
            gap: 15px;
        }

        .btn-cancel {
            padding: 12px 25px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: white;
            font-size: 16px;
            cursor: pointer;
        }

        .btn-save {
            padding: 12px 25px;
            border: none;
            border-radius: 5px;
            background-color: black;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        /*Fin estilos editar perfil*/

        /*Estilos busqueda*/
        .content {
            flex: 1;
            padding: 20px;
        }

        .content-card {
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            width: 900px;
        }

        .card-header {
            font-size: 24px;
            margin-bottom: 20px;
        }

        .search-filters {
            display: flex;
            gap: 20px;
            margin-bottom: 20px;
            align-items: center;
            justify-content: space-between;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 10px;
        }

        .filter-group {
            display: flex;
            flex-direction: column;
            gap: 5px;
        }

        .filter-label {
            font-weight: bold;
        }

        .filter-input {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 250px;
        }

        .new-incident-btn {
            background-color: #000;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            display: flex;
            align-items: center;
        }

            .new-incident-btn i {
                margin-right: 5px;
            }

        .incidents-table {
            width: 100%;
            border-collapse: collapse;
        }

            .incidents-table th {
                background-color: #1e4d46;
                color: white;
                text-align: left;
                padding: 12px;
            }

            .incidents-table td {
                padding: 12px;
                border-bottom: 1px solid #ddd;
            }

        .status-badge {
            padding: 5px 15px;
            border-radius: 15px;
            font-size: 12px;
            text-align: center;
        }

        .status-progress {
            background-color: #b8c5ff;
        }

        .status-completed {
            background-color: #96f7a8;
        }

        .status-open {
            background-color: #fff599;
        }

        .priority-critical {
            background-color: #ffaaa8;
        }

        .priority-low {
            background-color: #96f7a8;
        }

        .priority-medium {
            background-color: #fff599;
        }

        .action-btn {
            background: none;
            border: none;
            cursor: pointer;
            margin-right: 5px;
        }

        /*Fin busqueda estilos*/

        /*Estilos calificar*/
        .calificar {
            flex: 1;
            padding: 20px;
        }

        .calificar-card {
            background-color: #f2f2f2;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            max-width: 900px;
            margin: 0 auto;
        }

        .card-header-calificar {
            font-size: 24px;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 1px solid #ddd;
        }

        .user-info-calificar {
            margin-bottom: 30px;
        }

        .user-email-calificar {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .user-role-calificar {
            color: #666;
            font-size: 14px;
        }

        .rating-stars-calificar {
            display: flex;
            justify-content: center;
            margin: 30px 0;
            gap: 10px;
        }

        .star {
            width: 50px;
            height: 50px;
            cursor: pointer;
            transition: all 0.2s ease;
        }

            .star:hover {
                transform: scale(1.1);
            }

        .comment-section {
            margin: 20px 0;
        }

        .comment-title {
            font-size: 18px;
            margin-bottom: 10px;
        }

        .comment-textarea {
            width: 100%;
            height: 100px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            resize: none;
            font-family: Arial, sans-serif;
            box-sizing: border-box;
        }

        .button-group {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            margin-top: 20px;
        }

        .btn {
            padding: 10px 30px;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            border: none;
        }

        .btn-secondary {
            background-color: #fff;
            color: #333;
            border: 1px solid #ddd;
        }

        .btn-primary {
            background-color: #000;
            color: white;
        }
        /*Estilos calificar*/

        /*Estilos busqueda*/
        .Busque-content {
            padding: 20px;
            min-height: calc(100vh - 60px);
        }

        .search-container {
            background-color: #f0f0f0;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
        }

        .search-fields {
            display: flex;
            gap: 20px;
            margin-bottom: 20px;
        }

        .search-field {
            flex: 1;
        }

            .search-field label {
                display: block;
                margin-bottom: 8px;
                font-weight: bold;
            }

            .search-field input, .search-field select {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
            }

        .results-container {
            background-color: #f0f0f0;
            border-radius: 10px;
            padding: 20px;
        }

        .result-item {
            background-color: white;
            border-radius: 5px;
            padding: 15px;
            margin-bottom: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .result-id {
            background-color: #e0e0e0;
            padding: 5px 10px;
            border-radius: 15px;
            font-size: 0.9em;
        }

        .result-details {
            flex: 1;
            margin-left: 15px;
        }

        .result-name {
            font-weight: bold;
            margin-bottom: 5px;
        }

        .result-description {
            color: #666;
            font-size: 0.9em;
        }

        .result-status {
            padding: 5px 15px;
            border-radius: 15px;
            font-size: 0.9em;
        }

        .status-completed {
            background-color: #a0ff9d;
            color: #1a5517;
        }

        .status-open {
            background-color: #ffeaa0;
            color: #8a5a00;
        }

        .arrow-icon {
            font-size: 1.5em;
            margin-left: 15px;
        }
        /*Fin estilos busqueda*/

        /*Estilo reportar*/
        .report-container {
            background-color: #f0f0f0;
            border-radius: 10px;
            width: 100%;
            max-width: 800px;
            padding: 30px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin-left: 85px;
        }

        .report-title {
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 30px;
            color: #222;
        }

        .report-group {
            margin-bottom: 25px;
        }

        .report-label {
            display: block;
            font-size: 18px;
            margin-bottom: 10px;
            color: #333;
        }

        .report-control {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

            .report-control:focus {
                outline: none;
                border-color: #007bff;
                box-shadow: 0 0 0 2px rgba(0, 123, 255, 0.25);
            }

        textarea.form-control {
            min-height: 150px;
            resize: vertical;
        }

        .file-upload-area {
            border: 1px solid #ccc;
            border-radius: 4px;
            padding: 40px 20px;
            text-align: center;
            background-color: white;
            position: relative;
            cursor: pointer;
        }

        .file-upload-icon {
            display: block;
            margin: 0 auto 15px;
            width: 50px;
            height: 50px;
            fill: #888;
        }

        .file-upload-text {
            color: #888;
            font-size: 16px;
        }

        .file-upload-input {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            opacity: 0;
            cursor: pointer;
        }

        .buttons-container {
            display: flex;
            justify-content: flex-end;
            gap: 15px;
            margin-top: 30px;
        }

        .btn {
            padding: 12px 30px;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.2s ease;
            border: none;
        }

        .btn-cancel {
            background-color: white;
            color: #333;
            border: 1px solid #ddd;
        }

            .btn-cancel:hover {
                background-color: #f0f0f0;
            }

        .btn-save {
            background-color: #000;
            color: white;
        }

            .btn-save:hover {
                background-color: #333;
            }
        /*Fin estilo reportar*/
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>


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
                    <a href="#" data-target="verincidencias"><i class="bi bi-laptop-fill icon"></i>Ver ticket</a>
                    <a href="#" data-target="calificar"><i class="bi bi-laptop-fill icon"></i>Calificar</a>

                    <div class="cerrar-sesion-btn-container">
                        <asp:Button ID="btnCerrarSesion" runat="server" Text="Cerrar Sesión"
                            CssClass="cerrar-sesion-btn" OnClick="btnCerrarSesion_Click" />
                    </div>

                </div>


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


                <div id="perfil" class="section" style="display: block;">
                    <div class="perfil-content">
                        <div class="profile-sidebar">
                            <div class="profile-picture">
                                <asp:Image ID="imgProfilePic" runat="server" ImageUrl="Imagenes/premium_photo-1689568126014-06fea9d5d341.jpg" AlternateText="Profile Picture" />
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


                <div id="editarperfil" class="section" style="display: none;">
                    <div class="editar-content">
                        <div class="edit-profile-card">
                            <div class="card-header">
                                Editar perfil
                            </div>
                            <div class="profile-section-editar">
                                <div class="profile-picture-editar">
                                    <asp:Image ID="Image1" runat="server" ImageUrl="Imagenes/premium_photo-1689568126014-06fea9d5d341.jpg" AlternateText="Profile Picture" />
                                    <div class="camera-icon">
                                        <asp:LinkButton ID="lnkChangePicture" runat="server">📷</asp:LinkButton>
                                    </div>
                                </div>
                                <div class="profile-info">
                                    <div class="profile-name">
                                        <asp:Literal ID="Literal1" runat="server">Juan Peréz</asp:Literal>
                                    </div>
                                    <div class="profile-email">
                                        <asp:Literal ID="Literal2" runat="server">juanperez@gmail.com</asp:Literal>
                                    </div>
                                </div>
                            </div>

                            <div class="form-section">
                                <div class="form-row">
                                    <div class="form-group">
                                        <asp:Label ID="lblNombre" runat="server" CssClass="form-label" Text="Nombre" AssociatedControlID="txtNombre"></asp:Label>
                                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="Juan"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="lblApellido" runat="server" CssClass="form-label" Text="Apellido" AssociatedControlID="txtApellido"></asp:Label>
                                        <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" placeholder="Peréz"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group">
                                        <asp:Label ID="lblCorreo" runat="server" CssClass="form-label" Text="Correo" AssociatedControlID="txtCorreo"></asp:Label>
                                        <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control" placeholder="juanperez@gmail.com"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="lblTelefono" runat="server" CssClass="form-label" Text="Teléfono" AssociatedControlID="txtTelefono"></asp:Label>
                                        <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" placeholder="+593 99 123 4567"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="security-section">
                                <div class="security-title">Seguridad</div>
                                <div class="security-option">
                                    <div>
                                        <div>Cambiar contraseña</div>
                                        <div class="option-detail">Actualize tu contraseña</div>
                                    </div>
                                    <asp:LinkButton ID="lnkChangePassword" runat="server">❯</asp:LinkButton>
                                </div>
                            </div>

                            <div class="button-section">
                                <asp:Button ID="btnCancel" runat="server" Text="Cancelar" CssClass="btn-cancel" />
                                <asp:Button ID="btnSave" runat="server" Text="Guardar Cambios" CssClass="btn-save" />
                            </div>
                        </div>
                    </div>
                </div>


                <div id="tickets" class="section" style="display: none;">
                    <div class="content">
                        <div class="content-card">
                            <h2 class="card-header">MIS INCIDENCIAS</h2>

                            <div class="search-filters">
                                <div class="filter-group">
                                    <label class="filter-label">ID Incidencia</label>
                                    <input type="text" class="filter-input" placeholder="Buscar por ID" />
                                </div>

                                <div class="filter-group">
                                    <label class="filter-label">Estado</label>
                                    <asp:DropDownList ID="ddlEstado" runat="server" CssClass="filter-input">
                                        <asp:ListItem Text="Todos" Value="0" />
                                        <asp:ListItem Text="En Progreso" Value="1" />
                                        <asp:ListItem Text="Completo" Value="2" />
                                        <asp:ListItem Text="Abierto" Value="3" />
                                    </asp:DropDownList>
                                </div>

                                <button class="new-incident-btn">
                                    <i class="fas fa-plus"></i>Nueva Incidencia
                                </button>
                            </div>

                            <asp:GridView ID="gvIncidencias" runat="server" AutoGenerateColumns="false" CssClass="incidents-table"
                                OnRowCommand="gvIncidencias_RowCommand">
                                <Columns>
                                    <asp:BoundField DataField="ID" HeaderText="ID" />
                                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                                    <asp:BoundField DataField="Categoria" HeaderText="Categoria" />
                                    <asp:TemplateField HeaderText="Estado">
                                        <ItemTemplate>
                                            <div class="status-badge <%# GetStatusClass(Eval("Estado").ToString()) %>">
                                                <%# Eval("Estado") %>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Prioridad">
                                        <ItemTemplate>
                                            <div class="status-badge <%# GetPriorityClass(Eval("Prioridad").ToString()) %>">
                                                <%# Eval("Prioridad") %>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Asignado" HeaderText="Asignado" />
                                    <asp:TemplateField HeaderText="Acción">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnVer" runat="server" CommandName="Ver" CommandArgument='<%# Eval("ID") %>' CssClass="action-btn">
                     <i class="fas fa-eye"></i>
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="btnEditar" runat="server" CommandName="Editar" CommandArgument='<%# Eval("ID") %>' CssClass="action-btn">
                     <i class="fas fa-edit"></i>
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="btnEliminar" runat="server" CommandName="Eliminar" CommandArgument='<%# Eval("ID") %>' CssClass="action-btn">
                     <i class="fas fa-trash-alt"></i>
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>

                </div>


                <div id="nuevo" class="section" style="display: none;">
                    <div>
                        <div class="report-container">
                            <h1 class="report-title">REPORTAR INICDENCIA</h1>

                            <div class="report-group">
                                <label for="txtTitulo" class="form-label">Título:</label>
                                <asp:TextBox ID="TextBox2" runat="server" CssClass="report-control" required="required"></asp:TextBox>
                            </div>

                            <div class="report-group">
                                <label for="ddlCategoria" class="report-label">Categoría:</label>
                                <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="Seleccione una categoría" Value="" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="Hardware" Value="Hardware"></asp:ListItem>
                                    <asp:ListItem Text="Software" Value="Software"></asp:ListItem>
                                    <asp:ListItem Text="Red" Value="Red"></asp:ListItem>
                                    <asp:ListItem Text="Seguridad" Value="Seguridad"></asp:ListItem>
                                    <asp:ListItem Text="Otros" Value="Otros"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvCategoria" runat="server"
                                    ControlToValidate="ddlCategoria"
                                    InitialValue=""
                                    ErrorMessage="Por favor seleccione una categoría"
                                    Display="Dynamic"
                                    ForeColor="Red">
                                </asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group">
                                <label for="txtDescripcion" class="form-label">Descripción:</label>
                                <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"
                                    TextMode="MultiLine" required="required"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Adjuntar Archivos</label>
                                <div class="file-upload-area">
                                    <svg class="file-upload-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                        <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8zm-1-13h2v4h3l-4 4-4-4h3z" />
                                    </svg>
                                    <p class="file-upload-text">Arrastra o haz click para subir imagenes</p>
                                    <asp:FileUpload ID="fileUpload" runat="server" CssClass="file-upload-input" AllowMultiple="true" />
                                </div>
                            </div>

                            <div class="buttons-container">
                                <asp:Button ID="Button2" runat="server" Text="Cancelar" CssClass="btn btn-cancel"
                                    OnClick="btnCancelar_Click" CausesValidation="false" />
                                <asp:Button ID="btnGuardar" runat="server" Text="Guardar Cambios" CssClass="btn btn-save"
                                    OnClick="btnGuardar_Click" />
                            </div>
                        </div>
                    </div>
                </div>


                <div id="editar" class="section" style="display: none;">
                    <div>
                        <div class="report-container">
                            <h1 class="report-title">EDITAR INICDENCIA</h1>

                            <div class="report-group">
                                <label for="txtTitulo" class="form-label">Título:</label>
                                <asp:TextBox ID="TextBox4" runat="server" CssClass="report-control" required="required"></asp:TextBox>
                            </div>

                            <div class="report-group">
                                <label for="ddlCategoria" class="report-label">Categoría:</label>
                                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="Seleccione una categoría" Value="" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="Hardware" Value="Hardware"></asp:ListItem>
                                    <asp:ListItem Text="Software" Value="Software"></asp:ListItem>
                                    <asp:ListItem Text="Red" Value="Red"></asp:ListItem>
                                    <asp:ListItem Text="Seguridad" Value="Seguridad"></asp:ListItem>
                                    <asp:ListItem Text="Otros" Value="Otros"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    ControlToValidate="ddlCategoria"
                                    InitialValue=""
                                    ErrorMessage="Por favor seleccione una categoría"
                                    Display="Dynamic"
                                    ForeColor="Red">
                                </asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group">
                                <label for="txtDescripcion" class="form-label">Descripción:</label>
                                <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control"
                                    TextMode="MultiLine" required="required"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Adjuntar Archivos</label>
                                <div class="file-upload-area">
                                    <svg class="file-upload-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                        <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8zm-1-13h2v4h3l-4 4-4-4h3z" />
                                    </svg>
                                    <p class="file-upload-text">Arrastra o haz click para subir imagenes</p>
                                    <asp:FileUpload ID="fileUpload1" runat="server" CssClass="file-upload-input" AllowMultiple="true" />
                                </div>
                            </div>

                            <div class="buttons-container">
                                <asp:Button ID="Button1" runat="server" Text="Cancelar" CssClass="btn btn-cancel"
                                    OnClick="btnCancelar_Click" CausesValidation="false" />
                                <asp:Button ID="Button3" runat="server" Text="Guardar Cambios" CssClass="btn btn-save"
                                     />
                            </div>
                        </div>
                    </div>
                </div>


                <div id="buscar" class="section" style="display: none;">
                    <div class="Busque-content">
                        <h1>Busqueda de incidencias</h1>
                        <br />
                        <div class="search-container">
                            <div class="search-fields">
                                <div class="search-field">
                                    <label for="txtIncidenciaID">ID Incidencia</label>
                                    <asp:TextBox ID="txtIncidenciaID" runat="server" placeholder="Buscar por ID"></asp:TextBox>
                                </div>
                                <div class="search-field">
                                    <label for="ddlEstado">Estado</label>
                                    <asp:DropDownList ID="DropDownList1" runat="server">
                                        <asp:ListItem Text="Todos" Value="0" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="Abierto" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="En Progreso" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Completo" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="search-field">
                                    <label for="txtFecha">Fecha</label>
                                    <asp:TextBox ID="txtFecha" runat="server" placeholder="dd/mm/aaaa" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="results-container">
                            <h2>Resultados</h2>
                            <br />
                            <asp:Repeater ID="rptIncidencias" runat="server">
                                <ItemTemplate>
                                    <div class="result-item">
                                        <div class="result-id">
                                            <%# Eval("ID") %>
                                        </div>
                                        <div class="result-details">
                                            <div class="result-name"><%# Eval("Nombre") %></div>
                                            <div class="result-description"><%# Eval("Descripcion") %></div>
                                        </div>
                                        <div class="result-status <%# Eval("EstadoCSS") %>">
                                            <%# Eval("Estado") %>
                                        </div>
                                        <div class="arrow-icon">→</div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>

                </div>


                <div id="verincidencias" class="section" style="display: none;">
                    <div class="ticket-container">
                        <div class="ticket-header">
                            <div>
                                <div class="ticket-title">Al iniciar sesión se presento la BIOS</div>
                                <div class="ticket-date">Creado el 5 de febrero del 2025</div>
                            </div>
                            <div class="status-badges">
                                <span class="badge badge-critical">Crítico</span>
                                <span class="badge badge-complete">Completo</span>
                            </div>
                        </div>

                        <div class="ticket-content">
                            <div class="ticket-details">
                                <div class="ticket-section">
                                    <div class="section-title">Descripción</div>
                                    <p>Al encender el ordenador no inicio de manera normal sino que ento en la BIOS</p>
                                </div>

                                <div class="ticket-section">
                                    <div class="section-title">Archivos Adjuntos</div>
                                    <div class="file-attachment">
                                        <div class="file-icon">
                                            <img src="images/image-icon.png" alt="Image" width="24" height="24" />
                                        </div>
                                        <div>Error_Bios.png</div>
                                    </div>
                                </div>

                                <div class="ticket-section">
                                    <div class="section-title">Comentarios</div>
                                    <asp:TextBox ID="txtComentarios" runat="server" CssClass="comments-box" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>

                            <div class="ticket-metadata">
                                <div class="ticket-section">
                                    <div class="section-title">Detalles</div>

                                    <div class="metadata-item">
                                        <div class="metadata-label">Asignado a:</div>
                                        <div class="metadata-value">Juanperez@gmail.com</div>
                                    </div>

                                    <div class="metadata-item">
                                        <div class="metadata-label">Reportado por:</div>
                                        <div class="metadata-value">Emiliapaez@gmail.com</div>
                                    </div>

                                    <div class="metadata-item">
                                        <div class="metadata-label">Fecha límite:</div>
                                        <div class="metadata-value">14/03/2025</div>
                                    </div>

                                    <div class="metadata-item">
                                        <div class="metadata-label">Categoría:</div>
                                        <div class="metadata-value">Software</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div id="calificar" class="section" style="display: none;">
                    <div class="calificar">
                        <div class="calificar-card">
                            <h2 class="card-header-calificar">Calificar respuesta</h2>

                            <div class="user-info-calificar">
                                <div class="user-email-calificar">Juanperez@gmail.com</div>
                                <div class="user-role-calificar">Tecnico de software</div>
                            </div>

                            <div class="rating-stars-calificar">
                                <span id="star1" class="star" onclick="setRating(1)" style="font-size: 40px;">☆</span>
                                <span id="star2" class="star" onclick="setRating(2)" style="font-size: 40px;">☆</span>
                                <span id="star3" class="star" onclick="setRating(3)" style="font-size: 40px;">☆</span>
                                <span id="star4" class="star" onclick="setRating(4)" style="font-size: 40px;">☆</span>
                                <span id="star5" class="star" onclick="setRating(5)" style="font-size: 40px;">☆</span>
                            </div>

                            <div class="comment-section">
                                <h3 class="comment-title">Añadir comentarios</h3>
                                <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" CssClass="comment-textarea"></asp:TextBox>
                            </div>

                            <div class="button-group">
                                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-secondary"  />
                                <asp:Button ID="btnEnviar" runat="server" Text="Enviar" CssClass="btn btn-primary" />
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
                <script>
                    // Función para reproducir el mensaje de TTS
                    const addMessage = () => {
                        const message = new SpeechSynthesisUtterance("Se encuentra en la pagina de IUsuario");
                        message.lang = 'es-ES'; // Configura el idioma (español)
                        speechSynthesis.speak(message);
                    }

                    // Ejecuta la función cuando la página termina de cargar
                    window.addEventListener("load", () => addMessage());
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
            </ContentTemplate>
        </asp:UpdatePanel>

    </form>
</body>

</html>

