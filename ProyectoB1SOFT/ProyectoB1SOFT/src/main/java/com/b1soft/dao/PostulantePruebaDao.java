/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.dao;

import com.b1soft.modelo.PostulantePrueba;
import java.util.List;

/**
 *
 * @author Yirz
 */
public interface PostulantePruebaDao {
    public List<PostulantePrueba> findAll();
    public PostulantePrueba create(final PostulantePrueba entidad);
    public PostulantePrueba findByRfcAndId(final String rfc,Integer idPrueba);
    public List<PostulantePrueba> findById(final String rfc);
    public PostulantePrueba update(final PostulantePrueba entidad);
    public boolean delete(final PostulantePrueba entidad);
}
