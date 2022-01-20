/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Controller.DaoImpl.PostquestDaoImpl;
import Model.Dao.PostquestDao;
import Model.Postquest;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Thishan
 */
@WebServlet(name = "Postquestservelet2", urlPatterns = {"/Postquest2"})
public class Postquestservelet2 extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Postquestservelet2</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Postquestservelet2 at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String sender = request.getParameter("sender");
        String postdate = request.getParameter("postdate");
        
        String topic = request.getParameter("topic");
        String forumquest = request.getParameter("forumquest");
        HttpSession session = request.getSession();
         String email = (String) session.getAttribute("email");
         session.setAttribute("email",email);
         
         try (PrintWriter out = response.getWriter()) {
             PostquestDao postquest = new PostquestDaoImpl();
             Postquest F1 = new Postquest();
             F1.setSender(sender);
             F1.setPostdate(postdate);
             F1.setTopic(topic);
             F1.setForumquest(forumquest);
             F1.setEmail(email);
             postquest.addPostquest(F1);
             
             String site=new String("view/Forum/Tutor_Forum.jsp");
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("location", site);
             
         } catch (SQLException ex) {
            
        }
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
