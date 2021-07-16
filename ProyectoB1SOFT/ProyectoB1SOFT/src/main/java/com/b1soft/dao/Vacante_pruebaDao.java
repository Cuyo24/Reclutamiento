/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.dao;

import com.b1soft.modelo.PruebasAdministrador;
import com.b1soft.modelo.Vacante_prueba;
import java.util.List;

/**
 *
 * @author Yirz
 */
public interface Vacante_pruebaDao {
    //public List<Vacante_prueba> findAll();
    public Vacante_prueba create(final Vacante_prueba entidad);
    public List<Vacante_prueba> findById(final Integer idvacante);
    public Vacante_prueba update(final Vacante_prueba entidad);
    public boolean delete(final Vacante_prueba entidad);
}
