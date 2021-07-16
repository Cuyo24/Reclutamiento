/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.modelo;

import com.b1soft.dto.PruebasAdministradorDto;
import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author Yirz
 */
@Entity
@Table(name="Vacante")
public class Vacante implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_vacante;
    private String nombre_vacante;
    //private List<PruebasAdministradorDto> pruebas;
    public Vacante() {
    }

    public Vacante(Integer id_vacante, String nombre_vacante) {
        this.id_vacante = id_vacante;
        this.nombre_vacante = nombre_vacante;
    }
    
    public int getId_vacante() {
        return id_vacante;
    }

    public void setId_vacante(int id_vacante) {
        this.id_vacante = id_vacante;
    }

    public String getNombre_vacante() {
        return nombre_vacante;
    }

    public void setNombre_vacante(String nombre_vacante) {
        this.nombre_vacante = nombre_vacante;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Vacante{id_vacante=").append(id_vacante);
        sb.append(", nombre_vacante=").append(nombre_vacante);
        sb.append('}');
        return sb.toString();
    }

}
