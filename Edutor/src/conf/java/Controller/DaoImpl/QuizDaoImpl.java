/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.DaoImpl;

import DB.DB;
import Model.Dao.QuizDao;
import Model.Quiz;
import java.sql.SQLException;

/**
 *
 * @author thuve
 */
public class QuizDaoImpl implements QuizDao {

    @Override
    public void addQuiz(Quiz quiz) throws SQLException {
        DB.iud("INSERT INTO quiz(question, answer1, answer2, answer3,answer4,answer,email,classid)" + "VALUES('" +quiz.getQuestion()+"','" +quiz.getAnswer1()+"','" +quiz.getAnswer2()+"','" +quiz.getAnswer3()+"','" +quiz.getAnswer4()+"','" +quiz.getAnswer()+"','" +quiz.getEmail()+"','" +quiz.getClassid()+"')");
    }
    
}
