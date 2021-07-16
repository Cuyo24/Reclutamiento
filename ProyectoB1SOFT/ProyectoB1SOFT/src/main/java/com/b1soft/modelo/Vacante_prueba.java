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

/**
 *
 * @author Yirz
 */
@Entity
@Table(name="Vacante_prueba")
public class Vacante_prueba implements Serializable{
    @Id
    @Column(name="id_vacante")
    private int id_vacante;
    @Id
    @Column(name="id_prueba")
    private int id_prueba;

    public Vacante_prueba() {
    }

    public int getId_vacante() {
        return id_vacante;
    }

    public void setId_vacante(int id_vacante) {
        this.id_vacante = id_vacante;
    }

    public int getId_prueba() {
        return id_prueba;
    }

    public void setId_prueba(int id_prueba) {
        this.id_prueba = id_prueba;
    }

    @Override
    public String toString() {
        return "Vacante_prueba{" + "id_vacante=" + id_vacante + ", id_prueba=" + id_prueba + '}';
    }
    
}
