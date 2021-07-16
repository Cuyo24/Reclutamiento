/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.service.impl;

import com.b1soft.dao.AddAdminDao;
import com.b1soft.dto.AddAdminDto;
import com.b1soft.modelo.AddAdmin;
import com.b1soft.service.AddAdminService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author na_gr
 */
@Service("AddAdminService")
public class AddAdminServiceImpl implements AddAdminService{
    
    @Autowired
    private AddAdminDao addAdmindao;
    

   @Override
    public String crearAdmin(HttpServletRequest request) {
        String id_empleado=request.getParameter("idEmpleado");
        String nombre_admin=request.getParameter("Nombre");
        String apellidop_admin=request.getParameter("ApPaterno");
        String apellidom_admin=request.getParameter("ApMaterno");
        String correo_admin=request.getParameter("Correo");
        String password=request.getParameter("Password");
        AddAdmin admin=new AddAdmin(); 
        admin.setId_empleado(id_empleado);
        admin.setNombre_admin(nombre_admin);
        admin.setApellidop_admin(apellidop_admin);
        admin.setApellidom_admin(apellidom_admin);
        admin.setCorreo_admin(correo_admin);
        admin.setPassword(password);
        admin = addAdmindao.create(admin);
  
        AddAdminDto dto=new AddAdminDto(admin.getId_empleado(),admin.getNombre_admin(),admin.getApellidop_admin(),admin.getApellidom_admin(),admin.getCorreo_admin(),admin.getPassword(),new ArrayList<AddAdminDto>());
        String data="";
        try {
            ObjectMapper mapper = new ObjectMapper();
            data = mapper.writeValueAsString(dto);
        } catch (JsonProcessingException ex) {
             Logger.getLogger(AddAdminServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }


    @Override
    public boolean loginAdmin(HttpServletRequest request) {
        String correo = request.getParameter("Correo");
        String password = request.getParameter("Password");
        AddAdmin entidad= new AddAdmin();
        entidad.setCorreo_admin(correo);
        entidad.setPassword(password);
        entidad= addAdmindao.loginAdmin(entidad);
        if(entidad!=null){
           HttpSession session=request.getSession(true);
            session.setAttribute("user",entidad);
            session.setAttribute("rol", "administrador");
            return true;
        }
            
        return false;
    }

        
}



    

