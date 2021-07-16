/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.modelo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.TableGenerator;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.ManyToOne;
/**
 *
 * @author DELL
 */
@Entity
@Table(name = "RespuestasAdministrador")
@TableGenerator(name = "id_respuestas_table_generator")
public class RespuestasAdministrador implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id_respuesta", nullable = false)
    private Long Id_respuesta;
    @Column(name = "Texto", length = 255, nullable = false)
    private String Texto;
    @Column(name = "Imagen_respuesta", nullable = false)
    private String Imagen_respuesta;
    @JsonIgnore
    @ManyToOne(optional = false)
    private PreguntasAdministrador pregunta;
    @Column(name = "deleted", nullable = false)
    private Character deleted;

    public RespuestasAdministrador() {}

    public RespuestasAdministrador(final Long Id_respuesta) {
	this.Id_respuesta = Id_respuesta;
    }

    public Long getId_respuesta() {
	return Id_respuesta;
    }
    public void setId_respuesta(Long Id_respuesta) {
        this.Id_respuesta = Id_respuesta;
    }

    public String getTexto() {
	return Texto;
    }
    public void setTexto(final String Texto) {
	this.Texto = Texto;
    }

    public String getImagen_respuesta() {
	return Imagen_respuesta;
    }
    public void setImagen_respuesta(final String Imagen_respuesta) {
	this.Imagen_respuesta = Imagen_respuesta;
    }

    public Character getDeleted() {
	return deleted;
    }
    public void setDeleted(final Character deleted) {
	this.deleted = deleted;
    }

    public PreguntasAdministrador getPregunta() {
	return pregunta;
    }
    public void setPregunta(final PreguntasAdministrador pregunta) {
        this.pregunta = pregunta;
    }

}