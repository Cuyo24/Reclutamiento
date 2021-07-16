package com.b1soft.service.impl;

import com.b1soft.dao.PruebasAdministradorDao;
import com.b1soft.dao.VacanteDao;
import com.b1soft.dao.Vacante_pruebaDao;
import com.b1soft.dto.PreguntasAdministradorDto;
import com.b1soft.dto.PruebasAdministradorDto;
import com.b1soft.dto.VacanteDto;
import com.b1soft.modelo.PreguntasAdministrador;
import com.b1soft.modelo.PruebasAdministrador;
import com.b1soft.modelo.Vacante;
import com.b1soft.modelo.Vacante_prueba;
import com.b1soft.service.VacanteService;
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Yirz
 */
@Service("vacanteService")
public class VacanteServiceImp implements VacanteService{
    @Autowired
    private VacanteDao vacantedao;
    @Autowired
    private Vacante_pruebaDao vacante_pruebadao;
    @Autowired
    private PruebasAdministradorDao pruebasDao;
    @Override
    public String readVacantes() {
        List<VacanteDto> lista = new ArrayList<VacanteDto>();
        List<Vacante> entidadLista=vacantedao.findAll();
        String data="";
        for(int i=0;i<entidadLista.size();i++){
           
            List<Vacante_prueba> listaVacante_Prueba=vacante_pruebadao.findById(entidadLista.get(i).getId_vacante());
            VacanteDto dto=new VacanteDto();
            for(int j=0;j<listaVacante_Prueba.size();j++){
                PruebasAdministrador entidad=pruebasDao.findById(Long.valueOf(listaVacante_Prueba.get(j).getId_prueba()));
                dto.getPruebas().add(new PruebasAdministradorDto(entidad.getId_prueba(),entidad.getNombre_prueba(),entidad.getInstrucciones_prueba(),entidad.getAutocalif(),null));    
            }
            dto.setId_vacante(entidadLista.get(i).getId_vacante());
            dto.setNombre_vacante(entidadLista.get(i).getNombre_vacante());
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
    public String crearNuevaVacante(HttpServletRequest request) {
        String nombre=request.getParameter("Nombre");
        String[] pruebas=request.getParameterValues("pruebas[]");
        Vacante entidad=new Vacante(); 
        entidad.setNombre_vacante(nombre);
        entidad = vacantedao.create(entidad);
        Vacante_prueba entidad_relacional=new Vacante_prueba();
        List<PruebasAdministradorDto> list=new ArrayList<PruebasAdministradorDto>();
        for(int i=0;i<pruebas.length;i++){
            
            entidad_relacional.setId_vacante(entidad.getId_vacante());
            entidad_relacional.setId_prueba(Integer.parseInt(pruebas[i]));
            PruebasAdministrador pruebasAdministrador=pruebasDao.findById(Long.valueOf(pruebas[i]));
            PruebasAdministradorDto dto=new PruebasAdministradorDto(pruebasAdministrador.getId_prueba(),pruebasAdministrador.getNombre_prueba(),pruebasAdministrador.getInstrucciones_prueba(),pruebasAdministrador.getAutocalif(),null);
            list.add(dto);
            vacante_pruebadao.create(entidad_relacional);
        }
        VacanteDto dto=new VacanteDto(entidad.getId_vacante(),entidad.getNombre_vacante(),list);
        String data="";
        try {
            ObjectMapper mapper = new ObjectMapper();
            data = mapper.writeValueAsString(dto);
        } catch (JsonProcessingException ex) {
              Logger.getLogger(VacanteServiceImp.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }

    @Override
    public String actualizarVacante(HttpServletRequest request) {
        Integer id=Integer.parseInt(request.getParameter("idVacante"));
        String nombre=request.getParameter("Nombre");
        String [] pruebas=request.getParameterValues("pruebas[]");
        List<Vacante_prueba> aux_Vacante_pruebas=new ArrayList<Vacante_prueba>();
        List<Vacante_prueba> vacantes_pruebas=vacante_pruebadao.findById(id);
        Vacante_prueba vacante_prueba=new Vacante_prueba();
        List<PruebasAdministradorDto> list=new ArrayList<PruebasAdministradorDto>();
        for(int i=0;i<pruebas.length;i++){
            boolean flag=true;
            for(int j=0;j<vacantes_pruebas.size();j++){
                if(Integer.parseInt(pruebas[i])== vacantes_pruebas.get(j).getId_prueba()){
                    flag=false;
                    break;
                }    
            }
            if(flag){
                vacante_prueba.setId_prueba(Integer.parseInt(pruebas[i]));
                vacante_prueba.setId_vacante(id);
                vacante_pruebadao.create(vacante_prueba);
            }
        }
        for(int i=0;i<vacantes_pruebas.size();i++){
            boolean flag=true;
            for(int j=0;j<pruebas.length;j++){
                if(Integer.parseInt(pruebas[j])== vacantes_pruebas.get(i).getId_prueba()){
                    flag=false;
                    break;
                }    
            }
            if(flag){
                vacante_pruebadao.delete(vacantes_pruebas.get(i));
            }
        }
        Vacante entidad=new Vacante(id,nombre);
        entidad = vacantedao.update(entidad);
        for(int i=0;i<pruebas.length;i++){
            
            vacante_prueba.setId_vacante(entidad.getId_vacante());
            vacante_prueba.setId_prueba(Integer.parseInt(pruebas[i]));
            PruebasAdministrador pruebasAdministrador=pruebasDao.findById(Long.valueOf(pruebas[i]));
            PruebasAdministradorDto dto=new PruebasAdministradorDto(pruebasAdministrador.getId_prueba(),pruebasAdministrador.getNombre_prueba(),pruebasAdministrador.getInstrucciones_prueba(),pruebasAdministrador.getAutocalif(),null);
            list.add(dto);
        }
        VacanteDto dto=new VacanteDto(entidad.getId_vacante(),entidad.getNombre_vacante(),list);
        String data="";
        try {
            ObjectMapper mapper = new ObjectMapper();
            data = mapper.writeValueAsString(dto);
        } catch (JsonProcessingException ex) {
              Logger.getLogger(VacanteServiceImp.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }

    @Override
    public String borrarVancante(Map<String, String> requestParams) {
        Integer id=Integer.parseInt(requestParams.get("idVacante"));
        Vacante entidad=new Vacante();
        entidad.setId_vacante(id);
        boolean flag=vacantedao.delete(entidad);
        if(flag){
            return "{\"valid\":1}";
        }
        return "{\"valid\":0}";
      
    }
    
}
