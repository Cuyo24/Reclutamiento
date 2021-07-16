/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.modelo.formModel;

import org.springframework.web.multipart.MultipartFile;



/**
 *
 * @author Yirz
 */
public class Registro {
    private int id_vacante;
    private String RFC;
    private String Nombre;
    private String ApPaterno;
    private String ApMaterno;
    private String Correo;
    private String Edad;
    private String nss;
    private String CurP;
    private String tel;
    private String cp;
    private String estado;
    private String municipio;
    private String colonia;
    private String contrasena;
    private String Institu;
    private String grado;
    private MultipartFile archivos_pdf;
    private MultipartFile videos;
    private MultipartFile imagenes;

    public Registro() {
    }

   

   

    public int getId_vacante() {
        return id_vacante;
    }

    public void setId_vacante(int id_vacante) {
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

    public String getApPaterno() {
        return ApPaterno;
    }

    public void setApPaterno(String ApPaterno) {
        this.ApPaterno = ApPaterno;
    }

    public String getApMaterno() {
        return ApMaterno;
    }

    public void setApMaterno(String ApMaterno) {
        this.ApMaterno = ApMaterno;
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

    public String getNss() {
        return nss;
    }

    public void setNss(String nss) {
        this.nss = nss;
    }

    public String getCurP() {
        return CurP;
    }

    public void setCurP(String CurP) {
        this.CurP = CurP;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getCp() {
        return cp;
    }

    public void setCp(String cp) {
        this.cp = cp;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getMunicipio() {
        return municipio;
    }

    public void setMunicipio(String municipio) {
        this.municipio = municipio;
    }

    public String getColonia() {
        return colonia;
    }

    public void setColonia(String colonia) {
        this.colonia = colonia;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getInstitu() {
        return Institu;
    }

    public void setInstitu(String Institu) {
        this.Institu = Institu;
    }

    public String getGrado() {
        return grado;
    }

    public void setGrado(String grado) {
        this.grado = grado;
    }

    public MultipartFile getArchivos_pdf() {
        return archivos_pdf;
    }

    public void setArchivos_pdf(MultipartFile archivos_pdf) {
        this.archivos_pdf = archivos_pdf;
    }

    public MultipartFile getVideos() {
        return videos;
    }

    public void setVideos(MultipartFile videos) {
        this.videos = videos;
    }
    public MultipartFile getImagenes() {
        return imagenes;
    }

    public void setImagenes(MultipartFile imagenes) {
        this.imagenes = imagenes;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Registro{id_vacante=").append(id_vacante);
        sb.append(", RFC=").append(RFC);
        sb.append(", Nombre=").append(Nombre);
        sb.append(", ApPaterno=").append(ApPaterno);
        sb.append(", ApMaterno=").append(ApMaterno);
        sb.append(", Correo=").append(Correo);
        sb.append(", Edad=").append(Edad);
        sb.append(", nss=").append(nss);
        sb.append(", CurP=").append(CurP);
        sb.append(", tel=").append(tel);
        sb.append(", cp=").append(cp);
        sb.append(", estado=").append(estado);
        sb.append(", municipio=").append(municipio);
        sb.append(", colonia=").append(colonia);
        sb.append(", contrasena=").append(contrasena);
        sb.append(", Institu=").append(Institu);
        sb.append(", grado=").append(grado);
        sb.append(", archivos_pdf=").append(archivos_pdf);
        sb.append(", videos=").append(videos);
        sb.append(", imagenes=").append(imagenes);
        sb.append('}');
        return sb.toString();
    }
    
    
  
    
}
