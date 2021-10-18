/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.DaoImpl;

import DB.DB;
import Model.Announcement;
import Model.Dao.AnnouncementDao;
import java.sql.SQLException;

/**
 *
 * @author thuve
 */
public class AnnouncementDaoImpl implements AnnouncementDao{

    @Override
    public void addAnnouncement(Announcement announcement, Announcement announcement1) throws SQLException {
        DB.iud("INSERT INTO announcement (topic,date, link,details, email)" + "VALUES('"+ announcement.getTopic()+"','"+ announcement.getDate()+"','"+ announcement.getLink()+"','"+ announcement.getDetails()+"','"+ announcement1.getEmail()+"')");
    }
    
}
