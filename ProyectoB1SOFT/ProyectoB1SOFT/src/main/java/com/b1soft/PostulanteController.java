/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft;

import com.b1soft.modelo.formModel.Registro;
import com.b1soft.service.PostulanteService;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author luisr
 */
@Controller
public class PostulanteController {
    @Autowired
    private PostulanteService postulanteService;
   
    
    @RequestMapping(value="readPostulante.htm", method= RequestMethod.GET)
    public @ResponseBody String readPostulante(){
        return postulanteService.readPostulantes();
    }
    
    @RequestMapping(value = "createPostulante.htm", method = RequestMethod.POST)
    public @ResponseBody String crearNuevoPostulante(HttpServletRequest request) {
        return postulanteService.crearNuevoPostulante(request);

    }
    @RequestMapping(value = "updatePostulante.htm", method = RequestMethod.POST)
    public ModelAndView actualizarPostulante(@ModelAttribute Registro registro) {
        return postulanteService.actualizarPostulante(registro);
    }
    //Borrar Postulante
    @RequestMapping(value="deletePostulante.htm", method= RequestMethod.POST)
    public @ResponseBody String deletePostulante(@RequestParam Map<String, String> requestParam){
        String flag= postulanteService.eliminarPostulante(requestParam);
        System.out.println(flag);
        return flag;
    }
}

