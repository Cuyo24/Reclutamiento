/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.dao;

import com.b1soft.modelo.AddAdmin;
import com.b1soft.modelo.Administrador;
import java.util.List;

/**
 *
 * @author na_gr
 */
public interface PersonalDao {
    public List<Administrador> findAll();
    public Administrador findById(final String id_empleado);
    public Administrador update(final Administrador ePersonal);
    public boolean delete(final Administrador ePersonal);
    
}
