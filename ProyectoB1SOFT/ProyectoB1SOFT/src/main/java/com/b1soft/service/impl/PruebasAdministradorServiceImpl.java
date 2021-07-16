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
import com.b1soft.dto.PruebasAdministradorDto;
import com.b1soft.dto.RespuestasAdministradorDto;
import com.b1soft.modelo.PreguntasAdministrador;
import com.b1soft.modelo.PruebasAdministrador;
import com.b1soft.modelo.RespuestasAdministrador;
import com.b1soft.service.PruebasAdministradorService;
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
@Service("pruebasAdministradorService")
public class PruebasAdministradorServiceImpl implements PruebasAdministradorService {

    @Autowired
    private PruebasAdministradorDao pruebasDao;
    
    @Autowired
    private PreguntasAdministradorDao preguntasDao;
    
    @Autowired
    private RespuestasAdministradorDao respuestasDao;
    
    @Override
    public String devuelvePruebas() {
        String data = "";
        List<PruebasAdministrador> listaPruebasBd = pruebasDao.findAll();
        List<PruebasAdministradorDto> pruebas = new ArrayList<PruebasAdministradorDto>();
        for(int i = 0; i < listaPruebasBd.size(); i++) {
            List<PreguntasAdministrador> listaPreguntasBd = preguntasDao.getPreguntasPrueba(listaPruebasBd.get(i).getId_prueba());
            List<PreguntasAdministradorDto> preguntas = new ArrayList<PreguntasAdministradorDto>();
            for(int j = 0; j < listaPreguntasBd.size(); j++) {
                List<RespuestasAdministrador> listaRespuestasBd = respuestasDao.getRespuestasPregunta(listaPreguntasBd.get(j).getId_pregunta());
                List<RespuestasAdministradorDto> respuestas = new ArrayList<RespuestasAdministradorDto>();
                for(int k = 0; k < listaRespuestasBd.size(); k++) {
                    respuestas.add(new RespuestasAdministradorDto(listaRespuestasBd.get(k).getId_respuesta(), listaRespuestasBd.get(k).getTexto(), listaRespuestasBd.get(k).getImagen_respuesta(), listaPreguntasBd.get(j).getId_pregunta()));
                }
                if(listaPreguntasBd.get(j).getRespuestacorrecta() != null) {
                    preguntas.add(new PreguntasAdministradorDto(listaPreguntasBd.get(j).getId_pregunta(), listaPreguntasBd.get(j).getInstrucciones_pregunta(), listaPreguntasBd.get(j).getNumero_pregunta(), listaPreguntasBd.get(j).getImagen_pregunta(),listaPreguntasBd.get(j).getTiempo(),listaPreguntasBd.get(j).getRespuestacorrecta().getId_respuesta(), respuestas));
                } else {
                    preguntas.add(new PreguntasAdministradorDto(listaPreguntasBd.get(j).getId_pregunta(), listaPreguntasBd.get(j).getInstrucciones_pregunta(), listaPreguntasBd.get(j).getNumero_pregunta(), listaPreguntasBd.get(j).getImagen_pregunta(),listaPreguntasBd.get(j).getTiempo() ,null, respuestas));
                }
            }
            pruebas.add(new PruebasAdministradorDto(listaPruebasBd.get(i).getId_prueba(), listaPruebasBd.get(i).getNombre_prueba(), listaPruebasBd.get(i).getInstrucciones_prueba(),listaPruebasBd.get(i).getAutocalif() ,preguntas));
        }
        try {
            ObjectMapper mapper = new ObjectMapper();
            data = mapper.writeValueAsString(pruebas);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(PruebasAdministradorController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }

    @Override
    public String crearNuevaPrueba(Map<String, String> requestParams) {
        for (String keys : requestParams.keySet()) {
            System.out.println(keys + ":"+ requestParams.get(keys));
        }
        PruebasAdministrador nuevaPrueba = new PruebasAdministrador();
        nuevaPrueba.setDeleted('F');
        nuevaPrueba.setInstrucciones_prueba(requestParams.get("Instrucciones_prueba"));
        nuevaPrueba.setNombre_prueba(requestParams.get("Nombre_prueba"));
        nuevaPrueba.setAutocalif(Boolean.parseBoolean(requestParams.get("autocalif")));
        nuevaPrueba = pruebasDao.create(nuevaPrueba);
        //System.out.println("Se creo la prueba " + nuevaPrueba.getId_prueba());
        PruebasAdministradorDto returnPrueba = new PruebasAdministradorDto(nuevaPrueba.getId_prueba(), nuevaPrueba.getNombre_prueba(), nuevaPrueba.getInstrucciones_prueba(),nuevaPrueba.getAutocalif(),new ArrayList<PreguntasAdministradorDto>());
        String data = "";
        try {
            ObjectMapper mapper = new ObjectMapper();
            //data = mapper.writeValueAsString(returnPrueba);
            data = mapper.writeValueAsString(returnPrueba);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(PruebasAdministradorController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }

    @Override
    public String buscarPrueba(Map<String, String> requestParams) {
        String data = "";
        Long id=Long.valueOf(requestParams.get("id"));
        //System.out.println("La prueba es:" + requestParams.get("id"));
        PruebasAdministrador entidad = pruebasDao.findById(id);
        List<PreguntasAdministrador> listaPreguntasBd = preguntasDao.getPreguntasPrueba(entidad.getId_prueba());
        List<PreguntasAdministradorDto> preguntas = new ArrayList<PreguntasAdministradorDto>();
        for(int j = 0; j < listaPreguntasBd.size(); j++) {
            List<RespuestasAdministrador> listaRespuestasBd = respuestasDao.getRespuestasPregunta(listaPreguntasBd.get(j).getId_pregunta());
            List<RespuestasAdministradorDto> respuestas = new ArrayList<RespuestasAdministradorDto>();
            for(int k = 0; k < listaRespuestasBd.size(); k++) {
                respuestas.add(new RespuestasAdministradorDto(listaRespuestasBd.get(k).getId_respuesta(), listaRespuestasBd.get(k).getTexto(), listaRespuestasBd.get(k).getImagen_respuesta(), listaPreguntasBd.get(j).getId_pregunta()));
            }
            if(listaPreguntasBd.get(j).getRespuestacorrecta() != null) {
                preguntas.add(new PreguntasAdministradorDto(listaPreguntasBd.get(j).getId_pregunta(), listaPreguntasBd.get(j).getInstrucciones_pregunta(), listaPreguntasBd.get(j).getNumero_pregunta(), listaPreguntasBd.get(j).getImagen_pregunta(),listaPreguntasBd.get(j).getTiempo() ,listaPreguntasBd.get(j).getRespuestacorrecta().getId_respuesta(), respuestas));
            } else {
                preguntas.add(new PreguntasAdministradorDto(listaPreguntasBd.get(j).getId_pregunta(), listaPreguntasBd.get(j).getInstrucciones_pregunta(), listaPreguntasBd.get(j).getNumero_pregunta(), listaPreguntasBd.get(j).getImagen_pregunta(),listaPreguntasBd.get(j).getTiempo() ,null, respuestas));
            }
        }
        PruebasAdministradorDto prueba = new PruebasAdministradorDto(entidad.getId_prueba(), entidad.getNombre_prueba(), entidad.getInstrucciones_prueba(),entidad.getAutocalif() ,preguntas);
        try {
            ObjectMapper mapper = new ObjectMapper();
            data = mapper.writeValueAsString(prueba);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(PruebasAdministradorController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }

    @Override
    public String actualizarPrueba(Map<String, String> requestParams) {
        for (String keys : requestParams.keySet()) {
            System.out.println(keys + ":"+ requestParams.get(keys));
	}
        PruebasAdministrador nuevaPrueba = pruebasDao.findById(Long.valueOf(requestParams.get("Id_prueba")));
        nuevaPrueba.setInstrucciones_prueba(requestParams.get("Instrucciones_prueba"));
        nuevaPrueba.setNombre_prueba(requestParams.get("Nombre_prueba"));
        nuevaPrueba.setAutocalif(Boolean.parseBoolean(requestParams.get("autocalif")));
        nuevaPrueba = pruebasDao.update(nuevaPrueba);
        //PruebaDto returnPrueba = new PruebaDto(nuevaPrueba.getId_prueba(), nuevaPrueba.getNombre_prueba(), nuevaPrueba.getInstrucciones_prueba(), new ArrayList<PreguntaDto>());
        String data = "";
        try {
            ObjectMapper mapper = new ObjectMapper();
            //data = mapper.writeValueAsString(returnPrueba);
            data = mapper.writeValueAsString(true);
        } catch (JsonProcessingException ex) {
            Logger.getLogger(PruebasAdministradorController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }

    @Override
    public String borrarPrueba(Map<String, String> requestParams) {
        /*
        for (String keys : requestParams.keySet()) {
            System.out.println(keys + ":"+ requestParams.get(keys));
        }*/
        PruebasAdministrador nuevaPrueba = pruebasDao.findById(Long.valueOf(requestParams.get("Id_prueba")));
        List<PreguntasAdministrador> preguntas = preguntasDao.getPreguntasPrueba(nuevaPrueba.getId_prueba());
        for(int i = 0; i < preguntas.size(); i++) {
            preguntas.get(i).setRespuestacorrecta(null);
            preguntasDao.update(preguntas.get(i));
        }
        for(int i = 0; i < preguntas.size(); i++) {
            List<RespuestasAdministrador> respuestas = respuestasDao.getRespuestasPregunta(preguntas.get(i).getId_pregunta());
            for(int j = 0; j < respuestas.size(); j++) {
                respuestasDao.delete(respuestas.get(j));
            }
            preguntasDao.delete(preguntas.get(i));
        }
        pruebasDao.delete(nuevaPrueba);
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
