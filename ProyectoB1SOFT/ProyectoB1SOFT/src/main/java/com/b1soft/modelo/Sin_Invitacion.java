/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.modelo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.Immutable;

/**
 *
 * @author Yirz
 */
@Entity
@Table(name="Sin_Invitacion")
@Immutable
public class Sin_Invitacion implements Serializable{
    @Id
    @Column(name="RFC",insertable = false,updatable = false)
    private String RFC;
    @Column(name="Nombre",insertable = false,updatable = false)
    private String Nombre;
    @Column(name="ApellidoPaterno",insertable = false,updatable = false)
    private String ApellidoP;
    @Column(name="ApellidoMaterno",insertable = false,updatable = false)
    private String ApellidoM;
    @Column(name="Correo",insertable = false,updatable = false)
    private String Correo;

    public Sin_Invitacion() {
    }

    public String getRFC() {
        return RFC;
    }

    public void setRFC(String RFC) {
        this.RFC = RFC;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getApellidoP() {
        return ApellidoP;
    }

    public void setApellidoP(String ApellidoP) {
        this.ApellidoP = ApellidoP;
    }

    public String getApellidoM() {
        return ApellidoM;
    }

    public void setApellidoM(String ApellidoM) {
        this.ApellidoM = ApellidoM;
    }

    public String getCorreo() {
        return Correo;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Sin_Invitacion{RFC=").append(RFC);
        sb.append(", Nombre=").append(Nombre);
        sb.append(", ApellidoP=").append(ApellidoP);
        sb.append(", ApellidoM=").append(ApellidoM);
        sb.append(", Correo=").append(Correo);
        sb.append('}');
        return sb.toString();
    }

   

   
}
