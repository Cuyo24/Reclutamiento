package com.b1soft.dto;

import com.b1soft.modelo.pruebasPostulante;

public class pruebasPostulanteDto {
   private pruebasPostulante entidad;

    public pruebasPostulanteDto() {
        entidad = new pruebasPostulante();
    }

    public pruebasPostulante getEntidad() {
        return entidad;
    }

    public void setEntidad(pruebasPostulante entidad) {
        this.entidad = entidad;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("pruebasPostulanteDto{entidad=").append(entidad);
        sb.append('}');
        return sb.toString();
    }

      
    
   
   
}
