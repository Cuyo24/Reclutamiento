<%-- 
    Document   : pruebas
    Created on : 1/03/2021, 10:17:24 AM
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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pruebas B1 SOFT</title>
    <link rel="stylesheet" href="<c:url value='resources/css/kendo.common-bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='resources/css/kendo.bootstrap-v4.min.css'/>">
    <link rel="stylesheet" href="<c:url value='resources/css/prueba.css'/>">
    <link rel="stylesheet" href="<c:url value='resources/css/bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='resources/css/colors.css'/>">
    <link rel="stylesheet" href="<c:url value='resources/css/all.css'/>">
    <link rel="stylesheet" href="<c:url value='resources/css/body.css'/>">


    <script src="<c:url value='resources/js/jquery.min.js'/>"></script>
    <script src="<c:url value='resources/js/kendo.all.min.js'/>"></script>
    <script src="<c:url value='resources/js/kendo.es-MX.js'/>"></script>
    <script src="<c:url value='resources/js/pooper.min.js'/>"></script>
    <script src="<c:url value='resources/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='resources/js/all.min.js'/>"></script>
    <script src="<c:url value='resources/js/easytimer.min.js'/>"></script>
    <style>
        .k-stepper{
            display: none;
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
    </style>
</head>

<body>

    <header>
        <div class="nav-bg">
            <nav class="navegacion-principal contenedor"> <!--se pueden poner mas de una clase solo con un espacio-->
                <p >B1 SOFT LATINOAMÉRICA</p>

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
                <div class="col-sm-10 offset-sm-1">
                    <h4 id="Title" class="mt-3"></h4>
                    <form id="wizard"></form>

                    <div class="progress">
                        <div class="progress-bar progress-bar-striped progress-bar-animated bg-dark" id="progress"
                             role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <div id="timer">00:00:00</div>
                    <div id="dialog"></div>
                </div>

            </div>

        </div>
    </main>
    <script>
        var step;
        var prueba = {};
        function Build(pregunta, index) {
            var html = "";
            var value = 'a';
            if (pregunta.Tiene_imagen_pregunta) {
                html += `<img src='` + pregunta.Imagen_pregunta + `'/>`;
            }
            html += `<ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">`;
            for (var i = 0; i < pregunta.RESPUESTAS.length; i++) {
                if (!prueba.autocalif) {
                    html += `
                           <li class='k-radio-item'>
                               <input class="form-check-input" type="radio" name="preg` + pregunta.Numero_pregunta + `" id="preg` + pregunta.Numero_pregunta + `" value="` + (i + 1) + `" required/>

                       `;
                } else {
                    html += `
                           <li class='k-radio-item'>
                               <input class="form-check-input" type="radio" name="preg` + pregunta.Numero_pregunta + `" id="preg` + pregunta.Numero_pregunta + `" value="` + pregunta.RESPUESTAS[i].Id_respuesta + `" required/>

                       `;
                }

                if (pregunta.RESPUESTAS[i].Tiene_imagen_respuesta) {
                    html += ` <label class="form-check-label" for="preg1">` + value + `) ` + pregunta.RESPUESTAS[i].Texto.replaceAll("<","&lt;").replaceAll(">","&gt;") + `
                                        <img src='data:image/jpg;base64,` + pregunta.RESPUESTAS[i].Imagen_respuesta + `' style="width: 20%;height: 20%;"/>
                                    </label>
                                    </li>`
                } else {
                    html += ` <label class="form-check-label" for="preg1">` + (i + 1) + `) ` + pregunta.RESPUESTAS[i].Texto.replaceAll("<","&lt;").replaceAll(">","&gt;") +  `</label>
                            </li>`
                }
                value = nextChar(value);
            }
            html += `
                        <li class='k-radio-item'>
                            <input id="respIncorrecta` + index + `" class="form-check-input" type="radio" name="preg` + pregunta.Numero_pregunta + `" id="preg` + pregunta.Id_preguntas + `" value="x" hidden required/>
                        </li>`
            html += `</ul>`
            return html;
        }
        function nextChar(c) {
            return String.fromCharCode(c.charCodeAt(0) + 1);
        }
        function BuildForms(prueba) {
            var forms = []
            for (var i = 0; i < prueba.PREGUNTAS.length; i++) {
                var data = {
                    title: "",
                    buttons: [],
                    form: {
                        items: [
                            {
                                field: "preg" + prueba.PREGUNTAS[i].Id_preguntas,
                                editor: "" + Build(prueba.PREGUNTAS[i], i),
                                label: prueba.PREGUNTAS[i].Instrucciones_pregunta,
                                validation: {required: true}
                            },
                        ]
                    },
                }
                if (i != prueba.PREGUNTAS.length - 1) {
                    data.buttons = [{
                            name: "next",
                            text: "Siguiente",
                            attributes: {
                                "class": "btn btn-dark"
                            }
                        }]
                } else {
                    data.buttons = [{name: "done", text: "Finalizar"}]
                }
                forms.push(data);
            }
            return forms;
        }

        $(document).ready(function () {
            $.ajax({
                url: "getPrueba.htm",
                method: "POST",
                data: {id:${IdPrueba}},
                dataType: "json",
                async: false,
                success: function (data) {
                    console.log(data);
                    var preguntas = [];
                    prueba['ID_prueba'] = data.Id_prueba;
                    prueba['Nombre_prueba'] = data.Nombre_prueba;
                    prueba['Instrucciones'] = data.Instrucciones_prueba;
                    prueba['autocalif'] = data.autocalif;
                    for (var i = 0; i < data.PREGUNTAS.length; i++) {
                        var pregunta = data.PREGUNTAS[i];
                        if (pregunta.Id_respuesta_correcta != null && pregunta.Id_respuesta_correcta != undefined) {
                            var respuestas = [];
                            for (var j = 0; j < pregunta.RESPUESTAS.length; j++) {
                                var respuesta = pregunta.RESPUESTAS[j];
                                if (respuesta.Imagen_respuesta != null && respuesta.Imagen_respuesta != undefined && respuesta.Imagen_respuesta != "") {
                                    //data[i].PREGUNTAS[j].RESPUESTAS[k].Tiene_imagen_respuesta = true;
                                    respuestas.push({Id_respuesta: respuesta.Id_respuesta, Texto: respuesta.Texto, Tiene_imagen_respuesta: true, Imagen_respuesta: respuesta.Imagen_respuesta, pregunta_Id_pregunta: pregunta.Id_pregunta});
                                } else {
                                    //data[i].PREGUNTAS[j].RESPUESTAS[k].Tiene_imagen_respuesta = false;
                                    respuestas.push({Id_respuesta: respuesta.Id_respuesta, Texto: respuesta.Texto, Tiene_imagen_respuesta: false, Imagen_respuesta: respuesta.Imagen_respuesta, pregunta_Id_pregunta: pregunta.Id_pregunta});
                                }
                            }
                            if (pregunta.Imagen_pregunta != null && pregunta.Imagen_pregunta != undefined && pregunta.Imagen_pregunta != "") {
                                //data[i].PREGUNTAS[j].Tiene_imagen_pregunta = true;
                                preguntas.push({Id_pregunta: pregunta.Id_pregunta, Numero_pregunta: pregunta.Numero_pregunta, Instrucciones_pregunta: pregunta.Instrucciones_pregunta, Time_limit: pregunta.Tiempo, Tiene_imagen_pregunta: true, Imagen_pregunta: pregunta.Imagen_pregunta, respuestacorrecta_Id_respuesta: pregunta.Id_respuesta_correcta, prueba_Id_prueba: data.Id_prueba, RESPUESTAS: respuestas});
                            } else {
                                //data[i].PREGUNTAS[j].Tiene_imagen_pregunta = false;
                                preguntas.push({Id_pregunta: pregunta.Id_pregunta, Numero_pregunta: pregunta.Numero_pregunta, Instrucciones_pregunta: pregunta.Instrucciones_pregunta, Time_limit: pregunta.Tiempo, Tiene_imagen_pregunta: false, Imagen_pregunta: pregunta.Imagen_pregunta, respuestacorrecta_Id_respuesta: pregunta.Id_respuesta_correcta, prueba_Id_prueba: data.Id_prueba, RESPUESTAS: respuestas});
                            }
                        }

                    }
                    prueba['PREGUNTAS'] = preguntas;
                },
                error: function (msg) {

                }
            });
            OpenInstrucciones();
            $('#Title').html(prueba.Nombre_prueba);
            var wizard = $("#wizard").kendoWizard({
                pager: true,
                done: function (e) {
                    e.originalEvent.preventDefault();
                    timer.stop();
                    var calif = 0;
                    var data = $("#wizard").serializeArray();
                    var respuestas = [];
                    for (var i = 0; i < data.length; i++) {
                        respuestas.push(data[i].value)
                    }
                    console.log(respuestas);
                    var cadena = respuestas.join(",");
                    if (prueba.autocalif) {
                        var cont = 0;
                        for (var i = 0; i < prueba.PREGUNTAS.length; i++) {
                            if (data[i].value == "x")
                                continue;
                            if (parseInt(data[i].value) == prueba.PREGUNTAS[i].respuestacorrecta_Id_respuesta)
                                cont++;
                        }
                        calif = cont / prueba.PREGUNTAS.length * 100;
                    }
                    $.ajax({
                        url: "pruebas.htm",
                        method: "POST",
                        data: {rfc: "${user.RFC}", idPrueba:${IdPrueba}, calif: calif, respuestas: cadena},
                        dataType: "json",
                        success: function (data) {
                            $("#dialog").kendoDialog({
                                title: "Prueba Finalizada",
                                content: "La prueba ha sido finalizada, gracias por contestar",
                            });
                            var dialog = $("#dialog").data("kendoDialog");
                            dialog.open();
                            setTimeout(function () {
                                dialog.close();
                                $(location).attr('href', "pruebasPostulante.htm");
                            }, 2500);
                        },
                        error: function (mgs) {

                        }
                    })
                },
                contentPosition: "bottom",
                stepper: {
                    indicator: true,
                    label: true,
                    linear: true
                },
                activate: function (e) {
                    step = e.step;
                    limit = prueba.PREGUNTAS[step.options.index].Time_limit;
                    newTimer(limit)
                },
                actionBar: true,
                steps: BuildForms(prueba)
            }).data("kendoWizard");
            step = wizard.activeStep();
            var timer = new easytimer.Timer();
            ;
            var limit = prueba.PREGUNTAS[step.options.index].Time_limit;
            newTimer(limit);
            function newTimer(limit) {
                timer.stop();
                timer.start({precision: 'seconds', startValues: {seconds: 0}, target: {seconds: limit}});
                $('#progress').attr("style", "width:0%");
                $('#progress').attr("aria-valuenow", 0);
            }
            timer.addEventListener('secondsUpdated', function (e) {
                var porcentaje;
                var seconds = timer.getTotalTimeValues().seconds;
                porcentaje = seconds / limit * 100;
                $('#progress').attr("style", "width:" + porcentaje + "%");
                $('#progress').attr("aria-valuenow", porcentaje);
                $('#timer').html(timer.getTimeValues().toString());
            });
            timer.addEventListener('targetAchieved', function (e) {
                $('#progress').attr("style", "width:0%");
                $('#progress').attr("aria-valuenow", 0);
                $('#timer').html(timer.getTimeValues().toString());
                $('#respIncorrecta' + step.options.index).prop("checked", true);
                if ((step.options.index + 1) == step.options.totalSteps) {
                    $('button.k-button.k-primary').click();
                    //wizard.done();
                } else {
                    wizard.next();
                    step = wizard.activeStep();
                    limit = prueba.PREGUNTAS[step.options.index].Time_limit;
                    newTimer(limit)
                }
            });
        })
        function OpenInstrucciones() {
            var dialog = $('#dialog');
            dialog.kendoDialog({
                width: "800px",
                title: prueba.Nombre_prueba + ": Instrucciones",
                closable: false,
                modal: false,
                content: "<p style='white-space: pre-line'>" + prueba.Instrucciones + "</p>",
                actions: [
                    {text: 'Aceptar', primary: true}
                ],

            });
        }

    </script>
</body>

</html>