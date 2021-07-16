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
public interface AddAdminService {
    public String crearAdmin(HttpServletRequest request);
    public boolean loginAdmin(HttpServletRequest request);
}
