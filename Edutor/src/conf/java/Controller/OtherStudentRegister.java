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
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author thuve
 */
@WebServlet(name = "OtherStudentRegister", urlPatterns = {"/OtherStudentRegister"})
public class OtherStudentRegister extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        {
            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String address = request.getParameter("address");
            String gender = request.getParameter("gender");
            String dob = request.getParameter("dob");
            int phoneno = Integer.parseInt(request.getParameter("phoneno"));
            String workplace = request.getParameter("workplace");
            String qualification = request.getParameter("qualification");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String retypepassword = request.getParameter("retypepassword");

//            Part part = request.getPart("img");
            String nic = request.getParameter("nic");

            try(PrintWriter out = response.getWriter()) {

                //  InputStream is = part.getInputStream();
                LearnerDao learner = new LearnerDaoImpl();

                Learner L1 = new Learner();
                L1.setFirstname(firstname);
                L1.setLastname(lastname);
                L1.setAddress(address);
                L1.setGender(gender);
                L1.setDob(dob);
                L1.setPhoneno(phoneno);
                L1.setWorkplace(workplace);
                L1.setQualification(qualification);
                L1.setEmail(email);
                L1.setPassword(password);
                // L1.setImg((Blob) is);
                L1.setNic(nic);

                if (password.equals(retypepassword)) {

                    learner.addLearner(L1);
                  String site=new String("view/Edutor/login.jsp");
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("location", site);

                } else {
                 out.println("password and confirmpassword are not same");
                }

            } catch (SQLException ex) {
                Logger.getLogger(OtherStudentRegister.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }
}
