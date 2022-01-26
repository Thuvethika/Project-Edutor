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
@WebServlet(name = "DeleteReportedContents", urlPatterns = {"/DeleteReportedContents"})
public class DeleteReportedContents extends HttpServlet {

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
            
             int note_id =Integer.parseInt(request.getParameter("note_id"));
            out.println(note_id);
             String button=request.getParameter("button3");
            if("view".equals(button))
            {
                    Class.forName("com.mysql.jdbc.Driver");  
                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor","root","");
                    String sql="DELETE FROM notes WHERE note_id="+note_id+"";
                    
                    PreparedStatement pstmt=conn.prepareStatement(sql);
                    pstmt.execute();
                    String sql1="DELETE FROM ReportedContents WHERE note_id="+note_id+"";
                    PreparedStatement pstmt1=conn.prepareStatement(sql1);
                    pstmt1.execute();
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Content deleted...');");
                out.println("location='view/Admin/Admin_report.jsp';");
                out.println("</script>");
            
            
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DeleteReportedContents</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteReportedContents at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } 
    }   catch (ClassNotFoundException ex) {
            Logger.getLogger(DeleteReportedContents.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DeleteReportedContents.class.getName()).log(Level.SEVERE, null, ex);
        }}

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
