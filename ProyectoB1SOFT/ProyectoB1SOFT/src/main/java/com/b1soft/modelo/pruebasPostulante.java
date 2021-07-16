package com.b1soft.modelo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "Vacante_prueba")
public class pruebasPostulante implements Serializable{
    @Id
    @Column(name="id_vacante")
    private int id_vacante;
    @Id
    @Column(name="id_prueba")
    private int id_prueba;

    public pruebasPostulante() {
    }

    public int getId_vacante() {
        return id_vacante;
    }

    public void setId_vacante(int id_vacante) {
        this.id_vacante = id_vacante;
    }

    public int getId_prueba() {
        return id_prueba;
    }

    public void setId_prueba(int id_prueba) {
        this.id_prueba = id_prueba;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("pruebasPostulante{id_vacante=").append(id_vacante);
        sb.append(", id_prueba=").append(id_prueba);
        sb.append('}');
        return sb.toString();
    }
    
    
    
    
}
