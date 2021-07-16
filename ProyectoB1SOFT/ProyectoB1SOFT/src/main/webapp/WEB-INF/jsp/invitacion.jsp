<%-- 
    Document   : invitacion.jsp
    Created on : 10/02/2021, 01:08:48 PM
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
        <script src="<c:url value='resources/js/kendo.culture.es-MX.min.js'/>"></script>
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
                        <button type="button" id="enviarEmail" class="btn btn-primary mb-2">Enviar</button>
                        <button type="button" id="addInvitacion" class="btn btn-primary mb-2">Agregar Invitaci&oacute;n</button>
                        <button type="button" id="editPersonal" class="btn btn-secondary mb-2">Editar</button>
                        <button type="button" id="deletePersonal" class="btn btn-danger">Borrar</button>
                    </div>
                </div>


            </div>
        </div>
        <div id="EditDialog">
        </div>
        <div id="AddDialog">
        </div>
    </main>
    <script>
        $(document).ready(function () {
            /*
            var personal = [
                {
                    RFC: "CABE971013",
                    Nombre: "Eduardo Yair",
                    ApPaterno: "Carrillo",
                    ApMaterno: "Balcazar",
                    Correo: "yirz.carrillo@gmail.com"
                },
                {
                    RFC: "CABE971013",
                    Nombre: "Juan",
                    ApPaterno: "Perez",
                    ApMaterno: "Perez",
                    Correo: "yirz.carrillo@gmail.com"
                },
                {
                    RFC: "CABE971013",
                    Nombre: "Yair",
                    ApPaterno: "Garcia",
                    ApMaterno: "Garcia",
                    Correo: "yirz.carrillo@gmail.com"
                }
            ]*/
            var personal=[];
            $.ajax({
                url:"readInvitacion.htm",
                dataType:"json",
                async: false,
                success: function (data) {
                    console.log(data)
                    for(var i=0;i<data.length;i++){
                        personal.push({idInvitacion:data[i].id_invitacion,RFC:data[i].rfc,Nombre:data[i].nombre,ApPaterno:data[i].apellidoP,ApMaterno:data[i].apellidoM,Correo:data[i].correo})
                    }
                },
                error: function (msg) {
                    console.log(msg);    
                }
            });
            console.log(personal);
            $('#personalAdmin').kendoGrid({
                dataSource: {
                    data: personal,
                    schema: {
                        model: {
                            fields: {
                                idInvitacion: {type: 'integer'},
                                RFC: {type: 'string'},
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
                sortable: true,
                filterable: true,
                resizable: true,
                toolbar: ["search"],
                pageable: {
                    input: true,
                    numeric: false
                },
                columns: [
                    {field: "RFC", title: "RFC"},
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
        $('#addInvitacion').click(function () {
            window.ConfirmB1Soft("Agregar Invitación", "¿Deseas agregar una nueva invitación?").then(function () {
                OpenAddDialog() 
            });
        });
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
                    
                    $.ajax({
                        url:"deleteInvitacion.htm",
                        method:"POST",
                        dataType:"json",
                        data:{id:selectedItem.idInvitacion},
                        success: function (data) {
                            console.log(data);
                            if(data.valid==1){
                                grid.dataSource.remove(selectedItem);
                                grid.saveChanges();
                                AlertB1Soft("Invitacion Eliminada","Se ha eliminado la invitación de manera correcta");
                            }
                            else{
                                AlertB1Soft("Error eliminación","No se ha podido eliminar inivtación");
                            }
                        },
                        error: function (msg) {
                             AlertB1Soft("Error eliminación","No se ha podido eliminar inivtación "+ msg.status);
                        }
                    })
                    /*
                   
                     */
                });
            }
        });
        $('#enviarEmail').click(function () {
            var grid = $('#personalAdmin').data("kendoGrid");
            var selectedItem = grid.dataItem(grid.select());
            if (selectedItem == null) {
                AlertB1Soft("Error", "Debes seleccionar un personal administrativo");
            } else {
                window.ConfirmB1Soft("Enviar Email", "¿Deseas enviar invitación a " + selectedItem.Nombre + " " + selectedItem.ApPaterno + " " + selectedItem.ApMaterno + "?").then(function () {
                    $.ajax({
                        url:"invitacion.htm",
                        data:{id:selectedItem.idInvitacion},
                        method:"POST",
                        dataType:"json",
                        success: function (data) {
                            if(data.valid){
                                AlertB1Soft("Invitación","Correo enviado correctamente");
                            }
                            else{
                                AlertB1Soft("Error Invitación","Correo no se pudo enviar correctamente");
                            }
                        },
                        error: function (msg) {
                            AlertB1Soft("Error Invitación","Correo no se pudo enviar correctamente");
                        }
                    })
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
                    id_invitacion:personal.idInvitacion,
                    RFC:personal.RFC,
                    Nombre: personal.Nombre,
                    ApPaterno: personal.ApPaterno,
                    ApMaterno: personal.ApMaterno,
                    Correo: personal.Correo
                },
                items: [
                    {
                        field:"id_invitacion",
                        label:"Id Invitación",
                        validation: {required: true}
                    },
                    {
                        field: "RFC",
                        label: "RFC",
                        validation: {required: true}
                    },
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
                        field: "Correo",
                        label: "Correo",
                        validation: {required: true, email: true}
                    }
                ],
                buttonsTemplate: ""
            });
            $("input[name='id_invitacion'").prop("readonly",true);
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
                                    url:"editInvitacion.htm",
                                    method:"POST",
                                    data: form.serialize(),
                                    dataType:"json",
                                    success: function (data) {
                                        console.log(data);
                                        personal.set("RFC",data.rfc)
                                        personal.set("Nombre",data.nombre );
                                        personal.set("ApPaterno",data.apellidoP);
                                        personal.set("ApMaterno",data.apellidoM);
                                        personal.set("Correo", data.correo);
                                        grid.saveChanges();
                                    },
                                    error: function (msg) {
                                        AlertB1Soft("Error","Error al editar el invitación")
                                    }
                                })
                               
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
        function OpenAddDialog() {
            var dialog = $('#AddDialog');
            dialog.empty();
            dialog.append("<form id='AddForm' method='POST'></form>");
            var form = $('#AddForm');
            form.kendoForm({
                validatable: {validationSummary: true},
                orientation: "vertical",
                items: [
                    {
                        field: "new_invitacion", editor: "DropDownList", label: "Postulantes sin invitación Generada", 
                        validation: { required: true }, 
                        editorOptions: {
                            optionLabel: "Seleccionar Postulante...",
                            dataSource: {
                                transport: {
                                    read: {
                                        dataType: "json",
                                        url: "readSin_Invitacion.htm",
                                    }
                                }
                            },
                            dataTextField: "rfc",
                            dataValueField: "rfc"
                        }
                    }
                ],
                buttonsTemplate: ""
            });
            $("input[name='id_invitacion'").prop("readonly",true);
            dialog.kendoDialog({
                width: "450px",
                title: "Agregar Inivitación",
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
                                var dataSources = $("#personalAdmin").data("kendoGrid").dataSource;
                                $.ajax({
                                    url:"createInvitacion.htm",
                                    method:"POST",
                                    data:form.serialize(),
                                    dataType:"json",
                                    success: function (data) {
                                        console.log(data);
                                        var newInvitacion = {
                                            idInvitacion:data.id_invitacion,
                                            RFC:data.rfc,
                                            Nombre:data.nombre,
                                            ApPaterno:data.apellidoP,
                                            ApMaterno:data.apellidoM,
                                            Correo:data.correo
                                        };
                                        dataSources.insert(newInvitacion);
                                        dataSources.sort({ field:"idInvitacion",dir:"asc"});
                                        grid.saveChanges();
                                    },
                                    error: function (msg) {
                        
                                    }
                                })
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