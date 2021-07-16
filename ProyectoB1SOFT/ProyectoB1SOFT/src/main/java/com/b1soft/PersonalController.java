/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft;

import com.b1soft.service.PersonalService;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author na_gr
 */
@RestController
public class PersonalController {
    
    @Autowired
    private PersonalService personalService;

    @RequestMapping(value = "readAdmin.htm", method = RequestMethod.GET)
    public String readAdmin() {
        return personalService.readAdmin();
    }
    @RequestMapping(value="updateAdmin.htm",method = RequestMethod.POST)
    public String updateAdmin(HttpServletRequest request){
       return personalService.actualizarAdmin(request);
    }
    @RequestMapping(value="deleteAdmin.htm",method = RequestMethod.POST)
    public String deleteAdmin(@RequestParam Map<String,String> requestParam){
       String flag=personalService.borrarAdmin(requestParam);
       System.out.println(flag);
       return flag;
    }
   
  
}