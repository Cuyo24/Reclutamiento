<%-- 
    Document   : pruebaJunior
    Created on : 11/02/2021, 01:13:10 PM
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
                    kendo.alert("Gracias!! Has finalizado tus pruebas de Programador JR.");
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
                            <label class="form-check-label" for="preg1">a) Es un concepto similar al de 'array'. </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg1" id="preg1" value="b" required/>
                            <label class="form-check-label" for="preg1">b) Es un tipo particular de variable. </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg1" id="preg1" value="c" required/>
                            <label class="form-check-label" for="preg1">c) Como la sintaxis se basa en C++, es mas facil aprender si ya se conoce ese lenguaje. </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg1" id="preg1" value="d" required/>
                            <label class="form-check-label" for="preg1">d) Es una categoria de datos ordenada secuencialmente. </label>
                            </li></ul>`,
                            label:`¿Cuáles son las ventajas del lenguaje de programación Java?`,
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
                            <label class="form-check-label" for="preg2">a) No lo se.  </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg2" id="preg2" value="b" required/>
                            <label class="form-check-label" for="preg2">b) Es un concepto similar al de 'array'. </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg2" id="preg2" value="c" required/>
                            <label class="form-check-label" for="preg2">c) Es el acto mediante el cual una persona transmite sus bienes </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg2" id="preg2" value="d" required/>
                            <label class="form-check-label" for="preg2">d) Cuando una clase se deriva de una clase existente. </label>
                            </li></ul>`,
                            label:`¿Qué es la herencia?`,
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
                            <label class="form-check-label" for="preg3">a) public: marca un programa como basado en clases.<br/> static: modificador de acceso.<br/>
                                void: el nombre del método.<br/>String arg[]: no accede a ninguna clase.   </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg3" id="preg3" value="b" required/>
                            <label class="form-check-label" for="preg3">b) String args[]: los parámetros que van al método principal.<br/>static: marca un programa como basado en clases.<br/>
                            void: define el tipo de devolución del método.<br/> main: el nombre del método.<br/>public: modificador de acceso.</label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg3" id="preg3" value="c" required/>
                            <label class="form-check-label" for="preg3">c) public: no accede a ninguna clase.<br/> static: se puede acceder pero se necesita crear una instancia.<br/>
                                void: devuelve valores.<br/>String arg[]: parametros.</label>
                            </li></ul>`,
                            label:`¿Qué es public static void main (String args [])?`,
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
                            <label class="form-check-label" for="preg4">a) Se refiere a la acción de hacer una copia exacta de un objeto. </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg4" id="preg4" value="b" required/>
                            <label class="form-check-label" for="preg4">b) El procedimiento de obtener una población de varios inliiduos genéticamente homogéneos a partir de uno solo. </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg4" id="preg4" value="c" required/>
                            <label class="form-check-label" for="preg4">c) Es crear una copia de un objeto utilizando el método Clone (). Eso crea una nueva instancia del objeto e inicializa todos los campos.</label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg4" id="preg4" value="d" required/>
                            <label class="form-check-label" for="preg4">d) Se ha de redefinir la función miembro clone de la clase base Object</label>
                            </li></ul>`,
                            label:`En Java ¿Qué es la clonación de objetos?`,
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
                            <label class="form-check-label" for="preg5">a) sleep() da una breve pausa, wait() hara la pausa hasta que se cumpla un acondicion. </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg5" id="preg5" value="b" required/>
                            <label class="form-check-label" for="preg5">b) Sleep() no hace nada, wait() espera una orden </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg5" id="preg5" value="c" required/>
                            <label class="form-check-label" for="preg5">c) Tienen diferentes hilos. </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg5" id="preg5" value="d" required/>
                            <label class="form-check-label" for="preg5">d) Todas las anteriores. </label>
                            </li></ul>`,
                            label:`¿Cuál es la diferencia entre dormir y esperar en Java?`,
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
                            <label class="form-check-label" for="preg6">a) El tamaño no importa.  </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg6" id="preg6" value="b" required/>
                            <label class="form-check-label" for="preg6">b) El tamaño de int en maquinas de 32 bits y 64 bits es de 32 bits o 4 bytes. </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg6" id="preg6" value="c" required/>
                            <label class="form-check-label" for="preg6">c) El tamaño suele ser de 64 bits u 8 bytes.  </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg6" id="preg6" value="d" required/>
                            <label class="form-check-label" for="preg6">d) El tamaño depende del sistema operativo. </label>
                            </li></ul>`,
                            label:`¿Cuál es el tamaño de int en una máquina virtual Java de 64 bits?`,
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
                            <label class="form-check-label" for="preg7">a) JRE proporciona herramientas para desarrollar.<br/>JDK máquina virtual Java.<br/>JVM compilación Just In Time.<br/>
                            JIT entorno de tiempo de ejecución</label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg7" id="preg7" value="b" required/>
                            <label class="form-check-label" for="preg7">b) JRE significa entorno de tiempo de ejecución Java.<br/>JDK es un kit de desarrollo de Java, que proporciona herramientas para desarrollar.<br/>
                            JVM significa máquina virtual Java.<br/>JIT significa compilación Just In Time.   </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg7" id="preg7" value="b" required/>
                            <label class="form-check-label" for="preg7">c) JRE compilación Just In Time.<br/>JDK es un kit de desarrollo de Java, que proporciona herramientas para desarrollar.<br/> 
                            JVM significa máquina virtual Java.<br/>JIT significa compilación Just In Time.  </label>
                            </li></ul>`,
                            label:`¿Qué significan JRE, JDK, JVM y JIT?`,
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
                            <label class="form-check-label" for="preg8">a) Un vector​ es un ente matemático como la recta o el plano. Una matriz es un arreglo bidimensional de números. </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg8" id="preg8" value="b" required/>
                            <label class="form-check-label" for="preg8">b) Los vectores son estáticas: tienen tamaños y tipos fijos. Las matrices contienen listas dinámicas de referencias a otros objetos y diferentes tipos de datos.</label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg8" id="preg8" value="b" required/>
                            <label class="form-check-label" for="preg8">c) Un vector se representa mediante un segmento de recta. Una matriz es un arreglo bidimensional.  </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg8" id="preg8" value="b" required/>
                            <label class="form-check-label" for="preg8">d) Los vectores se asignan dinámicamente: contienen listas dinámicas de referencias a otros objetos y diferentes tipos de datos. 
                            Por otro lado, las matrices son estáticas: tienen tamaños y tipos fijos.    </label>
                            </li></ul>`,
                            label:`Describe las diferencias entre vectores y matrices en Java.`,
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
                            <label class="form-check-label" for="preg9">a) Siempre necesitamos agregar la ubicación del directorio en la variable path al instalar Java para que el sistema operativo encuentre el ejecutable. 
                            Classpath es utilizado por los ejecutables de Java para localizar archivos de clase.  </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg9" id="preg9" value="b" required/>
                            <label class="form-check-label" for="preg9">b) La diferencia radica en la elección de la sincronización. Si necesitamos manejar una gran cantidad de subprocesos, debemos optar por una técnica 
                            de sincronización avanzada como la eliminación de bloqueos. </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg9" id="preg9" value="b" required/>
                            <label class="form-check-label" for="preg9">c) En cualquier lenguaje orientado a objetos, permite que una subclase, clase derivada, clase extendida o clase secundaria proporcione una implementación 
                            diferente de un método derivado de sus superclases, clase base o clase padre.   </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg9" id="preg9" value="b" required/>
                            <label class="form-check-label" for="preg9">d) Es independiente de la plataforma: no se basa en el sistema operativo para ejecutar su código. Viene con su propia plataforma.  </label>
                            </li></ul>`,
                            label:`En Java, ¿cuál es la diferencia entre las variables path y classpath?`,
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
                            <label class="form-check-label" for="preg10">a)  La prueba de integración de hilos, asegura que tu código se integra con otros sistemas; mientras que una prueba funcional 
                            verifica la funcionalidad real de la aplicación mediante el uso de herramientas automatizadas para simular las interacciones del usuario.  </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg10" id="preg10" value="b" required/>
                            <label class="form-check-label" for="preg10">b)  El uso del método hilos es una buena indicación de una programación eficiente y un código limpio. </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg10" id="preg10" value="b" required/>
                            <label class="form-check-label" for="preg10">c) El código de sincronización es independiente del número de hilos, por lo que escribir código tendrá la misma complejidad en ambos casos.
                            La diferencia radica en la elección de la sincronización </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg10" id="preg10" value="b" required/>
                            <label class="form-check-label" for="preg10">d) Cualquier desarrollador de software debe depurar como parte de sus habilidades básicas, 
                            pero el enfoque correcto es analizar el problema en lugar de encontrar pequeños errores en los fragmentos de código. </label>
                            </li></ul>`,
                            label:`¿Qué es más difícil de programar, un código de sincronización para 10 hilos o 2 hilos?`,
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
                            editor:`<img src="<c:url value='resources/img/preg11.jpg'/>">
                            <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg11" id="preg11" value="a" required/>
                            <label class="form-check-label" for="preg11">a) 9 </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg11" id="preg11" value="b" required/>
                            <label class="form-check-label" for="preg11">b) 3  </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg11" id="preg11" value="b" required/>
                            <label class="form-check-label" for="preg11">c) 8 </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg11" id="preg11" value="b" required/>
                            <label class="form-check-label" for="preg11">d) Nada.  </label>
                            </li></ul>`,
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
                            field:"preg12",
                            editor:`<img src="<c:url value='resources/img/preg12.jpg'/>">
                            <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg12" id="preg12" value="a" required/>
                            <label class="form-check-label" for="preg12">a) Genera un Applet con el texto "Hola Mundo". </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg12" id="preg12" value="b" required/>
                            <label class="form-check-label" for="preg12">b) Genera un "Hola Mundo".  </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg12" id="preg12" value="b" required/>
                            <label class="form-check-label" for="preg12">c) No imprime nada, manda un Error. </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg12" id="preg12" value="b" required/>
                            <label class="form-check-label" for="preg12">d) Nada.  </label>
                            </li></ul>`,
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
                            field:"preg13",
                            editor:`<img src="<c:url value='resources/img/preg13.jpg'/>">
                            <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg13" id="preg13" value="a" required/>
                            <label class="form-check-label" for="preg13">a) No imprime nada, manda un Error. </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg13" id="preg13" value="b" required/>
                            <label class="form-check-label" for="preg13">b) imprime un contador.  </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg13" id="preg13" value="b" required/>
                            <label class="form-check-label" for="preg13">c) Imprime un conteo del 0 al 9. </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg13" id="preg13" value="b" required/>
                            <label class="form-check-label" for="preg13">d) Imprime 10.  </label>
                            </li></ul>`,
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
                            field:"preg14",
                            editor:`<img src="<c:url value='resources/img/preg14.jpg'/>">
                            <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg14" id="preg14" value="a" required/>
                            <label class="form-check-label" for="preg14">a) 5. </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg14" id="preg14" value="b" required/>
                            <label class="form-check-label" for="preg14">b) False.  </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg14" id="preg14" value="b" required/>
                            <label class="form-check-label" for="preg14">c) 7. </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg14" id="preg14" value="b" required/>
                            <label class="form-check-label" for="preg14">d) True.  </label>
                            </li></ul>`,
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
                            field:"preg15",
                            editor:`<img src="<c:url value='resources/img/preg15.jpg'/>">
                            <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg15" id="preg15" value="a" required/>
                            <label class="form-check-label" for="preg15">a) 5. </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg15" id="preg15" value="b" required/>
                            <label class="form-check-label" for="preg15">b) 1.  </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg15" id="preg15" value="b" required/>
                            <label class="form-check-label" for="preg15">c) 6. </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg15" id="preg15" value="b" required/>
                            <label class="form-check-label" for="preg15">d) 2.  </label>
                            </li></ul>`,
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
                            field:"preg16",
                            editor:`<img src="<c:url value='resources/img/preg16.jpg'/>">
                            <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg16" id="preg16" value="a" required/>
                            <label class="form-check-label" for="preg16">a) 7. </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg16" id="preg16" value="b" required/>
                            <label class="form-check-label" for="preg16">b) 9.  </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg16" id="preg16" value="b" required/>
                            <label class="form-check-label" for="preg16">c) 8. </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg16" id="preg16" value="b" required/>
                            <label class="form-check-label" for="preg16">d) 3.  </label>
                            </li></ul>`,
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
                            field:"preg17",
                            editor:`<img src="<c:url value='resources/img/preg17.jpg'/>">
                            <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg17" id="preg17" value="a" required/>
                            <label class="form-check-label" for="preg17">a) 12. </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg17" id="preg17" value="b" required/>
                            <label class="form-check-label" for="preg17">b) 9.  </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg17" id="preg17" value="b" required/>
                            <label class="form-check-label" for="preg17">c) 3. </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg17" id="preg17" value="b" required/>
                            <label class="form-check-label" for="preg17">d) 6.  </label>
                            </li></ul>`,
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
                            field:"preg18",
                            editor:`<img src="<c:url value='resources/img/preg18.jpg'/>">
                            <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg18" id="preg18" value="a" required/>
                            <label class="form-check-label" for="preg18">a) 12. </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg18" id="preg18" value="b" required/>
                            <label class="form-check-label" for="preg18">b) 9.  </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg18" id="preg18" value="b" required/>
                            <label class="form-check-label" for="preg18">c) 3. </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg18" id="preg18" value="b" required/>
                            <label class="form-check-label" for="preg18">d) 6.  </label>
                            </li></ul>`,
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
                            field:"preg19",
                            editor:`<img src="<c:url value='resources/img/preg19.jpg'/>">
                            <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg19" id="preg19" value="a" required/>
                            <label class="form-check-label" for="preg19">a) Bienvenido + de + edad + años de edad. </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg19" id="preg19" value="b" required/>
                            <label class="form-check-label" for="preg19">b) Bienvenido + nombre + de + edad + años de edad.  </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg19" id="preg19" value="b" required/>
                            <label class="form-check-label" for="preg19">c) Bienvenido + (nombre del usuario) + de + (años del usuario) + años de edad. </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg19" id="preg19" value="b" required/>
                            <label class="form-check-label" for="preg19">d) "bienvenido" +nombre+ "de" +edad+ años de edad.  </label>
                            </li></ul>`,
                            validation: {required:true},
                       
                            },
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
                            editor:`<img src="<c:url value='resources/img/preg20.jpg'/>">
                            <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg20" id="preg20" value="a" required/>
                            <label class="form-check-label" for="preg20">a)  "Entrada recibida por teclado es: \"" + entradaTeclado +"\"" </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg20" id="preg20" value="b" required/>
                            <label class="form-check-label" for="preg20">b)  Imprime una cadena cualquiera ingresada por el usuario. </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg20" id="preg20" value="b" required/>
                            <label class="form-check-label" for="preg20">c) Compila pero no muestra nada. </label>
                            </li>
                            <li class='k-radio-item'>
                            <input class="form-check-input" type="radio" name="preg20" id="preg20" value="b" required/>
                            <label class="form-check-label" for="preg20">d) Manda error.  </label>
                            </li></ul>`,
                            validation: {required:true},
                       
                            },
                        ]     
                    },
                }]
            });
        })
    </script>
</body>

</html>