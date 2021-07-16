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
import com.b1soft.dto.PreguntasAdministradorDto;
import com.b1soft.dto.RespuestasAdministradorDto;
import com.b1soft.modelo.PreguntasAdministrador;
import com.b1soft.modelo.RespuestasAdministrador;
import com.b1soft.service.PreguntasAdministradorService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author DELL
 */
@Service("preguntasAdministradorService")
public class PreguntasAdministradorServiceImpl implements PreguntasAdministradorService {

    @Autowired
    private PruebasAdministradorDao pruebasDao;

    @Autowired
    private PreguntasAdministradorDao preguntasDao;
    
    @Autowired
    private RespuestasAdministradorDao respuestasDao;

    @Override
    public String crearNuevaPregunta(Map<String, String> requestParams) {
        for (String keys : requestParams.keySet()) {
            System.out.println(keys + ":"+ requestParams.get(keys));
        }
        PreguntasAdministrador nuevaPregunta = new PreguntasAdministrador();
        nuevaPregunta.setDeleted('F');
        nuevaPregunta.setImagen_pregunta(requestParams.get("Imagen_pregunta"));
        nuevaPregunta.setInstrucciones_pregunta(requestParams.get("Instrucciones_pregunta"));
        nuevaPregunta.setNumero_pregunta(Long.valueOf(requestParams.get("Numero_pregunta")));
        nuevaPregunta.setPrueba(pruebasDao.findById(Long.valueOf(requestParams.get("prueba_Id_prueba"))));
        nuevaPregunta.setTiempo(Integer.parseInt(requestParams.get("Tiempo")));
        nuevaPregunta = preguntasDao.create(nuevaPregunta);
        PreguntasAdministradorDto returnPregunta = new PreguntasAdministradorDto(nuevaPregunta.getId_pregunta(), nuevaPregunta.getInstrucciones_pregunta(), nuevaPregunta.getNumero_pregunta(), nuevaPregunta.getImagen_pregunta(),nuevaPregunta.getTiempo(),null, new ArrayList<RespuestasAdministradorDto>());
        String data = "";
        try {
            ObjectMapper mapper = new ObjectMapper();
            data = mapper.writeValueAsString(returnPregunta);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(PruebasAdministradorController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }

    @Override
    public String actualizarPregunta(Map<String, String> requestParams) {
        for (String keys : requestParams.keySet()) {
            System.out.println(keys + ":"+ requestParams.get(keys));
        }
        PreguntasAdministrador nuevaPregunta = preguntasDao.findById(Long.valueOf(requestParams.get("Id_pregunta")));
        nuevaPregunta.setImagen_pregunta(requestParams.get("Imagen_pregunta"));
        nuevaPregunta.setInstrucciones_pregunta(requestParams.get("Instrucciones_pregunta"));
        nuevaPregunta.setNumero_pregunta(Long.valueOf(requestParams.get("Numero_pregunta")));
        nuevaPregunta.setTiempo(Integer.parseInt(requestParams.get("Tiempo")));
        if(!requestParams.get("respuestacorrecta_Id_respuesta").isEmpty()) {
            nuevaPregunta.setRespuestacorrecta(respuestasDao.findById(Long.valueOf(requestParams.get("respuestacorrecta_Id_respuesta"))));
        }
        nuevaPregunta = preguntasDao.update(nuevaPregunta);
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
    public String borrarPregunta(Map<String, String> requestParams) {
        for (String keys : requestParams.keySet()) {
            System.out.println(keys + ":"+ requestParams.get(keys));
        }
        PreguntasAdministrador nuevaPregunta = preguntasDao.findById(Long.valueOf(requestParams.get("Id_pregunta")));
        List<RespuestasAdministrador> respuestas = respuestasDao.getRespuestasPregunta(nuevaPregunta.getId_pregunta());
        nuevaPregunta.setRespuestacorrecta(null);
        preguntasDao.update(nuevaPregunta);
        for(int j = 0; j < respuestas.size(); j++) {
            //respuestas.get(j).setDeleted('T');
            respuestasDao.delete(respuestas.get(j));
        }
        //nuevaPregunta.setDeleted('T');
        preguntasDao.delete(nuevaPregunta);
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
