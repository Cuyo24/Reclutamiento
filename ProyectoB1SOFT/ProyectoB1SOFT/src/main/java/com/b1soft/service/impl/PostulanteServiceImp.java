/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.service.impl;

import com.b1soft.dao.PostulanteDao;
import com.b1soft.dao.PostulantePruebaDao;
import com.b1soft.dao.PruebasAdministradorDao;
import com.b1soft.dao.VacanteDao;
import com.b1soft.dto.PostulanteDto;
import com.b1soft.dto.PostulanteVDto;
import com.b1soft.dto.ResultadosDto;
import com.b1soft.modelo.Postulante;
import com.b1soft.modelo.PostulantePrueba;
import com.b1soft.modelo.PruebasAdministrador;
import com.b1soft.modelo.Vacante;
import com.b1soft.modelo.formModel.Registro;
import com.b1soft.util.JavaDropBox;
import com.b1soft.service.PostulanteService;
import com.dropbox.core.DbxException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author luisr
 */
@Service("PostulanteService")
public class PostulanteServiceImp implements PostulanteService {

    @Autowired
    PostulanteDao postulanteDao;
    @Autowired
    VacanteDao vacanteDao;
    @Autowired
    PostulantePruebaDao postulantePruebaDao;
    @Autowired
    PruebasAdministradorDao administradorDao;
    @Autowired
    ServletContext servletContext;

    @Override
    public String readPostulantes() {
        List<PostulanteDto> lista = new ArrayList<PostulanteDto>();
        List<Postulante> entidadlista = postulanteDao.findAll();
        String data = "";
        for (int i = 0; i < entidadlista.size(); i++) {
            List<PostulantePrueba> listaPruebas = postulantePruebaDao.findById(entidadlista.get(i).getRFC());
            PostulanteDto dto = new PostulanteDto();
            if (listaPruebas != null && listaPruebas.size() > 0) {
                float total = 0;
                List<ResultadosDto> resultadosDtos = new ArrayList<ResultadosDto>();
                for (int j = 0; j < listaPruebas.size(); j++) {
                    PruebasAdministrador prueba = administradorDao.findById(Long.valueOf(listaPruebas.get(j).getIdPrueba()));
                    resultadosDtos.add(new ResultadosDto(prueba.getNombre_prueba(), listaPruebas.get(j).getCalificacion()));
                    total += listaPruebas.get(j).getCalificacion();
                }
                total = (total / (100 * listaPruebas.size())) * 100;
                dto.setResultados(resultadosDtos);
                dto.setTotal(total);
            } else {
                dto.setResultados(null);
                dto.setTotal(0);
            }

            dto.setRFC(entidadlista.get(i).getRFC());
            dto.setNombre(entidadlista.get(i).getNombre());
            dto.setApellidoPaterno(entidadlista.get(i).getApellidoPaterno());
            dto.setApellidoMaterno(entidadlista.get(i).getApellidoMaterno());
            dto.setCorreo(entidadlista.get(i).getCorreo());
            dto.setId_vacante(entidadlista.get(i).getId_vacante());//foreignKey
            lista.add(dto);
        }
        try {
            ObjectMapper mapper = new ObjectMapper();
            data = mapper.writeValueAsString(lista);
        } catch (JsonProcessingException ex) {
            //Logger.getLogger(VacanteServiceImp.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex);
        }
        return data;
    }

    public String crearNuevoPostulante(HttpServletRequest request) {
        String RFC = request.getParameter("RFC");
        String Nombre = request.getParameter("Nombre");
        String ApellidoPaterno = request.getParameter("ApPaterno");
        String ApellidoMaterno = request.getParameter("ApMaterno");
        String Correo = request.getParameter("Correo");
        int id_vacante = Integer.parseInt(request.getParameter("Vacante"));
        System.out.println(RFC + Nombre + ApellidoMaterno + ApellidoPaterno + Correo + id_vacante);
        Postulante entidad = new Postulante();
        entidad.setRFC(RFC);
        entidad.setNombre(Nombre);
        entidad.setApellidoPaterno(ApellidoPaterno);
        entidad.setApellidoMaterno(ApellidoMaterno);
        entidad.setCorreo(Correo);
        entidad.setId_vacante(id_vacante);
        entidad = postulanteDao.create(entidad);
        PostulanteDto dto = new PostulanteDto(entidad.getRFC(), entidad.getNombre(), entidad.getApellidoPaterno(), entidad.getApellidoMaterno(), entidad.getCorreo(), entidad.getId_vacante());
        String data = "";
        try {
            ObjectMapper mapper = new ObjectMapper();
            data = mapper.writeValueAsString(dto);
        } catch (JsonProcessingException ex) {
        }
        return data;
    }

    @Override
    public ModelAndView actualizarPostulante(Registro registro) {
        ModelAndView model = new ModelAndView("html_utf8");
        try {
            Postulante entidad = new Postulante();
            entidad.setRFC(registro.getRFC());
            entidad.setNombre(registro.getNombre());
            entidad.setApellidoPaterno(registro.getApPaterno());
            entidad.setApellidoMaterno(registro.getApMaterno());
            entidad.setCorreo(registro.getCorreo());
            entidad.setEdad(registro.getEdad());
            entidad.setSeguroSocial(registro.getNss());
            entidad.setCURP(registro.getCurP());
            entidad.setCP(registro.getCp());
            entidad.setEstado(new String(registro.getEstado().getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8));
            entidad.setMunicipio(new String(registro.getMunicipio().getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8));
            entidad.setColonia(new String(registro.getColonia().getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8));
            entidad.setPassword(registro.getContrasena());
            entidad.setInstitucion(registro.getInstitu());
            entidad.setGrado(registro.getGrado());
            entidad.setTELEFONO(registro.getTel());
            entidad.setId_vacante(registro.getId_vacante());

            ArrayList<String> enlaces = guardarDropBox(registro);
            if (!enlaces.isEmpty()) {
                entidad.setCV(enlaces.get(0));
                entidad.setVideo(enlaces.get(1));
                entidad.setImagen(enlaces.get(2));
            } else {
                model.setViewName("redirect:/indexPostulante.htm");
                model.addObject("error", "Error al crear url DropBox");
                return model;
            }

            entidad = postulanteDao.update(entidad);

            model.setViewName("redirect:/indexPostulante.htm");
        } catch (IOException ex) {
            ex.printStackTrace();
            Logger.getLogger(PostulanteServiceImp.class.getName()).log(Level.SEVERE, null, ex);
            model.setViewName("redirect:/indexPostulante.htm");
            model.addObject("error", "Error en guardar Postulante");
        } catch (Exception ex) {
            ex.printStackTrace();
            Logger.getLogger(PostulanteServiceImp.class.getName()).log(Level.SEVERE, null, ex);
            model.setViewName("redirect:/indexPostulante.htm");
            model.addObject("error", "Error en guardar Postulante");
        }
        return model;
    }

    private ArrayList guardarDropBox(Registro registro) throws IOException, FileNotFoundException, DbxException {
        JavaDropBox jv = new JavaDropBox();
        ArrayList<String> enlaces = new ArrayList();
        String CV = registro.getRFC() + "_CV" + getExtention(registro.getArchivos_pdf().getOriginalFilename());
        String Video = registro.getRFC() + "_Video" + getExtention(registro.getVideos().getOriginalFilename());
        String Imagen = registro.getRFC() + "_Imagen" + getExtention(registro.getImagenes().getOriginalFilename());
        jv.uploadToDropbox(registro.getArchivos_pdf().getBytes(), "/" + CV);
        jv.uploadToDropbox(registro.getVideos().getBytes(), "/" + Video);
        jv.uploadToDropbox(registro.getImagenes().getBytes(), "/" + Imagen);
        String urlimagen
                = jv.createURL(Imagen);
        String urlvideo
                = jv.createURL(Video);
        String urlCV
                = jv.createURL(CV);
        if (!urlimagen.equals("") && !urlvideo.equals("") && !urlCV.equals("")) {
            enlaces.add(urlCV);
            enlaces.add(urlvideo);
            enlaces.add(urlimagen);
        }
        return enlaces;
    }

    private String getExtention(String string) {
        return string.substring(string.lastIndexOf("."), string.length());
    }

    @Override
    public ModelAndView buscarPostulante(HttpServletRequest request) {
        ModelAndView model = new ModelAndView();
        String rfc = request.getParameter("rfc");
        if (rfc != null) {
            System.out.print(rfc);
            Postulante postulante = postulanteDao.findByRFC(rfc);
            PostulanteVDto dto = new PostulanteVDto();
            postulante.setPassword("");
            postulante.setEstado(postulante.getEstado());
            postulante.setMunicipio(postulante.getMunicipio());
            postulante.setColonia(postulante.getColonia());
            dto.setEntidad(postulante);
            model.addObject("postulante", dto);
            model.setViewName("visualizarPostulante");
            return model;
        }
        model.setViewName("principalAdmin");
        return model;
    }

    @Override
    public boolean loginPostulante(HttpServletRequest requestParams) {
        String correo = requestParams.getParameter("Correo");
        String password = requestParams.getParameter("Password");
        Postulante entidad = new Postulante();
        entidad.setCorreo(correo);
        entidad.setPassword(password);
        entidad = postulanteDao.loginPostulante(entidad);

        if (entidad != null) {
            Vacante vacante = vacanteDao.findById(entidad.getId_vacante());
            entidad.setVacante(vacante.getNombre_vacante());
            HttpSession session = requestParams.getSession(true);
            session.setAttribute("user", entidad);
            session.setAttribute("rol", "postulante");

            return true;
        }

        return false;
    }

    @Override
    public String readVacantes() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ModelAndView visualizarPruebasPostulante(HttpServletRequest request) {
        ModelAndView model = new ModelAndView();
        String rfc = request.getParameter("rfc");
        if (rfc != null) {
            List<PostulantePrueba> listPostulantePruebas = postulantePruebaDao.findById(rfc);
            Postulante postulante = postulanteDao.findByRFC(rfc);
            PostulanteDto dto = new PostulanteDto();
            dto.setResultados(new ArrayList<ResultadosDto>());
            for (int i = 0; i < listPostulantePruebas.size(); i++) {
                PruebasAdministrador pa = administradorDao.findById(Long.valueOf(listPostulantePruebas.get(i).getIdPrueba()));
                ResultadosDto resultadosDto = new ResultadosDto(pa.getNombre_prueba(), listPostulantePruebas.get(i).getCalificacion(), listPostulantePruebas.get(i).getRespuestas());
                resultadosDto.setAutocalif(pa.getAutocalif());
                resultadosDto.setIdPrueba(Integer.valueOf(pa.getId_prueba().intValue()));
                dto.getResultados().add(resultadosDto);
            }
            dto.setRFC(rfc);
            dto.setNombre(postulante.getNombre());
            dto.setApellidoMaterno(postulante.getApellidoMaterno());
            dto.setApellidoPaterno(postulante.getApellidoPaterno());
            model.addObject("postulante", dto);
            model.setViewName("visualizarPruebasPostulante");
        } else {
            model.setViewName("principalAdmin");
        }
        return model;
    }

    @Override
    public ModelAndView visualizarRespuestas(HttpServletRequest request) {

        ModelAndView model = new ModelAndView();
        if (request.getParameter("rfc") != null && request.getParameter("idPrueba") != null) {
            String rfc = request.getParameter("rfc");
            int idPrueba = Integer.parseInt(request.getParameter("idPrueba"));
            PostulantePrueba postulantePrueba = postulantePruebaDao.findByRfcAndId(rfc, idPrueba);
            PruebasAdministrador pa = administradorDao.findById(Long.valueOf(postulantePrueba.getIdPrueba()));
            ResultadosDto resultadosDto = new ResultadosDto(pa.getNombre_prueba(), postulantePrueba.getCalificacion(), postulantePrueba.getRespuestas());
            resultadosDto.setAutocalif(pa.getAutocalif());
            resultadosDto.setIdPrueba(Integer.valueOf(pa.getId_prueba().intValue()));
            model.addObject("resultadosDto", resultadosDto);
            model.addObject("idPrueba", idPrueba);
            model.addObject("rfc", rfc);
            model.setViewName("verPrueba");
        } else {
            model.setViewName("postulante");
        }

        return model;
    }

    public String eliminarPostulante(Map<String, String> requestParams) {
        String id = requestParams.get("RFC");
        Postulante ePostulante = new Postulante();
        ePostulante.setRFC(id);
        boolean flag = postulanteDao.delete(ePostulante);
        if (flag) {
            return "{\"valid\":1}";
        }
        return "{\"valid\":0}";
    }
}
