/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.service.impl;

import com.b1soft.dao.AddAdminDao;
import com.b1soft.dao.PostulanteDao;
import com.b1soft.modelo.AddAdmin;
import com.b1soft.modelo.Postulante;
import com.b1soft.service.RecuperarContrsenaService;
import com.b1soft.util.Email;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Yirz
 */
@Service("RecuperarContrasenaService")
public class RecuperarContrasenaServiceImp implements RecuperarContrsenaService{
    @Autowired
    AddAdminDao addAdminDao;
    @Autowired
    PostulanteDao postulanteDao;
    @Override
    public String RecuperarContrasena(HttpServletRequest request) {
      String email=request.getParameter("Email");
      AddAdmin entidad=addAdminDao.findByEmail(email);
      Postulante postulante = postulanteDao.findByEmail(email);
      if(entidad!=null){
          Email mail =new Email();
          mail.enviarEmail(email,"Recuperación de Contraseña","Tu contraeña perdida es: "+entidad.getPassword());
          return "{\"valid\":1}";
      }
      else if(postulante!=null){
          Email mail =new Email();
          mail.enviarEmail(email,"Recuperación de Contraseña","Tu contraeña perdida es: "+postulante.getPassword());
          return "{\"valid\":1}";
      }
      else
      {
          return "{\"valid\":0}";
      }
    }

  
  
    
}
