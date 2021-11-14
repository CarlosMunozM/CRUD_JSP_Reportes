/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Carlos
 */
public class ConexionBD {
    private Connection con = null;
    private String bd = "ManobandaIngreso";
    private String usuario = "carlos";
    private String clave = "12345";
    
    public Connection getConexion(){
        
        try {
           
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName="+bd+";user="+usuario+";password="+clave);
            
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println(e);
        }
        return con;
    }
    
    public void cerrarConexion(){
        try {
            con.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
