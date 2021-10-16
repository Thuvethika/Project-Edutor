/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Dao;

import static java.lang.System.out;
import java.sql.*;
import Model.login;

/**
 *
 * @author user
 */
public class logindao {
    
    
   
    int result=0;
    
    public String registerlogin (login login) throws ClassNotFoundException
    {                    
          try {
              
              Class.forName("com.mysql.jdbc.Driver");    
              Connection conn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor","root","");
              String sql1="SELECT email,password FROM tutor where email='"+login.getEmail()+"' and password='"+login.getPassword()+"'";            
              PreparedStatement pstmt1=conn1.prepareStatement(sql1);                
              ResultSet rs1= pstmt1.executeQuery();                       
                if(rs1.next())
            {
                return"tutor";
                
            } 
                else
                {
                   try {
              Class.forName("com.mysql.jdbc.Driver");    
              Connection conn2=DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor","root","");
              String sql2="SELECT email,password FROM learner where email='"+login.getEmail()+"' and password='"+login.getPassword()+"'";            
              PreparedStatement pstmt2=conn2.prepareStatement(sql2);                
              ResultSet rs2= pstmt2.executeQuery();                       
                if(rs2.next())
            {
                return"learner";
            } 
                else
                {
                    try {
                        
                        Class.forName("com.mysql.jdbc.Driver");    
                        Connection conn3=DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor","root","");
                        String sql3="SELECT email,password FROM admin where email='"+login.getEmail()+"' and password='"+login.getPassword()+"'";            
                        PreparedStatement pstmt3=conn3.prepareStatement(sql3);                
                        ResultSet rs3= pstmt3.executeQuery();                       
                if(rs3.next())
            {
                return"admin";
            } 
                        
                    } catch (Exception e) {
                    }
                }
                        
                }
                   catch (Exception e)
                    {
                        
                           e.printStackTrace();
                    }
                }
        } catch (Exception e)
        {
            
            e.printStackTrace();
            
        }
          
           return"fail";   
    }
    
    
}
