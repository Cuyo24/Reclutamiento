/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.service.impl;

import com.b1soft.PersonalController;
import com.b1soft.dao.PersonalDao;
import com.b1soft.dto.PersonalDto;
import com.b1soft.modelo.AddAdmin;
import com.b1soft.modelo.Administrador;
import com.b1soft.service.PersonalService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author na_gr
 */
@Service("PersonalService")
public class PersonalServiceImpl implements PersonalService {
    
    @Autowired
    private PersonalDao personaldao;

    @Override
    public String readAdmin() {
        List<PersonalDto> lista = new ArrayList<PersonalDto>();
        List<Administrador> entidadLista=personaldao.findAll();
        String data="";
        for(int i=0;i<entidadLista.size();i++){
            PersonalDto dto = new PersonalDto();
            dto.setId_empleado(entidadLista.get(i).getId_empleado());
            dto.setNombre_admin(entidadLista.get(i).getNombre_admin());
            dto.setApellidop_admin(entidadLista.get(i).getApellidop_admin());
            dto.setApellidom_admin(entidadLista.get(i).getApellidom_admin());
            dto.setCorreo_admin(entidadLista.get(i).getCorreo_admin());
           //dto.setPassword(entidadLista.get(i).getPassword());
            lista.add(dto);
        }
        try {
            ObjectMapper mapper = new ObjectMapper();
            data = mapper.writeValueAsString(lista);
        } catch (JsonProcessingException ex) {
              Logger.getLogger(PersonalServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }

    @Override
    public String buscarAdmin(Map<String, String> requestParams) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String actualizarAdmin(HttpServletRequest request) {
        
        String id_empleado=request.getParameter("idEmpleado");
        String nombre_admin=request.getParameter("Nombre");
        String apellidop_admin=request.getParameter("ApPaterno");
        String apellidom_admin=request.getParameter("ApMaterno");
        String correo_admin=request.getParameter("Correo");
        String password=request.getParameter("Password");
        Administrador ePersonal=new Administrador(id_empleado,nombre_admin,apellidop_admin,apellidom_admin,correo_admin);
        ePersonal = personaldao.update(ePersonal);
        PersonalDto dto=new PersonalDto(ePersonal.getId_empleado(),ePersonal.getNombre_admin(),ePersonal.getApellidop_admin(),ePersonal.getApellidom_admin(),ePersonal.getCorreo_admin());
        String data = "";
        try {
            ObjectMapper mapper = new ObjectMapper();
            data = mapper.writeValueAsString(dto);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(PersonalServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }

    @Override
    public String borrarAdmin(Map<String, String> requestParams) {
        String id_empleado=requestParams.get("idEmpleado");
        Administrador ePersonal=new Administrador();
        ePersonal.setId_empleado(id_empleado);
        boolean flag=personaldao.delete(ePersonal);
        if(flag){
            return"{\"valid\":1}";
        }
        return "{\"valid\":0}";
    }


    
}
