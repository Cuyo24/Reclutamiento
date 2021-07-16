/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.dto;

/**
 *
 * @author DELL
 */
public class RespuestasAdministradorDto {
    public Long Id_respuesta;
    public String Texto;
    public String Imagen_respuesta;
    public Long pregunta_Id_pregunta;
    
    public RespuestasAdministradorDto() {}
    
    public RespuestasAdministradorDto(Long Id_respuesta, String Texto, String Imagen_respuesta, Long pregunta_Id_pregunta) {
        this.Id_respuesta = Id_respuesta;
        this.Texto = Texto;
        this.Imagen_respuesta = Imagen_respuesta;
        this.pregunta_Id_pregunta = pregunta_Id_pregunta;
    }

}
