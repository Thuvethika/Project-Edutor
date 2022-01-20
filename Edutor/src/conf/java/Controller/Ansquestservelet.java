/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Controller.DaoImpl.AnsquestDaoImpl;
import Model.Ansquest;
import Model.Dao.AnsquestDao;
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
 * @author Thishan
 */
@WebServlet(name = "Ansquestservelet", urlPatterns = {"/Ansquest"})
public class Ansquestservelet extends HttpServlet {

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
            out.println("<title>Servlet Ansquestservelet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Ansquestservelet at " + request.getContextPath() + "</h1>");
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
        String replier = request.getParameter("replier");
        String ansdate = request.getParameter("ansdate");
        
        
        String forumans = request.getParameter("forumans");
        HttpSession session = request.getSession();
         String email = (String) session.getAttribute("email");
         session.setAttribute("email",email);
         HttpSession session3=request.getSession();  
            int Fquestid = (int) session.getAttribute("Fquestid");
            session3.setAttribute("Fquestid",Fquestid);
            
             try (PrintWriter out = response.getWriter()) {
                
                 AnsquestDao ansquest = new AnsquestDaoImpl();
                 Ansquest AN1 = new Ansquest();
                 AN1.setReplier(replier);
                 AN1.setAnsdate(ansdate);
                 AN1.setForumans(forumans);
                 AN1.setEmail(email);
                 AN1.setFquestid(Fquestid);
                 ansquest.addAnsquest(AN1);
                  
                 out.println("<script type=\"text/javascript\">");
                
                out.println("location='view/Forum/QuestionL_Forum.jsp';");
                out.println("</script>");
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
