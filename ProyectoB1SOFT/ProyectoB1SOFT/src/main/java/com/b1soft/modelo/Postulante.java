package com.b1soft.modelo;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "Postulante")
public class Postulante implements Serializable {

    @Id
    private String RFC;
    private String Nombre;
    private String ApellidoPaterno;
    private String ApellidoMaterno;
    private String Correo;
    private String Edad;
    private String SeguroSocial;
    private String CURP;
    private String CP;
    private String TELEFONO;
    private String Estado;
    private String Municipio;
    private String Colonia;
    private String Password;
    private String Escolaridad;
    private String Institucion;
    private String Grado;
    private String CV;
    private String Video;
    private String Imagen;
    private Integer id_vacante;
    @Transient
    private String Vacante;
    public Postulante() {
    }

    public Postulante(String RFC, String Nombre, String ApellidoPaterno, String ApellidoMaterno, String Correo, String Edad, String SeguroSocial, String CURP, String CP, String TELEFONO, String Estado, String Municipio, String Colonia, String Password, String Escolaridad, String Institucion,String Grado, String CV,String Video,String Imagen, int id_vacante) {
        this.RFC = RFC;
        this.Nombre = Nombre;
        this.ApellidoPaterno = ApellidoPaterno;
        this.ApellidoMaterno = ApellidoMaterno;
        this.Correo = Correo;
        this.Edad = Edad;
        this.SeguroSocial = SeguroSocial;
        this.CURP = CURP;
        this.CP = CP;
        this.TELEFONO = TELEFONO;
        this.Estado = Estado;
        this.Municipio = Municipio;
        this.Colonia = Colonia;
        this.Password = Password;
        this.Escolaridad = Escolaridad;
        this.Institucion = Institucion;
        this.Grado=Grado;
        this.CV = CV;
        this.Video = Video;
        this.Imagen = Imagen;
        this.id_vacante = id_vacante;
    }
    
    public String getVacante() {
        return Vacante;
    }
    public void setVacante(String Vacante) {
        this.Vacante=Vacante;
    }
    public String getGrado() {
        return Grado;
    }

    public void setGrado(String Grado) {
        this.Grado = Grado;
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

    public String getEdad() {
        return Edad;
    }

    public void setEdad(String Edad) {
        this.Edad = Edad;
    }

    public String getSeguroSocial() {
        return SeguroSocial;
    }

    public void setSeguroSocial(String SeguroSocial) {
        this.SeguroSocial = SeguroSocial;
    }

    public String getCURP() {
        return CURP;
    }

    public void setCURP(String CURP) {
        this.CURP = CURP;
    }

    public String getCP() {
        return CP;
    }

    public void setCP(String CP) {
        this.CP = CP;
    }

    public String getTELEFONO() {
        return TELEFONO;
    }

    public void setTELEFONO(String TELEFONO) {
        this.TELEFONO = TELEFONO;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    public String getMunicipio() {
        return Municipio;
    }

    public void setMunicipio(String Municipio) {
        this.Municipio = Municipio;
    }

    public String getColonia() {
        return Colonia;
    }

    public void setColonia(String Colonia) {
        this.Colonia = Colonia;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getEscolaridad() {
        return Escolaridad;
    }

    public void setEscolaridad(String Escolaridad) {
        this.Escolaridad = Escolaridad;
    }

    public String getInstitucion() {
        return Institucion;
    }

    public void setInstitucion(String Institucion) {
        this.Institucion = Institucion;
    }

    public String getCV() {
        return CV;
    }

    public void setCV(String CV) {
        this.CV = CV;
    }

    public String getVideo() {
        return Video;
    }

    public void setVideo(String Video) {
        this.Video = Video;
    }

    public int getId_vacante() {
        return id_vacante;
    }

    public void setId_vacante(int id_vacante) {
        this.id_vacante = id_vacante;
    }
    public String getImagen() {
        return Imagen;
    }
    public void setImagen(String Imagen) {
        this.Imagen=Imagen;
    }

    
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Postulante{RFC=").append(RFC);
        sb.append(", Nombre=").append(Nombre);
        sb.append(", ApellidoPaterno=").append(ApellidoPaterno);
        sb.append(", ApellidoMaterno=").append(ApellidoMaterno);
        sb.append(", Correo=").append(Correo);
        sb.append(", Edad=").append(Edad);
        sb.append(", SeguroSocial=").append(SeguroSocial);
        sb.append(", CURP=").append(CURP);
        sb.append(", CP=").append(CP);
        sb.append(", TELEFONO=").append(TELEFONO);
        sb.append(", Estado=").append(Estado);
        sb.append(", Municipio=").append(Municipio);
        sb.append(", Colonia=").append(Colonia);
        sb.append(", Password=").append(Password);
        sb.append(", Escolaridad=").append(Escolaridad);
        sb.append(", Institucion=").append(Institucion);
        sb.append(", CV=").append(CV);
        sb.append(", Video=").append(Video);
        sb.append(", Imagen=").append(Imagen);
        sb.append(", id_vacante=").append(id_vacante);
        sb.append('}');
        return sb.toString();
    }

    /*public void setVacante(String nombre_vacante) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }*/
    
}


