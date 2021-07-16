<%-- 
    Document   : pruebaSenior
    Created on : 11/02/2021, 01:13:42 PM
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
    <link rel="stylesheet" href="<c:url value='resources/css/prism.css'/>">
    <link rel="stylesheet" href="<c:url value='resources/css/colors.css'/>">
    <link rel="stylesheet" href="<c:url value='resources/css/all.css'/>">
    <link rel="stylesheet" href="<c:url value='resources/css/body.css'/>">

    <script src="<c:url value='resources/js/kendo.culture.es-MX.min.js'/>"></script>
    <script src="<c:url value='resources/js/jquery.min.js'/>"></script>
    <script src="<c:url value='resources/js/kendo.all.min.js'/>"></script>
    <script src="<c:url value='resources/js/pooper.min.js'/>"></script>
    <script src="<c:url value='resources/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='resources/js/all.min.js'/>"></script>
    <script src="<c:url value='resources/js/prism.js'/>"></script>
</head>

<body>
    <header>
        <nav class="navbar navbar-light bg-all">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                    <h3>B1SOFT LATINOAMERICA</h3>
                </a>
            </div>
        </nav>
    </header>
    <main>
        <div class="container">
            <div class="demo-section k-content wide">
                <form id="wizard" novalidate></form>
            </div>
        </div>
    </main>
    <script>

        $(document).ready(function () {

            $("#wizard").kendoWizard({
                pager: true,
                contentPosition: "bottom",
                stepper: {
                    indicator: true,
                    label: true,
                    linear: true
                },
                done: function (e) {
                    e.originalEvent.preventDefault();
                    kendo.alert("Thank you for registering! Registration details will be sent to your email.");
                },
                actionBar: true,
                steps: [{
                    title: "",
                    buttons: [{name:"next",text:"Siguiente"}],
                    form: {
                        items:[
                            {
                            field:"preg1",
                            editor:`
                            <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg1" id="preg1" value="a" required/>
                            <label class="form-check-label" for="preg1">a) Grano Fino.<br/>Acoplamiento Flexible.<br/>Plataforma Dependiente.</label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg1" id="preg1" value="b" required/>
                            <label class="form-check-label" for="preg1">b) Grano Fino.<br/>Acoplamiento Flexible.<br/>Plataforma Dependiente.
                            <br/>Grano Grueso.<br/>Plataforma Independiente.<br/>Bajo Acoplamiento.</label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg1" id="preg1" value="c" required/>
                            <label class="form-check-label" for="preg1">c) Grano Grueso.<br/>Plataforma Independiente.<br/>Bajo Acoplamiento. </label>
                            </li>`,
                            label:`¿Cuáles son las características correctas de un servicio web?`,
                            validation: {required:true},
                        
                            },
                    ]

                    },
                },
                {
                    title: "",
                    buttons: [{name:"previous",text:"Anterior"},{name:"next",text:"Siguiente"}],
                    form: {
                        items:[
                            {
                            field:"preg2",
                            editor:`
                            <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg2" id="preg2" value="a" required/>
                            <label class="form-check-label" for="preg2">a) La respuesta depende de la implementación. </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg2" id="preg2" value="b" required/>
                            <label class="form-check-label" for="preg2">b) TreeMap. </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg2" id="preg2" value="c" required/>
                            <label class="form-check-label" for="preg2">c) HashMap </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg2" id="preg2" value="d" required/>
                            <label class="form-check-label" for="preg2">d) LinkedHashMap </label>
                            </li>
                            </ul>`
                            ,
                            label:`Suponga que desea crear una instancia de un nuevo "Map" que tiene un orden de
                            iteración que es el mismo orden de iteración de una instancia existente de un "Map".
                            ¿Cuál es la implementación concreta de la interface "Map" que se debería usar para la nueva instancia?`,
                            validation: {required:true},
                        
                            },
                    ]
                        
                    },
                },
                {
                    title: "",
                    buttons: [{name:"previous",text:"Anterior"},{name:"next",text:"Siguiente"}],
                    form: {
                        items:[
                            {
                            field:"preg3",
                            editor:`
                            <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg3" id="preg3" value="a" required/>
                            <label class="form-check-label" for="preg3">a) Debe ser declarado como estatico. </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg3" id="preg3" value="b" required/>
                            <label class="form-check-label" for="preg3">b) Debe ser declarado como final. </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg3" id="preg3" value="c" required/>
                            <label class="form-check-label" for="preg3">c) Debe ser declarado como abstract. </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg3" id="preg3" value="d" required/>
                            <label class="form-check-label" for="preg3">d) Debe ser declarado como público. </label>
                            </li>
                            </ul>`,
                            label:`¿Cuál es verdadera acerca de un "method-local inner class"?`,
                            validation: {required:true},
                        
                            },
                    ]          
                    },
                },
                {
                    title: "",
                    buttons: [{name:"previous",text:"Anterior"},{name:"next",text:"Siguiente"}],
                    form: {
                        items:[
                            {
                            field:"preg4",
                            editor:`
                            <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg4" id="preg4" value="a" required/>
                            <label class="form-check-label" for="preg4">a) Construir un servicio web JAX-RS definiendo un WADL primero.</label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg4" id="preg4" value="b" required/>
                            <label class="form-check-label" for="preg4">b) Construir un servicio web JAX-WS mediante la exposicion de la lógica de negocio existente. </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg4" id="preg4" value="c" required/>
                            <label class="form-check-label" for="preg4">c) Construir un servicio web JAX-WS definiendo WSDL primero. </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg4" id="preg4" value="d" required/>
                            <label class="form-check-label" for="preg4">d) Construir un servicio web JAX-RS mediante la exposioción de la lógica de negocio existente a través de URI especifícada. </label>
                            </li></ul>`,
                            label:`Hay una empresa que proporciona informacion de valores en sus páginas web. debido a la creciente demanda
                            de la compañia financiera decide ofrecer sus servicios como servicio web. La mayoría de los nuevos clientes han 
                            optado por solicitar actualizaciones en su teléfono móvil a través de una aplicacion especializada.
                            ¿Cuál es la mejor solución para apoyar este requisito de negocio?`,
                            validation: {required:true},
                        
                            },
                    ]
                    },
                },
                {
                    title: "",
                    buttons: [{name:"previous",text:"Anterior"},{name:"next",text:"Siguiente"}],
                    form: {
                        items:[
                            {
                            field:"preg5",
                            editor:`
                            <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg5" id="preg5" value="a" required/>
                            <label class="form-check-label" for="preg5">a) Unicamente el system garbage collection puede destruir objetos. </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg5" id="preg5" value="b" required/>
                            <label class="form-check-label" for="preg5">b) Runtime.getRuntime().gc() </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg5" id="preg5" value="c" required/>
                            <label class="form-check-label" for="preg5">c) x.delete() </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg5" id="preg5" value="d" required/>
                            <label class="form-check-label" for="preg5">d) x.finalize() </label>
                            </li></ul>`,
                            label:`¿Cuál de las siguientes permite destruir un objeto x?`,
                            validation: {required:true},
                        
                            },
                    ]
                        
                    },
                },
                {
                    title: "",
                    buttons: [{name:"previous",text:"Anterior"},{name:"next",text:"Siguiente"}],
                    form: {
                        items:[
                            {
                            field:"preg6",
                            editor:`
                            <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg6" id="preg6" value="a" required/>
                            <label class="form-check-label" for="preg6">a) int a = Math.abs(5L); </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg6" id="preg6" value="b" required/>
                            <label class="form-check-label" for="preg6">b) int b = Math.abs(5.5F); </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg6" id="preg6" value="c" required/>
                            <label class="form-check-label" for="preg6">c) int c = Math.abs(5.0); </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg6" id="preg6" value="d" required/>
                            <label class="form-check-label" for="preg6">d) int d = Mathabs(-5); </label>
                            </li></ul>`,
                            label:`¿Cuál de las siguientes deberia compilar sin error?`,
                            validation: {required:true},
                        
                            },
                    ]
                    },
                },
                {
                    title: "",
                    buttons: [{name:"previous",text:"Anterior"},{name:"next",text:"Siguiente"}],
                    form: {
                        items:[
                            {
                            field:"preg7",
                            editor:`
                            <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg7" id="preg7" value="a" required/>
                            <label class="form-check-label" for="preg7">a) public [ ] int a<br>private int [3] a []<br/>
                            public final int [] a</label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg7" id="preg7" value="b" required/>
                            <label class="form-check-label" for="preg6">b) public int a [3]<br/>static int[3a] a<br/>
                            public final int [] a</label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg7" id="preg7" value="c" required/>
                            <label class="form-check-label" for="preg7">c) public int a [ ]<br/> static int [ ]a<br/>
                            private int a [3]</label>
                            </li>
                            </ul>`,
                            label:`Seleccione la opción que corresponda a una declaración correcta de array: `,
                            validation: {required:true},
                        
                            },
                    ]
                    },
                },
                {
                    title: "",
                    buttons: [{name:"previous",text:"Anterior"},{name:"next",text:"Siguiente"}],
                    form: {
                        items:[
                            {
                            field:"preg8",
                            editor:`
                            <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg8" id="preg8" value="a" required/>
                            <label class="form-check-label" for="preg8">a) El programa compila pero se lanza un error de runtime "NoSuchMethodError". </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg8" id="preg8" value="b" required/>
                            <label class="form-check-label" for="preg8">b) El programa no compila y lanza un error de runtime "NoSuchMethodError". </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg8" id="preg8" value="c" required/>
                            <label class="form-check-label" for="preg8">c) El programa compila. </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg8" id="preg8" value="d" required/>
                            <label class="form-check-label" for="preg8">d) Ninguna de las anteriores. </label>
                            </li>
                        </ul>`,
                            label:`¿Qué sucede si el modificador static es quitado de la firma del método main()?`,
                            validation: {required:true},
                        
                            },
                    ]
                    },
                },
                {
                    title: "",
                    buttons: [{name:"previous",text:"Anterior"},{name:"next",text:"Siguiente"}],
                    form: {
                        items:[
                            {
                            field:"preg9",
                            editor:`
                            <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg9" id="preg9" value="a" required/>
                            <label class="form-check-label" for="preg9">a) Session </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg9" id="preg9" value="b" required/>
                            <label class="form-check-label" for="preg9">b) PageContext </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg9" id="preg9" value="c" required/>
                            <label class="form-check-label" for="preg9">c) Config </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg9" id="preg9" value="d" required/>
                            <label class="form-check-label" for="preg9">d) Request </label>
                            </li></ul>`,
                            label:`En una página jsp, se ha creado el atributo "ID_Usuario", este estará disponible
                            en cualquiera de los siguientes ámbitos: pageContext, session y request. Pero no se 
                            sabe en que alcance exctamente estará disponible. ¿Cuál de las siguientes variables
                            implícitas se puede utilizar para recuperar su valor?`,
                            validation: {required:true},
                        
                            },
                    ]
                    },
                },
                {
                    title: "",
                    buttons: [{name:"previous",text:"Anterior"},{name:"next",text:"Siguiente"}],
                    form: {
                        items:[
                            {
                            field:"preg10",
                            editor:`
                            <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg10" id="preg10" value="a" required/>
                            <label class="form-check-label" for="preg10">a) TraversalRowSet </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg10" id="preg10" value="b" required/>
                            <label class="form-check-label" for="preg10">b) JdbcRowSet </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg10" id="preg10" value="c" required/>
                            <label class="form-check-label" for="preg10">c) WebRowSet </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg10" id="preg10" value="d" required/>
                            <label class="form-check-label" for="preg10">d) JoinRowSet </label>
                            </li></ul>`,
                            label:`¿Cuál de las siguientes interfaces no se extiende la interfaz RowSet?`,
                            validation: {required:true},
                        
                            },
                    ]
                    },
                },
                {
                    title: "",
                    buttons: [{name:"previous",text:"Anterior"},{name:"next",text:"Siguiente"}],
                    form: {
                      items:[
                          {
                          field:"preg11",
                          editor:`
                          <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                          <li class='k-radio-item'>
                          <input class="form-check-input" type="radio" name="preg11" id="preg11" value="a" required/>
                          <label class="form-check-label" for="preg11">a) Class.forName("com.mysql.jdbc.Driver") newInstance(.); </label>
                          </li>
                          <li class='k-radio-item'>
                          <input class="form-check-input" type="radio" name="preg11" id="preg11" value="b" required/>
                          <label class="form-check-label" for="preg11">b) Connection connection = DriverManager.createConnection
                            ("jdbc : mysql://localhost:3306/addressBook","root","password") </label>
                          </li>
                          <li class='k-radio-item'>
                          <input class="form-check-input" type="radio" name="preg11" id="preg11" value="c" required/>
                          <label class="form-check-label" for="preg11">c) Class.forName("com.mysql.jdbc.Driver") getInstance().; </label>
                          </li>
                          <li class='k-radio-item'>
                          <input class="form-check-input" type="radio" name="preg11" id="preg11" value="d" required/>
                          <label class="form-check-label" for="preg11">d) Connection connection = DriverManager.getConnection
                            ("jdbc : mysql://localhost:3306/addressBook","root","password") </label>
                          </li></ul>`,
                          label:`¿Cuál de las siguientes afirmaciones se necesitarían en JDBC 3.0?`,
                          validation: {required:true},
                          }
                      ]  
                    },
                },
                {
                    title: "",
                    buttons: [{name:"previous",text:"Anterior"},{name:"next",text:"Siguiente"}],
                    form: {
                        items:[
                          {
                          field:"preg12",
                          editor:`
                          <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                          <li class='k-radio-item'>
                          <input class="form-check-input" type="radio" name="preg12" id="preg12" value="a" required/>
                          <label class="form-check-label" for="preg12">a) Front Bean. </label>
                          </li>
                          <li class='k-radio-item'>
                          <input class="form-check-input" type="radio" name="preg12" id="preg12" value="b" required/>
                          <label class="form-check-label" for="preg12">b) Managed Bean. </label>
                          </li>
                          <li class='k-radio-item'>
                          <input class="form-check-input" type="radio" name="preg12" id="preg12" value="c" required/>
                          <label class="form-check-label" for="preg12">c) Backing Bean.  </label>
                          </li>
                          <li class='k-radio-item'>
                          <input class="form-check-input" type="radio" name="preg12" id="preg12" value="d" required/>
                          <label class="form-check-label" for="preg12">d) Full Bean. </label>
                          </li></ul>`,
                          label:`¿Cuál se ajusta a la definición: "Son creados por JSF y pueden ser almacenados dentro de los
                         scope request, session o application"?`,
                          validation: {required:true},
                          }
                      ]    
                    },
                },
                {
                    title: "",
                    buttons: [{name:"previous",text:"Anterior"},{name:"next",text:"Siguiente"}],
                    form: {
                        items:[
                          {
                          field:"preg13",
                          editor:`
                          <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                          <li class='k-radio-item'>
                          <input class="form-check-input" type="radio" name="preg13" id="preg13" value="a" required/>
                          <label class="form-check-label" for="preg13">a) No, hay varias formas de dar mayor seguridad ante los threads. </label>
                          </li>
                          <li class='k-radio-item'>
                          <input class="form-check-input" type="radio" name="preg13" id="preg13" value="b" required/>
                          <label class="form-check-label" for="preg13">b) Si, es la manera mas segura. </label>
                          </li>
                          <li class='k-radio-item'>
                          <input class="form-check-input" type="radio" name="preg13" id="preg13" value="c" required/>
                          <label class="form-check-label" for="preg13">c) Si, es la unica manera que hay. </label>
                          </li>
                          <li class='k-radio-item'>
                          <input class="form-check-input" type="radio" name="preg13" id="preg13" value="d" required/>
                          <label class="form-check-label" for="preg13">d) Ninguna de las anteriores. </label>
                          </li></ul>`,
                          label:`¿Un Singleton, es siempre seguro con Multi Hilos?`,
                          validation: {required:true},
                          }
                      ]     
                    },
                },
                {
                    title: "",
                    buttons: [{name:"previous",text:"Anterior"},{name:"next",text:"Siguiente"}],
                    form: {
                        items:[
                          {
                          field:"preg14",
                          editor:`<img src="<c:url value='resources/img/Senior14.jpg'/>">
                          <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                          <li class='k-radio-item'>
                          <input class="form-check-input" type="radio" name="preg14" id="preg14" value="a" required/>
                          <label class="form-check-label" for="preg14">a) Después de la linea 7 cuando doBar() termine </label>
                          </li>
                          <li class='k-radio-item'>
                          <input class="form-check-input" type="radio" name="preg14" id="preg14" value="b" required/>
                          <label class="form-check-label" for="preg14">b) Después de la linea 14 </label>
                          </li>
                          <li class='k-radio-item'>
                          <input class="form-check-input" type="radio" name="preg14" id="preg14" value="c" required/>
                          <label class="form-check-label" for="preg14">c) Despues de la 14 cuando main() termine </label>
                          </li>
                          <li class='k-radio-item'>
                          <input class="form-check-input" type="radio" name="preg14" id="preg14" value="d" required/>
                          <label class="form-check-label" for="preg14">d) Depués de la linea 12 </label>
                          </li></ul>`,
                          label:`¿Cuál sentencia insertada en la línea 10, crea una instancia de "Bar"?`,
                          validation: {required:true},
                          }
                      ]   
                    },
                },
                {
                    title: "",
                    buttons: [{name:"previous",text:"Anterior"},{name:"next",text:"Siguiente"}],
                    form: {
                        items:[
                          {
                          field:"preg15",
                          editor:`<img src="<c:url value='resources/img/Senior15.jpg'/>">
                          <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                          <li class='k-radio-item'>
                          <input class="form-check-input" type="radio" name="preg15" id="preg15" value="a" required/>
                          <label class="form-check-label" for="preg15">a) Línea 11. </label>
                          </li>
                          <li class='k-radio-item'>
                          <input class="form-check-input" type="radio" name="preg15" id="preg15" value="b" required/>
                          <label class="form-check-label" for="preg15">b) Línea 14. </label>
                          </li>
                          <li class='k-radio-item'>
                          <input class="form-check-input" type="radio" name="preg15" id="preg15" value="c" required/>
                          <label class="form-check-label" for="preg15">c) Linea 12. </label>
                          </li>
                          <li class='k-radio-item'>
                          <input class="form-check-input" type="radio" name="preg15" id="preg15" value="d" required/>
                          <label class="form-check-label" for="preg15">d) Línea 22. </label>
                          </li></ul>`,
                          label:`¿Cuál línea en el ejemplo representa un uso inapropiado de assertions?`,
                          validation: {required:true},
                          }
                      ]     
                    },
                },
                {
                    title: "",
                    buttons: [{name:"previous",text:"Anterior"},{name:"next",text:"Siguiente"}],
                    form: {
                        items:[
                          {
                          field:"preg16",
                          editor:`<img src="<c:url value='resources/img/Senior16.jpg'/>">
                          <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                          <li class='k-radio-item'>
                          <input class="form-check-input" type="radio" name="preg16" id="preg16" value="a" required/>
                          <label class="form-check-label" for="preg16">a) Se lanza un AssertionError. </label>
                          </li>
                          <li class='k-radio-item'>
                          <input class="form-check-input" type="radio" name="preg16" id="preg16" value="b" required/>
                          <label class="form-check-label" for="preg16">b) Se lanza un AssertionError y se presenta la palabra finished. </label>
                          </li>
                          <li class='k-radio-item'>
                          <input class="form-check-input" type="radio" name="preg16" id="preg16" value="c" required/>
                          <label class="form-check-label" for="preg16">c) finished. </label>
                          </li>
                          <li class='k-radio-item'>
                          <input class="form-check-input" type="radio" name="preg16" id="preg16" value="d" required/>
                          <label class="form-check-label" for="preg16">d) La compilación falla. </label>
                          </li></ul>`,
                          label:`¿Cuál es la salida del programa? (Cuando se ejecuta con la opción -ea)`,
                          validation: {required:true},
                          }
                      ]   
                    },
                },
                {
                    title: "",
                    buttons: [{name:"previous",text:"Anterior"},{name:"next",text:"Siguiente"}],
                    form: {
                        items:[
                          {
                          field:"preg17",
                          editor:`<img src="<c:url value='resources/img/Senior17.jpg'/>">
                          <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                          <li class='k-radio-item'>
                          <input class="form-check-input" type="radio" name="preg17" id="preg17" value="a" required/>
                          <label class="form-check-label" for="preg17">a) @OneToOne(cascade = CascadeType.REMOVE). </label>
                          </li>
                          <li class='k-radio-item'>
                          <input class="form-check-input" type="radio" name="preg17" id="preg17" value="b" required/>
                          <label class="form-check-label" for="preg17">b) @OneToOne(cascade = CascadeType.ORPHAN_DELETE). </label>
                          </li>
                          <li class='k-radio-item'>
                          <input class="form-check-input" type="radio" name="preg17" id="preg17" value="c" required/>
                          <label class="form-check-label" for="preg17">c) @OneToOne. </label>
                          </li>
                          <li class='k-radio-item'>
                          <input class="form-check-input" type="radio" name="preg17" id="preg17" value="d" required/>
                          <label class="form-check-label" for="preg17">d) @OneToOne(cascade = CascadeType.DELETE). </label>
                          </li></ul>`,
                          label:`Considere el siguiente código
                          ¿Dado que hay una asignación unidireccional de uno a uno entre la persona y la dirección, cuál
                          de las siguientes anotaciones debería ser asignada al campo de dirección tal que cuando se elimina una entidad persona, la dirección
                          asociada es eliminada también?`,
                          validation: {required:true},
                          }
                      ]  
                    },
                },
                {
                    title: "",
                    buttons: [{name:"previous",text:"Anterior"},{name:"next",text:"Siguiente"}],
                    form: {
                        items:[
                          {
                          field:"preg18",
                          editor:`<img src="<c:url value='resources/img/Senior18.jpg'/>">
                          <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                          <li class='k-radio-item'>
                          <input class="form-check-input" type="radio" name="preg18" id="preg18" value="a" required/>
                          <label class="form-check-label" for="preg18">a) Apply @Enumerated(STRING) en el atributo de clase cardType de la entidad CreditCard. </label>
                          </li>
                          <li class='k-radio-item'>
                          <input class="form-check-input" type="radio" name="preg18" id="preg18" value="b" required/>
                          <label class="form-check-label" for="preg18">b) Apply @Basic en card cardType el atributo de la clase de la entidad CreditCard. </label>
                          </li>
                          <li class='k-radio-item'>
                          <input class="form-check-input" type="radio" name="preg18" id="preg18" value="c" required/>
                          <label class="form-check-label" for="preg18">c) Apply @Enumerated(STRING) en CreditCardType enum . </label>
                          </li>
                          <li class='k-radio-item'>
                          <input class="form-check-input" type="radio" name="preg18" id="preg18" value="d" required/>
                          <label class="form-check-label" for="preg18">d) No hay cambio en el codigo. </label>
                          </li></ul>`,
                          label:`¿Cómo se podría ajustar el código siguiente para que cuando se almacene una tarjeta de
                          crédito, en la columna de base de datos cardType contenga valores de cadena ("VISA",
                          "American Express", etc.) para el tipo de tarjeta?`,
                          validation: {required:true},
                          }
                      ]  
                    },
                },
                {
                    title: "",
                    buttons: [{name:"previous",text:"Anterior"},{name:"next",text:"Siguiente"}],
                    form: {                        
                        items:[
                          {
                          field:"preg19",
                          editor:`<img src="<c:url value='resources/img/Senior12.jpg'/>">
                          <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                          <li class='k-radio-item'>
                          <input class="form-check-input" type="radio" name="preg19" id="preg19" value="a" required/>
                          <label class="form-check-label" for="preg19">a) Este programa imprimirá la primera fila de contacto </label>
                          </li>
                          <li class='k-radio-item'>
                          <input class="form-check-input" type="radio" name="preg19" id="preg19" value="b" required/>
                          <label class="form-check-label" for="preg19">b) Este programa imprimirá el siguiente: SQLException </label>
                          </li>
                          <li class='k-radio-item'>
                          <input class="form-check-input" type="radio" name="preg19" id="preg19" value="c" required/>
                          <label class="form-check-label" for="preg19">c)  Este programa informará de errores del compilador </label>
                          </li>
                          <li class='k-radio-item'>
                          <input class="form-check-input" type="radio" name="preg19" id="preg19" value="d" required/>
                          <label class="form-check-label" for="preg19">d) Este programa imprimirá todas las líneas del contacto </label>
                          </li></ul>`,
                          validation: {required:true},
                          }
                      ]  
                    },
                },
               { 
                    title: "",
                    buttons: [{name:"previous",text:"Anterior"},{name:"done",text:"Finalizar"}],
                    form: {
                        items:[
                          {
                          field:"preg20",
                          editor:`<img src="<c:url value='resources/img/Senior13.jpg'/>'/>">
                          <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                          <li class='k-radio-item'>
                          <input class="form-check-input" type="radio" name="preg20" id="preg20" value="a" required/>
                          <label class="form-check-label" for="preg20">a) Bar b = f.new Bar(); </label>
                          </li>
                          <li class='k-radio-item'>
                          <input class="form-check-input" type="radio" name="preg20" id="preg20" value="b" required/>
                          <label class="form-check-label" for="preg20">b) Foo.Bar b = new Foo.Bar(); </label>
                          </li>
                          <li class='k-radio-item'>
                          <input class="form-check-input" type="radio" name="preg20" id="preg20" value="c" required/>
                          <label class="form-check-label" for="preg20">c) Bar b = f.new Bar(); </label>
                          </li>
                          <li class='k-radio-item'>
                          <input class="form-check-input" type="radio" name="preg20" id="preg20" value="d" required/>
                          <label class="form-check-label" for="preg20">d) Foo.Bar b = f.Bar(); </label>
                          </li></ul>`,
                          label:`¿Cuál sentencia insertada en la línea 10, crea una instancia de "Bar"?`,
                          validation: {required:true},
                          }
                      ]    
                    },
                }]
            });
        })
    </script>
    <style>
        .radio{color: black;}
    </style>
</body>

</html>