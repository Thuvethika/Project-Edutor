/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.DaoImpl;

import DB.DB;
import java.sql.*;
import Model.Dao.DeleteUserDao;
import Model.DeleteUser;
//import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author thuve
 */
public class DeleteUserDaoImpl implements DeleteUserDao {

    @Override
    public String Deleteuser(DeleteUser deleteuser) throws SQLException {
      
      //  DB.search("SELECT email FROM tutor where email='" + deleteuser.getEmail() + "'");
     
        
        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor", "root", "");
            String sql1 = "SELECT email FROM tutor where email='" + deleteuser.getEmail() + "'";
            PreparedStatement pstmt1 = conn1.prepareStatement(sql1);
            ResultSet rs1 = pstmt1.executeQuery();
            if (rs1.next()) {
                DB.iud("DELETE from tutor WHERE email = '" + deleteuser.getEmail() + "'");
                return "tutor";

            } else {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor", "root", "");
                    String sql2 = "SELECT email FROM learner where email='" + deleteuser.getEmail() + "'";
                    PreparedStatement pstmt2 = conn2.prepareStatement(sql2);
                    ResultSet rs2 = pstmt2.executeQuery();
                    if (rs2.next()) {
                        
                        DB.iud("DELETE from learner WHERE email = '" + deleteuser.getEmail() + "'");
                        return "learner";

                    }
                } catch (ClassNotFoundException | SQLException e) {
                }
            }

        } catch (ClassNotFoundException | SQLException e) {
        }
        return "fail"; 
       
    }

}
