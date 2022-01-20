/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.DaoImpl;

import DB.DB;
import Model.Dao.PostquestDao;
import Model.Postquest;
import java.sql.SQLException;

/**
 *
 * @author Thishan
 */
public class PostquestDaoImpl implements PostquestDao {

    @Override
    public void addPostquest(Postquest postquest) throws SQLException {
       DB.iud("INSERT INTO ForumQuest(sender, postdate, topic,forumquest,email)" + "VALUES ('" + postquest.getSender()+"','" + postquest.getPostdate() +"' ,'" + postquest.getTopic()+ "','" + postquest.getForumquest()+ "','" + postquest.getEmail() +"' ) ");
    }
    
    
}
