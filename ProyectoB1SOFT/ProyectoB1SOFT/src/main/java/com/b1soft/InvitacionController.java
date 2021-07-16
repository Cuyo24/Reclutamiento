/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft;

import com.b1soft.modelo.Invitacion;
import com.b1soft.service.InvitacionService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author luisr
 */
@RestController
public class InvitacionController {
    @Autowired
    private InvitacionService invitacionservice;
    
    @RequestMapping(value="readInvitacion.htm", method= RequestMethod.GET)
    //Se queda como prueba para cuando se  cree postulante y genere las pruebas con la informacion de postulante
    public String readInvitacion(){
        /*List <Invitacion> lista= new ArrayList<Invitacion>();
        lista.add(new Invitacion(1, "LuisRaulGG", "DFSAD546S", "Garcia", "Garcia", "batmanChido@gmail.com"));
        lista.add(new Invitacion(2, "LuisRaulGG", "DFSAD546S", "Garcia", "Garcia", "batmanChido@gmail.com"));
        lista.add(new Invitacion(3, "LuisRaulGG", "DFSAD546S", "Garcia", "Garcia", "batmanChido@gmail.com"));
        //Para que todos los string los mande en forma de json
        String data="";
        try{
            //Mapear los objetos a json
            ObjectMapper mapper = new ObjectMapper();
            data=mapper.writeValueAsString(lista);//regresa un string   
        }catch(JsonProcessingException e){
            System.err.println("Error: "+ e);
        }
        return data;*/
        return invitacionservice.readInvitaciones();
    }

    //Editar la Invitacion
    @RequestMapping(value="editInvitacion.htm", method= RequestMethod.POST)
    public String editInvitacion(HttpServletRequest request){
        return invitacionservice.editarInvitacion(request);
    }
    // Borrar la invitacion
    @RequestMapping(value="deleteInvitacion.htm", method= RequestMethod.POST)
    public String deleteInvitacion(@RequestParam Map<String, String> requestParam){
        String flag= invitacionservice.eliminarInvitacion(requestParam);
        System.out.println(flag);
        return flag;
    }
    @RequestMapping(value = "invitacion.htm", method = RequestMethod.POST)
    public String SendEmial(HttpServletRequest request) {
        return invitacionservice.sendEmail(request);
    }
    @RequestMapping(value = "readSin_Invitacion.htm", method = RequestMethod.GET)
    public String readSin_Invitacion() {
        return invitacionservice.readSin_Invitaciones();
    }
    @RequestMapping(value = "createInvitacion.htm", method = RequestMethod.POST)
    public String createInivtacion(HttpServletRequest request) {
        return invitacionservice.crearInvitacion(request);
    }
}
