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
public interface PruebasAdministradorService {
    public String devuelvePruebas();
    public String crearNuevaPrueba(final Map<String,String> requestParams);
    public String buscarPrueba(final Map<String,String> requestParams);
    public String actualizarPrueba(final Map<String,String> requestParams);
    public String borrarPrueba(final Map<String,String> requestParams);
}
