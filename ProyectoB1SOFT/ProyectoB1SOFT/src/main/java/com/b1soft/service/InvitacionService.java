/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.service;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author luisr
 */
public interface InvitacionService {
    public String crearInvitacion(final HttpServletRequest request);
    public String editarInvitacion(final HttpServletRequest request);
    public String eliminarInvitacion(final Map<String,String> requestParams);
    public String sendEmail(HttpServletRequest request);
    public String readInvitaciones();
    public ModelAndView readInvitacion(final  HttpServletRequest request);
    public String readSin_Invitaciones();
}
