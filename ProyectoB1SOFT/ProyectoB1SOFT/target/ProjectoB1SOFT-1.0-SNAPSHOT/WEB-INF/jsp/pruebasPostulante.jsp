<%-- 
    Document   : pruebasPostulante
    Created on : 12/02/2021, 10:55:25 AM
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
        <title>Pruebas B1 SOFT</title>
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
            .btn{
                width: 40%;
                color: #fff ;
                margin: 15px;
                padding: 15px;
                height: auto;
                cursor: pointer;
                font-size: 0.9em;
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
                <div class="row">
                    <div class="col-sm-7 offset-sm-2">
                        <div class="mt-3" id="pruebasTable"></div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-3 mt-5">
                        <a class="btn btn-primary" href="principalPostulante.htm">Regresar</a>
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
            $(document).ready(function () {
                var pruebas = [];
                $.ajax({
                    url: "readVacante1.htm",
                    method: "GET",
                    data: "id=${user.id_vacante}&rfc=${user.RFC}",
                    dataType: "json",
                    async: false,
                    success: function (data) {
                        console.log(data);
                        for (var i = 0; i < data.length; i++) {
                            pruebas.push({idPrueba: data[i].Id_prueba, Nombre: data[i].Nombre_prueba});
                        }
                        // $("#pruebasTable").data("kendoGrid").dataSource.read();
                    },
                    error: function (msg) {
                        console.log(msg);
                    }
                });
                $('#pruebasTable').kendoGrid({
                    dataSource: {
                        data: pruebas,
                        schema: {
                            model: {
                                fields: {
                                    idPrueba: {type: 'integer'},
                                    Nombre: {type: "string"},

                                }
                            }
                        },
                        pageSize: 20
                    },
                    height: 350,
                    scrollable: true,
                    sortable: true,
                    noRecords: {template: "Sin pruebas por realizar"},
                    columns: [
                        {field: "Nombre", title: "Nombre"},
                        {command:
                                    [{
                                            name: "Empezar",
                                            className: "btn",
                                            click: function empezarPrueba(e) {
                                                e.preventDefault();
                                                var dataItem = this.dataItem($(e.currentTarget).closest("tr"));
                                                //console.log(dataItem);
                                                window.ConfirmB1Soft("Iniciar Prueba", "¿Seguro que deasas iniciar la prueba " + dataItem.Nombre + " ?").then(function () {
                                                    $(location).attr('href', "pruebas.htm?id=" + dataItem.idPrueba)
                                                });
                                            },
                                            text: "Empezar prueba"
                                        }]
                        }
                    ]
                });
            });

        </script>
    </body>

</html