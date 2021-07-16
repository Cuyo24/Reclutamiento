/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.dto;
import com.b1soft.modelo.Invitacion;

/**
 *
 * @author luisr
 */
public class InvitacionDto {
    private Integer id_invitacion;
    private String nombre;
    private String rfc;
    private String apellidoP;
    private String apellidoM;
    private String correo;

    public InvitacionDto() {
    }

    public InvitacionDto(Integer id_invitacion, String nombre, String rfc, String apellidoP, String apellidoM, String correo) {
        this.id_invitacion = id_invitacion;
        this.nombre = nombre;
        this.rfc = rfc;
        this.apellidoP = apellidoP;
        this.apellidoM = apellidoM;
        this.correo = correo;
    }

    public Integer getId_invitacion() {
        return id_invitacion;
    }

    public void setId_invitacion(Integer id_invitacion) {
        this.id_invitacion = id_invitacion;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getRfc() {
        return rfc;
    }

    public void setRfc(String rfc) {
        this.rfc = rfc;
    }

    public String getApellidoP() {
        return apellidoP;
    }

    public void setApellidoP(String apellidoP) {
        this.apellidoP = apellidoP;
    }

    public String getApellidoM() {
        return apellidoM;
    }

    public void setApellidoM(String apellidoM) {
        this.apellidoM = apellidoM;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("InvitacionDto{id_invitacion=").append(id_invitacion);
        sb.append(", nombre=").append(nombre);
        sb.append(", rfc=").append(rfc);
        sb.append(", apellidoP=").append(apellidoP);
        sb.append(", apellidoM=").append(apellidoM);
        sb.append(", correo=").append(correo);
        sb.append('}');
        return sb.toString();
    }
    
    
    
}
