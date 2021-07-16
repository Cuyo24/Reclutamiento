/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.service;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Yirz
 */
public interface VacanteService {
    public String readVacantes();
    public String crearNuevaVacante(final HttpServletRequest request);
    //public String buscarVacante(final Map<String,String> requestParams);
    public String actualizarVacante(final HttpServletRequest request);
    public String borrarVancante(final Map<String,String> requestParams);
}
