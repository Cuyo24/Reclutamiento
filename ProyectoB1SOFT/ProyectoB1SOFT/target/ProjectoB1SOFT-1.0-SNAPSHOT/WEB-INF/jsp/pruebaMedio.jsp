<%-- 
    Document   : pruebaMedio
    Created on : 11/02/2021, 01:13:24 PM
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
                    <form id="wizard" action="pruebaMedio.htm" method="POST" novalidate></form>
                </div>
                <span id="minutes"></span>:<span id="seconds"></span>
            </div>
        </main>
        <script>

            $(document).ready(function () {
                var respuestas = ['c', 'c', 'b', 'a', 'a', 'a', 'c', 'c', 'd', 'b', 'c', 'd', 'b', 'c', 'a', 'b', 'c', 'a', 'a', 'd'];

                $("#wizard").kendoWizard({
                    pager: true,
                    contentPosition: "bottom",
                    stepper: {
                        indicator: true,
                        label: true,
                        linear: true
                    },
                    actionBar: true,
                    steps: [{
                            title: "",
                            buttons: [{name:"next",text:"Siguiente"}],
                            form: {
                                items: [
                                    {
                                        field: "preg1",
                                        editor: ` 
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
                                                <label class="form-check-label" for="preg1">c) Es un modelo o plantilla a partir de la cual creamos objetos. </label>
                                            </li>
                                            <li class='k-radio-item'>
                                                <input class="form-check-input" type="radio" name="preg1" id="preg1" value="d" required/>
                                                <label class="form-check-label" for="preg1">d) Es una categoria de datos ordenada secuencialmente. </label>
                                            </li>    
                                        </ul>
                                    `,
                                        label: `¿Cuál es la descripción que crees que define mejor el concepto 'clase' en la programación orientada a objetos?`,
                                        validation: {required: true},
                                    },
                                ]
                            }
                        },
                        {
                            title: "",
                            buttons: [{name:"previous",text:"Anterior"},{name:"next",text:"Siguiente"}],
                            form: {
                                items: [
                                    {
                                        field: "preg2",
                                        editor: `<div class="col-sm-7">
                                    <pre><code class="language-java">
                    int x = 1;
		
                    if (x==1)
                        System.out.println("Es uno");
                    else;
                        System.out.println("No es uno");
                                    </code></pre>
                                </div>
                                <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                                    <li class='k-radio-item'>
                                        <input type="radio" name="preg2"  value="a" class="k-radio" checked="checked" required>
                                        <label class="k-radio-label" for="engine1" >a)"Es uno"</label>
                                    </li>
                                    <li class='k-radio-item'>
                                        <input type="radio" name="preg2"  value="b" class="k-radio" checked="checked" required>
                                        <label class="k-radio-label" for="engine1" >b)"No es uno"</label>
                                    </li>
                                    <li class='k-radio-item'>
                                        <input type="radio" name="preg2"  value="c" class="k-radio" checked="checked"required>
                                        <label class="k-radio-label" for="engine1" >c)"Es uno" y "No es uno"</label>
                                    </li>
                                    <li class='k-radio-item'>
                                        <input type="radio" name="preg2"  value="d" class="k-radio" checked="checked" required>
                                        <label class="k-radio-label" for="engine1" >d)Ninguna de las tres opciones</label>
                                    </li>
                                </ul>`,
                                        label: `¿Cuál es el valor que se muestra por pantalla?`,
                                        validation: {required: true},
                                    },
                                ]
                            },
                        },
                        {
                            title: "",
                            buttons: [{name:"previous",text:"Anterior"},{name:"next",text:"Siguiente"}],
                            form: {
                                items: [
                                    {
                                        field: "preg3",
                                        editor: `
                                    <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                                        <li class='k-radio-item'>
                                            <input class="form-check-input" type="radio" name="preg3" value="a" required/>
                                            <label class="form-check-label" for="preg3">a) Sus cardinalidad y su tipo. </label>
                                        </li>
                                        <li class='k-radio-item'>
                                            <input class="form-check-input" type="radio" name="preg3" value="b" required/>
                                            <label class="form-check-label" for="preg3">b) Sus atributos y sus métodos. </label>
                                        </li>
                                        <li class='k-radio-item'>
                                            <input class="form-check-input" type="radio" name="preg3" value="c" required/>
                                            <label class="form-check-label" for="preg3">c) La forma en que establece comunicación e intercambia mensajes. </label>
                                        </li>
                                        <li class='k-radio-item'>    
                                            <input class="form-check-input" type="radio" name="preg3" value="d" required/>
                                            <label class="form-check-label" for="preg3">d) Su interfaz y los eventos asociados. </label>
                                        </li>
                                    </ul>
                                    `,
                                        label: `¿Qué elementos crees que definen a un objeto?`,
                                        validation: {required: true},
                                    },
                                ]
                            },
                        },
                        {
                            title: "",
                            buttons: [{name:"previous",text:"Anterior"},{name:"next",text:"Siguiente"}],
                            form: {
                                items: [
                                    {
                                        field: "preg4",
                                        editor: `
                                    <div class="col-sm-7">
                                        <pre><code class="language-java">
                System.out.println(1<<4);                            
                                        </code></pre>
                                    </div>
                                    <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                                        <li class='k-radio-item'>
                                            <input type="radio" name="preg4"  value="a" class="k-radio" checked="checked" required>
                                            <label class="k-radio-label" for="engine1" >a)16</label>
                                        </li>
                                        <li class='k-radio-item'>
                                            <input type="radio" name="preg4"  value="b" class="k-radio" checked="checked" required>
                                            <label class="k-radio-label" for="engine1" >b)5</label>
                                        </li>
                                        <li class='k-radio-item'>
                                            <input type="radio" name="preg4"  value="c" class="k-radio" checked="checked" required>
                                            <label class="k-radio-label" for="engine1" >c)true</label>
                                        </li>
                                        <li class='k-radio-item'>
                                            <input type="radio" name="preg4"  value="d" class="k-radio" checked="checked" required>
                                            <label class="k-radio-label" for="engine1" >d)-3</label>
                                        </li>
                                    </ul>
                                    `,
                                        label: `¿Cuál es el resultado del siguiente código fuente?`,
                                        validation: {required: true},
                                    },
                                ]
                            },
                        },
                        {
                            title: "",
                            buttons: [{name:"previous",text:"Anterior"},{name:"next",text:"Siguiente"}],
                            form: {
                                items: [
                                    {
                                        field: "preg5",
                                        editor: `
                                    <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                                        <li class='k-radio-item'>
                                            <input class="form-check-input" type="radio" name="preg5" id="preg5" value="a" required/>
                                            <label class="form-check-label" for="preg5">a) public class Componente extends Producto. </label>
                                        </li>
                                        <li class='k-radio-item'>
                                            <input class="form-check-input" type="radio" name="preg5" id="preg5" value="b" required/>
                                            <label class="form-check-label" for="preg5">b) public class Componente inherit Producto. </label>
                                        </li>
                                        <li class='k-radio-item'>
                                            <input class="form-check-input" type="radio" name="preg5" id="preg5" value="c" required/>
                                            <label class="form-check-label" for="preg5">c) public class Componente implements Producto. </label>
                                        </li>
                                        <li class='k-radio-item'>
                                            <input class="form-check-input" type="radio" name="preg5" id="preg5" value="d" required/>
                                            <label class="form-check-label" for="preg5">d) public class Componente belong to Producto. </label>
                                        </li>    
                                    </ul>
                                    `,
                                        label: `¿Qué código de los siguientes tiene que ver con la herencia?`,
                                        validation: {required: true},
                                    },
                                ]
                            },
                        },
                        {
                            title: "",
                            buttons: [{name:"previous",text:"Anterior"},{name:"next",text:"Siguiente"}],
                            form: {
                                items: [
                                    {
                                        field: "preg6",
                                        editor: `
                                    <div class="col-sm-7">
                                        <pre><code class="language-java">
                    int contador=1;
            
                    while (contador<=10) {
                        System.out.println( contador%2 == 1 ? "****" : "++++++++");
                        ++contador;
                    }                            
                                        </code></pre>
                                    </div>
                                    <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                                        <li class='k-radio-item'>
                                            <input type="radio" name="preg6"  value="a" class="k-radio" checked="checked" required>
                                            <label class="k-radio-label" for="engine1" >a)Alterna 5 veces cada uno los símbolos * y +</label>
                                        </li>
                                        <li class='k-radio-item'>
                                            <input type="radio" name="preg6"  value="b" class="k-radio" checked="checked" required>
                                            <label class="k-radio-label" for="engine1" >b)Genera 5 líneas con símbolos *</label>
                                        </li>
                                        <li class='k-radio-item'>
                                            <input type="radio" name="preg6"  value="c" class="k-radio" checked="checked" required>
                                            <label class="k-radio-label" for="engine1" >c)Genera 5 líneas con símbolos +</label>
                                        </li>
                                        <li class='k-radio-item'>
                                            <input type="radio" name="preg6"  value="d" class="k-radio" checked="checked" required>
                                            <label class="k-radio-label" for="engine1" >d)Alterna 10 veces cada uno los símbolos * y +</label>
                                        </li>
                                    </ul>
                                    `,
                                        label: `¿Qué hace el siguiente código fuente?`,
                                        validation: {required: true},
                                    },
                                ]
                            }
                        },
                        {
                            title: "",
                            buttons: [{name:"previous",text:"Anterior"},{name:"next",text:"Siguiente"}],
                            form: {
                                items: [
                                    {
                                        field: "preg7",
                                        editor: `
                                    <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                                        <li class='k-radio-item'>
                                
                                            <input class="form-check-input" type="radio" name="preg7" id="preg7" value="a" required/>
                                            <label class="form-check-label" for="preg7">a) Duplicar una clase. </label>
                                        </li>
                                        <li class='k-radio-item'>
                                            <input class="form-check-input" type="radio" name="preg7" id="preg7" value="b" required/>
                                            <label class="form-check-label" for="preg7">b) Eliminar una clase. </label>
                                        </li>
                                        <li class='k-radio-item'>
                                            <input class="form-check-input" type="radio" name="preg7" id="preg7" value="c" required/>
                                            <label class="form-check-label" for="preg7">c) Crear un objeto a partir de la clase. </label>
                                        </li>
                                        <li class='k-radio-item'>
                                            <input class="form-check-input" type="radio" name="preg7" id="preg7" value="d" required/>
                                            <label class="form-check-label" for="preg7">d) Conectar dos clases entre sí. </label>
                                        </li>
                                    </ul>
                                    `,
                                        label: `¿Qué significa instanciar una clase?`,
                                        validation: {required: true},
                                    },
                                ]
                            },
                        },
                        {
                            title: "",
                            buttons: [{name:"previous",text:"Anterior"},{name:"next",text:"Siguiente"}],
                            form: {
                                items: [
                                    {
                                        field: "preg8",
                                        editor: `
                                    <div class="col-sm-7">
                                        <pre><code class="language-java">
                    total -= --contador;
                                        </code></pre>
                                    </div>
                                    <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                                        <li class='k-radio-item'>
                                            <input type="radio" name="preg8"  value="a" class="k-radio" checked="checked" required>
                                            <label class="k-radio-label" for="engine1" >a)No compila, es erronea)</label>
                                        </li>
                                        <li class='k-radio-item'>
                                        <input type="radio" name="preg8"  value="b" class="k-radio" checked="checked" required>
                                        <label class="k-radio-label" for="engine1" >b)Decrementa contador a total y luego resta uno a contador.</label>
                                        </li>
                                        <li class='k-radio-item'>
                                        <input type="radio" name="preg8"  value="c" class="k-radio" checked="checked" required>
                                        <label class="k-radio-label" for="engine1" >c)Decrementa uno al contador y luego se lo resta a total.</label>
                                        </li>
                                        <li class='k-radio-item'>
                                        <input type="radio" name="preg8"  value="d" class="k-radio" checked="checked" required>
                                        <label class="k-radio-label" for="engine1" >d)Decrementa uno al contador y luego se lo asigna a total.</label>
                                        </li>
                                    </ul>
                                    `,
                                        label: `¿Qué hace el siguiente código fuente?`,
                                        validation: {required: true},
                                    },
                                ]
                            },
                        },
                        {
                            title: "",
                            buttons: [{name:"previous",text:"Anterior"},{name:"next",text:"Siguiente"}],
                            form: {
                                items: [
                                    {
                                        field: "preg9",
                                        editor: `
                                    <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                                        <li class='k-radio-item'>
                                        <input class="form-check-input" type="radio" name="preg9" id="preg9" value="a" required/>
                                        <label class="form-check-label" for="preg9">a) Una función utilizada para intercambiar valores. </label>
                                        </li>
                                        <li class='k-radio-item'>
                                        <input class="form-check-input" type="radio" name="preg9" id="preg9" value="b" required/>
                                        <label class="form-check-label" for="preg9">b) Es el sobrenombre de la versión 1.3 del JDK. </label>
                                        </li>
                                        <li class='k-radio-item'>
                                        <input class="form-check-input" type="radio" name="preg9" id="preg9" value="c" required/>
                                        <label class="form-check-label" for="preg9">c) Un framework específico para Android. </label>
                                        </li>
                                        <li class='k-radio-item'>
                                        <input class="form-check-input" type="radio" name="preg9" id="preg9" value="d" required/>
                                        <label class="form-check-label" for="preg9">d) Una librería para construir interfaces gráficas. </label>
                                        </li>
                                    </ul>
                                    `,
                                        label: `En Java, ¿a qué nos estamos refiriendo si hablamos de 'Swing'?`,
                                        validation: {required: true},
                                    },
                                ]
                            },
                        },
                        {
                            title: "",
                            buttons: [{name:"previous",text:"Anterior"},{name:"next",text:"Siguiente"}],
                            form: {
                                items: [
                                    {
                                        field: "preg10",
                                        editor: `
                                    <div class="col-sm-7">
                                        <pre><code class="language-java">
                    int suma = 0;
    
                    for (int x=1;x<=100;x++) {
                        if (x%2!=0) suma+=x; 
                    }                            
                                        </code></pre>
                                    </div>
                                    <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                                        <li class='k-radio-item'>
                                            <input type="radio" name="preg10"  value="a" class="k-radio" checked="checked" required>
                                            <label class="k-radio-label" for="engine1" >a)Suma los 100 primeros números</label>
                                        </li>
                                        <li class='k-radio-item'>
                                        <input type="radio" name="preg10"  value="b" class="k-radio" checked="checked" required>
                                        <label class="k-radio-label" for="engine1" >b)Suma los 100 primeros números impares</label>
                                        </li>
                                        <li class='k-radio-item'>
                                        <input type="radio" name="preg10"  value="c" class="k-radio" checked="checked" required>
                                        <label class="k-radio-label" for="engine1" >c)Suma los 100 primeros números pares</label>
                                        </li>
                                        <li class='k-radio-item'>
                                        <input type="radio" name="preg10"  value="d" class="k-radio" checked="checked" required>
                                        <label class="k-radio-label" for="engine1" >d)Ninguna de las anteriores respuestas es válida</label>
                                        </li>
                                    </ul>
                                    `,
                                        label: `¿Qué hace el siguiente código fuente?`,

                                    },
                                ]
                            },
                        },
                        {
                            title: "",
                            buttons: [{name:"previous",text:"Anterior"},{name:"next",text:"Siguiente"}],
                            form: {
                                items: [
                                    {
                                        field: "preg11",
                                        editor: `
                                <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                                    <li class='k-radio-item'>
                                    <input class="form-check-input" type="radio" name="preg11" id="preg11" value="a" required/>
                                    <label class="form-check-label" for="preg11">a) Una libreria de Java) </label>
                                    </li>
                                    <li class='k-radio-item'>
                                    <input class="form-check-input" type="radio" name="preg11" id="preg11" value="b" required/>
                                    <label class="form-check-label" for="preg11">b) Una versión de Java especial para servidores. </label>
                                    </li>
                                    <li class='k-radio-item'>
                                    <input class="form-check-input" type="radio" name="preg11" id="preg11" value="c" required/>
                                    <label class="form-check-label" for="preg11">c) Un IDE para desarrollar aplicaciones. </label>
                                    </li>
                                    <li class='k-radio-item'>
                                    <input class="form-check-input" type="radio" name="preg11" id="preg11" value="d" required/>
                                    <label class="form-check-label" for="preg11">d) Ninguna de las anteriores. </label>
                                    </li>
                                </ul>
                                `,
                                        label: `¿Qué es Eclipse?`,

                                    },
                                ]
                            },
                        },
                        {
                            title: "",
                            buttons: [{name:"previous",text:"Anterior"},{name:"next",text:"Siguiente"}],
                            form: {
                                items: [
                                    {
                                        field: "preg12",
                                        editor: `
                                <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                                    <li class='k-radio-item'>
                                        <input type="radio" name="preg12"  value="a" class="k-radio" checked="checked" required>
                                        <label class="k-radio-label" for="preg12" >a)Operador %</label>
                                    </li>
                                    <li class='k-radio-item'>
                                    <input type="radio" name="preg12"  value="b" class="k-radio" checked="checked" required>
                                    <label class="k-radio-label" for="preg12" >b)Math.percentage</label>
                                    </li>
                                    <li class='k-radio-item'>
                                    <input type="radio" name="preg12"  value="c" class="k-radio" checked="checked" required>
                                    <label class="k-radio-label" for="preg12" >c)Math.percent</label>
                                    </li>
                                    <li class='k-radio-item'>
                                    <input type="radio" name="preg12"  value="d" class="k-radio" checked="checked" required>
                                    <label class="k-radio-label" for="preg12" >d)Hay que calcularlo a mano</label>
                                    </li>
                                </ul>
                                `,
                                        label: `¿Cómo calculo el tanto por ciento de un número en Java?`,

                                    },
                                ]
                            },
                        },
                        {
                            title: "",
                            buttons: [{name:"previous",text:"Anterior"},{name:"next",text:"Siguiente"}],
                            form: {
                                items: [
                                    {
                                        field: "preg13",
                                        editor: `
                                <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                                    <li class='k-radio-item'>
                                    <input class="form-check-input" type="radio" name="preg13" id="preg13" value="a" required/>
                                    <label class="form-check-label" for="preg13">a) El formato de intercambio de datos. </label>
                                    </li>
                                    <li class='k-radio-item'>
                                    <input class="form-check-input" type="radio" name="preg13" id="preg13" value="b" required/>
                                    <label class="form-check-label" for="preg6">b) El formato que obtenemos tras compilar un fuente .java) </label>
                                    </li>
                                    <li class='k-radio-item'>
                                    <input class="form-check-input" type="radio" name="preg13" id="preg13" value="c" required/>
                                    <label class="form-check-label" for="preg13">c) Un tipo de variable. </label>
                                    </li>
                                    <li class='k-radio-item'>
                                    <input class="form-check-input" type="radio" name="preg13" id="preg13" value="d" required/>
                                    <label class="form-check-label" for="preg13">d) Un depurador de código. </label>
                                    </li>
                                </ul>
                                    `,
                                        label: `¿Qué es el bytecode en Java?`,

                                    },
                                ]
                            },
                        },
                        {
                            title: "",
                            buttons: [{name:"previous",text:"Anterior"},{name:"next",text:"Siguiente"}],
                            form: {
                                items: [
                                    {
                                        field: "preg14",
                                        editor: `
                                <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                                    <li class='k-radio-item'>
                                    <input class="form-check-input" type="radio" name="preg14" id="preg14" value="a" required/>
                                    <label class="form-check-label" for="preg14">a) public class Componente interface Product. </label>
                                    </li>
                                    <li class='k-radio-item'>
                                    <input class="form-check-input" type="radio" name="preg14" id="preg14" value="b" required/>
                                    <label class="form-check-label" for="preg14">b) Componente cp = new Componente (interfaz). </label>
                                    </li>
                                    <li class='k-radio-item'>
                                    <input class="form-check-input" type="radio" name="preg14" id="preg14" value="c" required/>
                                    <label class="form-check-label" for="preg14">c) public class Componente implements Printable. </label>
                                    </li>
                                    <li class='k-radio-item'>
                                    <input class="form-check-input" type="radio" name="preg14" id="preg14" value="d" required/>
                                    <label class="form-check-label" for="preg14">d) Componente cp = new Componente.interfaz. </label>
                                    </li>
                                </ul>
                                `,
                                        label: `¿Qué código asociarías a una Interfaz en Java?`,

                                    },
                                ]
                            },
                        },
                        {
                            title: "",
                            buttons: [{name:"previous",text:"Anterior"},{name:"next",text:"Siguiente"}],
                            form: {
                                items: [
                                    {
                                        field: "preg15",
                                        editor: `
                                <div class="col-sm-7">
                                    <pre><code class="language-java">
            int x = 5;
            int y = 5;
                                            
            y /= ++x;
            System.out.println(x);                            
                                </code></pre>
                                </div>
                                <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                                    <li class='k-radio-item'>
                                        <input type="radio" name="preg15"  value="a" class="k-radio" checked="checked" required>
                                        <label class="k-radio-label" for="engine1" >a)6</label>
                                    </li>
                                    <li class='k-radio-item'>
                                    <input type="radio" name="preg15"  value="b" class="k-radio" checked="checked" required>
                                    <label class="k-radio-label" for="engine1" >b)5</label>
                                    </li>
                                    <li class='k-radio-item'>
                                    <input type="radio" name="preg15"  value="c" class="k-radio" checked="checked" required>
                                    <label class="k-radio-label" for="engine1" >c)1</label>
                                    </li>
                                    <li class='k-radio-item'>
                                    <input type="radio" name="preg15"  value="d" class="k-radio" checked="checked" required>
                                    <label class="k-radio-label" for="engine1" >d)0</label>
                                    </li>
                                </ul>
                                `,
                                        label: `¿Qué hace el siguiente código fuente?`,

                                    },
                                ]
                            },
                        },
                        {
                            title: "",
                            buttons: [{name:"previous",text:"Anterior"},{name:"next",text:"Siguiente"}],
                            form: {
                                items: [
                                    {
                                        field: "preg16",
                                        editor: `
                                <div class="col-sm-7">
                                    <pre><code class="language-java">
                import java)applet.Applet;
                import java)awt.Graphics;
                public class MiPrimerApplet extends Applet {
            
                public void paint(Graphics g){
                    g.drawString("Hola Mundo",40,80);
                }
                
                }
                                    </code></pre>
                                </div>
                                <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                                    <li class='k-radio-item'>
                                        <input type="radio" name="preg16"  value="a" class="k-radio" checked="checked" required>
                                        <label class="k-radio-label" for="preg16" >a)Pinta en consola el texto "Hola Mundo"</label>
                                    </li>
                                    <li class='k-radio-item'>
                                    <input type="radio" name="preg16"  value="b" class="k-radio" checked="checked" required>
                                    <label class="k-radio-label" for="preg16" >b)Genera un Applet con el texto "Hola Mundo</label>
                                    </li>
                                    <li class='k-radio-item'>
                                    <input type="radio" name="preg16"  value="c" class="k-radio" checked="checked" required>
                                    <label class="k-radio-label" for="preg16" >c)Crea una ventana que contiene el texto "Hola Mundo"</label>
                                    </li>
                                    <li class='k-radio-item'>
                                    <input type="radio" name="preg16"  value="d" class="k-radio" checked="checked" required>
                                    <label class="k-radio-label" for="preg16" >d)Ninguna de las respuestas anteriores es correcta</label>
                                    </li>
                                </ul>
                                `,
                                        label: `¿Qué hace el siguiente código fuente?`,

                                    },
                                ]
                            },
                        },
                        {
                            title: "",
                            buttons: [{name:"previous",text:"Anterior"},{name:"next",text:"Siguiente"}],
                            form: {
                                items: [
                                    {
                                        field: "preg17",
                                        editor: `
                                <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                                    <li class='k-radio-item'>
                                    <input class="form-check-input" type="radio" name="preg17" id="preg17" value="a" required/>
                                    <label class="form-check-label" for="preg17">a) Editarlo para modificar su comportamiento. </label>
                                    </li>
                                    <li class='k-radio-item'>
                                    <input class="form-check-input" type="radio" name="preg17" id="preg17" value="b" required/>
                                    <label class="form-check-label" for="preg17">b) Cambiarle el nombre dejándolo con la misma funcionalidac) </label>
                                    </li>
                                    <li class='k-radio-item'>
                                    <input class="form-check-input" type="radio" name="preg17" id="preg17" value="c" required/>
                                    <label class="form-check-label" for="preg17">c) Crear un método con el mismo nombre pero diferentes argumentos. </label>
                                    </li>
                                    <li class='k-radio-item'>
                                    <input class="form-check-input" type="radio" name="preg17" id="preg17" value="d" required/>
                                    <label class="form-check-label" for="preg17">d) Añadirle funcionalidades a un método. </label>
                                    </li>
                                </ul>
                                `,
                                        label: `¿Qué significa sobrecargar (overload) un método?`,

                                    },
                                ]
                            },
                        },
                        {
                            title: "",
                            buttons: [{name:"previous",text:"Anterior"},{name:"next",text:"Siguiente"}],
                            form: {
                                items: [
                                    {
                                        field: "preg18",
                                        editor: `
                                <div class="col-sm-7">
                                    <pre><code class="language-java">
            int i=1;
            int j=2;
            int k=3;
            int m=2;
            System.out.println ((j >= i) || (k == m));                           
                                    </code></pre>
                                </div>
                                <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                                    <li class='k-radio-item'>
                                        <input type="radio" name="preg18"  value="a" class="k-radio" checked="checked" required>
                                        <label class="k-radio-label" for="engine1" >a)true </label>
                                    </li>
                                    <li class='k-radio-item'>
                                    <input type="radio" name="preg18"  value="b" class="k-radio" checked="checked" required>
                                    <label class="k-radio-label" for="engine1" >b)false</label>
                                    </li>
                                    <li class='k-radio-item'>
                                    <input type="radio" name="preg18"  value="c" class="k-radio" checked="checked" required>
                                    <label class="k-radio-label" for="engine1" >c)undefined</label>
                                    </li>
                                    <li class='k-radio-item'>
                                    <input type="radio" name="preg18"  value="d" class="k-radio" checked="checked" required>
                                    <label class="k-radio-label" for="engine1" >d)Da error de compilación</label>
                                    </li>
                                </ul>
                                `,
                                        label: `¿Qué hace el siguiente código fuente?`,

                                    },
                                ]
                            },
                        },
                        {
                            title: "",
                            buttons: [{name:"previous",text:"Anterior"},{name:"next",text:"Siguiente"}],
                            form: {
                                items: [
                                    {
                                        field: "preg19",
                                        editor: `
                                <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                                    <li class='k-radio-item'>
                                    <input class="form-check-input" type="radio" name="preg19" id="preg19" value="a" required/>
                                    <label class="form-check-label" for="preg19">a) Un error que lanza un método cuando algo va mal. </label>
                                    </li>
                                    <li class='k-radio-item'>
                                    <input class="form-check-input" type="radio" name="preg19" id="preg19" value="b" required/>
                                    <label class="form-check-label" for="preg19">b) Un objeto que no puede ser instanciado. </label>
                                    </li>
                                    <li class='k-radio-item'>
                                    <input class="form-check-input" type="radio" name="preg19" id="preg19" value="c" required/>
                                    <label class="form-check-label" for="preg19">c) Un bucle que no finaliza) </label>
                                    </li>
                                    <li class='k-radio-item'>
                                    <input class="form-check-input" type="radio" name="preg19" id="preg19" value="d" required/>
                                    <label class="form-check-label" for="preg19">d) Un tipo de evento muy utilizado al crear interfaces. </label>
                                    </li>
                                </ul>
                                `,
                                        label: `¿Qué es una excepción?`,

                                    },
                                ]
                            },
                        },
                        {
                            title: "",
                            buttons: [{name:"previous",text:"Anterior"},{name:"done",text:"Finalizar"}],
                            form: {
                                items: [
                                    {
                                        field: "preg20",
                                        editor: `
                                <div class="col-sm-7">
                                    <pre><code class="language-java">
            abstract class demo 
            { 
                public int a; 
                demo() 
                { 
                    a = 10; 
                } 
                                      
                abstract public void set(); 
                            
                abstract final public void get(); 
                                      
            } 
                                      
            class Test extends demo 
            { 

                public void set(int a) 
                { 
                    this.a = a; 
                } 
                                      
                final public void get() 
                { 
                    System.out.println("a = " + a); 
                } 
                                      
                public static void main(String[] args) 
                { 
                    Test obj = new Test(); 
                    obj.set(20); 
                    obj.get(); 
                } 
            } 
                                    </code></pre>
                                </div>
                                <ul autocomplete="off" aria-labelledby="RadioGroup-form-label" data-bind="value:RadioGroup" data-role="radiogroup" role="radiogroup" class="k-radio-list">
                                    <li class='k-radio-item'>
                                        <input type="radio" name="preg20"  value="a" class="k-radio" checked="checked" required>
                                        <label class="k-radio-label" for="engine1" >a) a = 10 </label>
                                    </li>
                                    <li class='k-radio-item'>
                                    <input type="radio" name="preg20"  value="b" class="k-radio" checked="checked" required>
                                    <label class="k-radio-label" for="engine1" >b) a = 20</label>
                                    </li>
                                    <li class='k-radio-item'>
                                    <input type="radio" name="preg20"  value="c" class="k-radio" checked="checked" required>
                                    <label class="k-radio-label" for="engine1" >c) undefined</label>
                                    </li>
                                    <li class='k-radio-item'>
                                    <input type="radio" name="preg20"  value="d" class="k-radio" checked="checked" required>
                                    <label class="k-radio-label" for="engine1" >d)Da error de compilación</label>
                                    </li>
                                </ul>
                                `,
                                        label: `¿Cuál es la salida del siguiente programa?`,

                                    },
                                ]
                            },
                        }]
                });
                var sec = 0;
                function pad(val) {
                    return val > 9 ? val : "0" + val;
                }
                setInterval(function () {
                    $("#seconds").html(pad(++sec % 60));
                    $("#minutes").html(pad(parseInt(sec / 60, 10)));
                }, 1000);
            })
        </script>
        <style>
            .fieldlist li {
                list-style: none;
                padding-bottom: 1em;
            }
        </style>
    </body>

</html>