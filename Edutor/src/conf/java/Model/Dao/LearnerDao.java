/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Dao;

import Model.Learner;
import java.sql.SQLException;

/**
 *
 * @author thuve
 */
public interface LearnerDao {
    public void addLearner(Learner learner) throws SQLException;
}
