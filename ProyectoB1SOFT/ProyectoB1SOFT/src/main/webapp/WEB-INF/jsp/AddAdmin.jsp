<%-- 
    Document   : AddAdmin
    Created on : 10/02/2021, 01:27:01 PM
    Author     : Yirz
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title></title>
        <link rel="stylesheet" href="<c:url value='resources/css/kendo.common-bootstrap.min.css'/>">
        <link rel="stylesheet" href="<c:url value='resources/css/kendo.bootstrap-v4.min.css'/>">
        <link rel="stylesheet" href="<c:url value='resources/css/bootstrap.min.css'/>">
        <link rel="stylesheet" href="<c:url value='resources/css/colors.css'/>">
        <link rel="stylesheet" href="<c:url value='resources/css/all.css'/>">
        <link rel="stylesheet" href="<c:url value='resources/css/body.css'/>">

        <script src="<c:url value='resources/js/jquery.min.js'/>"></script>
        <script src="<c:url value='resources/js/kendo.all.min.js'/>"></script>
        <script src="<c:url value='resources/js/pooper.min.js'/>"></script>
        <script src="<c:url value='resources/js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='resources/js/all.min.js'/>"></script>
    </head>
    <body>
        <main>
            <div class="container">
                <div class="row mt-3">
                    <form id="AddPersonal" action="createAdmin.htm" method="POST" ></form>
                    
                </div>
            </div>
        </main>
        <script>

            $(document).ready(function () {
                $('#AddPersonal').kendoForm({
                    validatable: {validateOnBlur: false},
                    orientation: "vertical",
                    items: [
                        {
                            field: "Nombre",
                            label: "Nombre",
                            validation: {required: true}
                        },
                        {
                            field: "ApPaterno",
                            label: "Apellido Paterno",
                            validation: {required: true}
                        },
                        {
                            field: "ApMaterno",
                            label: "Apellido Materno",
                            validation: {required: true}
                        },
                        {
                            field: "idEmpleado",
                            label: "ID Empleado",
                            validation: {required: true}
                        },
                        {
                            field: "Correo",
                            label: "Correo",
                            validation: {required: true, email: true}
                        },
                        {
                            field: "Password",
                            label: "Contraseña",
                            validation: {required: true}
                        }
                    ],
                    buttonsTemplate: `
                        <div class='d-flex flex-column align-items-center' style='width: 100%'>
                            <a id="GenPassword"  onClick="GenPassword();" class='btn k-button btn-primary mb-3 align-self-start' style='width:30%'>Generar Contraseña</a>
                            <input type="submit" class='btn btn-secondary' style='width: 50%'value='Guardar'/>
                        </div>`
                });

            });
            function GenPassword() {
                var abecedario = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".", "-", "_", "$", "&", "#", "@"];
                var numeroAleatorio;
                var data = "";
                for (var i = 0; i < 8; i++) {
                    numeroAleatorio = parseInt(Math.random() * abecedario.length);
                    data += abecedario[numeroAleatorio];
                }
                $('#Password').val(data);
            }
            function AlertB1Soft(title, content) {
                $("<div></div>").kendoAlert({
                    title: title,
                    content: content
                }).data("kendoAlert").open();
            }
            function ConfirmB1Soft(title, content) {
                return $("<div></div>").kendoConfirm({
                    title: title,
                    content: content
                }).data("kendoConfirm").open().result;
            }
         
      $('#AddPersonal').submit(function(event) {
                event.preventDefault();
                var validator = $('#AddPersonal').kendoValidator().data("kendoValidator");
                if (validator.validate()){
                    window.ConfirmB1Soft("Nuevo Personal", "¿Deseas guardar el personal ?").then(function () {
                        $.ajax({
                            url:"createAdmin.htm",
                            method:"POST",
                            data: $('#AddPersonal').serialize(),
                            dataType:"json",
                            success: function (data) {
                                console.log(data);
                                if(data!=null){
                                     AlertB1Soft("Personal","Guardado Correctamente");
                                }
                            },
                            error: function (mgs) {
                        
                            }
                        })
                    });
                }
                
            });
            

        
        </script>
    </body>

</html>