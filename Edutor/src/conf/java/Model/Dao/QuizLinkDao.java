/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Dao;

import Model.QuizLink;
import java.sql.SQLException;

/**
 *
 * @author thuve
 */
public interface QuizLinkDao {
      public void addQuizLink(QuizLink quizlink) throws SQLException ;
      
       public void displayQuizLink(QuizLink quizlink) throws SQLException ;
}
