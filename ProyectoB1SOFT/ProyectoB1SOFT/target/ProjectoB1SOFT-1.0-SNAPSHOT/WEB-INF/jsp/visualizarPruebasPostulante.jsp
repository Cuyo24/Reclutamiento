<%-- 
    Document   : visualizarPruebasPostulante
    Created on : 1/04/2021, 03:30:33 PM
    Author     : Yirz
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="<c:url value='resources/css/kendo.common-bootstrap.min.css'/>">
        <link rel="stylesheet" href="<c:url value='resources/css/kendo.bootstrap-v4.min.css'/>">
        <link rel="stylesheet" href="<c:url value='resources/css/bootstrap.min.css'/>">
        <link rel="stylesheet" href="<c:url value='resources/css/colors.css'/>">
        <link rel="stylesheet" href="<c:url value='resources/css/all.css'/>">
        <link rel="stylesheet" href="<c:url value='resources/css/body.css'/>">

        <script src="<c:url value='resources/js/jquery.min.js'/>"></script>
        <script src="<c:url value='resources/js/kendo.all.min.js'/>"></script>
        <script src="<c:url value='resources/js/kendo.culture.es-MX.min.js'/>"></script>
        <script src="<c:url value='resources/js/pooper.min.js'/>"></script>
        <script src="<c:url value='resources/js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='resources/js/all.min.js'/>"></script>
        <style>
            div.text-table{
                width:200px;
                white-space: nowrap;
                text-overflow: ellipsis;
                overflow: hidden;
            }
        </style>
        <style>
            body { Background: transparent; }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="card">
                <div class="card-header">
                    <h5> Postulante :</h5>
                    <h6>${postulante.nombre} ${postulante.apellidoPaterno} ${postulante.apellidoMaterno}</h6>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <table id="pruebas" class="table table-responsive">
                                <thead>
                                    <tr>
                                        <th scope="col">Prueba</th>
                                        <th scope="col">Calificación</th>
                                        <th scope="col">Respuestas</th>
                                        <th scope="col">Calificación Automatica</th>
                                        <th scope="col"></th>
                                        <th scope="col"></th>
                                    </tr>
                                <tbody>
                                    <c:forEach items="${postulante.resultados}" var="resultado">
                                        <tr>
                                            <td>${resultado.prueba}</td>
                                            <td>${resultado.calif}</td>
                                            <td><div class="text-table">${resultado.respuestas}</div></td>
                                            <c:choose>
                                                <c:when test="${resultado.autocalif}">
                                                <td><input class="switch" readonly checked/></td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td><input class="switch" readonly /></td>
                                                </c:otherwise>
                                            </c:choose>
                                           
                                            <td><button class="btn btn-primary copiar">Copiar</button></td>
                                            <td><a class="btn btn-primary" href="visualizarRespuestas.htm?rfc=${postulante.RFC}&idPrueba=${resultado.idPrueba}">Ver Prueba</a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                                </thead>
                            </table>
                        </div>

                    </div>
                    <div class="row mt-3">
                        <div class="col-sm-6">
                            <a class="btn btn-primary" href="visualizar.htm?rfc=${postulante.RFC}">Regresar</a>
                        </div>
                    </div>

                </div>

            </div>
        </div>
        <script>
            $("#pruebas").on('click', '.copiar', function () {
                var currentRow = $(this).closest("tr");
                var respuestas = currentRow.find("td:eq(2)");
                var text = respuestas.text();
                var cadena = text.replaceAll(",", "");
                var $temp = $("<input>");
                $("body").append($temp);
                $temp.val(cadena).select();
                document.execCommand("copy");
                $temp.remove();
                alert("cadena copiada")
            });
            $(document).ready(function (){
                $(".switch").kendoSwitch();
            })
        </script>
    </body>
</html>
