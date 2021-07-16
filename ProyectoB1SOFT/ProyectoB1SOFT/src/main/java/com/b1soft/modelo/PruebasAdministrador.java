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
import javax.persistence.TableGenerator;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
/**
 *
 * @author DELL
 */
@Entity
@Table(name = "PruebasAdministrador")
@TableGenerator(name = "id_pruebas_table_generator")
public class PruebasAdministrador implements Serializable {
    
    /*
     * Se cambio GenerationType.AUTO a GenerationType.IDENTITY
     * Las anotaciones se cambiaron encima de los atributos
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id_prueba", nullable = false)
    private Long Id_prueba;
    @Column(name = "Nombre_prueba", length = 100, nullable = false)
    private String Nombre_prueba;
    @Column(name = "Instrucciones_prueba", length = 255, nullable = false)
    private String Instrucciones_prueba;
    @Column(name = "deleted", nullable = false)
    private Character deleted;
    @Column(name = "autocalif", nullable = false)
    private Boolean autocalif;
    /*
     * Se genero los getters y los setters por los que te genera en automatico en netbeans 
     * 
     */
    public PruebasAdministrador() {}

    public PruebasAdministrador(final Long Id_prueba) {
	this.Id_prueba = Id_prueba;
    }

    public Long getId_prueba() {
        return Id_prueba;
    }

    public void setId_prueba(Long Id_prueba) {
        this.Id_prueba = Id_prueba;
    }

    public String getNombre_prueba() {
        return Nombre_prueba;
    }

    public void setNombre_prueba(String Nombre_prueba) {
        this.Nombre_prueba = Nombre_prueba;
    }

    public String getInstrucciones_prueba() {
        return Instrucciones_prueba;
    }

    public void setInstrucciones_prueba(String Instrucciones_prueba) {
        this.Instrucciones_prueba = Instrucciones_prueba;
    }

    public Character getDeleted() {
        return deleted;
    }

    public void setDeleted(Character deleted) {
        this.deleted = deleted;
    }

    public Boolean getAutocalif() {
        return autocalif;
    }

    public void setAutocalif(Boolean autocalif) {
        this.autocalif = autocalif;
    }
    
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("PruebasAdministrador{Id_prueba=").append(Id_prueba);
        sb.append(", Nombre_prueba=").append(Nombre_prueba);
        sb.append(", Instrucciones_prueba=").append(Instrucciones_prueba);
        sb.append(", deleted=").append(deleted);
        sb.append('}');
        return sb.toString();
    }

}