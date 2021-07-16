/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.dto;

import java.util.List;

/**
 *
 * @author DELL
 */
public class PruebasAdministradorDto {
    public Long Id_prueba;
    public String Nombre_prueba;
    public String Instrucciones_prueba;
    public Boolean autocalif;
    public List<PreguntasAdministradorDto> PREGUNTAS;
    
    public PruebasAdministradorDto() {}
    
    public PruebasAdministradorDto(Long Id_prueba, String Nombre_prueba, String Instrucciones_prueba,Boolean autocalif,List<PreguntasAdministradorDto> PREGUNTAS) {
        this.Id_prueba = Id_prueba;
        this.Nombre_prueba = Nombre_prueba;
        this.Instrucciones_prueba = Instrucciones_prueba;
        this.autocalif=autocalif;
        this.PREGUNTAS = PREGUNTAS;
    }
}
