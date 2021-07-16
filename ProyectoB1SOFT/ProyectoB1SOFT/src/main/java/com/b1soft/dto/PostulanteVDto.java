package com.b1soft.dto;

import com.b1soft.modelo.Postulante;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Yirz
 */
public class PostulanteVDto {
    private Postulante entidad;
    private StringBuilder pdf;
    private StringBuilder video;
    private StringBuilder Imagen;

    public PostulanteVDto() {
        entidad=new Postulante();
    }

    public Postulante getEntidad() {
        return entidad;
    }

    public StringBuilder getImagen() {
        return Imagen;
    }

    public void setImagen(StringBuilder Imagen) {
        this.Imagen = Imagen;
    }

    public void setEntidad(Postulante entidad) {
        this.entidad = entidad;
    }

    public StringBuilder getPdf() {
        return pdf;
    }

    public void setPdf(StringBuilder pdf) {
        this.pdf = pdf;
    }

    public StringBuilder getVideo() {
        return video;
    }

    public void setVideo(StringBuilder video) {
        this.video = video;
    }
    
}
