/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.modelo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.io.Serializable;
import javax.persistence.CascadeType;
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
@Table(name = "PreguntasAdministrador")
@TableGenerator(name = "id_preguntas_table_generator")
public class PreguntasAdministrador implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id_pregunta", nullable = false)
    private Long Id_pregunta;
    @Column(name = "Numero_pregunta", nullable = false)
    private Long Numero_pregunta;
    @Column(name = "Instrucciones_pregunta", length = 255, nullable = false)
    private String Instrucciones_pregunta;
    @Column(name = "Imagen_pregunta", nullable = false)
    private String Imagen_pregunta;
    @Column(name = "Tiempo", nullable = false)
    private Integer Tiempo;
    @JsonIgnore
    @ManyToOne(optional = true,cascade=CascadeType.ALL)
    private RespuestasAdministrador respuestacorrecta;
    @JsonIgnore
    @ManyToOne(optional = false)
    private PruebasAdministrador prueba;
    private Character deleted;

    public PreguntasAdministrador() {}

    public PreguntasAdministrador(final Long Id_pregunta) {
	this.Id_pregunta = Id_pregunta;
    }

    public Long getId_pregunta() {
	return Id_pregunta;
    }
    public void setId_pregunta(Long Id_pregunta) {
        this.Id_pregunta = Id_pregunta;
    }

    public Long getNumero_pregunta() {
        return Numero_pregunta;
    }
    public void setNumero_pregunta(final Long Numero_pregunta) {
        this.Numero_pregunta = Numero_pregunta;
    }
    
    public String getInstrucciones_pregunta() {
        return Instrucciones_pregunta;
    }
    public void setInstrucciones_pregunta(final String Instrucciones_pregunta) {
        this.Instrucciones_pregunta = Instrucciones_pregunta;
    }

    public String getImagen_pregunta() {
        return Imagen_pregunta;
    }
    public void setImagen_pregunta(final String Imagen_pregunta) {
        this.Imagen_pregunta = Imagen_pregunta;
    }

    @Column(name = "deleted", nullable = false)
    public Character getDeleted() {
        return deleted;
    }
    public void setDeleted(final Character deleted) {
	this.deleted = deleted;
    }
    
    public RespuestasAdministrador getRespuestacorrecta() {
        return respuestacorrecta;
    }
    public void setRespuestacorrecta(final RespuestasAdministrador respuestacorrecta) {
        this.respuestacorrecta = respuestacorrecta;
    }
    
    public PruebasAdministrador getPrueba() {
        return prueba;
    }
    public void setPrueba(final PruebasAdministrador prueba) {
        this.prueba = prueba;
    }

    public Integer getTiempo() {
        return Tiempo;
    }

    public void setTiempo(Integer Tiempo) {
        this.Tiempo = Tiempo;
    }
    

}