/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.dao;

import java.util.List;
import com.b1soft.modelo.Invitacion;
import com.b1soft.modelo.Sin_Invitacion;
/**
 *
 * @author luisr
 */
//Interfaces
public interface InvitacionDao {
    //Lista de vacantes
    public List<Invitacion> findAll();
    //Devuelve la vacante creada y actualizada 
    public Invitacion create(final Invitacion eInvitacion);
    public Invitacion findById(final Integer id_invitacion);
    public Invitacion findByToken(final String token);
    public Invitacion update(final Invitacion eInvitacion);
    public List<Sin_Invitacion> findPostulantesSinInvitacion();
    public Sin_Invitacion findPostulantesSinInvitacionByRFC(String rfc);
    public boolean delete(final Invitacion eInvitacion);
}
