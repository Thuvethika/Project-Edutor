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
import javax.servlet.http.HttpSession;

/**
 *
 * @author thuve
 */
@WebServlet(name = "AdminManageUser", urlPatterns = {"/AdminManageUser"})
public class AdminManageUser extends HttpServlet {

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
        try{
        String email2 = request.getParameter("email2");
        out.println(email2);
        
        
        HttpSession session3=request.getSession();
        session3.setAttribute("email4",email2);
        
         String email3 = request.getParameter("email3");
        out.println(email3);
        HttpSession session2=request.getSession();
        session2.setAttribute("email5",email3);
        String button3=request.getParameter("button3");
        
        if("view".equals(button3))
        {
            
            response.setContentType("text/html");
            out.println("<script type=\"text/javascript\">");
            
            out.println("location='view/Admin/AdminDeleteTutor.jsp';");
            out.println("</script>");
        }
            else if("view1".equals(button3)) {
            
            
            response.setContentType("text/html");
            out.println("<script type=\"text/javascript\">");
            
            out.println("location='view/Admin/AdminDeleteLearner.jsp';");
            out.println("</script>");
               }
            
           out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet AdminManageUser</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Servlet AdminManageUser at " + request.getContextPath() + "</h1>");
        out.println("</body>");
        out.println("</html>");
        } catch(Exception e){
        
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
