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
//  int classid1 = Integer.parseInt(request.getParameter("classid"));
        String topic = request.getParameter("topic");
        String date = request.getParameter("date");
     
        String details = request.getParameter("details");
PrintWriter out = response.getWriter();
        try {
            
            AnnouncementDao announcement = new AnnouncementDaoImpl();
            
            Announcement A1 = new Announcement();
            A1.setTopic(topic);
            A1.setDate(date);
         
            A1.setDetails(details);
            HttpSession session = request.getSession(false);
            String email = (String) session.getAttribute("email");
            A1.setEmail(email);
             HttpSession session1 = request.getSession(false);
           
     int classid = ((Integer) session1.getAttribute("classid"));
     A1.setClassid(classid);
                //Announcement A2 = new Announcement();
              //  A2.setEmail(email);
               
            announcement.addAnnouncement(A1);
         //   out.println("insertedd");
            String site=new String("view/Announce/DisplayAnnouncement.jsp");
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("location", site);

        } catch (SQLException ex) {
            Logger.getLogger(CreateAnnouncement.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}