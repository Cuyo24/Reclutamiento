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
 * @author Yirz
 */
@Entity
@Table(name="Postulante_Prueba")
public class PostulantePrueba implements Serializable{
    @Id
    private String RFC;
    @Id
    private int idPrueba;
    private float calificacion;
    private String respuestas;

    public PostulantePrueba() {
    }

    public PostulantePrueba(String RFC, int idPrueba, float calificacion, String respuestas) {
        this.RFC = RFC;
        this.idPrueba = idPrueba;
        this.calificacion = calificacion;
        this.respuestas = respuestas;
    }

   

    public String getRFC() {
        return RFC;
    }

    public void setRFC(String RFC) {
        this.RFC = RFC;
    }

    public int getIdPrueba() {
        return idPrueba;
    }

    public void setIdPrueba(int idPrueba) {
        this.idPrueba = idPrueba;
    }

    public float getCalificacion() {
        return calificacion;
    }

    public void setCalificacion(float calificacion) {
        this.calificacion = calificacion;
    }

    public String getRespuestas() {
        return respuestas;
    }

    public void setRespuestas(String respuestas) {
        this.respuestas = respuestas;
    }
    
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("PostulantePrueba{RFC=").append(RFC);
        sb.append(", idPrueba=").append(idPrueba);
        sb.append(", calificacion=").append(calificacion);
        sb.append('}');
        return sb.toString();
    }
    
}
