<%-- 
    Document   : registro
    Created on : 17/02/2021, 10:16:16 AM
    Author     : Yirz
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registro Postulante B1 SOFT</title>
        <link rel="stylesheet" href="<c:url value='resources/css/kendo.common-bootstrap.min.css'/>">
        <link rel="stylesheet" href="<c:url value='resources/css/kendo.bootstrap-v4.min.css'/>">

        <link rel="stylesheet" href="<c:url value='resources/css/colors.css'/>">
        <link rel="stylesheet" href="<c:url value='resources/css/all.css'/>">
        <link rel="stylesheet" href="<c:url value='resources/css/body.css'/>">
        <link rel="stylesheet" href="<c:url value='resources/css/bootstrap.min.css'/>">
        <script src="<c:url value='resources/js/jquery.min.js'/>"></script>
        <script src="<c:url value='resources/js/kendo.all.min.js'/>"></script>
        <script src="<c:url value='resources/js/kendo.es-MX.min.js'/>"></script>
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
                height:170vh;
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
            .navegacion-principal{
                display: flex;/*activa flexbox*/
                flex-direction:column;/*viene por default*/
                align-items: right;
                /*align-items: center; //Como con justify solo se alinea horizontalmente con align lo anileamos vertialmente para los dispositivos moviles*/

            }
            .navegacion-principal p{
                display: block; /*tomaran todo el espacio*/
                text-align: center;
                padding: 0; /*como margin pero más grueso*/
                color: white;
                font-weight: 700;
                font-size: 2rem;
                text-shadow: 4px 4px 4px #C3C3C3;
            }

            .nav-bg{
                background-color: #01ACBE;
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
            <div id="dialog"></div>
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
                <div class="container">
                    <div class="row">
                        <h2>
                            Bienvenido al portal de Registro
                        </h2>
                        <p>Ingrese los siguientes datos:</p>
                        <div id="validation-summary">
                        </div>
                    </div>
                    <div class="row">
                        <div class="card">
                            <div class="card-header"></div>
                            <div class="card-body">

                                <form:form id="form" action="updatePostulante.htm" method="POST" enctype="multipart/form-data">
                                    <input type="text" name="id_vacante" value="${postulante.id_vacante}" hidden="true">  
                                    <div class="row mt-5">
                                        <h3>Datos Generales:</h3>
                                        <div class="col-lg-2 col-sm-3">
                                            <label for="rfc" class="form-label">RFC</label>
                                            <input type="text" class="form-control" name="RFC" id="rfc" size="25" value="${postulante.RFC}"
                                                   placeholder="RFC" readonly required />
                                        </div>
                                        <div class="col-lg-2 col-sm-3">
                                            <label for="nombre" class="form-label">Nombre</label>
                                            <input type="text" class="form-control" name="Nombre" id="nombre" size="25" value="${postulante.nombre}"
                                                   placeholder="Nombre del aspirante" readonly required />
                                        </div>
                                        <div class="col-lg-2  col-sm-3">
                                            <label for="apellidoP" class="form-label">Apellido Paterno</label>
                                            <input type="text" class="form-control" name="ApPaterno" idApPaterno="apellidoP" size="25" value="${postulante.apPaterno}"
                                                   placeholder="Apellido Paterno" readonly required />
                                        </div>
                                        <div class="col-lg-2  col-sm-3">
                                            <label for="apellidoM" class="form-label">Apellido Materno</label>
                                            <input type="text" class="form-control" name="ApMaterno" id="apellidoM" size="25" value="${postulante.apMaterno}"
                                                   placeholder="Apellido Materno" readonly required />
                                        </div>
                                        <div class="col-lg-2  col-sm-3">
                                            <label for="Correo" class="form-label">Correo</label>
                                            <input type="email" class="form-control" name="Correo" id="Correo" size="25" placeholder="Correo" value="${postulante.correo}"
                                                   readonly required />
                                        </div>
                                        <div class="col-lg-3 col-sm-4 mt-3 mb-3">
                                            <button type="button" id="ModiFicar" class="btn btn-primary mt-2">Modificar</button>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <label for="Edad" class="form-label">Edad</label>
                                            <input type="number" class="form-control" name="Edad" id="Edad" size="25" required />
                                        </div>
                                        <div class="col-sm-4">
                                            <label for="nss" class="form-label">Número de Seguro Social</label>
                                            <input type="text" class="form-control" name="nss" id="nss" size="25"/>
                                        </div>
                                        <div class="col-sm-4">
                                            <label for="CurP" class="form-label">CURP</label>
                                            <input type="text"  class="form-control" name="CurP" id="CurP" size="25" required />
                                        </div>
                                        <div class="col-sm-4">
                                            <label for="telefono" class="form-label">Tel&eacute;fono</label>
                                            <input type="tel"  class="form-control" name="tel" id="tel" size="25" required />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <h3>Direcci&oacute;n:</h3>
                                        <div class="col-sm-4">
                                            <label for="cp" class="form-label">C&oacute;digo Postal</label>
                                            <input type="text"  class="form-control" name="cp" id="cp" size="25" required />
                                        </div>
                                        <div class="col-sm-4">
                                            <label for="estado" class="form-label">Estado</label>
                                            <input type="text"  class="form-control" name="estado" id="estado" size="25" required />
                                        </div>
                                        <div class="col-sm-4">
                                            <label for="municipio" class="form-label">Municipio</label>
                                            <input type="text"  class="form-control" name="municipio" id="municipio" size="25" required />
                                        </div>
                                        <div class="col-sm-4">
                                            <label for="colonia" class="form-label">Colonia</label>
                                            <input class="form-control" id="colonia" name="colonia" aria-label="Colonia" required >
                                            </input>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <h3>Seguridad:</h3>
                                        <div class="col-sm-4">
                                            <label for="contraseña" class="form-label">Contraseña</label>
                                            <input type="password" class="form-control" name="contrasena" id="contrasena" size="25" required />
                                        </div>
                                        <div class="col-sm-4">
                                            <label for="Conficontra" class="form-label">Confirmar Contrase&ncaron;a</label>
                                            <input type="password" class="form-control" name="password-confirm" id="Conficontra" size="25" required "/>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <h3>Escolaridad:</h3>
                                        <div class="col-sm-6">
                                            <label for="Institu" class="form-label">Institucion</label>
                                            <input type="text" id="Institu" name="Institu" class="form-control" required />
                                        </div>
                                        <div class="col-sm-6">
                                            <label for="grado" class="form-label">Grado</label>
                                            <input type="text" id="grado" name="grado" class="form-control" required />
                                        </div>
                                    </div>

                                </div>
                                <div class="row">
                                    <h3>Informaci&oacute;n Adicional:</h3>
                                    <div class="col-sm-12 mt-3">
                                        <br><h6 style="text-align: justify;">Agrega su CV en formato PDF; recuerda que debe estar actualizado y no debe ser 
                                            mayor a 2 hojas 
                                        </h6>
                                        <input type="file"
                                               accept=".pdf" name="archivos_pdf" class="form-control" id="archivos_pdf" required >
                                        </p>
                                    </div>
                                    <div class="col-sm-12 mt-3">
                                        <h6 style="text-align: justify;">Para nosotros es muy importante conocerte por lo que te pedimos agruegues un video en formato MP4
                                            donde puedas presentarte y puedas hablarnos no mas de 1 minuto de ti y del porque deberiamos contratarte;se original y hablanos de que tienes de diferente del resto de candidatos.
                                        </h6>
                                        <input type="file"
                                               accept=".MPG,.AVI,.MOV,.MP4" name="videos" class="form-control" id="videos" required >
                                    </div>
                                    <div class="col-sm-12 mt-3">
                                           <h6 style="text-align: justify;"> Deberas adjuntar tus dibujos de las pruebas proyectivas en un solo archivo PDF
                                                </h6>
                                        <input type="file"
                                               accept=".pdf" name="imagenes" class="form-control" id="imagenes" required >
                                    </div>
                                </div>
                                <div class="row mt-3 mb-3">
                                    <div class="col-4 offset-4">
                                        <button type="submit" id="Guardar" style="width: 100%;"
                                                class="btn btn-secondary">Guardar</button>
                                    </div>

                                </div>
                            </form:form>
                        </div>
                        <div class="card-footer"></div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <script>
      
        $(document).ready(function () {
            var validator = $("#form").kendoValidator({
            rules: {
            verifyPasswords: function (input) {
            var ret = true;
                    if (input.is("[name=password-confirm]")) {
            ret = input.val() === $("#contrasena").val();
            }
            return ret;
            }
            },
                    messages: {
                    verifyPasswords: "Contraseñas no coinciden",
                            required: "Este campo es requerido",
                            upload: "Se necesita agregar los campos de video y cv"
                    }
            }).data("kendoValidator");
            dialog = $("#dialog").kendoDialog({
                width: "450px",
                visible: false,
                title: "Registro",
                closable: true,
                modal: true,
                content: "<form id='kendoform'></form>",
                actions: [
                    {
                        text: 'Aceptar',
                        action: function (e) {
                            var form = $("#kendoform");
                            var validator = form.kendoValidator().data("kendoValidator");
                            if (validator.validate()) {
                                /*
                                 Enviar dato primero al back para modificar base de datos 
                                 */
                                var datos = form.serializeArray();
                                $('#rfc').val(datos[0].value);
                                $('#nombre').val(datos[1].value);
                                $('#apellidoP').val(datos[2].value);
                                $('#apellidoM').val(datos[3].value);
                                $('#Correo').val(datos[4].value);
                            } else {
                                return false;
                            }
                        },
                        primary: true
                    },
                    {text: 'Cancelar'},
                ],
            });
            $("#kendoform").kendoForm({
                items: [
                    {
                        field: "rfc",
                        label: "RFC",
                        validation: {required: true}
                    },
                    {
                        field: "nombre",
                        label: "Nombre",
                        validation: {required: true}
                    },
                    {
                        field: "ApellidoP",
                        label: "Apellido Paterno",
                        validation: {required: true}
                    },
                    {
                        field: "ApellidoM",
                        label: "Apellido Materno",
                        validation: {required: true}
                    },
                    {
                        field: "Correo",
                        label: "Correo Electronico",
                        validation: {required: true}
                    }


                ],
                buttonsTemplate: ""

            })

            $("#ModiFicar").kendoButton({
                click: openDialog
            });
        });
        function openDialog(e) {
            $("#dialog").data("kendoDialog").open();
        }
        /*$('#cp').on('change', function () {
            $.ajax({
                url: "https://apisgratis.com/api/codigospostales/v2/colonias/cp/?valor=" + $('#cp').val(),
                dataType: 'json',
                success: function (resp) {
                    console.log(resp)
                    
                        $('#municipio').val(resp[0].Municipio);
                        $('#estado').val(resp[0].Entidad);
                        $('#colonia').empty();
                        for (var i = 0; i < resp.length; i++) {
                            $('#colonia').append($('<option>',
                                    {
                                        value: resp[i].Colonia,
                                        text: resp[i].Colonia
                                    }));
                        }
                     
                },
                error: function (msg) {
                    $('#municipio').val("")
                    $('#estado').val("")
                    $('#colonia').empty();
                    kendo.alert("Error al Código Postal.");
                }
            });
        });*/

    </script>
</body>

</html>
</body>