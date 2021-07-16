/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.service.impl;

import com.b1soft.dao.InvitacionDao;
import com.b1soft.dao.PostulanteDao;
import com.b1soft.dto.InvitacionDto;
import com.b1soft.service.InvitacionService;
import java.util.Map;
import com.b1soft.modelo.Invitacion;
import com.b1soft.modelo.Postulante;
import com.b1soft.modelo.Sin_Invitacion;
import com.b1soft.modelo.formModel.Registro;
import com.b1soft.util.Email;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author luisr
 */
@Service("invitacionService")
public class InvitacionServiceImp implements InvitacionService{
    @Autowired
    private InvitacionDao invitaciondao;
    @Autowired
    private PostulanteDao postulanteDao;
    @Override
    public String readInvitaciones() {
        List<InvitacionDto> lista = new ArrayList<InvitacionDto>();
        List<Invitacion> eLista=invitaciondao.findAll();
        String data="";
        for(int i=0; i<eLista.size();i++){
            InvitacionDto dto=new InvitacionDto();
            dto.setId_invitacion(eLista.get(i).getId_invitacion());
            dto.setNombre(eLista.get(i).getNombre());
            dto.setRfc(eLista.get(i).getRfc());
            dto.setApellidoP(eLista.get(i).getApellidoP());
            dto.setApellidoM(eLista.get(i).getApellidoM());
            dto.setCorreo(eLista.get(i).getCorreo());
            lista.add(dto);
        }
        try {
            ObjectMapper mapper = new ObjectMapper();
            data = mapper.writeValueAsString(lista);
        } catch (JsonProcessingException ex) {
              Logger.getLogger(VacanteServiceImp.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }
    
    @Override
    public String editarInvitacion(HttpServletRequest request) {
       Integer id= Integer.parseInt(request.getParameter("id_invitacion"));
       String nombre=request.getParameter("Nombre");
       String rfc=request.getParameter("RFC");
       String apellidoP=request.getParameter("ApPaterno");
       String apellidoM=request.getParameter("ApMaterno");
       String correo=request.getParameter("Correo");
       Invitacion eInvitacion=new Invitacion(id, nombre, rfc, apellidoP, apellidoM, correo);
       eInvitacion= invitaciondao.update(eInvitacion);
       InvitacionDto dto=new InvitacionDto(eInvitacion.getId_invitacion(), eInvitacion.getNombre(), eInvitacion.getRfc(),eInvitacion.getApellidoP(), eInvitacion.getApellidoM(), eInvitacion.getCorreo());
       String data="";
       try{
           ObjectMapper mapper=new ObjectMapper();
           data = mapper.writeValueAsString(dto);
       }catch(JsonProcessingException ex){
           Logger.getLogger(InvitacionServiceImp.class.getName()).log(Level.SEVERE,null, ex);
       }
       return data;
    }  
    

    @Override
    public String eliminarInvitacion(Map<String, String> requestParams) {
        Integer id=Integer.parseInt(requestParams.get("id"));
        Invitacion eInvitacion=new Invitacion();
        eInvitacion.setId_invitacion(id);
        boolean flag=invitaciondao.delete(eInvitacion);
        if(flag){
            return"{\"valid\":1}";
        }
        return "{\"valid\":0}";
    } 

    @Override
    public String sendEmail(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        Invitacion entidad= invitaciondao.findById(id);
        String token = UUID.randomUUID().toString();
        System.out.println(token);
        entidad.setToken(token);        
        entidad = invitaciondao.update(entidad);
        Email email= new Email();
        String Contenido="Bienvenido a B1 SOFT\n"
                + "Se ha registrado su vacante por lo que le pedimos que se registres en la siguiente url:\n";
        String url="http://localhost:8080"+request.getContextPath()+"/registro.htm?code="+entidad.getToken();
        try{
            email.enviarEmail(entidad.getCorreo(),"Inivtación para realizar Pruebas",Contenido+url);
        }
        catch(Exception e){
            return "{\"valid\":0}";
        }
        return "{\"valid\":1}"; 
        
    }

     @Override
    public ModelAndView readInvitacion(HttpServletRequest request) {
        ModelAndView model = new ModelAndView();
        String token = request.getParameter("code");
        Invitacion entidad = invitaciondao.findByToken(token);
        if(entidad!=null){
            Postulante postulante=postulanteDao.findByRFC(entidad.getRfc());
            Registro registro= new Registro();
            registro.setId_vacante(postulante.getId_vacante());
            registro.setRFC(postulante.getRFC());
            registro.setApMaterno(postulante.getApellidoMaterno());
            registro.setApPaterno(postulante.getApellidoPaterno());
            registro.setCorreo(postulante.getCorreo());
            registro.setNombre(postulante.getNombre());
            model.addObject("postulante", registro);
            model.setViewName("registro");
        }
        else{
            model.addObject("error", "Usuario no tiene invitacion favor de pedir reenvio");
            model.setViewName("index");
        }
        
        return model;
    }

    @Override
    public String readSin_Invitaciones() {
        //List<InvitacionDto> lista = new ArrayList<InvitacionDto>();
        List<Sin_Invitacion> eLista=invitaciondao.findPostulantesSinInvitacion();
        String data="";
        /*
        for(int i=0; i<eLista.size();i++){
            InvitacionDto dto=new InvitacionDto();
            dto.setNombre(eLista.get(i).getNombre());
            dto.setRfc(eLista.get(i).getRFC());
            dto.setApellidoP(eLista.get(i).getApellidoP());
            dto.setApellidoM(eLista.get(i).getApellidoM());
            dto.setCorreo(eLista.get(i).getCorreo());
            lista.add(dto);
        }*/
        try {
            ObjectMapper mapper = new ObjectMapper();
            data = mapper.writeValueAsString(eLista);
        } catch (JsonProcessingException ex) {
              Logger.getLogger(InvitacionServiceImp.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }

    @Override
    public String crearInvitacion(HttpServletRequest request) {
        String rfc=request.getParameter("new_invitacion");
        Sin_Invitacion newInvitacion=invitaciondao.findPostulantesSinInvitacionByRFC(rfc);
        Invitacion invitacion=new Invitacion();
        invitacion.setRfc(newInvitacion.getRFC());
        invitacion.setNombre(newInvitacion.getNombre());
        invitacion.setCorreo(newInvitacion.getCorreo());
        invitacion.setApellidoM(newInvitacion.getApellidoM());
        invitacion.setApellidoP(newInvitacion.getApellidoP());
        invitacion=invitaciondao.create(invitacion);
        InvitacionDto dto=new InvitacionDto(invitacion.getId_invitacion(),invitacion.getNombre(),invitacion.getRfc(),invitacion.getApellidoP(),invitacion.getApellidoM(),invitacion.getCorreo());
        String data="";
        try {
            ObjectMapper mapper = new ObjectMapper();
            data = mapper.writeValueAsString(dto);
        } catch (JsonProcessingException ex) {
              Logger.getLogger(InvitacionServiceImp.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }
    
    
}
