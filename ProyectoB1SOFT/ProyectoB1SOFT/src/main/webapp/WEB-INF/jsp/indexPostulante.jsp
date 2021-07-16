<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- Compiled and minified Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<!-- Minified JS library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Compiled and minified Bootstrap JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
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
        <link rel="stylesheet" href="<c:url value='resources/css/index.css'/>">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >


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

    <body>
    <header>
        <div class="nav-bg">
        <nav class="navegacion-principal contenedor"> <!--se pueden poner mas de una clase solo con un espacio-->
            <p>B1 SOFT LATINOAMÉRICA</p>
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
    <section class="login-block">
        <div class="container">
        <div class="row">
            <div class="col-md-4 login-sec">
                <h2 class="text-center">Login</h2>
                <div class="card-body">
                    <form id="login" method="post" action="indexPostulante.htm"></form>
                    <a id="PasswordNew" href="#" onclick="OpenDialog();" style="color:white;">¿Olvidaste tu contraseña?</a>
                            <c:if test="${error!= null}">
                                <div class="alert alert-danger" role="alert">${error}</div>
                            </c:if>
                            
                </div>
            </div>
           
        <div class="col-md-8 banner-sec">
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                    <li data-target="#myCarousel" data-slide-to="3"></li>
                </ol>
            
                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                    <div class="item active">
                        <img align = "left-top" src="https://static.pexels.com/photos/33972/pexels-photo.jpg" alt="">
                        <div class="carousel-caption">
                            <h3>B1 SOFT LATINOAMERICA</h3>
                            <p>Creada en 2008, con el claro objetivo de brindar
                              soluciones al entorno de las transacciones
                              electrónicas, posicionándose rápidamente en el
                              sector corporativo como un socio estratégico en
                              soluciones fiscales
                             </p>
                        </div>
                    </div>
              
                    <div class="item">
                        <img src="https://images.pexels.com/photos/7097/people-coffee-tea-meeting.jpg" alt="">
                        <div class="carousel-caption">
                            <h3>MISIÓN</h3>
                            <p>Brindar soluciones integrales a nuestros
                              clientes y proyectos nacionales e
                              internacionales, capacitándonos y utilizando
                              tecnología de desarrollo software para
                              aplicaciones móviles y de escritorio de última
                              generación que nos permitan afianzarnos
                              como la mejor solución tecnológica a nivel
                              nacional con reconocimiento y operaciones
                              internacionales.</p>
                        </div>
                    </div>
                    
                    <div class="item">
                        <img src="https://images.pexels.com/photos/872957/pexels-photo-872957.jpeg" alt="">
                        <div class="carousel-caption">
                            <h3>VISIÓN</h3>
                            <p>Evolucionar de una respetada y confiable
                              compañía que ofrece soluciones tecnológicas,
                              a ser la mejor alternativa dentro del giro TI
                              para dar soluciones tecnológicas integrales a
                              cada uno de nuestros clientes y proyectos
                              nacionales e internacionales, atendiendo
                              puntualmente a sus necesidades específicas,
                              todo esto bajo estrictos estándares de calidad
                              y seguridad informática.
                              </p>
                        </div>
                    </div>
                    <div class="item">
                           <img src="https://architect.bjc.es/wp-content/uploads/2019/01/58523039_l-1024x683.jpg" alt="">
                           <div class="carousel-caption">
                               <h3>VALORES</h3>
                               <p>Competitividad</p>
                               <p> Responsabilidad social</p>
                               <p> Trabajo en equipo </p>
                               <p>Excelencia</p>
                               <p> Calidad</p>
                               <p>Pasión</p>
                               <p> Solución de problemas.</p>
                           </div>
                       </div>
                      <!-- Controls -->
                        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#myCarousel" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                            <span class="sr-only">Next</span>
                        </a>
                </div>
            </div>
        </div>
    </section>
	
<script type="text/javascript">
    // Call carousel manually
    $('#myCarouselCustom').carousel();

    // Go to the previous item
    $("#prevBtn").click(function(){
        $("#myCarouselCustom").carousel("prev");
    });
    // Go to the previous item
    $("#nextBtn").click(function(){
        $("#myCarouselCustom").carousel("next");
}   );
    $('.carousel').carousel({
        interval: 8000,
        pause:true,
        wrap:false
    });
</script>  

</div>
</div>
</div>
</div>
<div id="PasswordDialog">
    <form id="PasswordForm"></form>
</div>
</div>
</main><!-- comment -->

<script>
    //Form del login
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
        
    //Form para recuperar la contraseña
    function OpenDialog() {
        var dialog = $('#PasswordDialog');
        var form = $('#PasswordForm');
        form.empty();
        form.kendoForm({
            validatable: {validationSummary: true},
            orientation: "vertical",
            items: [
                {
                    field: "Email",
                    label: "Correo Electronico",
                    validation: {required: true}
                },
            ],
            buttonsTemplate: ""
        })
        
        dialog.kendoDialog({
            width: "450px",
            title: "Recuperación de Contraseña",
            modal: true,
            animation: {
                open: {
                    effects: "fade:in"
                },
                close: {
                    effects: "fade:out"
                }
            },
            //Validacion envio de correo
            actions: [
                {
                    text: 'Aceptar',
                    action: function (e) {
                        var validator = form.kendoValidator().data("kendoValidator");
                        if (validator.validate()) {
                            $.ajax({
                                url: "recuperarContrasena.htm",
                                method: "POST",
                                data: form.serialize(),
                                dataType: "json",
                                success: function (data) {
                                    window.console.log(data);
                                    if (data.valid == 1) {
                                        kendo.alert("Se te ha enviado un correo electronico donde obtendras tu contraseña nuevamente");
                                    } else {
                                        kendo.alert("Error al recuperar contraseña");
                                    }
                                },
                                error: function (msg) {
                                    kendo.alert("Error al recuperar contraseña");
                                }
                            })
                        } else {
                            return false;
                        }
                    },
                    primary: true,
                },
                {text: 'Cancelar'}]
        });

        dialog.data("kendoDialog").open();

    }
</script>
</body>

</html>
