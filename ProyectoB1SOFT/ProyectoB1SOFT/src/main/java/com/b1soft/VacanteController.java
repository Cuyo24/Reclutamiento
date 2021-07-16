/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft;

import com.b1soft.modelo.Vacante;
import com.b1soft.service.VacanteService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Yirz
 */
@RestController
public class VacanteController {

    @Autowired
    private VacanteService vacanteService;

    @RequestMapping(value = "createVacante.htm", method = RequestMethod.POST)
    public String createVacante(HttpServletRequest request) {
        return vacanteService.crearNuevaVacante(request);
    }

    @RequestMapping(value = "readVacante.htm", method = RequestMethod.GET)
    public String readVacante() {
        return vacanteService.readVacantes();
    }
    @RequestMapping(value="updateVacante.htm",method = RequestMethod.POST)
    public String updateVacante(HttpServletRequest request){
       return vacanteService.actualizarVacante(request);
    }
    @RequestMapping(value="deleteVacante.htm",method = RequestMethod.POST)
    public String deleteVacante(@RequestParam Map<String,String> requestParam){
       String flag=vacanteService.borrarVancante(requestParam);
       System.out.println(flag);
       return flag;
    }
}
