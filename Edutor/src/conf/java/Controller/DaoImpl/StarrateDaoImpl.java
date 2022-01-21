/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.DaoImpl;

import DB.DB;
import Model.Dao.StarrateDao;
import Model.Starrate;
import java.sql.SQLException;

/**
 *
 * @author Thishan
 */
public class StarrateDaoImpl implements StarrateDao {

    @Override
    public void addStarrate(Starrate starrate) throws SQLException {
        DB.iud("INSERT INTO starrating(l_email, rating, classid)" + "VALUES ('" + starrate.getEmail() +"','" + starrate.getRating() +"' ,'" + starrate.getClassid()+ "' ) ");
    }
    
    
}
