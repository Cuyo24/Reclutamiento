/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.util;

import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Yirz
 */
public class Email {

    public void enviarEmail(String dest, String asunto, String contenido) {
        try {
            Properties p = new Properties();
            p.setProperty("mail.smtp.host", "smtp.gmail.com");
            p.setProperty("mail.smtp.starttls.enable", "true");
            p.setProperty("mail.smtp.starttls.required", "true");
            p.setProperty("mail.smtp.port", "587");
            p.setProperty("mail.smtp.user",
                    "Nahum Alejandro El Guzmán Bernabé");
            p.setProperty("mail.smtp.auth", "true");

            Session s = Session.getDefaultInstance(p);
            MimeMessage mensaje = new MimeMessage(s);
            mensaje.setFrom(
                    new InternetAddress("nahum.guzman@b1-soft.com"));
            mensaje.addRecipients(Message.RecipientType.TO,
                    dest);

            mensaje.setSubject(asunto);
            mensaje.setText(contenido);

            Transport t = s.getTransport("smtp");
            t.connect("nahum.guzman@b1-soft.com",
                    "Claudiay123");
            t.sendMessage(mensaje, mensaje.getAllRecipients());
            t.close();
        } catch (MessagingException ex) {
            Logger.getLogger(Email.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
