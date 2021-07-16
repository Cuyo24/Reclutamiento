/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.service.impl;

import com.b1soft.PruebasAdministradorController;
import com.b1soft.dao.PreguntasAdministradorDao;
import com.b1soft.dao.PruebasAdministradorDao;
import com.b1soft.dao.RespuestasAdministradorDao;
import com.b1soft.dto.RespuestasAdministradorDto;
import com.b1soft.modelo.RespuestasAdministrador;
import com.b1soft.service.RespuestasAdministradorService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author DELL
 */
@Service("respuestasAdministradorService")
public class RespuestasAdministradorServiceImpl implements RespuestasAdministradorService {
    
    @Autowired
    private PreguntasAdministradorDao preguntasDao;
    
    @Autowired
    private RespuestasAdministradorDao respuestasDao;

    @Override
    public String crearRespuesta(Map<String, String> requestParams) {
        for (String keys : requestParams.keySet()) {
            System.out.println(keys + ":"+ requestParams.get(keys));
        }
        RespuestasAdministrador nuevaRespuesta = new RespuestasAdministrador();
        nuevaRespuesta.setDeleted('F');
        nuevaRespuesta.setImagen_respuesta(requestParams.get("Imagen_respuesta"));
        nuevaRespuesta.setTexto(requestParams.get("Texto"));
        nuevaRespuesta.setPregunta(preguntasDao.findById(Long.valueOf(requestParams.get("pregunta_Id_pregunta"))));
        nuevaRespuesta = respuestasDao.create(nuevaRespuesta);
        RespuestasAdministradorDto returnRespuesta = new RespuestasAdministradorDto(nuevaRespuesta.getId_respuesta(), nuevaRespuesta.getTexto(), nuevaRespuesta.getImagen_respuesta(), nuevaRespuesta.getPregunta().getId_pregunta());
        String data = "";
        try {
            ObjectMapper mapper = new ObjectMapper();
            data = mapper.writeValueAsString(returnRespuesta);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(PruebasAdministradorController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }

    @Override
    public String actualizarRespuesta(Map<String, String> requestParams) {
        for (String keys : requestParams.keySet()) {
            System.out.println(keys + ":"+ requestParams.get(keys));
        }
        RespuestasAdministrador nuevaRespuesta = respuestasDao.findById(Long.valueOf(requestParams.get("Id_respuesta")));
        nuevaRespuesta.setImagen_respuesta(requestParams.get("Imagen_respuesta"));
        nuevaRespuesta.setTexto(requestParams.get("Texto"));
        nuevaRespuesta = respuestasDao.update(nuevaRespuesta);
        String data = "";
        try {
            ObjectMapper mapper = new ObjectMapper();
            data = mapper.writeValueAsString(true);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(PruebasAdministradorController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }

    @Override
    public String borrarRespuesta(Map<String, String> requestParams) {
        for (String keys : requestParams.keySet()) {
            System.out.println(keys + ":"+ requestParams.get(keys));
        }
        RespuestasAdministrador nuevaRespuesta = respuestasDao.findById(Long.valueOf(requestParams.get("Id_respuesta")));
        //nuevaRespuesta.setDeleted('T');
        respuestasDao.delete(nuevaRespuesta);
        String data = "";
        try {
            ObjectMapper mapper = new ObjectMapper();
            data = mapper.writeValueAsString(true);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(PruebasAdministradorController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }
    
}
