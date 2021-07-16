<%-- 
    Document   : principalPostulante
    Created on : 11/02/2021, 11:24:16 AM
    Author     : Yirz
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <c:choose>
        <c:when test="${user==null}">
            <%
                response.sendRedirect(request.getContextPath().concat("/indexPostulante.htm"));
            %>
        </c:when>
        <c:otherwise>
            <c:if test='${rol ne "postulante"}'>
                <%
                    response.sendRedirect(request.getContextPath().concat("/principalAdmin.htm"));
                %>
            </c:if>
        </c:otherwise>
    </c:choose>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home Postulante</title>
        <link rel="stylesheet" href="<c:url value='resources/css/kendo.common-bootstrap.min.css'/>">
        <link rel="stylesheet" href="<c:url value='resources/css/kendo.bootstrap-v4.min.css'/>">
        <link rel="stylesheet" href="<c:url value='resources/css/bootstrap.min.css'/>">
        <link rel="stylesheet" href="<c:url value='resources/css/colors.css'/>">
        <link rel="stylesheet" href="<c:url value='resources/css/all.css'/>">
        <link rel="stylesheet" href="<c:url value='resources/css/body.css'/>">
        <link rel="stylesheet" href="<c:url value='resources/css/style.css'/>">

        <script src="<c:url value='resources/js/jquery.min.js'/>"></script>
        <script src="<c:url value='resources/js/kendo.all.min.js'/>"></script>
        <script src="<c:url value='resources/js/kendo.es-MX.js'/>"></script>
        <script src="<c:url value='resources/js/pooper.min.js'/>"></script>
        <script src="<c:url value='resources/js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='resources/js/all.min.js'/>"></script>
        <style>


            *{
                margin: 0px;
                padding: 0px;
            }

            .context {
                width: 100%;
                position: absolute;
                top:50vh;

            }

            .context h1{
                text-align: center;
                color: #fff;
                font-size: 50px;
            }


            .area{
                background: #f7f7fa;  
                background: -webkit-linear-gradient(to left, #89e8f5, #89e8f5);  
                width: 100%;
                height:100vh;
                z-index:-3;
                position:absolute;
            }


            .circles{
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                overflow: hidden;
                z-index:-2;
            }

            .circles li{
                position: absolute;
                display: block;
                list-style: none;
                width: 20px;
                height: 20px;
                background:#89e8f5;
                animation: animate 25s linear infinite;
                bottom: -150px;
                z-index:-1;

            }

            .circles li:nth-child(1){
                left: 25%;
                width: 80px;
                height: 80px;
                animation-delay: 0s;
            }


            .circles li:nth-child(2){
                left: 10%;
                width: 20px;
                height: 20px;
                animation-delay: 2s;
                animation-duration: 12s;
            }

            .circles li:nth-child(3){
                left: 70%;
                width: 20px;
                height: 20px;
                animation-delay: 4s;
            }

            .circles li:nth-child(4){
                left: 40%;
                width: 60px;
                height: 60px;
                animation-delay: 0s;
                animation-duration: 18s;
            }

            .circles li:nth-child(5){
                left: 65%;
                width: 20px;
                height: 20px;
                animation-delay: 0s;
            }

            .circles li:nth-child(6){
                left: 75%;
                width: 110px;
                height: 110px;
                animation-delay: 3s;
            }

            .circles li:nth-child(7){
                left: 35%;
                width: 150px;
                height: 150px;
                animation-delay: 7s;
            }

            .circles li:nth-child(8){
                left: 50%;
                width: 25px;
                height: 25px;
                animation-delay: 15s;
                animation-duration: 45s;
            }

            .circles li:nth-child(9){
                left: 20%;
                width: 15px;
                height: 15px;
                animation-delay: 2s;
                animation-duration: 35s;
            }

            .circles li:nth-child(10){
                left: 85%;
                width: 150px;
                height: 150px;
                animation-delay: 0s;
                animation-duration: 11s;
            }
            @keyframes animate {

                0%{
                    transform: translateY(0) rotate(0deg);
                    opacity: 1;
                    border-radius: 0;
                }

                100%{
                    transform: translateY(-1000px) rotate(720deg);
                    opacity: 0;
                    border-radius: 50%;
                }


            }
            iframe {
                display: block;
                width: 100%;
                height: 700px;
                border: none;
            }
            .actualizar{
                width:20%;
            }
        </style>
    </head>

    <body >
        <header>
            <div class="nav-bg">
                <nav class="navegacion-principal contenedor"> <!--se pueden poner mas de una clase solo con un espacio-->
                    <p >B1 SOFT LATINOAMÉRICA</p>
                    <p class="text-end mt-5" style="width: 50%"><a style="color:white" href="logoutP.htm">Cerrar Sesión</a></p>
                </nav>
            </div>
        </header>
        <main>
            <div class="area">
                <ul class="circles">
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                </ul>

                <div class="row ">
                    <div class="col-sm-6 offset-sm-3">
                        <div class="card text-center mt-5">
                            <div class="card-header text-muted">
                            </div>
                            <div class="card-body">
                                <h2 class="card-title">
                                    Bienvenido
                                    <p class="text-center mt-5">
                                        <img width="200px" height="200px" src="resources/img/avatar.png">
                                    </p>
                                </h2>
                                <div class="row mt-3">
                                    <p><i class="fas fa-user " style="margin-right:10px;"></i>Postulante: ${user.nombre} ${user.apellidoPaterno} ${user.apellidoMaterno}</p>
                                </div>
                                <div class="row">
                                    <p><i class="fas fa-briefcase" style="margin-right:10px;"></i></i>Puesto Postulado: ${user.vacante}</p>
                                </div>
                                <a href="#" class="btn btn-secondary" onclick="iniciarPruebas()">Iniciar Pruebas</a>
                            </div>
                            <div class="card-footer text-muted">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <script>
            function ConfirmB1Soft(title, content) {
                return $("<div></div>").kendoConfirm({
                    title: title,
                    content: content
                }).data("kendoConfirm").open().result;
            }
            function iniciarPruebas() {
                window.ConfirmB1Soft("Iniciar Pruebas", "¿Seguro que deasas iniciar tus prueabas?").then(function () {
                    $(location).attr('href', 'pruebasPostulante.htm')
                });
            }
        </script>
    </body>

</html>