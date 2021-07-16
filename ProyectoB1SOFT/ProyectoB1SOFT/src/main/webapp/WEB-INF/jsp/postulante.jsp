<%-- 
    Document   : postulante.jsp
    Created on : 10/02/2021, 01:08:34 PM
    Author     : Yirz
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Postulantes</title>
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
    <main>
        <div class="container">
            <div class="row">
                <div class="col-sm-8 mt-3">
                    <div id="postulantes"></div>
                </div>
                <div class="col-sm-4 mt-5">
                    <div class="row mt-5">
                        <button type="button" id="agregPostulante" class="btn btn-primary">Agregar</button>
                    </div>
                    <div class="row mt-2">
                        <button type="button" id="verPostulante" class="btn btn-secondary">Visualizar</button>
                    </div>
                    <div class="row mt-2">
                        <button type="button" id="eliminarPostulante" class="btn btn-danger">Borrar</button>
                    </div>
                </div>
            </div>
        </div>
        <div id="EditDialog">

        </div>
        <div id="AgDialog">

        </div>
    </main>
    <script>
        $(document).ready(function () {
            var pos = [];   
            $.ajax({
                    url: "readPostulante.htm",
                    method: "GET",
                    dataType: "json",
                    success: function (data) {
                        console.log(data);
                        
                        for (var i = 0; i < data.length; i++) {
                            pos.push({RFC:data[i].rfc, Nombre:data[i].nombre, ApMaterno:data[i].apellidoMaterno, ApPaterno:data[i].apellidoPaterno, Correo:data[i].correo, Vacante: data[i].id_vacante,Resultados:data[i].resultados,Total:data[i].total});
                        }
                        console.log(pos);
                        $("#postulantes").data("kendoGrid").dataSource.read();
                    },
                    error: function (msg) {
                        AlertB1Soft("Error", msg.status);
                    }
                });
           
            $('#postulantes').kendoGrid({
                resizable:true,
                dataSource: pos,
                height: 550,
                selectable: true,
                scrollable: true,
                sortable: true,
                resizable: true,
                filterable: true,
                pageable: {
                    input: true,
                    numeric: false
                },
                columns: [
                    {file: "RFC", field: "RFC"},
                    { field: "Nombre", field: "Nombre" },
                    { field: "ApPaterno", title: "Apellido Paterno" },
                    { field: "ApMaterno", title: "Apellido Materno" },
                    { field: "Correo", title: "Correo Electronico" },
                    { field: "Vacante", tittle: "Vacante postulada"}
                ]
            });
            
        });
       
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
        $('#verPostulante').click(function () {
            var grid = $('#postulantes').data("kendoGrid");
            var selectedItem = grid.dataItem(grid.select());
            if (selectedItem == null) {
                AlertB1Soft("Error", "Debes seleccionar un postulante");
            }
            else {
                console.log(selectedItem);
                $(location).attr('href',"visualizar.htm?rfc="+selectedItem.RFC)
                    //OpenEditDialog(selectedItem);
            }
        });
        $('#agregPostulante').click(function () {
            var grid = $('#postulantes').data("kendoGrid");
            window.ConfirmB1Soft("agregar", "¿Deseas agregar al postulante?").then(function () {
                    OpenAddDialog();
                });
            
        });
        //Funcion borrar
        $('#eliminarPostulante').click(function () {
            var grid = $('#postulantes').data("kendoGrid");
            var selectedItem = grid.dataItem(grid.select());
            if (selectedItem == null) {
                AlertB1Soft("Error", "Debes seleccionar un postulante");
            } else {
                window.ConfirmB1Soft("Borrar Postulante", "¿Deseas borrar a " + selectedItem.Nombre + " " + selectedItem.ApPaterno + " " + selectedItem.ApMaterno + "?").then(function () {
                    
                    $.ajax({
                        url:"deletePostulante.htm",
                        method:"POST",
                        dataType:"json",
                        data:{RFC:selectedItem.RFC},
                        success: function (data) {
                            console.log(data);
                            if(data.valid==1){
                                grid.dataSource.remove(selectedItem);
                                grid.saveChanges();
                                AlertB1Soft("Postulante Eliminad@","Se ha eliminado al postulante de manera correcta");
                            }
                            else{
                                AlertB1Soft("Error eliminación","No se ha podido eliminar al postulante");
                            }
                        },
                        error: function (msg) {
                             AlertB1Soft("Error eliminación","No se ha podido eliminar al postulante "+ msg.status);
                        }
                    });
                    /*
                   
                     */
                });
            }
        });
        function OpenEditDialog(pos) {/*modal*/
            var dialog = $('#EditDialog');
            dialog.empty();
            dialog.append("<form id='ViewForm' method='POST'></form>");
            var form = $('#ViewForm');

            form.kendoForm({
                validatable: { validationSummary: true },
                orientation: "vertical",
                formData: {
                    RFC: pos.RFC,
                    Nombre: pos.Nombre,
                    ApPaterno: pos.ApPaterno,
                    ApMaterno: pos.ApMaterno,
                    Correo: pos.Correo,
                    Vacante: pos.Vacante
                },
                items: [
                {
                            field:"Postulante", 
                            editor:`
                            <div>
                                <h6>RFC:</h6>
                                <p id="example"></p>
                            </div>
                            <div>
                                <h6>Nombre:</h6>
                                <p id="example1"></p>
                            </div>
                            <div>
                                <h6>Apellido Paterno:</h6>
                                <p id="example2"></p>
                            </div>
                            <div>
                                <h6>Apellido Materno:</h6>
                                <p id="example3"></p>
                            </div>
                            <div>
                                <h6>Correo:</h6>
                                <p id="example4"></p>
                            </div>
                            <div>
                                <h6>Vacante:</h6>
                                <p id="example5"></p>
                            </div>
                            <div>
                                <h6>Porcentaje:</h6>
                                <p id="example6"></p>
                            </div>
                            <div>
                                <h6>Pruebas Realizadas</h6>
                                <p id="example7"></p>
                            </div>
                            `,
                            label:``,
                            validation: {required:true},
                        
                            },
                ],
                buttonsTemplate: ""
            })
            var template = kendo.template("<div id='box'>#= firstName #</div>");
            var data = { firstName: pos.RFC }; //A value in JavaScript/JSON
            var result = template(data); //Pass the data to the compiled template
            $("#example").html(result); //display the result
            var template = kendo.template("<div id='box'>#= firstName #</div>");
            var data = { firstName: pos.Nombre }; //A value in JavaScript/JSON
            var result = template(data); //Pass the data to the compiled template
            $("#example1").html(result); //display the result
            var template = kendo.template("<div id='box'>#= firstName #</div>");
            var data = { firstName: pos.ApPaterno }; //A value in JavaScript/JSON
            var result = template(data); //Pass the data to the compiled template
            $("#example2").html(result); //display the result
            var template = kendo.template("<div id='box'>#= firstName #</div>");
            var data = { firstName: pos.ApMaterno }; //A value in JavaScript/JSON
            var result = template(data); //Pass the data to the compiled template
            $("#example3").html(result); //display the result
            var template = kendo.template("<div id='box'>#= firstName #</div>");
            var data = { firstName: pos.Correo }; //A value in JavaScript/JSON
            var result = template(data); //Pass the data to the compiled template
            $("#example4").html(result); //display the result
            var template = kendo.template("<div id='box'>#= firstName #</div>");
            var data = { firstName: pos.Vacante }; //A value in JavaScript/JSON
            var result = template(data); //Pass the data to the compiled template
            $("#example5").html(result); //display the result
            var template = kendo.template("<div id='box'>#= firstName #</div>");
            var data = { firstName: pos.Total+"%" }; //A value in JavaScript/JSON
            var result = template(data); //Pass the data to the compiled template
            $("#example6").html(result); //display the result
            var template = kendo.template("<div id='box'>#= firstName #</div>");
            var pruebas="";
            if(pos.Resultados!=null && pos.Resultados!= undefined){
                for(var i=0;i<pos.Resultados.length;i++){
                    pruebas+="Prueba:"+pos.Resultados[i].prueba+"<br>"
                    pruebas+="Calificacion"+pos.Resultados[i].calif+"<br>"
                }
                var data = { firstName: pruebas }; //A value in JavaScript/JSON
                var result = template(data); //Pass the data to the compiled template
                $("#example7").html(result); //display the result
            }
            else{
                 var template = kendo.template("<div id='box'>#= firstName #</div>");
                var data = { firstName: "Sin Pruebas Realizadas" }; //A value in JavaScript/JSON
                var result = template(data); //Pass the data to the compiled template
                $("#example7").html(result);
            }
           
            
            dialog.kendoDialog({
                width: "450px",
                title: "Información Postulante",
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
                    
                    { text: 'Aceptar' }]
            });
            dialog.data("kendoDialog").open();
        }
        function OpenAddDialog(pos) {
            var dialog = $('#AgDialog');
            dialog.empty();
            dialog.append("<form id='AgForm' method='POST'></form>");
            var form = $('#AgForm');
            form.kendoForm({
                validatable: { validationSummary: true },
                orientation: "vertical",
                
                items: [
                {
                        field: "RFC",
                        label: "RFC",
                        validation: { required: true }
                    },
                    {
                        field: "Nombre",
                        label: "Nombre",
                        validation: { required: true }
                    },
                    {
                        field: "ApPaterno",
                        label: "Apellido Paterno",
                        validation: { required: true }
                    },
                    {
                        field: "ApMaterno",
                        label: "Apellido Materno",
                        validation: { required: true }
                    },
                    {
                        field: "Correo",
                        label: "Correo",
                        validation: { required: true, email: true }
                    },
                    {
                        field: "Vacante",
                        label: "Vacante",
                        validation: { required: true }
                    },
                ],
                buttonsTemplate: ""
            })
            dialog.kendoDialog({
                width: "450px",
                title: "Agregar Postulante",
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
                    {
                        text: 'Aceptar',
                        action: function (e) {
                            var newPostulante=[];
                            var validator = form.kendoValidator().data("kendoValidator");
                            if(validator.validate()) {
                                
                                var datos = form.serializeArray();
                                var newPostulante={
                                    RFC: datos[0].value,
                                    Nombre: datos[1].value,
                                    ApPaterno: datos[2].value,
                                    ApMaterno: datos[3].value,
                                    Correo: datos[4].value,
                                    Vacante: datos[5].value
                                };
                                $.ajax({
                                        url: "createPostulante.htm",
                                        method: "POST",
                                        dataType: "json",
                                        data: newPostulante,
                                        success: function (data) {
                                            var grid = $("#postulantes").data("kendoGrid");
                                            var dataSources = $("#postulantes").data("kendoGrid").dataSource;
                                            console.log(data);
                                            var newPostulante = {
                                               RFC: data.rfc,
                                               Nombre: data.nombre,
                                               ApPaterno: data.apellidoPaterno,
                                               ApMaterno: data.apellidoMaterno,
                                               Correo: data.correo,
                                               Vacante: data.id_vacante
                                            };
                                            dataSources.insert(newPostulante);
                                            dataSources.sort({ field:"RFC",dir:"asc"});//ordenar ascendente
                                            grid.saveChanges();
                                            
                                            console.log(data);
                                        },
                                        error: function (msg) {
                                            AlertB1Soft("Error", msg.status);
                                        }
                                    });
                                    
                                //dataSources.insert(newPostulante);
                                //grid.saveChanges();
                                return true;
                            }
                            else{
                                return false;
                            }
                        },        
                        primary: true,
                    },
                    { text: 'Cancelar' }]
            });
            dialog.data("kendoDialog").open();
        }

    </script>
    <style>
        .centrar{
            text-align: center;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
        }
    </style>
</body>
