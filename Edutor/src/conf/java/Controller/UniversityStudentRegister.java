/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Controller.DaoImpl.LearnerDaoImpl;
import Model.Dao.LearnerDao;
import Model.Learner;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author thuve
 */
@WebServlet(name = "UniversityStudentRegister", urlPatterns = {"/UniversityStudentRegister"})
@MultipartConfig
public class UniversityStudentRegister extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        { try(PrintWriter out = response.getWriter()){
            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String address = request.getParameter("address");
            String gender = request.getParameter("gender");
            String dob = request.getParameter("dob");
            int phoneno = Integer.parseInt(request.getParameter("phoneno"));
            String university = request.getParameter("university");
            String course = request.getParameter("course");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String retypepassword = request.getParameter("retypepassword");

            Part part = request.getPart("img");
            String nic = request.getParameter("nic");

           InputStream inputStream = part.getInputStream();

                //  InputStream is = part.getInputStream();
                LearnerDao learner = new LearnerDaoImpl();

                Learner L1 = new Learner();
                L1.setFirstname(firstname);
                L1.setLastname(lastname);
                L1.setAddress(address);
                L1.setGender(gender);
                L1.setDob(dob);
              L1.setPhoneno(phoneno);
                L1.setUniversity(university);
                L1.setCourse(course);
                L1.setEmail(email);
                L1.setPassword(password);
                L1.setNic(nic);
                if (inputStream != null) {
                   L1.setImg(part);
                   
                  }

                if (password.equals(retypepassword)) {

                    learner.addLearner(L1);
                String site=new String("View/login.jsp");
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("location", site);

                } else {
                   out.println("password and confirmpassword are not same");
                }

            } catch (SQLException ex) {
                Logger.getLogger(UniversityStudentRegister.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }
}
