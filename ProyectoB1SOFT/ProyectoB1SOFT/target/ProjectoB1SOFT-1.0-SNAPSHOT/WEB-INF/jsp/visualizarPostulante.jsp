<%-- 
    Document   : visualizarPostulante.jsp
    Created on : 30/03/2021, 10:11:08 AM
    Author     : Yirz
--%>



<%@page import="com.dropbox.core.v2.sharing.ListSharedLinksResult"%>
<%@page import="com.b1soft.util.JavaDropBox"%>
<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="org.apache.commons.codec.binary.StringUtils"%>
<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@page import="com.b1soft.dto.PostulanteVDto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Visualizar Postulante B1 SOFT</title>
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
        <script type="text/javascript" src="https://www.dropbox.com/static/api/2/dropins.js" id="dropboxjs" data-app-key="yy6yzz0n4nufa9m"></script>

        <style>
            body { Background: transparent; }
        </style>
    </head>
    <body>

        <%
            JavaDropBox jdb = new JavaDropBox();
            PostulanteVDto dto = (PostulanteVDto) request.getAttribute("postulante");

        %>

        <div class="container">
            <div class="card mt-5">
                <div class="card-body">
                    <div class="row">
                        <h3>
                            Postulante:
                        </h3>
                        <h5>
                            <c:out value="${postulante.entidad.nombre}"/>
                            <c:out value="${postulante.entidad.apellidoPaterno}"/>
                            <c:out value="${postulante.entidad.apellidoMaterno}"/>
                        </h5>
                    </div>
                    <div class="row">
                        <div class="col-sm-4">
                            <label for="rfc" class="form-label">RFC</label>
                            <input type="text" class="form-control" name="RFC" id="rfc" size="25" value="${postulante.entidad.RFC}"  readonly  />
                        </div>
                        <div class="col-sm-4">
                            <label for="rfc" class="form-label">Correo</label>
                            <input type="text" class="form-control" name="RFC" id="rfc" size="25" value="${postulante.entidad.correo}"  readonly  />
                        </div>
                        <div class="col-sm-4">
                            <label for="rfc" class="form-label">Edad</label>
                            <input type="text" class="form-control" name="RFC" id="rfc" size="25" value="${postulante.entidad.edad}"  readonly  />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <label for="rfc" class="form-label">N&uacute;mero de Seguro Social</label>
                            <input type="text" class="form-control" name="RFC" id="rfc" size="25" value="${postulante.entidad.seguroSocial}"  readonly  />
                        </div>
                        <div class="col-sm-6">
                            <label for="rfc" class="form-label">CURP</label>
                            <input type="text" class="form-control" name="RFC" id="rfc" size="25" value="${postulante.entidad.CURP}"  readonly  />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <label for="rfc" class="form-label">Tel&eacute;fono</label>
                            <input type="text" class="form-control" name="RFC" id="rfc" size="25" value="${postulante.entidad.TELEFONO}"  readonly  />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-7">
                            <label for="rfc" class="form-label">C&oacute;digo Postal</label>
                            <input type="text" class="form-control" name="RFC" id="rfc" size="25" value="${postulante.entidad.CP}"  readonly  />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-4">
                            <label for="rfc" class="form-label">Estado</label>
                            <input type="text" class="form-control" name="RFC" id="rfc" size="25" value="${postulante.entidad.estado}"  readonly  />
                        </div>
                        <div class="col-sm-4">
                            <label for="rfc" class="form-label">Municipio</label>
                            <input type="text" class="form-control" name="RFC" id="municipio" size="25" value="${postulante.entidad.municipio}"  readonly  />
                        </div>
                        <div class="col-sm-4">
                            <label for="rfc" class="form-label">Colonia</label>
                            <input type="text" class="form-control" name="RFC" id="rfc" size="25" value="${postulante.entidad.colonia}"  readonly  />
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <label for="rfc" class="form-label">Instituto</label>
                            <input type="text" class="form-control" name="RFC" id="rfc" size="25" value="${postulante.entidad.institucion}"  readonly  />
                        </div>
                    </div>
                    <c:choose>
                        <c:when test="${postulante.entidad.CV!=null && postulante.entidad.video!=null}">
                            <div class="row mt-3">
                                <div class="col-sm-6 offset-3">
                                    <a 
                                        href="${postulante.entidad.video}"
                                        class="dropbox-embed"
                                        ></a>
                                </div>    
                            </div>
                            <div class="row mt-3">
                                <div class="col-sm-4">
                                    <a class="btn btn-primary" target="_blank" href="${postulante.entidad.CV}" title='Visualizar PDF'>Vizualizar CV</a>
                                </div>    
                            </div>
                                 <div class="row mt-3">
                                <div class="col-sm-4">
                                    <a class="btn btn-primary" target="_blank" href="${postulante.entidad.imagen}" title='Visualizar Pruebas proyectivas'>Pruebas Proyectivas</a>
                                </div>    
                            </div>
                        </c:when>
                    </c:choose>
                    <div class="row mt-3">
                        <div class="col-sm-6">
                            <a class="btn btn-primary"  href="visualizarPruebasPostulante.htm?rfc=${postulante.entidad.RFC}" >Visualizar Respuestas Pruebas</a>
                        </div>  
                        <div class="col-sm-6">
                            <a class="btn btn-primary"  href="postulante.htm" >Regresar</a>
                        </div>
                        <div class="col-sm-6">
                            <a class="btn btn-primary" id="Modificar"  >Modificar</a>
                        </div>
                    </div>
                </div>  
            </div>
        </div>
        <div id="EditDialog"> </div>
                        
                        
        <script>
            $(document).ready(function () {
                $("#municipio").val(utf8_encode("${postulante.entidad.municipio}"));
            });
            
            function onOpenformulario() {
                        var dialog = $('#EditDialog');
                        dialog.empty();
                        dialog.append("<form id='exampleform'</form>");
                        var form = $('#exampleform');
                        form.kendoForm({
                            formData: {
                                RFC:"${postulante.entidad.RFC}",
                                Nombre:"${postulante.entidad.nombre}",
                                ApellidoPaterno:"${postulante.entidad.apellidoPaterno}",
                                ApellidoMaterno:"${postulante.entidad.apellidoMaterno}",
                                                Correo:"${postulante.entidad.correo}"    
                            },
                            layout: "grid",
                            grid: {
                                cols: 1,
                                gutter: 20
                            },
                            buttonsTemplate: "",

                            items: [
                                {
                                    type: "group",
                                    label: "Datos Generales",
                                    layout: "grid",
                                    grid: { cols: 1, gutter: 5 },
                                    
                                    items: [
                                        {
                                            field: "RFC",
                                            label: "RFC:",
                                            validation: { readonly:true }
                                        },
                                        {
                                            field: "Nombre",
                                            label: "Nombre:",
                                            validation: { required: true }
                                        },
                                        {
                                            field: "ApellidoPaterno",
                                            label: "Apellido Paterno",
                                            validation: {
                                                required: true
                                               
                                            }
                                        },
                                        {
                                            field: "ApellidoMaterno",
                                            label: "Apellido Materno",
                                            validation: {
                                                required: true
                                               
                                            }
                                        },
                                        {
                                            field: "Correo",
                                            label: "Correo",
                                            validation: {
                                                type: "email",
                                                required: true,
                                                email: true
                                               
                                            }
                                        }
                                    ]
                                },

                            ],
                        });

                        dialog.kendoDialog({
                            width: "400px",
                            title: "Modificar",
                            modal: true,
                            
                            animation: {
                                open: {
                                    effects: "fade:in"
                                },
                                close: {
                                    effects: "fade:out"
                                }
                            },
                            actions: [

                                { text: 'Guardar', primary: true }]
                        });
                        dialog.data("kendoDialog").open();
                    }
        

                    $('#Modificar').click(function () {
                            onOpenformulario();
                        });
        
            
        </script>
    </body>
</html>
