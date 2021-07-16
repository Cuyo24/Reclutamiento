package com.b1soft.dto;

import com.b1soft.modelo.Postulante;
import java.util.ArrayList;
import java.util.List;

public class PostulanteDto {

    private String RFC;
    private String Nombre;
    private String ApellidoPaterno;
    private String ApellidoMaterno;
    private String Correo;
    private float Total;
    private List<ResultadosDto> resultados;
    //private int Edad;
    private Integer id_vacante;

    public PostulanteDto() {
    }

    public PostulanteDto(String RFC, String Nombre, String ApellidoPaterno, String ApellidoMaterno, String Correo, int id_vacante) {
        this.RFC = RFC;
        this.Nombre = Nombre;
        this.ApellidoPaterno = ApellidoPaterno;
        this.ApellidoMaterno = ApellidoMaterno;
        this.Correo = Correo;
        this.id_vacante = id_vacante;
    }

    public String getRFC() {
        return RFC;
    }

    public void setRFC(String RFC) {
        this.RFC = RFC;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getApellidoPaterno() {
        return ApellidoPaterno;
    }

    public void setApellidoPaterno(String ApellidoPaterno) {
        this.ApellidoPaterno = ApellidoPaterno;
    }

    public String getApellidoMaterno() {
        return ApellidoMaterno;
    }

    public void setApellidoMaterno(String ApellidoMaterno) {
        this.ApellidoMaterno = ApellidoMaterno;
    }

    public String getCorreo() {
        return Correo;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }


    public Integer getId_vacante() {
        return id_vacante;
    }

    public void setId_vacante(Integer id_vacante) {
        this.id_vacante = id_vacante;
    }

    public float getTotal() {
        return Total;
    }

    public void setTotal(float Total) {
        this.Total = Total;
    }

    public List<ResultadosDto> getResultados() {
        return resultados;
    }

    public void setResultados(List<ResultadosDto> resultados) {
        this.resultados = resultados;
    }
    
    
    
    
}


