/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.DaoImpl;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author user
 */
@WebServlet(name = "invitefreindsservlet", urlPatterns = {"/invitefreindsservlet"})
public class invitefreindsservlet extends HttpServlet {

    
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
                
             String email=request.getParameter("email");
             out.println(email);
           
           
            try {
                String from ="projectedutor@gmail.com";
                String password ="xiteyvadgngnggry";
                Properties props = new Properties();
                props.put("mail.smtp.host", "smtp.gmail.com");
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.port", "587");
                props.put("mail.smtp.socketFactory.port" , "587");
                props.put("mail.smtp.starttls.enable" , "true");

                Session s = Session.getInstance(props, null);
                s.setDebug(true);

                MimeMessage msg = new MimeMessage(s);

                String fromEmail ="projectedutor@gmail.com";

                String addressTo =email;
                InternetAddress to = new InternetAddress(addressTo);

                InternetAddress fromAddr = new InternetAddress(fromEmail);

                msg.setSentDate(new java.util.Date());
                msg.setFrom(fromAddr);
                msg.addRecipient(Message.RecipientType.TO, to);

                msg.setSubject("Come and join with us..");
                msg.setContent("this is one of the best platform for online learning ","text/plain");

                Transport tr = s.getTransport("smtp");
                String smtp_server = props.getProperty("mail.smtp.host");

                tr.connect(smtp_server, from, password);
                msg.saveChanges();
                tr.sendMessage(msg, msg.getAllRecipients());
                tr.close();

                out.println("<script type=\"text/javascript\">");
                out.println("alert('Succesfully mail sent...');");
                out.println("location='view/Learner_home/Home_Learner.jsp';");
                out.println("</script>");
                
               /* String site=new String("view/Learner_home/learnerhome.jsp");
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("location", site);*/
                
            } catch (Exception e) {
                
            }
  
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
