/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.DaoImpl;

import DB.DB;
import Model.Announcement;
import Model.Dao.AnnouncementDao;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;

/**
 *
 * @author thuve
 */
public class AnnouncementDaoImpl implements AnnouncementDao{

    @Override
    public void addAnnouncement(Announcement announcement) throws SQLException {
       //s DB.iud("INSERT INTO announcement (topic,date, link,details, email,classid)" + "VALUES('" + announcement.getTopic() + "','" + announcement.getDate()+"','"+ announcement.getLink()+"','"+ announcement.getDetails()+"','"+ announcement.getEmail()+"','" +announcement.getClassid()+"'");
     DB.iud("INSERT INTO announcement(topic, date, details,email,classid)" + "VALUES('" +announcement.getTopic()+"','" +announcement.getDate()+"','" +announcement.getDetails()+"','" +announcement.getEmail()+"','" +announcement.getClassid()+"')");
    
    }

    @Override
    public String displayAnnnouncement(Announcement announcement) throws SQLException {
        
         
     try  {

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor", "root", "");
         //  List<Announcement> Announce= new ArrayList<Announcement>();
            String sql1 = "SELECT topic,date,details FROM announcement where email='" + announcement.getEmail() + "'";
            PreparedStatement pstmt = con.prepareStatement(sql1);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                
             /*   Announcement A1 = new Announcement();
                A1.setTopic(rs.getString("topic"));
                A1.setTopic(rs.getString("date"));
                A1.setTopic(rs.getString("link"));
                A1.setTopic(rs.getString("details"));  */
                
              // Announce.add(A1);
                 String topic = rs.getString("topic");
                 String date = rs.getString("date");
                 String link = rs.getString("link");
                 String details = rs.getString("details");
                 
                 
                  
             //con.close();  */
             
               return "Display"; 
    
    } 
    
}       catch (ClassNotFoundException ex) {
            Logger.getLogger(AnnouncementDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
   }
        
    
