/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.dao;

import com.b1soft.modelo.PruebasAdministrador;
import java.util.List;

/**
 *
 * @author DELL
 */
public interface PruebasAdministradorDao {
    public List<PruebasAdministrador> findAll();
    public PruebasAdministrador create(final PruebasAdministrador nuevaPrueba);
    public PruebasAdministrador findById(final Long idPrueba);
    public PruebasAdministrador update(final PruebasAdministrador nuevaPrueba);
    public void delete(final PruebasAdministrador nuevaPrueba);
}
