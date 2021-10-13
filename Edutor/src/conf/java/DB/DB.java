/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author thuve
 */
public class DB {
     private static Connection con;

    private static synchronized Connection getConnection() {

        if (con == null) {

            try {

                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor", "root", "");
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);

            }
        }
        return con;
    }

    public static void iud(String query) throws SQLException {
        getConnection();
        getConnection().createStatement().executeUpdate(query);

    }
}
