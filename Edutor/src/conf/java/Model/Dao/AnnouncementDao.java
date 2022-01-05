/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Dao;

import Model.Announcement;
import java.sql.SQLException;

/**
 *
 * @author thuve
 */
public interface AnnouncementDao {
    public void addAnnouncement(Announcement announcement) throws SQLException ;
    
  // public List<Announcement> displayAnnnouncement(Announcement announcement) throws SQLException;
   public String displayAnnnouncement(Announcement announcement) throws SQLException;
    
}
