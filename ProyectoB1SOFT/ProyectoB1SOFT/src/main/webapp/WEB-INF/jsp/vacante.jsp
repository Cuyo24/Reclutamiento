<%-- 
    Document   : vacante.jsp
    Created on : 10/02/2021, 01:08:20 PM
    Author     : Yirz
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
        <main>
            <div class="container">
                <div class="row">
                    <div class="col-sm-7 mt-3">
                        <div id="Vacantes"></div>
                    </div>
                    <div class="col-sm-5 mt-5">
                        <div class="row mt-5">
                            <button type="button" id="AgregaVac" class="btn btn-primary">Agregar</button>
                        </div>
                        <div class="row mt-2">
                            <button type="button" id="EditaVac" class="btn btn-secondary">Editar</button>
                        </div>
                        <div class="row mt-2">
                            <button type="button" id="BorrarVac" class="btn btn-danger">Borrar</button>
                        </div>
                    </div>
                </div>
            </div>
            <div id="EditDialog"></div>
            <div id="AgreDialog"></div>
        </main>
        <script>
            var Vacant = [];
            $(document).ready(function () {
                $.ajax({
                    url: "readVacante.htm",
                    method: "GET",
                    dataType: "json",
                    success: function (data) {
                        console.log(data);
                        var pruebas = [];
                        for (var i = 0; i < data.length; i++) {
                            for (var j = 0; j < data[i].pruebas.length; j++) {
                                //console.log(data[i].pruebas[j].Nombre_prueba);
                                pruebas.push({IdPrueba:data[i].pruebas[j].Id_prueba,Nombre:data[i].pruebas[j].Nombre_prueba})
                            }
                            Vacant.push({idVacante: data[i].id_vacante, Nombre: data[i].nombre_vacante, Pruebas: pruebas});
                            pruebas=[];
                        }
                        //console.log(Vacant);
                        $("#Vacantes").data("kendoGrid").dataSource.read();
                    },
                    error: function (msg) {
                        AlertB1Soft("Error", msg.status);
                    }
                });
                $("#Vacantes").kendoGrid({
                    dataSource:Vacant,
                    height: 550,
                    selectable: true,
                    scrollable: true,
                    sortable: true,
                    resizable: true,
                    pageable: {
                        input: true,
                        numeric: false,
                    },
                    columns: [
                        {field: "idVacante", title: "id"},
                        {field: "Nombre", title: "Nombre"},
                        {
                            field: "Pruebas", 
                            title: "Pruebas",
                            template: function(dataItem) {
                                var data=[];
                                for(var i=0;i<dataItem.Pruebas.length;i++){
                                    data.push(dataItem.Pruebas[i].Nombre);
                                }
                                return data.splice(",");
                            }
                        },
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

            $('#BorrarVac').click(function () {
                var grid = $('#Vacantes').data("kendoGrid");
                var selectedItem = grid.dataItem(grid.select());
                if (selectedItem == null) {
                    AlertB1Soft("Error", "Debes seleccionar una vacante");
                } else {
                    window.ConfirmB1Soft("Borrar vacante", "¿Deseas borrar a " + selectedItem.idVacante + " " + selectedItem.Nombre + " " + selectedItem.pruebas + "?").then(function () {
                        $.ajax({
                            url: "deleteVacante.htm",
                            method: "POST",
                            data: {idVacante: selectedItem.idVacante, Nombre: selectedItem.Nombre},
                            //dataType: 'json',
                            success: function (data) {
                                //console.log(data);
                                var flag = JSON.parse(data);
                                //console.log(flag);
                                if (flag.valid == 1) {
                                    grid.dataSource.remove(selectedItem);
                                    grid.saveChanges();
                                }
                            },
                            error: function (msg) {

                            }
                        });
                    });
                }
            });
            $('#AgregaVac').click(function () {
                //var grid = $('#Vacantes').data("kendoGrid");
                OpenAgreDialog();
            });
            $('#EditaVac').click(function () {
                var grid = $('#Vacantes').data("kendoGrid");
                var selectedItem = grid.dataItem(grid.select());
                if (selectedItem == null) {
                    AlertB1Soft("Error", "Debes seleccionar una vacante");
                } else {
                    window.ConfirmB1Soft("Editar vacante", "¿Deseas editar a " + selectedItem.Nombre + " " + selectedItem.pruebas + "?").then(function () {

                        OpenEditDialog(selectedItem);
                    });
                }
            });
            function OpenEditDialog(Vacant) {
                var dialog = $('#EditDialog');
                dialog.empty();
                dialog.append("<form id='EditForm' method='POST'></form>");
                var form = $('#EditForm');
                form.kendoForm({
                    validatable: {validationSummary: true},
                    orientation: "vertical",
                    formData: {
                        Nombre: Vacant.Nombre,
                        idVacante: Vacant.idVacante
                    },
                    items: [
                        {
                            field: "idVacante",
                            label: "ID Vacante",
                            attributes:{"readonly":true},
                            validation: {required: true}
                        },
                        {
                            field: "Nombre",
                            label: "Nombre del puesto",
                            validation: {required: true}
                        },
                        {
                            field: "pruebas",
                            label: "Selecciona las pruebas a realizar",
                            editor: function (container, options) {
                                $("<input id='pruebasEdit'/>").appendTo(container);
                            },
                            validation: {required: true}
                        },
                    ],
                    buttonsTemplate: ""
                })
                $("input[name='idVacante']").prop("readonly",true);
                $.ajax({
                    url: "regresaPruebasAdmin.htm",
                    dataType: "json",
                    success: function (data) {
                        var pruebas=[];
                        var values=[];
                        for(var i=0;i<data.length;i++){
                            pruebas.push({IdPrueba:data[i].Id_prueba,Nombre:data[i].Nombre_prueba});
                        }
                        for(var i=0;i<Vacant.Pruebas.length;i++){
                            values.push({IdPrueba:Vacant.Pruebas[i].IdPrueba});
                        }
                        $("#pruebasEdit").kendoMultiSelect({
                            optionLabel: "Selecciona las pruebas",
                            dataTextField: "Nombre",
                            dataValueField: "IdPrueba",
                            dataSource:pruebas,
                            value:values
                        });
                    },
                    error: function (msg) {
                         AlertB1Soft("Error", msg.status);
                    }
                });

                dialog.kendoDialog({
                    width: "450px",
                    title: "Editar vacante",
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
                                var validator = form.kendoValidator().data("kendoValidator");
                                var multiselect = $("#pruebasEdit").data("kendoMultiSelect");
                                if(multiselect.value().length==0){
                                    AlertB1Soft("Error","Ingrese por lo menos una prueba")
                                    return false;
                                }
                                if (validator.validate()) {
                                    
                                    var grid = $("#Vacantes").data("kendoGrid");
                                    var data=form.serializeArray();
                                    var editVacante ={
                                        idVacante:data[0].value,
                                        Nombre:data[1].value,
                                        pruebas:multiselect.value()
                                    };
                                    $.ajax({
                                        url: "updateVacante.htm",
                                        method: "POST",
                                        dataType: "json",
                                        data: editVacante,
                                        success: function (data) {
                                            var pruebas=[];
                                            console.log(data);
                                            for(var i=0;i<data.pruebas.length;i++){
                                                pruebas.push({IdPrueba:data.pruebas[i].Id_prueba,Nombre:data.pruebas[i].Nombre_prueba});
                                            }
                                            
                                            Vacant.set("idVacante", data.id_vacante);
                                            Vacant.set("Nombre", data.nombre_vacante);
                                            Vacant.set("Pruebas",pruebas);
                                            grid.saveChanges();
                                        },
                                        error: function (msg) {
                                            AlertB1Soft("Error", msg.status);
                                        }
                                    });
                                    return true;
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
            function OpenAgreDialog() {
                var dialog = $('#AgreDialog');
                dialog.empty();
                dialog.append("<form id='AddForm'></form>");
                var form = $('#AddForm');
                form.kendoForm({
                    validatable: {validationSummary: true},
                    orientation: "vertical",
                    items: [
                        {
                            field: "Nombre",
                            label: "Nombre del puesto",
                            validation: {required: true}
                        },
                        {
                            field: "pruebas",
                            label: "Pruebas a realizar",
                            editor: function (container, options) {
                                $("<input id='pruebasAdd'/>").appendTo(container);
                            },
                            validation: {required: true}
                        },
                    ],
                    buttonsTemplate: ""
                });
                $.ajax({
                    url: "regresaPruebasAdmin.htm",
                    dataType: "json",
                    success: function (data) {
                        var pruebas=[]
                        for(var i=0;i<data.length;i++){
                            pruebas.push({IdPrueba:data[i].Id_prueba,Nombre:data[i].Nombre_prueba});
                        }
                        $("#pruebasAdd").kendoMultiSelect({
                            optionLabel: "Selecciona las pruebas",
                            dataTextField: "Nombre",
                            dataValueField: "IdPrueba",
                            dataSource:pruebas
                        });
                    },
                    error: function (msg) {
                        
                    }
                });
                dialog.kendoDialog({
                    width: "450px",
                    title: "Agregar vacante",
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
                                var validator = form.kendoValidator().data("kendoValidator");
                                var multiselect = $("#pruebasAdd").data("kendoMultiSelect");
                                if(multiselect.value().length==0){
                                    AlertB1Soft("Error","Ingrese por lo menos una prueba")
                                    return false;
                                }
                                if (validator.validate()) {
                                    //console.log(multiselect.value())
                                    var data=form.serializeArray();
                                    var newVacante={
                                        Nombre:data[0].value,
                                        pruebas:multiselect.value()
                                    }
                                    $.ajax({
                                        url: "createVacante.htm",
                                        method: "POST",
                                        dataType: "json",
                                        data: newVacante,
                                        success: function (data) {
                                            var grid = $("#Vacantes").data("kendoGrid");
                                            var dataSources = $("#Vacantes").data("kendoGrid").dataSource;
                                             
                                            var pruebas=[];
                                            //console.log(data);
                                            for(var i=0;i<data.pruebas.length;i++){
                                                pruebas.push({IdPrueba:data.pruebas[i].Id_prueba,Nombre:data.pruebas[i].Nombre_prueba});
                                            }
                                            var newVacante = {
                                                idVacante: data.id_vacante,
                                                Nombre: data.nombre_vacante,
                                                Pruebas:pruebas,
                                            };
                                            dataSources.insert(newVacante);
                                            dataSources.sort({ field:"idVacante",dir:"asc"});
                                            grid.saveChanges();
                                            
                                            console.log(data);
                                        },
                                        error: function (msg) {
                                            AlertB1Soft("Error", msg.status);
                                        }
                                    });
                                    return true;
                                } else {
                                    return false;
                                }
                            }
                        },
                        {text: 'Cancelar'}]
                });
                dialog.data("kendoDialog").open();
            }

             

        </script>


    </body>
</html>