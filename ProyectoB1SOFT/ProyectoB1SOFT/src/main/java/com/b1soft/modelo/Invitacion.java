package com.b1soft.modelo;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author luisr
 */
@Entity
public class Invitacion implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_invitacion;
    private String nombre;
    private String rfc;
    private String apellidoP;
    private String apellidoM;
    private String correo;
    private String token;

    public Invitacion() {
    }
    
    public Invitacion(int id_invitacion, String nombre, String rfc, String apellidoP, String apellidoM, String correo) {
        this.id_invitacion = id_invitacion;
        this.nombre = nombre;
        this.rfc = rfc;
        this.apellidoP = apellidoP;
        this.apellidoM = apellidoM;
        this.correo = correo;
    }  

    public int getId_invitacion() {
        return id_invitacion;
    }

    public void setId_invitacion(int id_invitacion) {
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

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }
    
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Invitacion{id_invitacion=").append(id_invitacion);
        sb.append(", nombre=").append(nombre);
        sb.append(", rfc=").append(rfc);
        sb.append(", apellidoP=").append(apellidoP);
        sb.append(", apellidoM=").append(apellidoM);
        sb.append(", correo=").append(correo);
        sb.append('}');
        return sb.toString();
    }

    
}
