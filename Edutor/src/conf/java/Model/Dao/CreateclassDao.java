/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Dao;

import Model.Createclass;
import java.sql.SQLException;

/**
 *
 * @author Thishan
 */
public interface CreateclassDao {
    public void addCreateclass(Createclass createclass) throws SQLException;
    
}
