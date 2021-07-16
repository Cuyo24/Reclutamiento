/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.dao;

import com.b1soft.modelo.PreguntasAdministrador;
import java.util.List;

/**
 *
 * @author DELL
 */
public interface PreguntasAdministradorDao {
    public List<PreguntasAdministrador> getPreguntasPrueba(final Long Id_prueba);
    public List<PreguntasAdministrador> findAll();
    public PreguntasAdministrador create(final PreguntasAdministrador nuevaPregunta);
    public PreguntasAdministrador findById(final Long idPregunta);
    public PreguntasAdministrador update(final PreguntasAdministrador nuevaPregunta);
    public void delete(final PreguntasAdministrador nuevaPregunta);
}
