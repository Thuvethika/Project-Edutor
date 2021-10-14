/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.DaoImpl;

import DB.DB;
import Model.Dao.TutorDao;
import Model.Tutor;
import java.sql.SQLException;

/**
 *
 * @author thuve
 */
public class TutorDaoImpl implements TutorDao {
    
     @Override
     public void addTutor(Tutor tutor) throws SQLException {
        
        DB.iud("INSERT INTO tutor(firstname, lastname,address,gender,dob,nic,phoneno,degreename,email,password,qualification,img)" +  "VALUES ('" + tutor.getFirstname() + "','" + tutor.getLastname() + "','" + tutor.getAddress() + "','" + tutor.getGender() + "','" + tutor.getDob() + "','" + tutor.getNic() + "','" + tutor.getPhoneno() + "','" + tutor.getDegreename() + "','" + tutor.getEmail() + "','" + tutor.getPassword() + "','" + tutor.getQualification() + "','" + tutor.getImg() + "')");
    }
    
}
