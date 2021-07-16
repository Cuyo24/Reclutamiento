/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft;

import com.b1soft.service.PreguntasAdministradorService;
import com.b1soft.service.PruebasAdministradorService;
import com.b1soft.service.RespuestasAdministradorService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author DELL
 */
@Controller
public class PruebasAdministradorController {
    
    @Autowired
    PruebasAdministradorService pruebasService;
    @Autowired
    PreguntasAdministradorService preguntasService;
    @Autowired
    RespuestasAdministradorService respuestasService;
    
    @RequestMapping(value = "crearPruebasAdmin.htm", method = RequestMethod.GET)
    public ModelAndView crearPruebasAdmin() {
        ModelAndView model = new ModelAndView();
        model.setViewName("crearPruebasAdmin");
        return model;
    }
    @RequestMapping(value="getPrueba.htm",method=RequestMethod.POST)
    public @ResponseBody String getPrueba(@RequestParam Map<String,String> requestParams){
        System.out.println("################################## Entrando en getPrueba ##################################");
        return pruebasService.buscarPrueba(requestParams);
    }
    @RequestMapping(value = "regresaPruebasAdmin.htm", method = RequestMethod.GET)
    public @ResponseBody String regresaPruebasAdmin(){
        System.out.println("################################## Entrando en regresaPruebasAdmin ##################################");
        String data = pruebasService.devuelvePruebas();
        System.out.println("################################## Saliendo de regresaPruebasAdmin ##################################");
        return data;
    }
    
    @RequestMapping(value = "nuevaPruebaAdmin.htm", method = RequestMethod.POST)
    public @ResponseBody String nuevaPruebaAdmin(@RequestParam Map<String,String> requestParams){
        System.out.println("################################## Entrando en nuevaPruebaAdmin ##################################");
        String data = pruebasService.crearNuevaPrueba(requestParams);
        System.out.println("################################## Saliendo de nuevaPruebaAdmin ##################################");
        return data;
    }
    
    @RequestMapping(value = "actualizaPruebaAdmin.htm", method = RequestMethod.POST)
    public @ResponseBody String actualizaPruebaAdmin(@RequestParam Map<String,String> requestParams){
        System.out.println("################################## Entrando en actualizaPruebaAdmin ##################################");
        String data = pruebasService.actualizarPrueba(requestParams);
        System.out.println("################################## Saliendo de actualizaPruebaAdmin ##################################");
        return data;
    }
    
    @RequestMapping(value = "borraPruebaAdmin.htm", method = RequestMethod.POST)
    public @ResponseBody String borraPruebaAdmin(@RequestParam Map<String,String> requestParams){
        System.out.println("################################## Entrando en borraPruebaAdmin ##################################");
        String data = pruebasService.borrarPrueba(requestParams);
        System.out.println("################################## Saliendo de borraPruebaAdmin ##################################");
        return data;
    }
    
    @RequestMapping(value = "creaPreguntaAdmin.htm", method = RequestMethod.POST)
    public @ResponseBody String creaPreguntaAdmin(@RequestParam Map<String,String> requestParams){
        System.out.println("################################## Entrando en creaPreguntaAdmin ##################################");
        String data = preguntasService.crearNuevaPregunta(requestParams);
        System.out.println("################################## Saliendo de creaPreguntaAdmin ##################################");
        return data;
    }
    
    @RequestMapping(value = "actualizaPreguntaAdmin.htm", method = RequestMethod.POST)
    public @ResponseBody String actualizaPreguntaAdmin(@RequestParam Map<String,String> requestParams){
        System.out.println("################################## Entrando en actualizaPreguntaAdmin ##################################");
        String data = preguntasService.actualizarPregunta(requestParams);
        System.out.println("################################## Saliendo de actualizaPreguntaAdmin ##################################");
        return data;
    }
    
    @RequestMapping(value = "borraPreguntaAdmin.htm", method = RequestMethod.POST)
    public @ResponseBody String borraPreguntaAdmin(@RequestParam Map<String,String> requestParams){
        System.out.println("################################## Entrando en borraPreguntaAdmin ##################################");
        String data = preguntasService.borrarPregunta(requestParams);
        System.out.println("################################## Saliendo de borraPreguntaAdmin ##################################");
        return data;
    }

    @RequestMapping(value = "creaRespuestaAdmin.htm", method = RequestMethod.POST)
    public @ResponseBody String creaRespuestaAdmin(@RequestParam Map<String,String> requestParams){
        System.out.println("################################## Entrando en creaRespuestaAdmin ##################################");
        String data = respuestasService.crearRespuesta(requestParams);
        System.out.println("################################## Saliendo de creaRespuestaAdmin ##################################");
        return data;
    }
    
    @RequestMapping(value = "actualizaRespuestaAdmin.htm", method = RequestMethod.POST)
    public @ResponseBody String actualizaRespuestaAdmin(@RequestParam Map<String,String> requestParams){
        System.out.println("################################## Entrando en actualizaRespuestaAdmin ##################################");
        String data = respuestasService.actualizarRespuesta(requestParams);
        System.out.println("################################## Saliendo de actualizaRespuestaAdmin ##################################");
        return data;
    }
    
    @RequestMapping(value = "borraRespuestaAdmin.htm", method = RequestMethod.POST)
    public @ResponseBody String borraRespuestaAdmin(@RequestParam Map<String,String> requestParams){
        System.out.println("################################## Entrando en borraRespuestaAdmin ##################################");
        String data = respuestasService.borrarRespuesta(requestParams);
        System.out.println("################################## Saliendo de borraRespuestaAdmin ##################################");
        return data;
    }
}
