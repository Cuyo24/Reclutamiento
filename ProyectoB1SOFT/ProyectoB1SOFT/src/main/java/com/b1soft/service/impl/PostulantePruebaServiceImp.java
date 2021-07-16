/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.service.impl;

import com.b1soft.dao.PostulantePruebaDao;
import com.b1soft.modelo.PostulantePrueba;
import com.b1soft.service.PostulantePruebaService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
/**
 *
 * @author Yirz
 */
@Service("PostulantePruebaService")
public class PostulantePruebaServiceImp implements PostulantePruebaService{
    @Autowired
    PostulantePruebaDao postulantePruebaDao;
    @Override
    public String getPruebasRealizadas(Map<String, String> request) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String createPostulantePruebas(Map<String, String> requestParams) {
        String rfc=requestParams.get("rfc");
        int idPrueba=Integer.parseInt(requestParams.get("idPrueba"));
        float calificacion=Float.parseFloat(requestParams.get("calif"));
        String respuestas=requestParams.get("respuestas");
        PostulantePrueba entidad = new PostulantePrueba(rfc, idPrueba, calificacion,respuestas);
        entidad=postulantePruebaDao.create(entidad);
        String data="";
        try {
            ObjectMapper mapper = new ObjectMapper();
            data = mapper.writeValueAsString(entidad);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(PostulantePruebaServiceImp.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }

    @Override
    public String eliminarPostulantePruebas(Map<String, String> requestParams) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
