/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.util;

import com.b1soft.dao.PruebasAdministradorDao;
import com.b1soft.modelo.PruebasAdministrador;
import java.util.List;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Component;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

/**
 *
 * @author DELL
 */
@Component
@ComponentScan(value="com.b1soft.dao")
public class AppContextListener implements ServletContextListener{

    @Autowired
    private PruebasAdministradorDao pruebasAdministradorDao;
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("Iniciando AppContextListener");
	try {
            SpringBeanAutowiringSupport.processInjectionBasedOnCurrentContext(this);
            List<PruebasAdministrador> testPrueba = pruebasAdministradorDao.findAll();
            System.out.println("Encontré " + testPrueba.size() + " pruebas en el contexto");
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("No hay contexto.");
    }
    
}
