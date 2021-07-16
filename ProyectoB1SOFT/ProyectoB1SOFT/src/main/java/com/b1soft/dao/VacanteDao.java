/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.dao;

import com.b1soft.modelo.Vacante;
import java.util.List;

/**
 *
 * @author Yirz
 */
public interface VacanteDao {
    public List<Vacante> findAll();
    public Vacante create(final Vacante entidad);
    public Vacante findById(final Integer id);
    public Vacante update(final Vacante entidad);
    public boolean delete(final Vacante entidad);
}
