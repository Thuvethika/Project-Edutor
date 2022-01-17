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
import javax.servlet.http.HttpSession;

/**
 *
 * @author thuve
 */
@WebServlet(name = "FreeEnroll", urlPatterns = {"/FreeEnroll"})
public class FreeEnroll extends HttpServlet {

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
            
             int advd=Integer.parseInt(request.getParameter("advd"));
            
            String button1=request.getParameter("button1");
            
             HttpSession session = request.getSession(false);
            String email = (String) session.getAttribute("email");
             if("enrol".equals(button1))
                  {
                try {
                  
                    Class.forName("com.mysql.jdbc.Driver");  
                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor","root","");
                    String sql= "SELECT classid FROM publishadvertisments WHERE advd="+advd+" ";
                      PreparedStatement pstmt1=conn.prepareStatement(sql);                
                    ResultSet rs1= pstmt1.executeQuery();
                    
                    if(rs1.next())
                     { 
                        String classid=rs1.getString("classid");
                        int classid1=Integer.parseInt(classid);
                          
                      
                       String sql1= "SELECT classid, l_email FROM enrolledclasses";
                      PreparedStatement pstmt3=conn.prepareStatement(sql1);                
                    ResultSet rs2= pstmt3.executeQuery();
                          if(rs2.next())
                     { do{
                         int classid2=Integer.parseInt(rs2.getString("classid"));
                        
                       String email5=rs2.getString("l_email");
                            out.println(email5);
                            out.println(email);
                             out.println(classid2);
                              out.println(classid1);
                     if ((classid2 == classid1) && (email.equals(email5) )){
                          
                              
                           out.println("<script type=\"text/javascript\">");
                out.println("alert('You already enrolled in the class...');");
                out.println("location='view/Filter/Filter_ad.jsp';");
                out.println("</script>");
                     
                          } 
                     else{try{
                Class.forName("com.mysql.jdbc.Driver");  
                        Connection conn2=DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor","root","");
                        // Advertisement AD1 = new Advertisement();
                         String sql2="INSERT INTO enrolledclasses( classid,l_email) VALUES (?,?)";
                         PreparedStatement pstmt2=conn2.prepareStatement(sql2);
                            pstmt2.setInt(1,classid1);
                            
                             pstmt2.setString(2, email);
                           pstmt2.executeUpdate();
                    
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Enrolled in the class...');");
                out.println("location='view/Learner_home/Home_Learner.jsp';");
                out.println("</script>"); 
                } catch (ClassNotFoundException ex) {
                     Logger.getLogger(FreeEnroll.class.getName()).log(Level.SEVERE, null, ex);
                 } 
                          
                     
                     }
                     
                     }  while(rs2.next()); }      
                     
                            
                  
                     
                     } 
  
            }    catch (ClassNotFoundException ex) {
                     Logger.getLogger(FreeEnroll.class.getName()).log(Level.SEVERE, null, ex);
                 } catch (SQLException ex) {
                     Logger.getLogger(FreeEnroll.class.getName()).log(Level.SEVERE, null, ex);
                 }
            
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet FreeEnroll</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FreeEnroll at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }catch (Exception e) {
                    out.println(e);
    }  }

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
