/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Controller.DaoImpl.AnnouncementDaoImpl;
import Model.Announcement;
import Model.Dao.AnnouncementDao;
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
@WebServlet(name = "CreateAnnouncement", urlPatterns = {"/CreateAnnouncement"})
public class CreateAnnouncement extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      //  processRequest(request, response);

        String topic = request.getParameter("topic");
        String date = request.getParameter("date");
        String link = request.getParameter("link");
        String details = request.getParameter("details");

        try (PrintWriter out = response.getWriter()) {
            
            AnnouncementDao announcement = new AnnouncementDaoImpl();
            
            Announcement A1 = new Announcement();
            A1.setTopic(topic);
            A1.setDate(date);
            A1.setLink(link);
            A1.setDetails(details);
            
             HttpSession session = request.getSession(false);
                String email = (String) session.getAttribute("email");
                Announcement A2 = new Announcement();
                A2.setEmail(email);
               
            announcement.addAnnouncement(A1,A2);
            out.println("insertedd");

        } catch (SQLException ex) {
            Logger.getLogger(CreateAnnouncement.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}