/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.service;

import java.util.Map;

/**
 *
 * @author DELL
 */
public interface PreguntasAdministradorService {
    public String crearNuevaPregunta(final Map<String,String> requestParams);
    public String actualizarPregunta(final Map<String,String> requestParams);
    public String borrarPregunta(final Map<String,String> requestParams);
}
