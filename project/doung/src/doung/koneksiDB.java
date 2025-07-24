/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package doung;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author BimaCos
 */
public class koneksiDB {
    
    private static Connection cn;
    
    public static Connection getKoneksi() { 
       if (cn == null){
            try{
                DriverManager.registerDriver(new com.mysql.jdbc.Driver());
                cn = DriverManager.getConnection("jdbc:mysql://localhost/db_doung","root","");
                
                
                
            }catch (Exception e) {
                e.printStackTrace();
            }
            
            }
                return cn;
    
            
                }
    
}
