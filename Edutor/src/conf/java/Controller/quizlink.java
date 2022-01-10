/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Controller.DaoImpl.AnnouncementDaoImpl;
import Controller.DaoImpl.QuizLinkDaoImpl;
import Model.Announcement;
import Model.Dao.AnnouncementDao;
import Model.Dao.QuizLinkDao;
import Model.QuizLink;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "quizlink", urlPatterns = {"/quizlink"})
public class quizlink extends HttpServlet {

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
        
            
            String topic = request.getParameter("topic");
        String date = request.getParameter("date");
     
        String quizlink = request.getParameter("quizlink");

        try {
            
            QuizLinkDao link = new QuizLinkDaoImpl();
            
           QuizLink L1 = new QuizLink();
            L1.setTopic(topic);
            L1.setDate(date);
         
            L1.setQuizlink(quizlink);
           
            HttpSession session = request.getSession(false);
            String email = (String) session.getAttribute("email");
            L1.setEmail(email);
             HttpSession session1 = request.getSession(false);
           
     int classid = ((Integer) session1.getAttribute("classid"));
     L1.setClassid(classid);
                //Announcement A2 = new Announcement();
              //  A2.setEmail(email);
               
             link.addQuizLink(L1);
         //   out.println("insertedd");
            String site=new String("view/quizlink/ViewQuizLink.jsp");
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("location", site);
            
            
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet quizlink</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet quizlink at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }catch (SQLException ex) {
            Logger.getLogger(CreateAnnouncement.class.getName()).log(Level.SEVERE, null, ex);
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
