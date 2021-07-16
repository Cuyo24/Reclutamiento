/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.modelo;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author na_gr
 */


@Entity
@Table(name="Administrador")
public class AddAdmin implements Serializable{
    @Id
    private String id_empleado;
    private String nombre_admin;
    private String apellidop_admin;
    private String apellidom_admin;
    private String correo_admin;
    private String password;

    public AddAdmin() {
    }
    
    public AddAdmin(String id_empleado,String nombre_admin,String apellidop_admin,String apellidom_admin,String correo_admin,String password){
        this.id_empleado = id_empleado;
        this.nombre_admin = nombre_admin;
        this.apellidop_admin = apellidop_admin;
        this.apellidom_admin = apellidom_admin;
        this.correo_admin = correo_admin;
        this.password = password;
    }

    public String getId_empleado() {
        return id_empleado;
    }

    public void setId_empleado(String id_empleado) {
        this.id_empleado = id_empleado;
    }

    public String getNombre_admin() {
        return nombre_admin;
    }

    public void setNombre_admin(String nombre_admin) {
        this.nombre_admin = nombre_admin;
    }

    public String getApellidop_admin() {
        return apellidop_admin;
    }

    public void setApellidop_admin(String apellidop_admin) {
        this.apellidop_admin = apellidop_admin;
    }

    public String getApellidom_admin() {
        return apellidom_admin;
    }

    public void setApellidom_admin(String apellidom_admin) {
        this.apellidom_admin = apellidom_admin;
    }

    public String getCorreo_admin() {
        return correo_admin;
    }

    public void setCorreo_admin(String correo_admin) {
        this.correo_admin = correo_admin;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("AddAdmin{id_empleado=").append(id_empleado);
        sb.append(", nombre_admin=").append(nombre_admin);
        sb.append(", apellidop_admin=").append(apellidop_admin);
        sb.append(", apellidom_admin=").append(apellidom_admin);
        sb.append(", correo_admin=").append(correo_admin);
        sb.append(", password=").append(password);
        sb.append('}');
        return sb.toString();
    }
    
    
    

    
  
}
