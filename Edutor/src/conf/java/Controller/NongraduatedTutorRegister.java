/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Controller.DaoImpl.TutorDaoImpl;
import Model.Dao.TutorDao;
import Model.Tutor;
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
@WebServlet(name = "NongraduatedTutorRegister", urlPatterns = {"/NongraduatedTutorRegister"})
public class NongraduatedTutorRegister extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      //  processRequest(request, response);

        {
            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String address = request.getParameter("address");
            String gender = request.getParameter("gender");
            // Date dob = (Date)getDate("dob");
            String dob = request.getParameter("dob");
            int phoneno = Integer.parseInt(request.getParameter("phoneno"));
            String qualification = request.getParameter("qualification");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String retypepassword = request.getParameter("retypepassword");

//            Part part = request.getPart("img");
            String nic = request.getParameter("nic");

            try (PrintWriter out = response.getWriter()){

                //  InputStream is = part.getInputStream();
                TutorDao tutor = new TutorDaoImpl();

                Tutor T1 = new Tutor();
                T1.setFirstname(firstname);
                T1.setLastname(lastname);
                T1.setAddress(address);
                T1.setGender(gender);
                T1.setPhoneno(phoneno);
                T1.setQualification(qualification);
                T1.setEmail(email);
                T1.setPassword(password);
                // T1.setImg((Blob) is);
                T1.setNic(nic);
                T1.setDob(dob);

                if (password.equals(retypepassword)) {

                    tutor.addTutor(T1);
                String site=new String("view/Edutor/login.jsp");
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("location", site);
                } else {
                  out.println("password and confirmpassword are not same or data not found");
                }

            } catch (SQLException ex) {
                Logger.getLogger(GraduatedTutorRegister.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

    }
}
