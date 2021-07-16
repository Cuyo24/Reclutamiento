<%-- 
    Document   : pruebas
    Created on : 1/03/2021, 10:17:24 AM
    Author     : Yirz
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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
    </style>
    <style>
        body { Background: transparent; }
    </style>
</head>

<body>
    <main class="container">
        <div class="card">
            <input id="respuestas" value="${resultadosDto.respuestas}" hidden/>
            <h4 id="Title" class="mt-3"></h4>
            <div id="wizard"></div>
        </div>
        <div class="row mt-3">
            <div class="col-sm-6">
               <a class="btn btn-primary"  href="visualizarPruebasPostulante.htm?rfc=${rfc}" >Regresar</a> 
            </div>
                 
        </div>
    </main>
    <script>
        var prueba = {};
        var respuestas=$("#respuestas").val().split(",");
        function Build(pregunta, index) {
            var html = "";
            if (pregunta.Tiene_imagen_pregunta) {
                html += `<img src='` + pregunta.Imagen_pregunta + `'/>`;
            }
                html += `<ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">`;
            for (var i = 0; i < pregunta.RESPUESTAS.length; i++) {
                if(!prueba.autocalif){
                    if(parseInt(respuestas[index])== (i+1)){
                        html += `
                            <div class="alert alert-secondary" role="alert">
                                <p>Respuesta del Postulante</p>
                                <li class='k-radio-item'>
                               <input class="form-check-input" type="radio" name="preg` + pregunta.Numero_pregunta + `" id="preg` + pregunta.Numero_pregunta + `" value="` + (i+1) + `" readonly/>
                            
                       `;
                    }else{
                        html += `
                            <div>
                           <li class='k-radio-item'>
                               <input class="form-check-input" type="radio" name="preg` + pregunta.Numero_pregunta + `" id="preg` + pregunta.Numero_pregunta + `" value="` + (i+1) + `" readonly/>

                       `;
                    }
                   
                }
                else{
                    if(parseInt(respuestas[index])== pregunta.RESPUESTAS[i].Id_respuesta){
                        if(parseInt(respuestas[index])== pregunta.respuestacorrecta_Id_respuesta){
                            html += `
                                <div class="alert alert-success" role="alert">
                                <p>Contestado Correctamente </p>
                            `;
                            html += `
                               <li class='k-radio-item'>
                                   <input class="form-check-input" type="radio" name="preg` + pregunta.Numero_pregunta + `" id="preg` + pregunta.Numero_pregunta + `" value="` + pregunta.RESPUESTAS[i].Id_respuesta + `" readonly/>

                           `;
                        }
                        else{
                             html += `
                                <div class="alert alert-danger" role="alert">
                                <p>Contestado Incorrectamente </p
                            `;
                            html += `
                                <li class='k-radio-item'>
                                    <input class="form-check-input" type="radio" name="preg` + pregunta.Numero_pregunta + `" id="preg` + pregunta.Numero_pregunta + `" value="` + pregunta.RESPUESTAS[i].Id_respuesta + `" readonly/>

                            `;
                        }
                        
                    }
                    else{
                        if(pregunta.RESPUESTAS[i].Id_respuesta == pregunta.respuestacorrecta_Id_respuesta){
                            html += `
                                <div class="alert alert-success" role="alert">
                                <p>Respuesta Correcta</p>
                            `;
                            html += `
                               <li class='k-radio-item'>
                                   <input class="form-check-input" type="radio" name="preg` + pregunta.Numero_pregunta + `" id="preg` + pregunta.Numero_pregunta + `" value="` + pregunta.RESPUESTAS[i].Id_respuesta + `" readonly/>

                           `;
                        }
                        else{
                            html += `
                            <div>
                               <li class='k-radio-item'>
                                   <input class="form-check-input" type="radio" name="preg` + pregunta.Numero_pregunta + `" id="preg` + pregunta.Numero_pregunta + `" value="` + pregunta.RESPUESTAS[i].Id_respuesta + `" readonly/>

                           `;
                        }
                        
                    }
                    
                }
               
                if (pregunta.RESPUESTAS[i].Tiene_imagen_respuesta) {
                html += ` <label class="form-check-label" for="preg1">` + value + `) ` + pregunta.RESPUESTAS[i].Texto.replaceAll("<","&lt;").replaceAll(">","&gt;") + `
                                        <img src='data:image/jpg;base64,` + pregunta.RESPUESTAS[i].Imagen_respuesta + `' style="width: 20%;height: 20%;"/>
                                    </label>
                                    </li>
                        </div>`
                }
                else {
                html += ` <label class="form-check-label" for="preg1">` + (i+1) + `) ` + pregunta.RESPUESTAS[i].Texto.replaceAll("<","&lt;").replaceAll(">","&gt;") + `</label>
                            </li>
                        </div>`
                }
                
            }
            html += `
                        <li class='k-radio-item'>
                            <input id="respIncorrecta` + index + `" class="form-check-input" type="radio" name="preg` + pregunta.Numero_pregunta + `" id="preg` + pregunta.Id_preguntas + `" value="x" hidden readonly/>
                        </li>`
            html += `</ul>`
            return html;
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
                                validation: { required: true }
                            },
                        ]
                    },
                }
                if(i==0 && i != prueba.PREGUNTAS.length - 1){
                     data.buttons = [
                        {
                            name: "next",
                            text: "Siguiente",
                            attributes: {
                                "class": "btn btn-dark"
                            }
                        }
                    ]
                    
                }
                else if (i != prueba.PREGUNTAS.length - 1) {
                    data.buttons = [
                        {
                            name: "previous",
                            text: "Anterior",
                            attributes: {
                                "class": "btn btn-dark"
                            }
                        }
                    
                        ,{
                            name: "next",
                            text: "Siguiente",
                            attributes: {
                                "class": "btn btn-dark"
                            }
                        }
                    ]
                }
                else {
                    data.buttons = [{ name: "previous", text: "Anterior" }]
                }
                forms.push(data);
            }
            return forms;
        }

        $(document).ready(function () {
            $.ajax({
                url:"getPrueba.htm",
                method:"POST",
                data:{id:${idPrueba}},
                dataType:"json",
                async: false,
                success: function (data) {
                    console.log(data);
                    var preguntas=[];
                    prueba['ID_prueba'] = data.Id_prueba;
                    prueba['Nombre_prueba'] = data.Nombre_prueba;
                    prueba['Instrucciones']=data.Instrucciones_prueba;
                    prueba['autocalif']=data.autocalif;
                    for (var i = 0; i < data.PREGUNTAS.length; i++){
                        var pregunta = data.PREGUNTAS[i];
                        if(pregunta.Id_respuesta_correcta != null && pregunta.Id_respuesta_correcta!= undefined){
                            var respuestas = [];
                            for (var j = 0; j < pregunta.RESPUESTAS.length;j++){
                                var respuesta = pregunta.RESPUESTAS[j];
                                if (respuesta.Imagen_respuesta != null && respuesta.Imagen_respuesta != undefined && respuesta.Imagen_respuesta != "") {
                                    //data[i].PREGUNTAS[j].RESPUESTAS[k].Tiene_imagen_respuesta = true;
                                    respuestas.push({ Id_respuesta: respuesta.Id_respuesta, Texto: respuesta.Texto, Tiene_imagen_respuesta: true, Imagen_respuesta: respuesta.Imagen_respuesta, pregunta_Id_pregunta: pregunta.Id_pregunta });
                                }
                                else {
                                    //data[i].PREGUNTAS[j].RESPUESTAS[k].Tiene_imagen_respuesta = false;
                                    respuestas.push({ Id_respuesta: respuesta.Id_respuesta, Texto: respuesta.Texto, Tiene_imagen_respuesta: false, Imagen_respuesta: respuesta.Imagen_respuesta, pregunta_Id_pregunta: pregunta.Id_pregunta });
                                }
                            }
                            if(pregunta.Imagen_pregunta != null && pregunta.Imagen_pregunta != undefined && pregunta.Imagen_pregunta != "") {
                                //data[i].PREGUNTAS[j].Tiene_imagen_pregunta = true;
                                preguntas.push({ Id_pregunta: pregunta.Id_pregunta, Numero_pregunta: pregunta.Numero_pregunta, Instrucciones_pregunta: pregunta.Instrucciones_pregunta,Time_limit: pregunta.Tiempo, Tiene_imagen_pregunta: true, Imagen_pregunta: pregunta.Imagen_pregunta, respuestacorrecta_Id_respuesta: pregunta.Id_respuesta_correcta, prueba_Id_prueba: data.Id_prueba, RESPUESTAS: respuestas });
                            } else {
                                //data[i].PREGUNTAS[j].Tiene_imagen_pregunta = false;
                                preguntas.push({ Id_pregunta: pregunta.Id_pregunta, Numero_pregunta: pregunta.Numero_pregunta, Instrucciones_pregunta: pregunta.Instrucciones_pregunta,Time_limit: pregunta.Tiempo, Tiene_imagen_pregunta: false, Imagen_pregunta: pregunta.Imagen_pregunta, respuestacorrecta_Id_respuesta: pregunta.Id_respuesta_correcta, prueba_Id_prueba: data.Id_prueba, RESPUESTAS: respuestas });
                            }
                        }
                        
                    }
                    prueba['PREGUNTAS']=preguntas;
                },
                error: function (msg) {

                }
            });
            $('#Title').html(prueba.Nombre_prueba);
            var wizard = $("#wizard").kendoWizard({
                pager: true,
                done: function (e) {
                    e.originalEvent.preventDefault();
                    
                },
                contentPosition: "bottom",
                stepper: {
                    indicator: true,
                    label: true,
                    linear: true
                },
                actionBar: true,
                steps: BuildForms(prueba)
            }).data("kendoWizard");
        })  
        function OpenInstrucciones(){
            var dialog = $('#dialog');
            dialog.kendoDialog({
                width: "800px",
                title:  prueba.Nombre_prueba+": Instrucciones",
                closable: false,
                modal: false,
                content: "<p style='white-space: pre-line'>"+prueba.Instrucciones+"</p>",
                actions: [
                    { text: 'Aceptar', primary: true }
                ],
                
            }); 
        }
        
    </script>
</body>

</html>