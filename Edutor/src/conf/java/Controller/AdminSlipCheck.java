/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

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
 * @author thuve
 */
@WebServlet(name = "AdminSlipCheck", urlPatterns = {"/AdminSlipCheck"})
public class AdminSlipCheck extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try {
           // String email=request.getParameter("email");
           // out.println(email);
             int paymentid=Integer.parseInt(request.getParameter("paymentid"));
            out.println(paymentid);
            String decide=request.getParameter("decide");
            if("omit".equals(decide))
            {
                try {
                  
                    Class.forName("com.mysql.jdbc.Driver");  
                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor","root","");
                    String sql="DELETE FROM manualpayment WHERE paymentid="+paymentid+"";
                    PreparedStatement pstmt=conn.prepareStatement(sql);
                    pstmt.execute();
                    
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Slip Rejected...');");
                out.println("location='view/Admin/Admin_manualpayment.jsp';");
                out.println("</script>");
                } 
                catch (Exception e) {
                    out.println(e);
                }
  
            }
            else if("accept".equals(decide))
            {
        
                Class.forName("com.mysql.jdbc.Driver");  
                Connection conn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor","root","");
                String sql1="select email,classid,paymentslip,imagename,paymentid from manualpayment WHERE paymentid="+paymentid+" ";
                PreparedStatement pstmt1=conn1.prepareStatement(sql1);                
                    ResultSet rs1= pstmt1.executeQuery();
                     
                    
                     if(rs1.next())
                     { int paymentid1=Integer.parseInt(request.getParameter("paymentid"));
                        String classid=rs1.getString("classid");
                         int classid1=Integer.parseInt(classid);
                          
                      out.println(classid1);
                         String email1=rs1.getString("email");
                          String paymentslip=rs1.getString("paymentslip");
                          String imagename=rs1.getString("imagename");
                         
                        Class.forName("com.mysql.jdbc.Driver");  
                        Connection conn2=DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor","root","");
                        // Advertisement AD1 = new Advertisement();
                         String sql2="INSERT INTO enrolledclasses( classid,l_email) VALUES (?,?)";
                         PreparedStatement pstmt2=conn2.prepareStatement(sql2);
                            pstmt2.setInt(1,classid1);
                            
                             pstmt2.setString(2, email1);
                           
                              String sql3="INSERT INTO approvedslips(paymentslip,email,paymentid,classid,imagename) VALUES (?,?,?,?,?)";
                                 PreparedStatement pstmt3=conn2.prepareStatement(sql3); 
                                  pstmt3.setString(1, paymentslip);
                                   pstmt3.setString(2, email1);
                                 pstmt3.setInt(3,paymentid1);
                             pstmt3.setInt(4,classid1);
                            pstmt3.setString(5,imagename);
                            pstmt3.executeUpdate();  
                            int a =pstmt2.executeUpdate();
                             
                             if(a>0)
                             {
                                    Class.forName("com.mysql.jdbc.Driver");  
                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor","root","");
                                    String sql="DELETE FROM manualpayment WHERE paymentid="+paymentid+" ";
                                    PreparedStatement pstmt=conn.prepareStatement(sql);
                                    pstmt.execute(); 
                                        out.println("<script type=\"text/javascript\">");
                                        out.println("alert('enrolled in the class...');");
                                        out.println("location='view/Admin/Admin_manualpayment.jsp';");
                                        out.println("</script>");
                             }
                  
                     }
            }} catch (ClassNotFoundException ex) {
            Logger.getLogger(AdminSlipCheck.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AdminSlipCheck.class.getName()).log(Level.SEVERE, null, ex);
        }
            
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdminSlipCheck</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminSlipCheck at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
