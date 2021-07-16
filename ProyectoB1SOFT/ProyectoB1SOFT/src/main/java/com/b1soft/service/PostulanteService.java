/* To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.service;

import com.b1soft.modelo.formModel.Registro;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


public interface PostulanteService{

public String readVacantes();
    public String readPostulantes();
    public String crearNuevoPostulante(final HttpServletRequest request);
    public ModelAndView buscarPostulante(final HttpServletRequest request);
    public ModelAndView actualizarPostulante(final Registro registro);
    public ModelAndView visualizarPruebasPostulante(final HttpServletRequest request);
    public ModelAndView visualizarRespuestas(final HttpServletRequest request);
    public boolean loginPostulante(final HttpServletRequest request);
    public String eliminarPostulante(final Map<String,String> requestParams);
}

