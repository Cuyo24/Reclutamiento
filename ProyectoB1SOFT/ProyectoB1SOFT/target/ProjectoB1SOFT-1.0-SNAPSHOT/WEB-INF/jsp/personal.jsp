<%-- 
    Document   : personal
    Created on : 10/02/2021, 01:30:45 PM
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
        <style>
            body { Background: transparent; }
        </style>
    </head>
    <body>
        <main>
            <div class="container" style="margin: 10px 0;">
                <div class="row">
                    <div class="d-flex justify-content-start" style="width: 70%;">
                        <div id="personalAdmin"></div>
                    </div>
                    <div class="d-flex flex-column justify-content-center" style="width: 30%;">
                        <button type="button" id="editPersonal" class="btn btn-secondary mb-2">Editar</button>
                        <button type="button" id="deletePersonal" class="btn btn-danger">Borrar</button>
                    </div>
                </div>
            </div>
        </div>
        <div id="EditDialog">

        </div>
    </main>
    <script>

        $(document).ready(function () {
            /* var personal = [
             {
             idEmpleado: 151551,
             Nombre: "Eduardo Yair",
             ApPaterno: "Carrillo",
             ApMaterno: "Balcazar",
             Correo: "yirz.carrillo@gmail.com"
             },
             {
             idEmpleado: 6516515,
             Nombre: "Juan",
             ApPaterno: "Perez",
             ApMaterno: "Perez",
             Correo: "yirz.carrillo@gmail.com"
             },
             {
             idEmpleado: 56151651,
             Nombre: "Yair",
             ApPaterno: "Garcia",
             ApMaterno: "Garcia",
             Correo: "yirz.carrillo@gmail.com"
             }
             ]*/
            var personal = [];
            $.ajax({
                url: "readAdmin.htm",
                method: "GET",
                dataType: "json",
                //data: $('#personalAdmin').serialize(),
                //  async: false,
                success: function (data) {
                    console.log(data);
                    for (var i = 0; i < data.length; i++) {
                        personal.push({idEmpleado: data[i].id_empleado, Nombre: data[i].nombre_admin, ApPaterno: data[i].apellidop_admin, ApMaterno: data[i].apellidom_admin, Correo: data[i].correo_admin});
                    }
                    $("#personalAdmin").data("kendoGrid").dataSource.read();
                },
                error: function (msg) {
                    console.log(msg);

                }
            });
           // console.log(personal);
            //
            $('#personalAdmin').kendoGrid({
                dataSource: {
                    data: personal,
                    schema: {
                        model: {
                            fields: {
                                idEmpleado: {type: 'string'},
                                Nombre: {type: "string"},
                                ApPaterno: {type: "string"},
                                ApMaterno: {type: "string"},
                                Correo: {type: "string"}
                            }
                        }
                    },
                    pageSize: 20
                },
                height: 550,
                width: 700,
                selectable: true,
                scrollable: true,
                resizable: true,
                sortable: true,
                filterable: true,
                toolbar: ["search"],
                pageable: {
                    input: true,
                    numeric: false
                },
                columns: [
                    {field: "idEmpleado", title: "idEmpleado"},
                    {field: "Nombre", title: "Nombre"},
                    {field: "ApPaterno", title: "Apellido Paterno"},
                    {field: "ApMaterno", title: "Apellido Materno"},
                    {field: "Correo", title: "Correo Electronico"}
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
        $('#editPersonal').click(function () {
            var grid = $('#personalAdmin').data("kendoGrid");
            var selectedItem = grid.dataItem(grid.select());
            if (selectedItem == null) {
                AlertB1Soft("Error", "Debes seleccionar un personal administrativo");
            } else {
                window.ConfirmB1Soft("Borrar Personal", "¿Deseas editar a " + selectedItem.Nombre + " " + selectedItem.ApPaterno + " " + selectedItem.ApMaterno + "?").then(function () {
                    //console.log(selectedItem);
                    OpenEditDialog(selectedItem);
                    //console.log(grid.dataSource);
                });
            }
        });
        $('#deletePersonal').click(function () {
            var grid = $('#personalAdmin').data("kendoGrid");
            var selectedItem = grid.dataItem(grid.select());
            if (selectedItem == null) {
                AlertB1Soft("Error", "Debes seleccionar un personal administrativo");
            } else {
                window.ConfirmB1Soft("Borrar Personal", "¿Deseas borrar a " + selectedItem.Nombre + " " + selectedItem.ApPaterno + " " + selectedItem.ApMaterno + "?").then(function () {
//AJAXDELETE
                    $.ajax({
                        url: "deleteAdmin.htm",
                        method: "POST",
                        //dataType: "json",
                        data: {idEmpleado:selectedItem.idEmpleado},
                        success: function (data) {
                            console.log(data);
                            if (data.valid == 1) {
                                grid.dataSource.remove(selectedItem);
                                grid.saveChanges();
                                //AlertB1Soft("Administrador Eliminado", "Se ha eliminado el administrador de manera correcta");
                            } else {
                                AlertB1Soft("Administrador Eliminado", "Se ha eliminado el administrador de manera correcta");
                            }
                        },
                        error: function (msg) {
                            AlertB1Soft("Error eliminación", "No se ha podido eliminar inivtación " + msg.status);
                        }
                    });
                    //console.log(grid.dataSource);
                });
            }
        });

        function OpenEditDialog(personal) {
            var dialog = $('#EditDialog');
            dialog.empty();
            dialog.append("<form id='EditForm' method='POST'></form>");
            var form = $('#EditForm');
            form.kendoForm({
                validatable: {validationSummary: true},
                orientation: "vertical",
                formData: {
                    Nombre: personal.Nombre,
                    ApPaterno: personal.ApPaterno,
                    ApMaterno: personal.ApMaterno,
                    idEmpleado: personal.idEmpleado,
                    Correo: personal.Correo
                },
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
                    }
                ],
                buttonsTemplate: ""
            });

            $("input[name='id_empleado'").prop("readonly", true);
            dialog.kendoDialog({
                width: "450px",
                title: "Editar Personal",
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
                            if (validator.validate()) {
                                var grid = $("#personalAdmin").data("kendoGrid");
                                var dataFrom = form.serializeArray();
                                $.ajax({
                                    url: "updateAdmin.htm",
                                    method: "POST",
                                    data: form.serialize(),
                                    dataType: "json",
                                    success: function (data) {
                                        console.log(data);
                                        personal.set("Nombre", data.nombre_admin);
                                        personal.set("ApPaterno", data.apellidop_admin);
                                        personal.set("ApMaterno", data.apellidom_admin);
                                        personal.set("idEmpleado", data.id_empleado);
                                        personal.set("Correo", data.correo_admin);
                                        grid.saveChanges();
                                    },
                                    error: function (msg) {
                                        AlertB1soft("Error","Error al editar el invitación");
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
    </script>
</body>

</html>