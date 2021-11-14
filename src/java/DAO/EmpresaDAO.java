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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author BACK UP 7
 */
public class EmpresaDAO {
    
     public List<tbl_Empresa> listarEmpresas(){
        
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
                empresa.setRazon_social(rs.getString("razon_social"));
                empresa.setRuc(rs.getString("ruc"));
                empresa.setDireccion(rs.getString("direccion"));
                empresa.setTelefono(rs.getString("telefono"));
                datos.add(empresa);
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
       return datos;
    }
     
    public boolean insertarEmpresa(tbl_Empresa empresa){
        ConexionBD  cnn = new ConexionBD();
        try {
            Connection con = cnn.getConexion();
            CallableStatement callableStatement = con.prepareCall("{call insertarEmpresa(?,?,?,?,?)}");
            callableStatement.setString(1, empresa.getNombre());
            callableStatement.setString(2, empresa.getRazon_social());
            callableStatement.setString(3, empresa.getRuc());
            callableStatement.setString(4, empresa.getDireccion());
            callableStatement.setString(5, empresa.getTelefono());
            callableStatement.executeUpdate();
            
            con.close();
            
            return true;
        } catch (Exception e) {
             System.out.println(e);
             return false;
        }
    }
    
    public boolean modificarEmpresa(tbl_Empresa empresa){
        ConexionBD  cnn = new ConexionBD();
        try {
            Connection con = cnn.getConexion();
            CallableStatement callableStatement = con.prepareCall("{call modificarEmpresa(?,?,?,?,?,?)}");
            callableStatement.setInt(1, empresa.getId_empresa());
            callableStatement.setString(2, empresa.getNombre());
            callableStatement.setString(3, empresa.getRazon_social());
            callableStatement.setString(4, empresa.getRuc());
            callableStatement.setString(5, empresa.getDireccion());
            callableStatement.setString(6, empresa.getTelefono());
            callableStatement.executeUpdate();
            
            con.close();
            
            return true;
        } catch (Exception e) {
             System.out.println(e);
             return false;
        }
    } 
    
    public boolean eliminarEmpresa(tbl_Empresa empresa){
        ConexionBD  cnn = new ConexionBD();
        try {
            Connection con = cnn.getConexion();
            CallableStatement callableStatement = con.prepareCall("{call eliminarEmpresa(?)}");
            callableStatement.setInt(1, empresa.getId_empresa());
            callableStatement.executeUpdate();
            
            con.close();
            
            return true;
        } catch (Exception e) {
             System.out.println(e);
             return false;
        }
    } 
}
