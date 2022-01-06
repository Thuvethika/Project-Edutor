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

/**
 *
 * @author user
 */
@WebServlet(name = "admin2_adrequestservlet", urlPatterns = {"/admin2_adrequestservlet"})
public class admin2_adrequestservlet extends HttpServlet {

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
                     int customid=Integer.parseInt(request.getParameter("customid"));
            out.println(customid);
            String decision=request.getParameter("decision");
            if("delete".equals(decision))
            {
                try {
                  
                    Class.forName("com.mysql.jdbc.Driver");  
                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor","root","");
                    String sql="DELETE FROM customadvertisement WHERE Customad_id="+customid+"";
                    PreparedStatement pstmt=conn.prepareStatement(sql);
                    pstmt.execute();
                    
                out.println("<script type=\"text/javascript\">");
                out.println("alert('adevertise deleted...');");
                out.println("location='view/Admin/Admin_adrequest2.jsp';");
                out.println("</script>");
                } 
                catch (Exception e) {
                    out.println(e);
                }
  
            }
            else if("approve".equals(decision))
            {
        
                Class.forName("com.mysql.jdbc.Driver");  
                Connection conn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor","root","");
                String sql1="SELECT  uploadimage, imgname,fees,amount, email, classid FROM customadvertisement WHERE Customad_id="+customid+" ";
                PreparedStatement pstmt1=conn1.prepareStatement(sql1);                
                    ResultSet rs1= pstmt1.executeQuery();                       
                     if(rs1.next())
                     {
                         String email=rs1.getString("email");
                         String imgname=rs1.getString("imgname");
                         String fees=rs1.getString("fees");
                         String amount=rs1.getString("amount");
                         String classid=rs1.getString("classid");
                         int classid1=Integer.parseInt(classid);
                        
                        Class.forName("com.mysql.jdbc.Driver");  
                        Connection conn2=DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor","root","");
                         String sql2="INSERT INTO publishadvertisments(imgname,fees,amount, email, classid) VALUES (?,?,?,?,?)";
                         PreparedStatement pstmt2=conn2.prepareStatement(sql2);
                            
                            pstmt2.setString(1,imgname);
                            pstmt2.setString(2,fees);
                            pstmt2.setString(3,amount);
                            pstmt2.setString(4, email);
                            pstmt2.setInt(5, classid1);
                            int a =pstmt2.executeUpdate();
                             
                             if(a>0)
                             {
                                    Class.forName("com.mysql.jdbc.Driver");  
                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor","root","");
                                    String sql="DELETE FROM customadvertisement WHERE Customad_id="+customid+"";
                                    PreparedStatement pstmt=conn.prepareStatement(sql);
                                    pstmt.execute(); 
                                        out.println("<script type=\"text/javascript\">");
                                        out.println("alert('advertisment advertised sucessfully...');");
                                        out.println("location='view/Admin/Admin_adrequest2.jsp';");
                                        out.println("</script>");
                             }
                  
                     }
            }
            
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(admin2_adrequestservlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(admin2_adrequestservlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
