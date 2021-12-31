/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.DaoImpl;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
@WebServlet(name = "newpasswordservlet", urlPatterns = {"/newpasswordservlet"})
public class newpasswordservlet extends HttpServlet {

    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String password=request.getParameter("password");
            String confirmpassword=request.getParameter("confirmpassword");
            
            HttpSession session1=request.getSession(false);  
            String forgotemail=(String)session1.getAttribute("forgotemail"); 
            out.println("thinesh");
         
            if(password.equals(confirmpassword))
            {
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor","root","");           
                String sql="SELECT email FROM tutor where email='"+forgotemail+"'";            
                PreparedStatement pstmt=conn.prepareStatement(sql);                
                ResultSet rs= pstmt.executeQuery(); 
                
                if(rs.next())
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn2= DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor","root","");
                    String sql2="UPDATE tutor SET password='"+password+"'";
                    PreparedStatement pstmt2=conn2.prepareStatement(sql2);
                    pstmt2.executeUpdate();
                     
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Succesfully updated your new password...');");
                    out.println("location='view/login.jsp';");
                    out.println("</script>");
                }
                else
                {
                    Class.forName("com.mysql.jdbc.Driver");  
                    Connection conn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor","root","");
                    String sql1="SELECT email FROM learner where email='"+forgotemail+"'";            
                    PreparedStatement pstmt1=conn1.prepareStatement(sql1);                
                    ResultSet rs1= pstmt1.executeQuery(); 
                
                if(rs1.next())
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn3= DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor","root","");
                    String sql3="UPDATE learner SET password='"+password+"'";
                    PreparedStatement pstmt3=conn3.prepareStatement(sql3);
                    pstmt3.executeUpdate();
                     
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Succesfully updated your new password...');");
                    out.println("location='view/login.jsp';");
                    out.println("</script>");
                }
                }
                
            }
            else 
            {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('password and newpassword are not same');");
                out.println("location='view/Reset/newpassword.jsp';");
                out.println("</script>");
                
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(newpasswordservlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(newpasswordservlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
