package com.b1soft.service.impl;

import com.b1soft.dao.PostulantePruebaDao;
import com.b1soft.dao.PruebasAdministradorDao;
import com.b1soft.dao.VacanteDao;
import com.b1soft.dao.Vacante_pruebaDao;
import com.b1soft.dto.PruebasAdministradorDto;
import com.b1soft.dto.VacanteDto;
import com.b1soft.modelo.PostulantePrueba;
import com.b1soft.modelo.PruebasAdministrador;
import com.b1soft.modelo.Vacante;
import com.b1soft.modelo.Vacante_prueba;
import com.b1soft.service.pruebasPostulanteService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;




@Service("pruebasPostulanteService")
public class pruebasPostulanteServiceImp implements pruebasPostulanteService {
    @Autowired
    private VacanteDao vacantedao;
    @Autowired
    private Vacante_pruebaDao vacante_pruebadao;
    @Autowired
    private PruebasAdministradorDao pruebasDao;
    @Autowired
    private PostulantePruebaDao postulantePruebaDao;
    @Override
    public String readVacantes(HttpServletRequest request) {
        String id = request.getParameter("id");
        String rfc = request.getParameter("rfc");
        List<Vacante_prueba> lista =  vacante_pruebadao.findById(Integer.parseInt(id));
        List<PostulantePrueba> lista_pruebas_realizadas=postulantePruebaDao.findById(rfc);
        List<PruebasAdministradorDto> listapruebas = new ArrayList<>();
        for(int i=0;i<lista.size();i++){
            boolean flag=false;
            for(int j=0;j<lista_pruebas_realizadas.size();j++){
                if(lista_pruebas_realizadas.get(j).getIdPrueba()==lista.get(i).getId_prueba()){
                    flag=true;
                    break;
                }
            }
            if(!flag){
                PruebasAdministrador prueba = pruebasDao.findById(Long.valueOf(lista.get(i).getId_prueba()));
                listapruebas.add(new PruebasAdministradorDto(prueba.getId_prueba(),prueba.getNombre_prueba(),prueba.getInstrucciones_prueba(),prueba.getAutocalif(),null));
            }
        }
        
        String data = "";
        try {
            ObjectMapper mapper = new ObjectMapper();
            data = mapper.writeValueAsString(listapruebas);
        } catch (JsonProcessingException ex) {
              Logger.getLogger(VacanteServiceImp.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;

    }
}
