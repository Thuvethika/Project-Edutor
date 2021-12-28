/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Dao;

import Model.Advertisement;
import java.sql.SQLException;

/**
 *
 * @author thuve
 */
public interface AdvertisementDao {
    
    public void addAdvertisement (Advertisement advertisement,Advertisement advertisement1) throws SQLException;
     public void addCustomAdvertisement(Advertisement advertisement,Advertisement advertisement1) throws SQLException;
}
