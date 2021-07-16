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
 * @author na_gr
 */
public interface PersonalService {
    public String readAdmin();
    public String buscarAdmin(final Map<String,String> requestParams);
    public String actualizarAdmin(final HttpServletRequest request);
    public String borrarAdmin(final Map<String,String> requestParams);
}
    

