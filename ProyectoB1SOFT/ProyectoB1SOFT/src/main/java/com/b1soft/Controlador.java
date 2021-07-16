/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft;
import com.b1soft.service.AddAdminService;
import com.b1soft.service.InvitacionService;
import com.b1soft.service.PostulantePruebaService;
import com.b1soft.service.PostulanteService;
import com.b1soft.service.RecuperarContrsenaService;
import com.b1soft.util.Email;
import java.io.IOException;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Yirz
 */
@Controller
//@SessionAttributes("user")
public class Controlador {
    @Autowired
    InvitacionService invitacionService;
    @Autowired
    AddAdminService addAdminService;
    @Autowired
    PostulanteService postulanteService;
    @Autowired
    PostulantePruebaService postulantePruebaService;
    @Autowired
    RecuperarContrsenaService recuperarContrsenaService;
    
    @RequestMapping(value = "index.htm", method = RequestMethod.GET)
    public ModelAndView index() {
        ModelAndView model = new ModelAndView();
        model.setViewName("index");
        return model;
    }
    
     @RequestMapping(value = "indexPostulante.htm", method = RequestMethod.GET)
    public ModelAndView indexPostulante() { 
        ModelAndView model = new ModelAndView();
        model.setViewName("indexPostulante");
        return model;
    }

    @RequestMapping(value = "index.htm", method = RequestMethod.POST)
    public ModelAndView login(HttpServletRequest request,HttpServletResponse response) {
        ModelAndView model = new ModelAndView();
       
        if (addAdminService.loginAdmin(request)) {
            model.setViewName("redirect:/principalAdmin.htm");
        }else { 
            model.addObject("error","Contraseña o correo incorrectos");
            model.setViewName("index");
        }
        return model;
    }@RequestMapping(value = "indexPostulante.htm", method = RequestMethod.POST)
    public ModelAndView loginPostulante(HttpServletRequest request,HttpServletResponse response) {
        ModelAndView model = new ModelAndView();
        if (postulanteService.loginPostulante(request)) {
            model.setViewName("redirect:/principalPostulante.htm");
        } else { 
            model.addObject("error","Contraseña o correo incorrectos");
            model.setViewName("indexPostulante");
        }
        return model;
    }
    @RequestMapping(value = "principalAdmin.htm", method = RequestMethod.GET)
    public ModelAndView AdminMainView() {
        ModelAndView model = new ModelAndView();
        model.setViewName("principalAdmin");
        return model;
    }
    @RequestMapping(value = "registro.htm", method = RequestMethod.GET)
    public ModelAndView registroView(HttpServletRequest request) {
        return invitacionService.readInvitacion(request);
    }

    @RequestMapping(value = "vacante.htm", method = RequestMethod.GET)
    public ModelAndView vacanteView() {
        ModelAndView model = new ModelAndView();
        model.setViewName("vacante");
        return model;
    }

    @RequestMapping(value = "postulante.htm", method = RequestMethod.GET)
    public ModelAndView postulanteView() {
        ModelAndView model = new ModelAndView();
        model.setViewName("postulante");
        return model;
    }

    @RequestMapping(value = "AddAdmin.htm", method = RequestMethod.GET)
    public ModelAndView addAdminView() {
        ModelAndView model = new ModelAndView();
        model.setViewName("AddAdmin");
        return model;
    }
    
    @RequestMapping(value = "invitacion.htm", method = RequestMethod.GET)
    public ModelAndView invitacionView() {
        ModelAndView model = new ModelAndView();
        model.setViewName("invitacion");
        return model;
    }
    @RequestMapping(value = "personal.htm", method = RequestMethod.GET)
    public ModelAndView personalView() {
        ModelAndView model = new ModelAndView();
        model.setViewName("personal");
        return model;
    }
    @RequestMapping(value = "prueba.htm", method = RequestMethod.GET)
    public ModelAndView pruebaView() {
        ModelAndView model = new ModelAndView();
        model.setViewName("prueba");
        return model;
    }
    @RequestMapping(value = "principalPostulante.htm", method = RequestMethod.GET)
    public ModelAndView postulanteMainView() {
        ModelAndView model = new ModelAndView();
        model.setViewName("principalPostulante");
        return model;
    }
    @RequestMapping(value = "pruebasPostulante.htm", method = RequestMethod.GET)
    public ModelAndView pruebasPostulanteView() {
        ModelAndView model = new ModelAndView();
        model.setViewName("pruebasPostulante");
        return model;
    }
    @RequestMapping(value = "pruebas.htm", method = RequestMethod.GET)
    public ModelAndView pruebasView(@RequestParam Map<String,String> requestParam) {
        ModelAndView model = new ModelAndView();
        model.addObject("IdPrueba",requestParam.get("id"));
        model.setViewName("pruebas");
        return model;
    }
    @RequestMapping(value = "pruebas.htm", method = RequestMethod.POST)
    public @ResponseBody String pruebasInsert(@RequestParam Map<String,String> requestParam) {
        return postulantePruebaService.createPostulantePruebas(requestParam);
    }
    @RequestMapping(value="recuperarContrasena.htm",method = RequestMethod.POST)
    public @ResponseBody String recuperarContrasena(HttpServletRequest request){
        return recuperarContrsenaService.RecuperarContrasena(request);
    }
    @RequestMapping(value = "pruebaJunior.htm", method = RequestMethod.GET)
    public ModelAndView pruebasJrView() {
        ModelAndView model = new ModelAndView();
        model.setViewName("pruebaJunior");
        return model;
    }
    @RequestMapping(value = "pruebaMedio.htm", method = RequestMethod.GET)
    public ModelAndView pruebasMedioView() {
        ModelAndView model = new ModelAndView();
        model.setViewName("pruebaMedio");
        return model;
    }
    @RequestMapping(value = "pruebaSenior.htm", method = RequestMethod.GET)
    public ModelAndView pruebasSeniorView() {
        ModelAndView model = new ModelAndView();
        model.setViewName("pruebaSenior");
        return model;
    }
    @RequestMapping(value = "pruebaMedio.htm", method = RequestMethod.POST)
    public ModelAndView pruebasMedioEval(HttpServletRequest request) {
        String []data={"c","c","b","a","a","a","c","c","d","b","c","d","b","c","a","b","c","a","a","d"};
        float cont=0;
        for(int i =0;i<20;i++){
            if(data[i].equals(request.getParameter("preg"+(i+1))))
                cont++;
        }
        float rerult=cont/20*100;
        /*
            Guardar en la base datos el resultado y que ya se realizo la prueba
        */
        ModelAndView model = new ModelAndView();
        model.setViewName("pruebasPostulante");
        return model;
    }
    @RequestMapping(value = "pruebaJunior.htm", method = RequestMethod.POST)
    public ModelAndView pruebasJrEval(HttpServletRequest request) {
        
        String []data={"c","d","b","c","a","b","b","d","a","c","b","a","c","b","d","b","d","c","c","b"};
        float cont=0;
        for(int i =0;i<20;i++){
            if(data[i].equals(request.getParameter("preg"+(i+1))))
                cont++;
        }
        float rerult=cont/20*100;
        /*
            Guardar en la base datos el resultado y que ya se realizo la prueba
        */
        ModelAndView model = new ModelAndView();
        model.setViewName("pruebasPostulante");
        return model;
    }
    @RequestMapping(value = "pruebaSenior.htm", method = RequestMethod.POST)
    public ModelAndView pruebasSeniorEval(HttpServletRequest request) {
        
        String []data={"c","d","b","d","a","a","c","b","d","a","d","c","a","a","c","b","d","c","d","b"};
        float cont=0;
        for(int i =0;i<20;i++){
            if(data[i].equals(request.getParameter("preg"+(i+1))))
                cont++;
        }
        float rerult=cont/20*100;
        /*
            Guardar en la base datos el resultado y que ya se realizo la prueba
        */
        ModelAndView model = new ModelAndView();
        model.setViewName("pruebasPostulante");
        return model;
    }
    @RequestMapping(value="logout.htm",method = RequestMethod.GET)
    public ModelAndView Logout(HttpServletRequest request, HttpServletResponse response){
        HttpSession session=request.getSession(false);
        session.removeAttribute("user");
         session.removeAttribute("rol");
        session.invalidate();
        ModelAndView model=new ModelAndView();
        model.setViewName("redirect:/index.htm");
        return model;
    }
    @RequestMapping(value="logoutP.htm",method = RequestMethod.GET)
    public ModelAndView LogoutP(HttpServletRequest request, HttpServletResponse response){
        HttpSession session=request.getSession(false);
        session.removeAttribute("user");
        session.removeAttribute("rol");
        session.invalidate();
        ModelAndView model=new ModelAndView();
        model.setViewName("redirect:/indexPostulante.htm");
        return model;
    }
    @RequestMapping(value="sesionRequired.htm",method = RequestMethod.GET)
    public ModelAndView ViewSessionRequired(){
        ModelAndView model=new ModelAndView();
        model.setViewName("sesionRequired");
        return  model;
    }
}
