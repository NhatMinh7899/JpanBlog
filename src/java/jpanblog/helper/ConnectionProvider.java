/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jpanblog.helper;

import java.sql.*;

/**
 *
 * @author Admin
 */
public class ConnectionProvider {
    private static Connection con;
    
    public static Connection getConnection(){
        try {
            if(con == null){
                //load drive
                Class.forName("com.mysql.jdbc.Driver");
                
                //create a connection..
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jpanblog","root", "7899");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
