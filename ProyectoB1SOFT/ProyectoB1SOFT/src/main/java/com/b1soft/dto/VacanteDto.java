/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.dto;

import com.b1soft.modelo.Vacante;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Yirz
 */
public class VacanteDto {

    private Integer id_vacante;
    private String nombre_vacante;
    private List<PruebasAdministradorDto> pruebas;

    public VacanteDto() {
        pruebas= new ArrayList<PruebasAdministradorDto>();
    }

    public VacanteDto(Integer id_vacante, String nombre_vacante, List<PruebasAdministradorDto> pruebas) {
        this.id_vacante = id_vacante;
        this.nombre_vacante = nombre_vacante;
        this.pruebas = pruebas;
    }

 

    public Integer getId_vacante() {
        return id_vacante;
    }

    public void setId_vacante(Integer id_vacante) {
        this.id_vacante = id_vacante;
    }

    public String getNombre_vacante() {
        return nombre_vacante;
    }

    public void setNombre_vacante(String nombre_vacante) {
        this.nombre_vacante = nombre_vacante;
    }

    public List<PruebasAdministradorDto> getPruebas() {
        return pruebas;
    }

    public void setPruebas(List<PruebasAdministradorDto> pruebas) {
        this.pruebas = pruebas;
    }
    
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("VacanteDto{id_vacante=").append(id_vacante);
        sb.append(", nombre_vacante=").append(nombre_vacante);
        sb.append('}');
        return sb.toString();
    }

}
