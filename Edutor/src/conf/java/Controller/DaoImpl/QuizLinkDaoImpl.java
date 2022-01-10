/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.DaoImpl;

import DB.DB;
import Model.Dao.QuizLinkDao;
import Model.QuizLink;
import java.sql.SQLException;

/**
 *
 * @author thuve
 */
public class QuizLinkDaoImpl implements QuizLinkDao {

    @Override
    public void addQuizLink(QuizLink quizlink) throws SQLException {
         DB.iud("INSERT INTO quizlinks(topic, date, quizlink,email,classid)" + "VALUES('" +quizlink.getTopic()+"','" +quizlink.getDate()+"','" +quizlink.getQuizlink()+"','" +quizlink.getEmail()+"','" +quizlink.getClassid()+"')");
    }

    @Override
    public void displayQuizLink(QuizLink quizlink) throws SQLException {
    }
    
}
