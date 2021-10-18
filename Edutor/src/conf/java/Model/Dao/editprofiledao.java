/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Dao;

import Model.Tutor;
import Model.editprofile;
import com.mysql.cj.protocol.Resultset;
//import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import java.sql.*;


/**
 *
 * @author user
 */
public class editprofiledao {
       int result=0;
       
    public String deleteprofile(editprofile editprofile) throws ClassNotFoundException
            {
                try {
                    Class.forName("com.mysql.jdbc.Driver");  
                    Connection conn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor","root","");
                    String sql1="SELECT email FROM learner where email='"+editprofile.getEmail()+"'";            
                    PreparedStatement pstmt1=conn1.prepareStatement(sql1);                
                    ResultSet rs1= pstmt1.executeQuery();                       
                     if(rs1.next())
                {
                    Class.forName("com.mysql.jdbc.Driver");  
                    Connection conn2=DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor","root","");
                    String sql2="DELETE FROM learner WHERE email='"+editprofile.getEmail()+"'";
                    PreparedStatement pstmt2=conn2.prepareStatement(sql2);
                    pstmt2.execute();
                
                 }     
                     else
                     {
                         try {
                             
                                Class.forName("com.mysql.jdbc.Driver");  
                                Connection conn3=DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor","root","");
                                String sql3="SELECT email FROM tutor where email='"+editprofile.getEmail()+"'";            
                                PreparedStatement pstmt3=conn3.prepareStatement(sql3);                
                                ResultSet rs3= pstmt3.executeQuery();                       
                     if(rs3.next())
                {
                    Class.forName("com.mysql.jdbc.Driver");  
                    Connection conn4=DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor","root","");
                    String sql4="DELETE FROM tutor WHERE email='"+editprofile.getEmail()+"'";
                    PreparedStatement pstmt4=conn4.prepareStatement(sql4);
                    pstmt4.execute();
                
                 } 
                             
                             
                             
                         } catch (Exception e) {
                         }
                     }

                } catch (Exception e) {
                }
      
               return "fail"; 
            }
     
  /*  public String updateprofile(editprofile editprofile) throws ClassNotFoundException
    {
        try {
            Class.forName("com.mysql.jdbc.Driver");
                     String sql="SELECT firstname, lastname, address, gender, dob, phoneno, degreename, qualification FROM tutor WHERE email='"+editprofile.getEmail()+"' ";
            PreparedStatement pstmt=conn.prepareStatement(sql);
            ResultSet rs=pstmt.executeQuery();
            
            if(rs.next())
            {
                Tutor tutor1=new Tutor();
                tutor1.setFirstname(rs.getString("firstname"));
                tutor1.setLastname(rs.getString("lastname"));
                tutor1.setAddress(rs.getString("address"));
                tutor1.setGender(rs.getString("gender"));
                tutor1.setDob(rs.getString("dob"));
                tutor1.setPhoneno(rs.getInt("phoneno"));
                tutor1.setDegreename(rs.getString("degreename"));
                tutor1.setQualification(rs.getString("qualification"));  Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor","root","");
            String sql="SELECT firstname, lastname, address, gender, dob, phoneno, degreename, qualification FROM tutor WHERE email='"+editprofile.getEmail()+"' ";
            PreparedStatement pstmt=conn.prepareStatement(sql);
            ResultSet rs=pstmt.executeQuery();
            
            if(rs.next())
            {
                Tutor tutor1=new Tutor();
                tutor1.setFirstname(rs.getString("firstname"));
                tutor1.setLastname(rs.getString("lastname"));
                tutor1.setAddress(rs.getString("address"));
                tutor1.setGender(rs.getString("gender"));
                tutor1.setDob(rs.getString("dob"));
                tutor1.setPhoneno(rs.getInt("phoneno"));
                tutor1.setDegreename(rs.getString("degreename"));
                tutor1.setQualification(rs.getString("qualification"));    
            }
        } catch (Exception e) {
        }
        
        
           return null;
        
    }*/
    
     public String update(editprofile editprofile,Tutor T2) throws ClassNotFoundException
     {
         try {
             
                Class.forName("com.mysql.jdbc.Driver");  
                Connection conn3=DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor","root","");
                String sql3="SELECT email FROM tutor where email='"+editprofile.getEmail()+"'";            
                PreparedStatement pstmt3=conn3.prepareStatement(sql3);                
                ResultSet rs3= pstmt3.executeQuery(); 
                
                if(rs3.next())
                {
                     Class.forName("com.mysql.jdbc.Driver");
                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor","root","");
                    String sql="UPDATE tutor SET firstname='"+T2.getFirstname()+"',lastname='"+T2.getLastname()+"',address='"+T2.getAddress()+"',gender='"+T2.getGender()+"',dob='"+T2.getDob()+"',phoneno='"+T2.getPhoneno()+"' WHERE email='"+editprofile.getEmail()+"'";
                    PreparedStatement pstmt=conn.prepareStatement(sql);
                    pstmt.executeUpdate();
            
                }
                else
                    try {
                        
                    Class.forName("com.mysql.jdbc.Driver");  
                    Connection conn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor","root","");
                    String sql1="SELECT email FROM learner where email='"+editprofile.getEmail()+"'";            
                    PreparedStatement pstmt1=conn1.prepareStatement(sql1);                
                    ResultSet rs1= pstmt1.executeQuery();  
                    
                     if(rs1.next())
                     {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor","root","");
                        String sql="UPDATE learner SET firstname='"+T2.getFirstname()+"',lastname='"+T2.getLastname()+"',address='"+T2.getAddress()+"',gender='"+T2.getGender()+"',dob='"+T2.getDob()+"',phoneno='"+T2.getPhoneno()+"' WHERE email='"+editprofile.getEmail()+"'";
                        PreparedStatement pstmt=conn.prepareStatement(sql);
                        pstmt.executeUpdate();                         
                     }
                        
                        
                    } catch (Exception e) {
                    }

         } catch (Exception e) {
             System.out.println(e);
         }
         
           return null;
         
     }
    
}
