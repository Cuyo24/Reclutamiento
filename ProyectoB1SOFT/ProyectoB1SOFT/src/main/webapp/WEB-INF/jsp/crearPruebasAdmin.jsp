<%-- 
    Document   : AddAdmin
    Created on : 1//02/2021, 01:27:01 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pruebas B1SOFT</title>
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
        <style>
            body { Background: transparent; }
        </style>
    </head>
    <body>
        <div id="tablaPruebas"></div>
        <div id = "dialogPreguntasPrueba"></div>
        <div id = "dialogRespuestasPregunta"></div>
        <div id = "dialogRespuesta"></div>

        <script>
            var indicesPrueba = [];
            var indicesPregunta = [];
            var indicesRespuesta = [];
            var listaPruebas = [
                /*{ Id_prueba: 1, Nombre_prueba: "Prueba 1", PREGUNTAS: [ 
                 { Id_pregunta: 1, Numero_pregunta: 1, Instrucciones: "Revise el siguiente código e indique la salida esperada:", Tiene_imagen_pregunta: false, Imagen_pregunta: null, respuestacorrecta_Id_respuesta: 2, RESPUESTAS: [
                 { Id_respuesta: 1, Texto: "Devuelve nulo.", Tiene_imagen_respuesta: false, Imagen_respuesta: null, pregunta_Id_pregunta: 1 },
                 { Id_respuesta: 2, Texto: "No devuelve nada.", Tiene_imagen_respuesta: false, Imagen_respuesta: null, pregunta_Id_pregunta: 2 }
                 ] }
                 ] },
                 { Id_prueba: 2, Nombre_prueba: "Prueba 2", PREGUNTAS: [] },
                 { Id_prueba: 3, Nombre_prueba: "Prueba 3", PREGUNTAS: [] },
                 { Id_prueba: 4, Nombre_prueba: "Prueba 4", PREGUNTAS: [] },
                 { Id_prueba: 5, Nombre_prueba: "Prueba 5", PREGUNTAS: [] }*/
            ];
            var Id_prueba_aux = 100;
            var nuevaPrueba = {};
            var nuevaPruebaBool = false;
            var indicePrueba;
            var Id_pregunta_aux = 1000;
            var nuevaPregunta = {};
            var imgPregunta = null;
            var nuevaPreguntaBool = false;
            var indicePregunta;
            var Id_respuestas_aux = 1000;
            var nuevaRespuesta = {};
            var imgRespuesta = null;
            var nuevaRespuestaBool = false;
            var indiceRespuesta;
            //Cosa fea que no sirve
            /*var dataPruebas = new kendo.data.DataSource({
             schema: {
             model: {
             id: "Id_prueba",
             fields: {
             Nombre_prueba: { type: "string" },
             Instrucciones_prueba: { type: "string" }
             }
             }
             },
             pageSize: 10,
             transport: {
             read:{
             url: "regresaPruebasAdmin.htm",
             contentType: "application/json; charset=utf-8",
             //dataType: 'json',
             type: "GET",
             cache: false
             }
             },
             //En change, se toman los elementos recibidos y se almacenan en una lista, esto para una manipulación más sencilla
             change: function(e) {
             kendo.alert("Se recibió la data correctamente");
             },
             error: function (e) {
             kendo.alert("Status: " + e.status + "; Error message: " + e.errorThrown);
             }
             });*/

            function cargaPruebas() {
                $.ajax({
                    type: "GET",
                    url: "regresaPruebasAdmin.htm",
                    dataType: "json",
                    async: false,
                    success: function (data) {
                        console.log(data);
                        if (!data.error) {
                            listaPruebas.splice(0, listaPruebas.length);
                            var tamanio = data.length;
                            for (var i = 0; i < tamanio; i++) {
                                var preguntas = [];
                                for (var j = 0; j < data[i].PREGUNTAS.length; j++) {
                                    var pregunta = data[i].PREGUNTAS[j];
                                    var respuestas = [];
                                    for (var k = 0; k < pregunta.RESPUESTAS.length; k++) {
                                        var respuesta = pregunta.RESPUESTAS[k];
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
                                        preguntas.push({Id_pregunta: pregunta.Id_pregunta, Numero_pregunta: pregunta.Numero_pregunta, Instrucciones_pregunta: pregunta.Instrucciones_pregunta, Tiene_imagen_pregunta: true, Imagen_pregunta: pregunta.Imagen_pregunta, respuestacorrecta_Id_respuesta: pregunta.respuestacorrecta_Id_respuesta, prueba_Id_prueba: data[i].Id_prueba, Tiempo: pregunta.Tiempo, RESPUESTAS: respuestas});
                                    } else {
                                        //data[i].PREGUNTAS[j].Tiene_imagen_pregunta = false;
                                        preguntas.push({Id_pregunta: pregunta.Id_pregunta, Numero_pregunta: pregunta.Numero_pregunta, Instrucciones_pregunta: pregunta.Instrucciones_pregunta, Tiene_imagen_pregunta: false, Imagen_pregunta: pregunta.Imagen_pregunta, respuestacorrecta_Id_respuesta: pregunta.respuestacorrecta_Id_respuesta, prueba_Id_prueba: data[i].Id_prueba, Tiempo: pregunta.Tiempo, RESPUESTAS: respuestas});
                                    }
                                }
                                listaPruebas.push({Id_prueba: data[i].Id_prueba, Nombre_prueba: data[i].Nombre_prueba, Instrucciones_prueba: data[i].Instrucciones_prueba, autocalif: data[i].autocalif, PREGUNTAS: preguntas});
                            }
                            $("#tablaPruebas").data("kendoGrid").dataSource.read();
                            kendo.alert("Cargado con éxito.");
                            console.log(listaPruebas);
                        }
                    },
                    error: function (msg) {
                        kendo.alert("Error al cargar.<br>" + msg.status + ": " + msg.statusText);
                    }
                });
            }

            function guardarPrueba() {
                var valida = $("#formPrueba").kendoValidator().data("kendoValidator").validate();
                if (valida) {
                    kendo.confirm("¿Desea guardar los cambios?").done(function () {
                        nuevaPrueba.Nombre_prueba = document.getElementById("Nombre_prueba").value;
                        nuevaPrueba.Instrucciones_prueba = document.getElementById("Instrucciones_prueba").value;
                        nuevaPrueba.autocalif = $("#autocalif").prop('checked');
                        console.log(nuevaPrueba);
                        if (nuevaPruebaBool) {
                            $.ajax({
                                type: "POST",
                                url: "nuevaPruebaAdmin.htm",
                                async: false,
                                data: nuevaPrueba,
                                success: function (data) {
                                    if (!data.error) {
                                        kendo.alert("Creado correctamente");
                                        $("#tablaPreguntas").show();
                                        nuevaPruebaBool = false;
                                        indicePrueba = listaPruebas.length + 1;
                                        nuevaPrueba = JSON.parse(data);
                                        listaPruebas.push(nuevaPrueba);
                                        console.log(nuevaPrueba);
                                        //cargaPruebas();
                                    }
                                },
                                error: function (msg) {
                                    kendo.alert("Error al crear.<br>" + msg.status + ": " + msg.statusText);
                                }
                            });
                        } else {
                            //listaPruebas[indicePrueba] = nuevaPrueba;
                            console.log(nuevaPrueba);
                            $.ajax({
                                type: "POST",
                                url: "actualizaPruebaAdmin.htm",
                                async: false,
                                data: nuevaPrueba,
                                success: function (data) {
                                    if (!data.error) {
                                        kendo.alert("Actualizado correctamente");
                                        //Realmente esto no hace falta por los cambios hechos, lo dejo comentado por si acaso
                                        //nuevaPrueba = data;
                                        listaPruebas[indicePrueba] = nuevaPrueba;
                                        //console.log(data);
                                        //cargaPruebas();
                                    }
                                },
                                error: function (msg) {
                                    kendo.alert("Error al actualizar.<br>" + msg.status + ": " + msg.statusText);
                                }
                            });
                        }
                        $("#tablaPruebas").data("kendoGrid").dataSource.read();
                    });
                }
            }

            function cerrarPrueba() {
                $("#dialogPreguntasPrueba").data("kendoDialog").close();
            }

            function onOpenPreguntasPrueba(e) {
                $("#dialogPreguntasPrueba").html("<form id='formPrueba' novalidate></form>" +
                        "<br><div id='tablaPreguntas'></div>");
                console.log(nuevaPrueba);
                $("#formPrueba").kendoForm({
                    validatable: {validateOnBlur: true},
                    orientation: "horizontal",
                    formData: nuevaPrueba,
                    items: [
                        {field: "Nombre_prueba", label: "Nombre de la Prueba:", validation: {required: {message: "Ingrese un nombre para continuar."}}, attributes: {maxlength: 100}},
                        {field: "Instrucciones_prueba", label: "Instrucciones:",
                            editor: function (container, options) {
                                $("<textarea class='k-textarea' id='Instrucciones_prueba' name='Instrucciones_prueba' title='Instrucciones_prueba' required='required' data-required-msg='Ingrese las instrucciones de la prueba' aria-labelledby='Instrucciones_prueba-form-label' data-bind='Instrucciones_prueba' required='required'>").appendTo(container);
                            }
                        },
                        {
                            field: "autocalif", label: "Calificar Automáticamente", editor: "Switch"
                        }
                    ],
                    buttonsTemplate: "<button class='k-button k-primary' type='button' onclick='guardarPrueba()'>Guardar</button>" +
                            "<button class='k-button' type='button' onclick='cerrarPrueba()'>Salir</button>"
                });
                if (nuevaPruebaBool) {
                    $("#tablaPreguntas").hide();
                }
                //Inicialización del grid
                $("#tablaPreguntas").kendoGrid({
                    dataSource: {
                        data: nuevaPrueba.PREGUNTAS,
                        schema: {
                            model: {
                                id: "Id_pregunta",
                                fields: {
                                    Numero_pregunta: {type: "number"},
                                    Instrucciones_pregunta: {type: "string"}
                                }
                            }
                        },
                        pageSize: 10
                    },
                    height: 400,
                    sortable: true,
                    filterable: true,
                    resizable: true,
                    noRecords: {template: "Esta prueba no tiene preguntas."},
                    pageable: {pageSizes: ["all", 5, 10, 20, 50], buttonCount: 5, refresh: true},
                    persistSelection: true,
                    change: onChangePregunta,
                    toolbar: [{name: "nuevaPregunta", text: "Nueva Pregunta"}, {name: "verPregunta", text: "Ver/Editar"}, {name: "borrarPregunta", text: "Eliminar"}],
                    columns: [
                        {selectable: true, width: "5%"},
                        {field: "Numero_pregunta", title: "Número de pregunta", width: "15%"},
                        {field: "Instrucciones_pregunta", title: "Instrucciones", width: "80%"}
                    ]
                });
                //Funcionalidad del botón Agregar
                $(".k-grid-nuevaPregunta").click(function (e) {
                    Id_pregunta_aux += 1;
                    nuevaPreguntaBool = true;
                    nuevaPregunta = {Id_pregunta: Id_pregunta_aux, Numero_pregunta: 0, Instrucciones: "", Tiene_imagen_pregunta: false, Imagen_pregunta: null, respuestacorrecta_Id_respuesta: null, prueba_Id_prueba: nuevaPrueba.Id_prueba, RESPUESTAS: []};
                    $("#dialogRespuestasPregunta").data("kendoDialog").open();
                });
                //Funcionalidad del botón Editar
                $(".k-grid-verPregunta").click(function (e) {
                    nuevaPreguntaBool = false;
                    indicePregunta = indicesPregunta[0];
                    nuevaPregunta = nuevaPrueba.PREGUNTAS[indicePregunta];
                    $("#dialogRespuestasPregunta").data("kendoDialog").open();
                });
                //Funcionalidad del botón Eliminar
                $(".k-grid-borrarPregunta").click(function (e) {
                    kendo.confirm("Se eliminarán las preguntas de la Base de Datos con todas sus respuestas, esta acción no se puede deshacer.<br>¿Desea continuar?")
                            .done(function () {
                                for (var i = indicesPregunta.length - 1; i >= 0; i--) {
                                    $.ajax({
                                        type: "POST",
                                        url: "borraPreguntaAdmin.htm",
                                        async: false,
                                        data: nuevaPrueba.PREGUNTAS[indicesPregunta[i]],
                                        success: function (data) {
                                            if (!data.error) {
                                                kendo.alert("Borrado correctamente");
                                                nuevaPrueba.PREGUNTAS.splice(indicesPregunta[i], 1);
                                                console.log(data);
                                                //cargaPruebas();
                                            }
                                        },
                                        error: function (msg) {
                                            kendo.alert("Error al borrar.<br>" + msg.status + ": " + msg.statusText);
                                        }
                                    });
                                }
                                listaPruebas[indicePrueba] = nuevaPrueba;
                                $("#tablaPreguntas").data("kendoGrid").clearSelection();
                                $("#tablaPreguntas").data("kendoGrid").dataSource.read();
                            })
                            .fail(function () {
                                $("#tablaPreguntas").data("kendoGrid").clearSelection();
                            });
                });
                $(".k-grid-verPregunta").addClass("k-state-disabled");
                $(".k-grid-borrarPregunta").addClass("k-state-disabled");
            }

            //Método para detectar cambios en las selecciones
            function onChangePrueba(arg) {
                indicesPrueba = [];
                //Verifica si hay elementos seleccionados
                if (this.selectedKeyNames().length > 0) {
                    //En caso de haber, se busca en la lista los índices de los elementos seleccionados con su id
                    for (var i = 0; i < this.selectedKeyNames().length; i++) {
                        indicesPrueba.push(listaPruebas.findIndex(obj => obj.Id_prueba === Number(this.selectedKeyNames()[i])));
                    }
                    //Este es un parche para el borrado, por alguna razón, quedan índices con -1 que corresponden a elementos ya borrados, por lo que se quitan todos los -1
                    var tamanio = indicesPrueba.length;
                    for (var i = 0; i < tamanio; i++) {
                        if (indicesPrueba[i] == -1) {
                            indicesPrueba.splice(i, 1);
                            tamanio -= 1;
                            i -= 1;
                        }
                    }
                    indicesPrueba.sort(function (a, b) {
                        return a - b;
                    });
                    //Si al hacer el filtrado anterior, se revisa si queda algún índice, en caso de haberlo, se habilita el botón de borrado
                    if (indicesPrueba.length > 0) {
                        $(".k-grid-borrarPrueba").removeClass("k-state-disabled");
                    } else {
                        $(".k-grid-borrarPrueba").addClass("k-state-disabled");
                    }
                    //Para poder editar un elemento, sólo debe existir una selección
                    if (indicesPrueba.length == 1) {
                        $(".k-grid-verPrueba").removeClass("k-state-disabled");
                    } else {
                        $(".k-grid-verPrueba").addClass("k-state-disabled");
                    }
                } else {
                    //En caso de no haber, se bloquean los botones de edición y borrado
                    $(".k-grid-verPrueba").addClass("k-state-disabled");
                    $(".k-grid-borrarPrueba").addClass("k-state-disabled");
                }
            }

            function guardarPregunta() {
                var valida = $("#formPregunta").kendoValidator().data("kendoValidator").validate();
                var numPregunta = Number(document.getElementById("Numero_pregunta").value);
                var validaNum = (numPregunta > 0) && (nuevaPrueba.PREGUNTAS.findIndex(res => Number(res.Numero_pregunta) === Number(numPregunta)) == -1 || nuevaPrueba.PREGUNTAS.findIndex(res => Number(res.Numero_pregunta) === Number(numPregunta)) == indicePregunta);
                var validaImagen = ($("#Tiene_imagen_pregunta").is(':checked') && imgPregunta != null) || ($("#Tiene_imagen_respuesta").is(':checked') && nuevaPregunta.Imagen_pregunta != null && nuevaPregunta.Imagen_pregunta != undefined && nuevaPregunta.Imagen_pregunta != "") || (!$("#Tiene_imagen_pregunta").is(':checked'));
                if (valida && validaNum && validaImagen) {
                    kendo.confirm("¿Desea guardar los cambios?").done(function () {
                        nuevaPregunta.Numero_pregunta = numPregunta;
                        nuevaPregunta.Instrucciones_pregunta = document.getElementById("Instrucciones_pregunta").value;
                        nuevaPregunta.Tiempo = document.getElementById("Tiempo").value;
                        if ($("#Tiene_imagen_pregunta").is(':checked')) {
                            nuevaPregunta.Tiene_imagen_pregunta = true;
                            if (imgPregunta != null) {
                                nuevaPregunta.Imagen_pregunta = imgPregunta;
                            }
                        } else {
                            nuevaPregunta.Tiene_imagen_pregunta = false;
                            nuevaPregunta.Imagen_pregunta = null;
                        }
                        if (nuevaPregunta.RESPUESTAS.length == 0) {
                            nuevaPregunta.respuestacorrecta_Id_respuesta = null;
                        } else {
                            var corId = $("#respuestacorrecta_Id_respuesta").data("kendoDropDownList").dataItem().Id_respuesta;
                            //(corId);
                            if (corId == null || corId == undefined) {
                                nuevaPregunta.respuestacorrecta_Id_respuesta = $("#respuestacorrecta_Id_respuesta").data("kendoDropDownList").dataItem(0).Id_respuesta;
                            } else {
                                nuevaPregunta.respuestacorrecta_Id_respuesta = corId;
                            }
                        }
                        //console.log("Se va a guardar la pregunta " + nuevaPregunta);
                        if (nuevaPreguntaBool) {
                            console.log(nuevaPregunta);
                            $.ajax({
                                type: "POST",
                                url: "creaPreguntaAdmin.htm",
                                async: false,
                                data: nuevaPregunta,
                                success: function (data) {
                                    if (!data.error) {
                                        kendo.alert("Creado correctamente");

                                        indicePreguntas = nuevaPrueba.PREGUNTAS.length + 1;
                                        nuevaPreguntaBool = false;
                                        var idPruebaAux = nuevaPregunta.prueba_Id_prueba;
                                        var tieneImagenAux = nuevaPregunta.Tiene_imagen_pregunta;
                                        nuevaPregunta = JSON.parse(data);
                                        nuevaPregunta.prueba_Id_prueba = idPruebaAux;
                                        nuevaPregunta.Tiene_imagen_pregunta = tieneImagenAux;
                                        nuevaPrueba.PREGUNTAS.push(nuevaPregunta);
                                        if (nuevaPrueba.PREGUNTAS.length == 1) {
                                            data = new kendo.data.DataSource(
                                                    {
                                                        data: nuevaPrueba.PREGUNTAS,
                                                        schema: {
                                                            model: {
                                                                id: "Id_pregunta",
                                                                fields: {
                                                                    Numero_pregunta: {type: "number"},
                                                                    Instrucciones_pregunta: {type: "string"}
                                                                }
                                                            }
                                                        },
                                                        pageSize: 10
                                                    }
                                            );
                                            data.read();
                                            $("#tablaPreguntas").data("kendoGrid").setDataSource(data);
                                            console.log($("#tablaPreguntas").data("kendoGrid").dataSource);
                                        }
                                        console.log(nuevaPrueba);
                                        $("#tablaRespuestas").show();
                                        console.log(nuevaPregunta);
                                        //cargaPruebas();
                                    }
                                },
                                error: function (msg) {
                                    kendo.alert("Error al crear.<br>" + msg.status + ": " + msg.statusText);
                                }
                            });
                        } else {
                            console.log(nuevaPregunta);
                            $.ajax({
                                type: "POST",
                                url: "actualizaPreguntaAdmin.htm",
                                async: false,
                                data: nuevaPregunta,
                                success: function (data) {
                                    if (!data.error) {
                                        kendo.alert("Actualizado correctamente");
                                        //nuevaPregunta = data;
                                        nuevaPrueba.PREGUNTAS[indicePregunta] = nuevaPregunta;
                                        //console.log(data);
                                        //cargaPruebas();
                                    }
                                },
                                error: function (msg) {
                                    kendo.alert("Error al actualizar.<br>" + msg.status + ": " + msg.statusText);
                                }
                            });
                        }
                        imgPregunta = null;
                        //console.log($("#tablaPreguntas").data("kendoGrid").dataSource);
                        $("#tablaPreguntas").data("kendoGrid").dataSource.read();
                        //console.log($("#tablaPreguntas").data("kendoGrid").dataSource);
                        $("#tablaPruebas").data("kendoGrid").dataSource.read();
                    });
                } else {
                    kendo.alert("Llene todos los campos y asegúrese de que el número de pregunta, que debe ser mayor a cero, no se repita.<br>" +
                            "Además, si marca la casilla de imagen, carguela, de lo contrario, desmárquela.");
                }
            }

            function cerrarPregunta() {
                $("#dialogRespuestasPregunta").data("kendoDialog").close();
            }

            function cargaImagenPregunta(event) {
                var file = event.target.files[0];
                var reader = new FileReader();
                reader.onload = function (event) {
                    imgPregunta = event.target.result;
                    //console.log(imgPregunta);
                };
                reader.readAsDataURL(file);
            }

            function revisaImagenPregunta() {
                var seleccion = $("#Tiene_imagen_pregunta").is(':checked');
                //console.log(seleccion);
                if (seleccion) {
                    $("#Imagen_pregunta-form-label").show();
                    $("[data-container-for='Imagen_pregunta']").show();
                } else {
                    $("#Imagen_pregunta-form-label").hide();
                    $("[data-container-for='Imagen_pregunta']").hide();
                }
            }

            function onOpenRespuestasPregunta() {
                $("#dialogRespuestasPregunta").html("<form id='formPregunta' novalidate></form>" +
                        "<br><div id='tablaRespuestas'></div>");
                $("#formPregunta").kendoForm({
                    validatable: {validateOnBlur: true},
                    orientation: "horizontal",
                    formData: nuevaPregunta,
                    items: [
                        {field: "Numero_pregunta", label: "Número de pregunta:", validation: {required: {message: "Ingrese un nombre para continuar."}}, attributes: {maxlength: 10}},
                        {field: "Instrucciones_pregunta", label: "Instrucciones:",
                            editor: function (container, options) {
                                $("<textarea class='k-textarea' id='Instrucciones_pregunta' name='Instrucciones_pregunta' title='Instrucciones_pregunta' required='required' data-required-msg='Ingrese las instrucciones de la pregunta' aria-labelledby='Instrucciones_pregunta-form-label' data-bind='value:Instrucciones_pregunta' required='required' maxlength=255>").appendTo(container);
                            }
                        },
                        {field: "Tiene_imagen_pregunta", label: "Tiene imagen:", editor: "Switch"},
                        {field: "Tiempo", label: "Tiempo en segundos de la pregunta:"},
                        {field: "Imagen_pregunta", label: "Imagen:",
                            editor: function (container, options) {
                                $("<input name='Imagen_pregunta' id='Imagen_pregunta' type='file' accept='image/*' onchange='cargaImagenPregunta(event)' aria-label='files'/>").appendTo(container);
                            }
                        },
                        {field: "respuestacorrecta_Id_respuesta", label: "Respuesta correcta:", editor: function (container, options) {
                                $("<input id='respuestacorrecta_Id_respuesta'/>").appendTo(container);
                            }
                        }
                    ],
                    buttonsTemplate: "<button class='k-button k-primary' type='button' onclick='guardarPregunta()'>Guardar</button>" +
                            "<button class='k-button' type='button' onclick='cerrarPregunta()'>Salir</button>"
                });
                $("#Imagen_pregunta").kendoUpload({multiple: false});
                $('[aria-labelledby="Tiene_imagen_pregunta-form-label"]').on("click", revisaImagenPregunta);
                if (!nuevaPregunta.Tiene_imagen_pregunta) {
                    $("#Imagen_pregunta-form-label").hide();
                    $("[data-container-for='Imagen_pregunta']").hide();
                }
                $("#respuestacorrecta_Id_respuesta").kendoDropDownList({
                    value: nuevaPregunta.respuestacorrecta_Id_respuesta,
                    dataTextField: "Texto",
                    dataValueField: "Id_respuesta",
                    dataSource: nuevaPregunta.RESPUESTAS,
                    change: function (e) {
                        //Se obtiene la información de dónde se hizo el cambio en la Dropdownlist
                        var element = e.sender.element;
                        //console.log(e.sender.value());
                    }
                });
                if (nuevaPreguntaBool) {
                    $("#tablaRespuestas").hide();
                }
                //Inicialización del grid
                $("#tablaRespuestas").kendoGrid({
                    dataSource: {
                        data: nuevaPregunta.RESPUESTAS,
                        schema: {
                            model: {
                                id: "Id_respuesta",
                                fields: {
                                    Texto: {type: "string"}
                                }
                            }
                        },
                        pageSize: 10
                    },
                    height: 400,
                    sortable: true,
                    filterable: true,
                    resizable: true,
                    noRecords: {template: "Esta pregunta no tiene respuestas."},
                    pageable: {pageSizes: ["all", 5, 10, 20, 50], buttonCount: 5, refresh: true},
                    persistSelection: true,
                    change: onChangeRespuesta,
                    toolbar: [{name: "nuevaRespuesta", text: "Nueva Respuesta"}, {name: "verRespuesta", text: "Ver/Editar"}, {name: "borrarRespuesta", text: "Eliminar"}],
                    columns: [
                        {selectable: true, width: "5%"},
                        {field: "Texto", title: "Texto de la respuesta", width: "95%"}
                    ]
                });
                //Funcionalidad del botón Agregar
                $(".k-grid-nuevaRespuesta").click(function (e) {
                    Id_respuestas_aux += 1;
                    nuevaRespuestaBool = true;
                    nuevaRespuesta = {Id_respuesta: Id_respuestas_aux, Texto: "", Tiene_imagen_respuesta: false, Imagen_respuesta: null, pregunta_Id_pregunta: nuevaPregunta.Id_pregunta};
                    $("#dialogRespuesta").data("kendoDialog").open();
                });
                //Funcionalidad del botón Editar
                $(".k-grid-verRespuesta").click(function (e) {
                    nuevaRespuestaBool = false;
                    indiceRespuesta = indicesRespuesta[0];
                    nuevaRespuesta = nuevaPregunta.RESPUESTAS[indiceRespuesta];
                    //console.log(nuevaRespuesta);
                    $("#dialogRespuesta").data("kendoDialog").open();
                });
                //Funcionalidad del botón Eliminar
                $(".k-grid-borrarRespuesta").click(function (e) {
                    kendo.confirm("Se eliminarán las respuestas de la Base de Datos, esta acción no se puede deshacer.<br>¿Desea continuar?")
                            .done(function () {
                                for (var i = indicesRespuesta.length - 1; i >= 0; i--) {
                                    $.ajax({
                                        type: "POST",
                                        url: "borraRespuestaAdmin.htm",
                                        async: false,
                                        data: nuevaPregunta.RESPUESTAS[indicesRespuesta[i]],
                                        success: function (data) {
                                            if (!data.error) {
                                                kendo.alert("Borrado correctamente");
                                                nuevaPregunta.RESPUESTAS.splice(indicesRespuesta[i], 1);
                                                console.log(data);
                                                //cargaPruebas();
                                            }
                                        },
                                        error: function (msg) {
                                            kendo.alert("Error al borrar.<br>" + msg.status + ": " + msg.statusText);
                                        }
                                    });
                                }
                                nuevaPrueba.PREGUNTAS[indicePregunta] = nuevaPregunta;
                                listaPruebas[indicePrueba] = nuevaPrueba;
                                $("#tablaRespuestas").data("kendoGrid").clearSelection();
                                $("#tablaRespuestas").data("kendoGrid").dataSource.read();
                                $("#tablaPreguntas").data("kendoGrid").dataSource.read();
                                $("#tablaPruebas").data("kendoGrid").dataSource.read();
                            })
                            .fail(function () {
                                $("#tablaPreguntas").data("kendoGrid").clearSelection();
                            });
                });
                $(".k-grid-verRespuesta").addClass("k-state-disabled");
                $(".k-grid-borrarRespuesta").addClass("k-state-disabled");
            }

            function onChangePregunta(arg) {
                indicesPregunta = [];
                //console.log("Selecciona: " + this.selectedKeyNames());
                //Verifica si hay elementos seleccionados
                if (this.selectedKeyNames().length > 0) {
                    //En caso de haber, se busca en la lista los índices de los elementos seleccionados con su id
                    for (var i = 0; i < this.selectedKeyNames().length; i++) {
                        indicesPregunta.push(nuevaPrueba.PREGUNTAS.findIndex(obj => obj.Id_pregunta === Number(this.selectedKeyNames()[i])));
                    }
                    //Este es un parche para el borrado, por alguna razón, quedan índices con -1 que corresponden a elementos ya borrados, por lo que se quitan todos los -1
                    var tamanio = indicesPregunta.length;
                    for (var i = 0; i < tamanio; i++) {
                        if (indicesPregunta[i] == -1) {
                            indicesPregunta.splice(i, 1);
                            tamanio -= 1;
                            i -= 1;
                        }
                    }
                    indicesPregunta.sort(function (a, b) {
                        return a - b;
                    });
                    //Si al hacer el filtrado anterior, se revisa si queda algún índice, en caso de haberlo, se habilita el botón de borrado
                    if (indicesPregunta.length > 0) {
                        $(".k-grid-borrarPregunta").removeClass("k-state-disabled");
                    } else {
                        $(".k-grid-borrarPregunta").addClass("k-state-disabled");
                    }
                    //Para poder editar un elemento, sólo debe existir una selección
                    if (indicesPregunta.length == 1) {
                        $(".k-grid-verPregunta").removeClass("k-state-disabled");
                    } else {
                        $(".k-grid-verPregunta").addClass("k-state-disabled");
                    }
                } else {
                    //En caso de no haber, se bloquean los botones de edición y borrado
                    $(".k-grid-verPregunta").addClass("k-state-disabled");
                    $(".k-grid-borrarPregunta").addClass("k-state-disabled");
                }
            }

            function onChangeRespuesta(arg) {
                indicesRespuesta = [];
                //Verifica si hay elementos seleccionados
                if (this.selectedKeyNames().length > 0) {
                    //En caso de haber, se busca en la lista los índices de los elementos seleccionados con su id
                    for (var i = 0; i < this.selectedKeyNames().length; i++) {
                        indicesRespuesta.push(nuevaPregunta.RESPUESTAS.findIndex(obj => Number(obj.Id_respuesta) === Number(this.selectedKeyNames()[i])));
                    }
                    //Este es un parche para el borrado, por alguna razón, quedan índices con -1 que corresponden a elementos ya borrados, por lo que se quitan todos los -1
                    var tamanio = indicesRespuesta.length;
                    for (var i = 0; i < tamanio; i++) {
                        if (indicesRespuesta[i] == -1) {
                            indicesRespuesta.splice(i, 1);
                            tamanio -= 1;
                            i -= 1;
                        }
                    }
                    indicesRespuesta.sort(function (a, b) {
                        return a - b;
                    });
                    //Si al hacer el filtrado anterior, se revisa si queda algún índice, en caso de haberlo, se habilita el botón de borrado
                    if (indicesRespuesta.length > 0) {
                        $(".k-grid-borrarRespuesta").removeClass("k-state-disabled");
                    } else {
                        $(".k-grid-borrarRespuesta").addClass("k-state-disabled");
                    }
                    //Para poder editar un elemento, sólo debe existir una selección
                    if (indicesRespuesta.length == 1) {
                        $(".k-grid-verRespuesta").removeClass("k-state-disabled");
                    } else {
                        $(".k-grid-verRespuesta").addClass("k-state-disabled");
                    }
                } else {
                    //En caso de no haber, se bloquean los botones de edición y borrado
                    $(".k-grid-verRespuesta").addClass("k-state-disabled");
                    $(".k-grid-borrarRespuesta").addClass("k-state-disabled");
                }
            }

            function guardarRespuesta() {
                var valida = $("#formRespuesta").kendoValidator().data("kendoValidator").validate();
                var validaImagen = ($("#Tiene_imagen_respuesta").is(':checked') && imgRespuesta != null) || ($("#Tiene_imagen_respuesta").is(':checked') && nuevaRespuesta.Imagen_respuesta != null && nuevaRespuesta.Imagen_respuesta != undefined && nuevaRespuesta.Imagen_respuesta != "") || (!$("#Tiene_imagen_respuesta").is(':checked'));
                if (valida && validaImagen) {
                    kendo.confirm("¿Desea guardar los cambios?").done(function () {
                        nuevaRespuesta.Texto = document.getElementById("Texto").value;
                        if ($("#Tiene_imagen_respuesta").is(':checked')) {
                            nuevaRespuesta.Tiene_imagen_respuesta = true;
                            if (imgRespuesta != null) {
                                nuevaRespuesta.Imagen_respuesta = imgRespuesta;
                            }
                        } else {
                            nuevaRespuesta.Tiene_imagen_respuesta = false;
                            nuevaRespuesta.Imagen_respuesta = null;
                        }
                        if (nuevaRespuestaBool) {
                            $.ajax({
                                type: "POST",
                                url: "creaRespuestaAdmin.htm",
                                async: false,
                                data: nuevaRespuesta,
                                success: function (data) {
                                    if (!data.error) {
                                        kendo.alert("Creado correctamente");
                                        indiceRespuestas = nuevaPregunta.RESPUESTAS.length + 1;
                                        nuevaRespuestaBool = false;
                                        var tieneImagenAux = nuevaRespuesta.Tiene_imagen_respuesta;
                                        nuevaRespuesta = JSON.parse(data);
                                        nuevaRespuesta.Tiene_imagen_respuesta = tieneImagenAux;
                                        nuevaPregunta.RESPUESTAS.push(nuevaRespuesta);
                                        if (nuevaPregunta.RESPUESTAS.length == 1) {
                                            data = new kendo.data.DataSource(
                                                    {
                                                        data: nuevaPregunta.RESPUESTAS,
                                                        schema: {
                                                            model: {
                                                                id: "Id_respuesta",
                                                                fields: {
                                                                    Texto: {type: "string"}
                                                                }
                                                            }
                                                        },
                                                        pageSize: 10
                                                    }
                                            );
                                            data.read();
                                            $("#tablaRespuestas").data("kendoGrid").setDataSource(data);
                                            console.log($("#tablaRespuestas").data("kendoGrid").dataSource);
                                        }
                                        //$("#tablaRespuestas").data("kendoGrid").dataSource.insert(nuevaRespuesta);
                                        $("#tablaRespuestas").show();
                                        console.log(nuevaRespuesta);
                                        //cargaPruebas();
                                    }

                                },
                                error: function (msg) {
                                    kendo.alert("Error al crear.<br>" + msg.status + ": " + msg.statusText);
                                }
                            });
                        } else {
                            $.ajax({
                                type: "POST",
                                url: "actualizaRespuestaAdmin.htm",
                                async: false,
                                data: nuevaRespuesta,
                                success: function (data) {
                                    if (!data.error) {
                                        kendo.alert("Actualizado correctamente");
                                        //nuevaRespuesta = data;
                                        nuevaPregunta.RESPUESTAS[indiceRespuesta] = nuevaRespuesta;
                                        $("#tablaRespuestas").data("kendoGrid").refresh();
                                        console.log(data);
                                        //cargaPruebas();
                                    }
                                },
                                error: function (msg) {
                                    kendo.alert("Error al actualizar.<br>" + msg.status + ": " + msg.statusText);
                                }
                            });
                        }
                        imgRespuesta = null;
                        $("#tablaRespuestas").data("kendoGrid").dataSource.read();
                        $("#tablaRespuestas").data("kendoGrid").refresh();
                        $("#tablaPreguntas").data("kendoGrid").dataSource.read();
                        $("#tablaPruebas").data("kendoGrid").dataSource.read();
                        $("#respuestacorrecta_Id_respuesta").data("kendoDropDownList").dataSource.read();
                        $("#dialogRespuesta").data("kendoDialog").close();
                    });
                } else {
                    kendo.alert("Llene todos los campos y asegúrese de cargar una imagen si marca la casilla correspondiente, de lo contrario, desmárquela.");
                }
            }

            function cerrarRespuesta() {
                $("#dialogRespuesta").data("kendoDialog").close();
            }

            function cargaImagenRespuesta(event) {
                var file = event.target.files[0];
                var reader = new FileReader();
                reader.onload = function (event) {
                    imgRespuesta = event.target.result;
                    //console.log(imgRespuesta);
                };
                reader.readAsDataURL(file);
            }

            function revisaImagenRespuesta() {
                var seleccion = $("#Tiene_imagen_respuesta").is(':checked');
                //console.log(seleccion);
                if (seleccion) {
                    $("#Imagen_respuesta-form-label").show();
                    $("[data-container-for='Imagen_respuesta']").show();
                } else {
                    $("#Imagen_respuesta-form-label").hide();
                    $("[data-container-for='Imagen_respuesta']").hide();
                }
            }

            function onOpenRespuesta() {
                $("#dialogRespuesta").html("<form id='formRespuesta' novalidate></form>");
                $("#formRespuesta").kendoForm({
                    validatable: {validateOnBlur: true},
                    orientation: "horizontal",
                    formData: nuevaRespuesta,
                    items: [
                        {field: "Texto", label: "Texto:",
                            editor: function (container, options) {
                                $("<textarea class='k-textarea' id='Texto' name='Texto' title='Texto' required='required' data-required-msg='Ingrese el texto de la respuesta' aria-labelledby='Texto-form-label' data-bind='value:Texto' required='required'>").appendTo(container);
                            }
                        },
                        {field: "Tiene_imagen_respuesta", label: "Tiene imagen:", editor: "Switch"},
                        {field: "Imagen_respuesta", label: "Imagen:",
                            editor: function (container, options) {
                                $("<input name='Imagen_respuesta' id='Imagen_respuesta' type='file' accept='image/*' onchange='cargaImagenRespuesta(event)' aria-label='files'/>").appendTo(container);
                            }
                        }
                    ],
                    buttonsTemplate: "<button class='k-button k-primary' type='button' onclick='guardarRespuesta()'>Guardar</button>" +
                            "<button class='k-button' type='button' onclick='cerrarRespuesta()'>Salir</button>"
                });
                $("#Imagen_respuesta").kendoUpload({multiple: false});
                $('[aria-labelledby="Tiene_imagen_respuesta-form-label"]').on("click", revisaImagenRespuesta);
                if (!nuevaRespuesta.Tiene_imagen_respuesta) {
                    $("#Imagen_respuesta-form-label").hide();
                    $("[data-container-for='Imagen_respuesta']").hide();
                }
            }

            //Inicialización del dom
            $(document).ready(function () {

                //Script para poner la tabla en español
                $.getScript("https://kendo.cdn.telerik.com/2020.3.1118/js/messages/kendo.messages.es-ES.min.js", function () {

                    //Inicialización del grid
                    $("#tablaPruebas").kendoGrid({
                        dataSource: {
                            data: listaPruebas,
                            schema: {
                                model: {
                                    id: "Id_prueba",
                                    fields: {
                                        Nombre_prueba: {type: "string"},
                                        Instrucciones_prueba: {type: "string"}
                                    }
                                }
                            },
                            pageSize: 10
                        },
                        height: 400,
                        sortable: true,
                        filterable: true,
                        resizable: true,
                        noRecords: {template: "No hay pruebas en el sistema."},
                        pageable: {pageSizes: ["all", 5, 10, 20, 50], buttonCount: 5, refresh: true},
                        persistSelection: true,
                        change: onChangePrueba,
                        toolbar: [{name: "nuevaPrueba", text: "Nueva Prueba"}, {name: "verPrueba", text: "Ver/Editar"}, {name: "borrarPrueba", text: "Eliminar"}, {name: "search", text: "Buscar prueba"}],
                        columns: [
                            {selectable: true, width: "5%"},
                            {field: "Nombre_prueba", title: "Nombre", width: "20%"},
                            {field: "Instrucciones_prueba", title: "Instrucciones", width: "75%"}
                        ]
                    });

                    //Funcionalidad del botón Agregar
                    $(".k-grid-nuevaPrueba").click(function (e) {
                        Id_prueba_aux += 1;
                        nuevaPruebaBool = true;
                        nuevaPrueba = {Id_prueba: Id_prueba_aux, Nombre_prueba: "", Instrucciones_prueba: "", autocalif: "", PREGUNTAS: []};
                        $("#dialogPreguntasPrueba").data("kendoDialog").open();
                    });

                    //Funcionalidad del botón Editar
                    $(".k-grid-verPrueba").click(function (e) {
                        nuevaPruebaBool = false;
                        indicePrueba = indicesPrueba[0];
                        nuevaPrueba = listaPruebas[indicePrueba];
                        $("#dialogPreguntasPrueba").data("kendoDialog").open();
                    });

                    //Funcionalidad del botón Eliminar
                    $(".k-grid-borrarPrueba").click(function (e) {
                        kendo.confirm("Se eliminarán las pruebas de la Base de Datos incluyendo sus preguntas y respectivas respuestas, esta acción no se puede deshacer.<br>¿Desea continuar?")
                                .done(function () {
                                    for (var i = indicesPrueba.length - 1; i >= 0; i--) {
                                        //listaPruebas.splice(indicesPrueba[i],1);
                                        $.ajax({
                                            type: "POST",
                                            url: "borraPruebaAdmin.htm",
                                            async: false,
                                            data: listaPruebas[indicesPrueba[i]],
                                            success: function (data) {
                                                if (!data.error) {
                                                    kendo.alert("Borrado correctamente");
                                                    listaPruebas.splice(indicesPrueba[i], 1);
                                                    console.log(data);
                                                    //cargaPruebas();
                                                }
                                            },
                                            error: function (msg) {
                                                kendo.alert("Error al borrar.<br>" + msg.status + ": " + msg.statusText);
                                            }
                                        });
                                    }
                                    $("#tablaPruebas").data("kendoGrid").clearSelection();
                                    $("#tablaPruebas").data("kendoGrid").dataSource.read();
                                })
                                .fail(function () {
                                    $("#tablaPruebas").data("kendoGrid").clearSelection();
                                });
                    });

                    //Los botones de edición y borrado se inicializan bloqueados
                    $(".k-grid-verPrueba").addClass("k-state-disabled");
                    $(".k-grid-borrarPrueba").addClass("k-state-disabled");

                    //Inicialización del dialog de carga/modificación
                    $("#dialogPreguntasPrueba").kendoDialog({
                        title: "Información de la prueba",
                        width: "1200px",
                        height: "600px",
                        modal: true,
                        visible: false,
                        closable: true,
                        open: onOpenPreguntasPrueba,
                        close: function (e) {
                            //Al cerrar, se borra el form
                            $("#formPrueba").remove();
                            $("#tablaPreguntas").remove();
                            $("#tablaPruebas").data("kendoGrid").clearSelection();
                        }
                    });

                    $("#dialogRespuestasPregunta").kendoDialog({
                        title: "Información de la pregunta",
                        width: "1100px",
                        height: "600px",
                        modal: true,
                        visible: false,
                        closable: true,
                        open: onOpenRespuestasPregunta,
                        close: function (e) {
                            //Al cerrar, se borra el form
                            $("#formPregunta").remove();
                            $("#tablaRespuestas").remove();
                            $("#tablaPreguntas").data("kendoGrid").clearSelection();
                        }
                    });

                    $("#dialogRespuesta").kendoDialog({
                        title: "Información de la respuesta",
                        width: "500px",
                        height: "360px",
                        modal: true,
                        visible: false,
                        closable: true,
                        open: onOpenRespuesta,
                        close: function (e) {
                            //Al cerrar, se borra el form
                            $("#formRespuesta").remove();
                            $("#tablaRespuestas").data("kendoGrid").clearSelection();
                        }
                    });
                    cargaPruebas();
                });

            });

        </script>
    </body>

</html>