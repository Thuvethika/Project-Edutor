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
@WebServlet(name = "ReportContent", urlPatterns = {"/ReportContent"})
public class ReportContent extends HttpServlet {

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
            
            
             HttpSession session3=request.getSession(false);  
                int classid =(Integer)session3.getAttribute("classid");
              //  int classid=Integer.parseInt(classid1);
                
           /*  HttpSession session1=request.getSession(false);  
                String noteid =(String)session1.getAttribute("noteid");
                int noteid=Integer.parseInt(noteid);*/
                
            String note_id=request.getParameter("note_id"); 
            
            HttpSession session=request.getSession(false);  
                String email2=(String)session.getAttribute("email");
                
             //   String reportbtn=request.getParameter("reportbtn");
            //if("report".equals(reportbtn))
            {
                
                 Class.forName("com.mysql.jdbc.Driver").newInstance();
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor", "root", "");
              
              String sql = "SELECT title, note,imgname,classid, email FROM notes WHERE note_id="+note_id+"";
              PreparedStatement stmt = con.prepareStatement(sql);
               
              ResultSet rs = stmt.executeQuery();
              
              
                     if(rs.next())
                     {
                         
                      
                         String title=rs.getString("title");
                          String note=rs.getString("note");
                             String email=rs.getString("email");
                              String imgname=rs.getString("imgname");
                              
                              String classid2=rs.getString("classid");
                             //  int classid2=Integer.parseInt(request.getParameter("classid"));
                             String sql2 = "SELECT classname, grade FROM class WHERE classid="+classid2+"";
                           PreparedStatement stmt1 = con.prepareStatement(sql2);
                          ResultSet rs2 = stmt1.executeQuery();
                          if(rs2.next())
                     { 
                          String subject=rs2.getString("classname");
                          String grade =rs2.getString("grade");
                          
                        Class.forName("com.mysql.jdbc.Driver");  
                        Connection conn2=DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor","root","");
                        // Advertisement AD1 = new Advertisement();
                         String sql4="INSERT INTO reportedcontents (l_email, t_email,subject,grade,title,note,imgname, note_id) VALUES (?,?,?,?,?,?,?,?)";
                         PreparedStatement pstmt2=conn2.prepareStatement(sql4);
                            pstmt2.setString(1,email2);
                            
                             pstmt2.setString(2, email);
                             
                                 pstmt2.setString(3, subject);
                                   pstmt2.setString(4, grade);
                                pstmt2.setString(5, title);
                                 pstmt2.setString(6, note);
                                  pstmt2.setString(7, imgname);
                          pstmt2.setString(8, note_id);
                           pstmt2.executeUpdate();
                           
                             out.println("<script type=\"text/javascript\">");
                out.println("alert('Content Reported...');");
                out.println("location='view/Learner_enroll_class/L_enrol.jsp';");
                out.println("</script>");
                         
                     }   }}
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ReportContent</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReportContent at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ReportContent.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(ReportContent.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(ReportContent.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ReportContent.class.getName()).log(Level.SEVERE, null, ex);
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
