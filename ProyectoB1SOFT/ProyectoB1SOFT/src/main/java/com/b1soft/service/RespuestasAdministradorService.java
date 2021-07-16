/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.service;

import com.b1soft.dto.PruebasAdministradorDto;
import java.util.List;
import java.util.Map;

/**
 *
 * @author DELL
 */
public interface RespuestasAdministradorService {
    public String crearRespuesta(final Map<String,String> requestParams);
    public String actualizarRespuesta(final Map<String,String> requestParams);
    public String borrarRespuesta(final Map<String,String> requestParams);
}
