/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.dao;

import com.b1soft.modelo.RespuestasAdministrador;
import java.util.List;

/**
 *
 * @author DELL
 */
public interface RespuestasAdministradorDao {
    public List<RespuestasAdministrador> getRespuestasPregunta(final Long Id_prueba);
    public List<RespuestasAdministrador> findAll();
    public RespuestasAdministrador create(final RespuestasAdministrador nuevaRespuesta);
    public RespuestasAdministrador findById(final Long idRespuesta);
    public RespuestasAdministrador update(final RespuestasAdministrador nuevaRespuesta);
    public void delete(final RespuestasAdministrador nuevaRespuesta);
}
