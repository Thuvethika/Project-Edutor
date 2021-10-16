/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.DaoImpl;

import DB.DB;
import Model.Dao.LearnerDao;
import Model.Learner;
import java.sql.SQLException;

/**
 *
 * @author thuve
 */
public class LearnerDaoImpl implements LearnerDao{

    @Override
    public void addLearner(Learner learner) throws SQLException {
     DB.iud("INSERT INTO learner(firstname, lastname,address,gender,dob,phoneno,grade,university,course,workplace,qualification,email,password,nic,img)" +  "VALUES ('" + learner.getFirstname() + "','" + learner.getLastname() + "','" + learner.getAddress() + "','" + learner.getGender() + "','" + learner.getDob() + "','" + learner.getPhoneno() + "','" + learner.getGrade() + "','" + learner.getUniversity() + "','" + learner.getCourse() + "','" + learner.getWorkplace() + "','" + learner.getQualification() + "','" + learner.getEmail() + "','" + learner.getPassword() + "','" + learner.getNic() + "','" + learner.getImg() + "')");
    }   
    
}
 