/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Controller.DaoImpl.AdvertisementDaoImpl;
import Model.Advertisement;
import Model.Dao.AdvertisementDao;
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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author thuve
 */
@WebServlet(name = "CreateAdvertisement", urlPatterns = {"/CreateAdvertisement"})
@MultipartConfig
public class CreateAdvertisement extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //  processRequest(request, response);
        

            // String uploadimage = request.getParameter("uploadimage");
        PrintWriter out = response.getWriter();
            try  {
                   int classid = Integer.parseInt(request.getParameter("classid"));
                    String subject = request.getParameter("subject");
                    String date = request.getParameter("date");
                    String time = request.getParameter("time");
                    String classoption = request.getParameter("classoption");
                    String fees = request.getParameter("fees");
                    AdvertisementDao advertisement = new AdvertisementDaoImpl();

                    Advertisement AD = new Advertisement();
 
                    AD.setClassid(classid);
                    AD.setSubject(subject);
                 AD.setDate(date);
                 AD.setTime(time);
                    AD.setClassoption(classoption);
                    AD.setFees(fees);

                    HttpSession session = request.getSession(false);
                    String email = (String) session.getAttribute("email");
                    Advertisement AD1 = new Advertisement();
                    AD1.setEmail(email);
                    advertisement.addAdvertisement(AD, AD1);

                   out.println("Insertedd ad");
                    response.setContentType("text/html");
    out.println("<script type=\"text/javascript\">");  
   out.println("alert('Saved');");
   out.println("location='view/Tutor_home/Home_Tutor.jsp';");
   out.println("</script>"); 
                
            } catch (SQLException ex) {
                Logger.getLogger(CreateAdvertisement.class.getName()).log(Level.SEVERE, null, ex);
            }
        

    }
}
