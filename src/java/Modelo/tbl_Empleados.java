/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author BACK UP 7
 */
public class tbl_Empleados {
    
    tbl_Empresa empresa = new tbl_Empresa();
    private int id_empleado;
    private String nombres;
    private String apellidos;
    private String cedula;
    private String sexo;
    private int carga_familiar;
    private String telefono;
    private String direccion;
    private String nivel_estudios;

    public tbl_Empresa getEmpresa() {
        return empresa;
    }

    public void setEmpresa(tbl_Empresa empresa) {
        this.empresa = empresa;
    }

    public int getId_empleado() {
        return id_empleado;
    }

    public void setId_empleado(int id_empleado) {
        this.id_empleado = id_empleado;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public int getCarga_familiar() {
        return carga_familiar;
    }

    public void setCarga_familiar(int carga_familiar) {
        this.carga_familiar = carga_familiar;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getNivel_estudios() {
        return nivel_estudios;
    }

    public void setNivel_estudios(String nivel_estudios) {
        this.nivel_estudios = nivel_estudios;
    }
    
}
