<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>B1 SOFT Reclutamiento</title>
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
</head>

<body >
     <header>
        <div class="nav-bg">
        <nav class="navegacion-principal contenedor"> <!--se pueden poner mas de una clase solo con un espacio-->
            <p>B1 SOFT LATINOAMÉRICA</p>
		</nav>
    </div>
         
         <img class="wave" src="resources/img/fondolog.png">
    </header>
    <main>
        
        <div class="container">
            <div class="img">
			<img src="resources/img/bg.png">
		</div>
            <div class="login-content">
                
                <div class="col-md-8 col-md-offset-2">
                    
                        <div class=" mt-2 row text-center">
                            <div class="col-12">
                                <img width="100px" height="100px" src="resources/img/avatar.png">
                                <h2 class="title">Bienvenido</h2>
                            </div>
                        </div>
                        
                        <div class="card-body">
                            <form id="login" method="post" action="index.htm"></form>
                            <a id="PasswordNew" href="#" onclick="OpenDialog();">Olvidaste tu contraseña?</a>
                            <c:if test="${error!= null}">
                                <div class="alert alert-danger" role="alert">${error}</div>
                            </c:if>
                        </div>
                        
                    
                </div>
           
        </div>
        <div id="PasswordDialog">
            <form id="PasswordForm"></form>
        </div>
    </main>
    <script>
        
        $(document).ready(function () {
            $('#login').kendoForm({
                validatable: { validationSummary: true },
                orientation: "vertical",
                items: [
                    {
                        field: "Correo",
                        label: "Correo",
                        validation: { required: true }
                    },
                    {
                        field: "Password",
                        label: "Contraseña",
                        validation: { required: true },
                        editor: function (container, options) {
                            container.append($("<input type='password' class='k-textbox k-valid' id='Password' name='Password' title='Password' required='required' autocomplete='off' aria-labelledby='Password-form-label' data-bind='value:Password' aria-describedby='Password-form-hint'>"));
                        }
                    },
                ],
                buttonsTemplate: "<input type='submit' class='btn btn-secondary' style='width: 100%' value='Iniciar'/>"
            });
        });

        function OpenDialog() {
            var dialog = $('#PasswordDialog');
            var form =  $('#PasswordForm');
            form.empty();
            form.kendoForm({
                validatable: { validationSummary: true },
                orientation: "vertical",
                items: [
                    {
                        field: "Email",
                        label: "Correo Electronico",
                        validation: { required: true }
                    },
                ],
                buttonsTemplate:""
            })
            dialog.kendoDialog({
                width: "450px",
                title: "Recuperación de Contraseña",
                modal: true,
                animation: {
                    open:{
                        effects: "fade:in"
                    },
                    close: {
                      effects: "fade:out"
                    }
                },
                actions:[
                    {
                        text:'Aceptar',
                        action: function(e){
                            var validator = form.kendoValidator().data("kendoValidator");
                            if(validator.validate()){
                                $.ajax({
                                    url:"recuperarContrasena.htm",
                                    method:"POST",
                                    data:form.serialize(),
                                    dataType:"json",
                                    success: function (data) {
                                        window.console.log(data);
                                        if(data.valid==1){
                                            kendo.alert("Se te ha enviado un correo electronido donde obtendras tu contraseña nuevamente");
                                        }
                                        else{
                                            kendo.alert("Error al recuperar contraseña");
                                        }
                                    },
                                    error: function (msg) {
                                        kendo.alert("Error al recuperar contraseña");
                                    }
                                })
                            }
                            else{
                                return false;
                            }
                        },
                        primary:true,
                    },
                    {text:'Cancelar'}                ]
                
            });
           
            dialog.data("kendoDialog").open();

        }
    </script>
</body>

</html>