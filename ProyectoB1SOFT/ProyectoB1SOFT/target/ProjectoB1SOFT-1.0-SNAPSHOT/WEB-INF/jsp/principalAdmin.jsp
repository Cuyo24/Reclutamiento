<%-- 
    Document   : principalAdmin
    Created on : 10/02/2021, 12:24:57 PM
    Author     : Yirz
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <c:choose>
        <c:when test="${user==null}">
            <%
                response.sendRedirect(request.getContextPath().concat("/sesionRequired.htm"));
            %>
        </c:when>
    </c:choose>
    <c:if test='${rol!="administrador"}'>
        <%
            response.sendRedirect(request.getContextPath().concat("/principalPostulante.htm"));
        %>
    </c:if>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home Admin</title>
        <link rel="stylesheet" href="<c:url value='resources/css/kendo.common-bootstrap.min.css'/>">
        <link rel="stylesheet" href="<c:url value='resources/css/kendo.bootstrap-v4.min.css'/>">
        <link rel="stylesheet" href="<c:url value='resources/css/bootstrap.min.css'/>">
        <link rel="stylesheet" href="<c:url value='resources/css/colors.css'/>">
        <link rel="stylesheet" href="<c:url value='resources/css/all.css'/>">
        <link rel="stylesheet" href="<c:url value='resources/css/body.css'/>">
        <link rel="stylesheet" href="<c:url value='resources/css/style.css'/>">

        <script src="<c:url value='resources/js/jquery.min.js'/>"></script>
        <script src="<c:url value='resources/js/kendo.all.min.js'/>"></script>
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
                height: 600px;
                border: none;
            }
            .actualizar{
                width:20%;
                font-size: 0.9em;
            }
        </style>
    </head>

    <body>
        <header>
            <header>
                <div class="nav-bg">
                    <nav class="navegacion-principal contenedor"> <!--se pueden poner mas de una clase solo con un espacio-->
                        <p>B1 SOFT LATINOAMÉRICA</p>
                    </nav>
                </div>

            </header>
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
                 
            <div class="row">
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#Home" type="button" role="tab" aria-controls="home" aria-selected="true">Incio</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#Vacante" type="button" role="tab" aria-controls="profile" aria-selected="false">Vacante</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#Postulante" type="button" role="tab" aria-controls="contact" aria-selected="false">Postulante</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#Invitacion" type="button" role="tab" aria-controls="contact" aria-selected="false">Invitaci&oacute;n</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#Pruebas" type="button" role="tab" aria-controls="contact" aria-selected="false">Pruebas</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#AddAdmin" type="button" role="tab" aria-controls="contact" aria-selected="false">Agregar Admin</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#Personal" type="button" role="tab" aria-controls="contact" aria-selected="false">Personal Admin</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="logout-tab" onclick="logout()" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="false">Cerrar Sesion</button>
                    </li>
                    <li class="nav-item" role="presentation">
                       <button class="nav-link" id="contact-tab" onclick="prueba()" data-bs-toggle="tab" data-bs-target="#Prueba" type="button" role="tab" aria-controls="contact" aria-selected="false">PRUEBA</button>
                    </li>
                </ul>
            </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="tab-content" id="pills-tabContent">
                            <div class="tab-pane fade show active" id="Home" role="tabpanel" aria-labelledby="pills-home-tab">
                                <div class="row">
                                    <h2 class="text-center mt-5 ">Bienvenido</h2>
                                    <p class="text-center mt-5">
                                        <img width="200px" height="200px" src="resources/img/avatar.png">
                                    </p>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="Vacante" role="tabpanel" aria-labelledby="pills-profile-tab">
                                <div class="col-sm-12">
                                    <button class="btn btn-secondary mt-3 actualizar" onclick="refresh('vacante')"> Actualizar Tabla <i class="fas fa-sync-alt"></i> </button>
                                    <iframe id="vacante" src="vacante.htm"></iframe>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="Postulante" role="tabpanel" aria-labelledby="pills-contact-tab">
                                <div class="col-sm-12">
                                    <div class="container-fluid">
                                        <button class="btn btn-secondary mt-3 actualizar" onclick="refresh('postulante')"> Actualizar Tabla <i class="fas fa-sync-alt"></i> </button>
                                        <iframe id="postulante" src="postulante.htm"></iframe>
                                    </div>
                                </div>

                            </div>
                            <div class="tab-pane fade" id="Invitacion" role="tabpanel" aria-labelledby="pills-contact-tab">
                                <div class="col-sm-12">
                                    <div >
                                        <button class="btn btn-secondary mt-3 actualizar" onclick="refresh('invitacion')"> Actualizar Tabla <i class="fas fa-sync-alt"></i> </button>
                                        <iframe id="invitacion" src="invitacion.htm"></iframe>
                                    </div>>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="Pruebas" role="tabpanel" aria-labelledby="pills-contact-tab">
                                <div class="col-sm-12">
                                    <div >
                                        <button class="btn btn-secondary mt-3 actualizar" onclick="refresh('pruebas')"> Actualizar Tabla <i class="fas fa-sync-alt"></i> </button>
                                        <iframe id="pruebas" src="crearPruebasAdmin.htm"></iframe><!-- comment -->
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="AddAdmin" role="tabpanel" aria-labelledby="pills-contact-tab">
                                <div class="col-sm-12">
                                    <div >
                                        <iframe src="AddAdmin.htm"></iframe>
                                    </div>

                                </div>>
                            </div>
                            <div class="tab-pane fade" id="Personal" role="tabpanel" aria-labelledby="pills-contact-tab">
                                <div class="col-sm-12">
                                    <div >
                                        <button class="btn btn-secondary mt-3 actualizar" onclick="refresh('personal')"> Actualizar Tabla <i class="fas fa-sync-alt"></i> </button>
                                        <iframe id="personal" src="personal.htm"></iframe>
                                    </div>

                                </div>
                            </div>
                            <div class="tab-pane fade" id="prueba" role="tabpanel" aria-labelledby="pills-contact-tab">
                                <div class="col-sm-12">
                                    <div >
                                        <button class="btn btn-secondary mt-3 actualizar" onclick="refresh('prueba')"> Actualizar Tabla <i class="fas fa-sync-alt"></i> </button>
                                        <iframe id="prueba" src="prueba.htm"></iframe>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </main>


    </body>
    <script>

        function logout() {
            $(location).attr('href', "logout.htm")
        }
        function refresh(frame) {
            document.getElementById(frame).contentDocument.location.reload(true);
        }
        
        function prueba(){
            $(location).attr('href', "prueba.htm")
        }
    </script>

</html>
