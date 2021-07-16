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
public class PreguntasAdministradorDto {
    public Long Id_pregunta;
    public String Instrucciones_pregunta;
    public Long Numero_pregunta;
    public String Imagen_pregunta;
    public Integer Tiempo;
    public Long Id_respuesta_correcta;
    public List<RespuestasAdministradorDto> RESPUESTAS;
    
    public PreguntasAdministradorDto() {}
    
    public PreguntasAdministradorDto(Long Id_pregunta, String Instrucciones_pregunta, Long Numero_pregunta, String Imagen_pregunta,Integer Tiempo ,Long Id_respuesta_correcta, List<RespuestasAdministradorDto> RESPUESTAS) {
        this.Id_pregunta = Id_pregunta;
        this.Instrucciones_pregunta = Instrucciones_pregunta;
        this.Numero_pregunta = Numero_pregunta;
        this.Imagen_pregunta = Imagen_pregunta;
        this.Tiempo=Tiempo;
        this.Id_respuesta_correcta = Id_respuesta_correcta;
        this.RESPUESTAS = RESPUESTAS;
    }
}
