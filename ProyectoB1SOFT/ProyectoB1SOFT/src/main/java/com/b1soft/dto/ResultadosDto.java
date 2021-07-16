/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.dto;

/**
 *
 * @author Yirz
 */
public class ResultadosDto {
    private Integer idPrueba;
    private String Prueba;
    private Boolean autocalif;
    private float calif;
    private String respuestas;

    public ResultadosDto() {
    }

    public ResultadosDto(String Prueba, float calif) {
        this.Prueba = Prueba;
        this.calif = calif;
    }

    public ResultadosDto(String Prueba, float calif, String respuestas) {
        this.Prueba = Prueba;
        this.calif = calif;
        this.respuestas = respuestas;
    }
    
    
    public String getPrueba() {
        return Prueba;
    }

    public void setPrueba(String Prueba) {
        this.Prueba = Prueba;
    }

    public float getCalif() {
        return calif;
    }

    public void setCalif(float calif) {
        this.calif = calif;
    }

    public String getRespuestas() {
        return respuestas;
    }

    public void setRespuestas(String respuestas) {
        this.respuestas = respuestas;
    }

    public Boolean getAutocalif() {
        return autocalif;
    }

    public void setAutocalif(Boolean autocalif) {
        this.autocalif = autocalif;
    }

    public Integer getIdPrueba() {
        return idPrueba;
    }

    public void setIdPrueba(Integer idPrueba) {
        this.idPrueba = idPrueba;
    }
    
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("ResultadosDto{Prueba=").append(Prueba);
        sb.append(", calif=").append(calif);
        sb.append('}');
        return sb.toString();
    }
    
}
