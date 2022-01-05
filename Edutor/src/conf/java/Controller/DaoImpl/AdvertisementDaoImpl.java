/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.DaoImpl;

import DB.DB;
import Model.Advertisement;
import Model.Dao.AdvertisementDao;
import java.sql.SQLException;

/**
 *
 * @author thuve
 */
public class AdvertisementDaoImpl implements AdvertisementDao {

    @Override
    public void addAdvertisement(Advertisement advertisement,Advertisement advertisement1) throws SQLException {
        
        DB.iud("INSERT INTO advertisement(subject, date, time, classoption,fees,email,classid)" + "VALUES('" +advertisement.getSubject() +"','" +advertisement.getDate()+"','" +advertisement.getTime()+"','" +advertisement.getClassoption() +"','" +advertisement.getFees() +"','" +advertisement1.getEmail()+"','" +advertisement.getClassid()+"')");
    }

    @Override
    public void addCustomAdvertisement(Advertisement advertisement, Advertisement advertisement1) throws SQLException {
   
         DB.iud("INSERT INTO customadvertisement(uploadimage,email)" + "VALUES('"+advertisement.getUploadimage()+"','"+advertisement1.getEmail()+"')");
    }
    }
  
   
    
