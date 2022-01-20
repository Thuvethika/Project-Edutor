/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.DaoImpl;

import DB.DB;
import Model.Ansquest;
import Model.Dao.AnsquestDao;
import java.sql.SQLException;

/**
 *
 * @author Thishan
 */
public class AnsquestDaoImpl implements AnsquestDao {

    @Override
    public void addAnsquest(Ansquest ansquest) throws SQLException {
        DB.iud("INSERT INTO ansquest(Fquestid,replier, ansdate,forumans,email)" + "VALUES ('" + ansquest.getFquestid() +"','" + ansquest.getReplier()+"','" + ansquest.getAnsdate() +"' ,'" + ansquest.getForumans()+ "','" + ansquest.getEmail()+ "' ) ");
    }
    
}
