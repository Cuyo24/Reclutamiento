<%-- 
    Document   : prueba
    Created on : 15 jul. 2021, 13:15:25
    Author     : marti
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
       <title></title>
    <link rel="stylesheet" href="<c:url value='resources/css/kendo.common-bootstrap.min.css'/>">
        <link rel="stylesheet" href="<c:url value='resources/css/kendo.bootstrap-v4.min.css'/>">
        <link rel="stylesheet" href="<c:url value='resources/css/bootstrap.min.css'/>">
        <link rel="stylesheet" href="<c:url value='resources/css/colors.css'/>">
        <link rel="stylesheet" href="<c:url value='resources/css/all.css'/>">
        <link rel="stylesheet" href="<c:url value='resources/css/body.css'/>">
        <link rel="stylesheet" href="<c:url value='resources/css/style.css'/>">

        <script src="<c:url value='resources/js/jquery.min.js'/>"></script>
        <script src="<c:url value='resources/js/kendo.all.min.js'/>"></script>
        <script src="<c:url value='resources/js/pooper.min.js'/>"></script>
        <script src="<c:url value='resources/js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='resources/js/all.min.js'/>"></script>

    <script src="js/jquery.min.js"></script>
    
    
    <script src="js/kendo.all.min.js"></script>
    <style>
        .center {
          margin: auto;
          width: 60%;
          border: 3px solid #73AD21;
          padding: 10px;
        }
        .boton{
            align-items: center;
        }
          body { Background: transparent; }
        </style>
    
    </head>
    <body>
          <header>
            <header>
                <div class="nav-bg">
                    <nav class="navegacion-principal contenedor"> <!--se pueden poner mas de una clase solo con un espacio-->
                        <p>B1 SOFT LATINOAMÉRICA</p>
                    </nav>
                </div>

            </header>
        </header>
        
       <div id="EditDialog"></div>
    <div id="example" class="center">
    <div class="demo-section k-content">
        <h4>Grid Layout</h4>
        <div id="validation-success"></div>

        <form id="exampleform">
            
        </form>
        
    </div>
    <p>   
        <button id="BotonFormulario" class="k-secundary">Abrir dialog</button>
    </p>
    <script>
        $(document).ready(function () {

            var validationSuccess = $("#validation-success");
            
            $("#exampleform").kendoForm({
                formData: {
                    RFC: "01928091",
                    LastName: "Doe",
                    Email: " ",
                    Edad:"0",
                    Country: "1",
                    City: "Strasbourg",
                    AddressLine: ""
                },
                layout: "grid",
                grid: {
                    cols: 2,
                    gutter: 20
                },
                items: [
                    {
                        type: "group",
                        label: "Postulante",
                        layout: "grid",
                        grid: { cols: 1, gutter: 10},
                        items: [
                            { 
                                field: "RFC", 
                                label: "RFC:",  

                                validation: {readonly:true } 
                            },
                            { 
                                field: "NSS", 
                                label: "NSS:", 
                                validation: { readonly:true } 
                            },
                            { 
                                field: "Telefono", 
                                label: "Telefono", 
                                validation: { 
                                    required: true 
                                }
                            },
                            {
                                field: "CP",
                                label: "CP: ",
                                validation: {
                                    min:0,required: true, type:"number",onkeypress:'return event.charCode >= 48 && event.charCode <= 57'
                                }
                            },
                            {
                                field: "Estado",
                                label: "Estado: ",
                                validation: {
                                    required: true
                                }
                            },
                            {
                                field: "Instituto",
                                label: "Instituto: ",
                                validation: {
                                    required: true
                                }
                            }
                            
                        ]
                    },
                    {
                        type: "group",
                        label: "ㅤ",
                        layout: "grid",
                        grid: { cols: 1, gutter: 10},
                        items: [
                        { 
                                field: "Edad", 
                                label: "Edad:", 
                                validation: { min:0,required: true, type:"number",onkeypress:'return event.charCode >= 48 && event.charCode <= 57' } 
                            },    
                        { 
                                field: "Email", 
                                label: "Correo:", 
                                validation: { required: true, email: true } 
                            },
                            { 
                                field: "CURP", 
                                label: "CURP:", 
                                validation: { required: true } 
                            },
                            { 
                                field: "Municipio", 
                                label: "Municipio: ", 
                                validation: { required: true } 
                            },
                            {
                                field: "Colonia", 
                                label: "Colonia: ", 
                                validation: { required: true } 
                            }

                        ]
                    },
                    
                ],
                validateField: function(e) {
                    validationSuccess.html("");
                },
                submit: function(e) {
                    e.preventDefault();
                    validationSuccess.html("<div class='k-messagebox k-messagebox-success'>Form data is valid!</div>");
                },
                clear: function(ev) {
                    validationSuccess.html("");
                }
                
                
            });
        });
        

        function onOpenformulario() {
                        var dialog = $('#EditDialog');
                        dialog.empty();
                        dialog.append("<form id='exampleform'</form>");
                        var form = $('#exampleform');
                        form.kendoForm({
                            layout: "grid",
                            grid: {
                                cols: 1,
                                gutter: 20
                            },
                            buttonsTemplate: "",

                            items: [
                                {
                                    type: "group",
                                    label: "Datos Generales",
                                    layout: "grid",
                                    grid: { cols: 1, gutter: 5 },
                                    
                                    items: [
                                        {
                                            field: "RFC",
                                            label: "RFC:",
                                            validation: { required: true }
                                        },
                                        {
                                            field: "Nombre",
                                            label: "Nombre:",
                                            validation: { required: true }
                                        },
                                        {
                                            field: "ApellidoPaterno",
                                            label: "Apellido Paterno",
                                            validation: {
                                                required: true
                                               
                                            }
                                        },
                                        {
                                            field: "ApellidoMaterno",
                                            label: "Apellido Materno",
                                            validation: {
                                                required: true
                                               
                                            }
                                        },
                                        {
                                            field: "Correo",
                                            label: "Correo",
                                            validation: {
                                                type: "email",
                                                required: true,
                                                email: true
                                               
                                            }
                                        }
                                    ]
                                },

                            ],
                        });

                        dialog.kendoDialog({
                            width: "400px",
                            title: "Modificar",
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

                                { text: 'Guardar', primary: true }]
                        });
                        dialog.data("kendoDialog").open();
                    }
        

                    $('#BotonFormulario').click(function () {
                            onOpenformulario();
                        });
                      
                        $('#dialogformulario').kendoDialog({
                            title: "Grid de ejemplo",
                            width: "1300px",
                            height: "600px",
                            modal: true,
                            open: onOpenformulario,
                            visible: false,
                            closable: true
                        });

        
    </script>
</div>

<style>
    #example .k-content {
        max-width: 600px;
        width: 600px;
    }
</style>

    </body>
</html>
