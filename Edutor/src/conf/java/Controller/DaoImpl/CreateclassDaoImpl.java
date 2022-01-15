/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.DaoImpl;

import DB.DB;
import Model.Createclass;
import Model.Dao.CreateclassDao;
import java.sql.SQLException;

/**
 *
 * @author Thishan
 */
public class CreateclassDaoImpl implements CreateclassDao{

    @Override
    public void addCreateclass(Createclass createclass) throws SQLException {
         DB.iud("INSERT INTO class(classname, grade, medium,email)" + "VALUES ('" + createclass.getClassname() +"','" + createclass.getGrade() +"' , '" + createclass.getMedium() + "','" + createclass.getEmail() +"') ");
    }
    
    
}
