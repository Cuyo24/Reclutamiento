/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft;

import com.b1soft.service.PostulanteService;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Yirz
 */
@Controller
public class VisualizarController {
    @Autowired
    PostulanteService postulanteService;
    @RequestMapping(value="visualizar.htm",method = RequestMethod.GET)
    public ModelAndView visualizarPostulante(HttpServletRequest request){
        return postulanteService.buscarPostulante(request);
    }
    @RequestMapping(value="visualizarPruebasPostulante.htm",method = RequestMethod.GET)
    public ModelAndView visualizarPruebasPostulante(HttpServletRequest request){
        return postulanteService.visualizarPruebasPostulante(request);
    }
    @RequestMapping(value = "visualizarRespuestas.htm",method=RequestMethod.GET)
    public ModelAndView visualizarRespuestas(HttpServletRequest request){
        return postulanteService.visualizarRespuestas(request);
    }
}
