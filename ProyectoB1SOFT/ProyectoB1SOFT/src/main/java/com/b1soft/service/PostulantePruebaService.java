/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.service;

import java.util.Map;

/**
 *
 * @author Yirz
 */
public interface PostulantePruebaService {
    public String getPruebasRealizadas(final Map<String,String> request);
    public String createPostulantePruebas(final Map<String,String> requestParams);
    public String eliminarPostulantePruebas(final Map<String,String> requestParams);
}
