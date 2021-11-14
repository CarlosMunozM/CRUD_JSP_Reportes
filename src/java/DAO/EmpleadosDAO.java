/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Clases.ConexionBD;
import Modelo.tbl_Empleados;
import Modelo.tbl_Empresa;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author BACK UP 7
 */
public class EmpleadosDAO {
    
     public List<tbl_Empleados> listarEmpleados(){
        
        List<tbl_Empleados> datos = new ArrayList<tbl_Empleados>();
         ConexionBD  cnn = new ConexionBD();
        try {
            Connection con = cnn.getConexion();
            CallableStatement callableStatement = con.prepareCall("{call listarEmpleados()}");
            ResultSet rs = callableStatement.executeQuery();
            tbl_Empleados empleados;
            while(rs.next()){
                empleados = new tbl_Empleados();
                empleados.setId_empleado(rs.getInt("id_empleado"));
                empleados.getEmpresa().setId_empresa(rs.getInt("id_empresa"));
                empleados.getEmpresa().setNombre(rs.getString("nombreEmpresa"));
                empleados.setNombres(rs.getString("nombres"));
                empleados.setApellidos(rs.getString("apellidos"));
                empleados.setCedula(rs.getString("cedula"));
                empleados.setSexo(rs.getString("sexo"));
                empleados.setCarga_familiar(rs.getInt("carga_familiar"));
                empleados.setTelefono(rs.getString("telefono"));
                empleados.setDireccion(rs.getString("direccion"));
                empleados.setNivel_estudios(rs.getString("nivel_estudios"));
                datos.add(empleados);
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
       return datos;
    }
    
    public boolean insertarEmpleado(tbl_Empleados empleado){
        ConexionBD  cnn = new ConexionBD();
        try {
            Connection con = cnn.getConexion();
            CallableStatement callableStatement = con.prepareCall("{call insertarEmpleado(?,?,?,?,?,?,?,?,?)}");
            callableStatement.setInt(1, empleado.getEmpresa().getId_empresa());
            callableStatement.setString(2, empleado.getNombres());
            callableStatement.setString(3, empleado.getApellidos());
            callableStatement.setString(4, empleado.getCedula());
            callableStatement.setString(5, empleado.getSexo());
            callableStatement.setInt(6, empleado.getCarga_familiar());
            callableStatement.setString(7, empleado.getTelefono());
            callableStatement.setString(8, empleado.getDireccion());
            callableStatement.setString(9, empleado.getNivel_estudios());
            callableStatement.executeUpdate();
            
            con.close();
            
            return true;
        } catch (Exception e) {
             System.out.println(e);
             return false;
        }
    } 
    
    public boolean modificarEmpleado(tbl_Empleados empleado){
        ConexionBD  cnn = new ConexionBD();
        try {
            Connection con = cnn.getConexion();
            CallableStatement callableStatement = con.prepareCall("{call modificarEmpleado(?,?,?,?,?,?,?,?,?,?)}");
            callableStatement.setInt(1, empleado.getId_empleado());
            callableStatement.setInt(2, empleado.getEmpresa().getId_empresa());
            callableStatement.setString(3, empleado.getNombres());
            callableStatement.setString(4, empleado.getApellidos());
            callableStatement.setString(5, empleado.getCedula());
            callableStatement.setString(6, empleado.getSexo());
            callableStatement.setInt(7, empleado.getCarga_familiar());
            callableStatement.setString(8, empleado.getTelefono());
            callableStatement.setString(9, empleado.getDireccion());
            callableStatement.setString(10, empleado.getNivel_estudios());
            callableStatement.executeUpdate();
            
            con.close();
            
            return true;
        } catch (Exception e) {
             System.out.println(e);
             return false;
        }
    }
    
    public boolean eliminarEmpleado(tbl_Empleados empleado){
        ConexionBD  cnn = new ConexionBD();
        try {
            Connection con = cnn.getConexion();
            CallableStatement callableStatement = con.prepareCall("{call eliminarEmpleado(?)}");
            callableStatement.setInt(1, empleado.getId_empleado());
            callableStatement.executeUpdate();
            
            con.close();
            
            return true;
        } catch (Exception e) {
             System.out.println(e);
             return false;
        }
    }
    
    public List<tbl_Empresa> listarEmpresasCombo(){
        
        List<tbl_Empresa> datos = new ArrayList<tbl_Empresa>();
        ConexionBD  cnn = new ConexionBD();
        try {
            Connection con = cnn.getConexion();
            CallableStatement callableStatement = con.prepareCall("{call listarEmpresas()}");
            ResultSet rs = callableStatement.executeQuery();
            tbl_Empresa empresa;
            while(rs.next()){
                empresa = new tbl_Empresa();
                empresa.setId_empresa(rs.getInt("id_empresa"));
                empresa.setNombre(rs.getString("nombre"));
                datos.add(empresa);
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
       return datos;
    }
}
