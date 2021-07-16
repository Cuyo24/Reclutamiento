/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft;

import com.b1soft.service.AddAdminService;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author na_gr
 */
@RestController
public class AddAdminController {
    
    @Autowired
    private AddAdminService AddAdminService;
    
    @RequestMapping(name="createAdmin.htm", method = RequestMethod.POST)
    public String createAdmin(HttpServletRequest request){
        return AddAdminService.crearAdmin(request);
    }
 }
       

