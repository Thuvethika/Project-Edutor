/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.DaoImpl;

import Model.Dao.editprofiledao;
import Model.Tutor;
import Model.editprofile;
import com.sun.crypto.provider.RSACipher;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
@WebServlet(name = "editprofileservlet", urlPatterns = {"/editprofileservlet"})
public class editprofileservlet extends HttpServlet {
  private editprofiledao editprofiledao=new editprofiledao();
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            

            
              String button=request.getParameter("button");
             if("delete".equals(button))
              {
                HttpSession session=request.getSession(false);  
                String email=(String)session.getAttribute("email"); 
                
                editprofile editprofile=new editprofile();
                editprofile.setEmail(email);
                
               editprofiledao.deleteprofile(editprofile);
               
               String site=new String("view/Edutor/login.jsp");
               response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("location", site);

              }
              
            /* else if("save".equals(button))
              {
                HttpSession session1=request.getSession(false);  
                String emailaddress=(String)session1.getAttribute("email"); 
                
                editprofile email1=new editprofile();
                email1.setEmail(emailaddress);
              
              }*/
              
            else if("update".equals(button))
              {
                             String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String address = request.getParameter("address");
            String gender = request.getParameter("gender");
            String dob = request.getParameter("dob");
            int phoneno = Integer.parseInt(request.getParameter("phoneno"));
            
            
                Tutor T2 = new Tutor();
                T2.setFirstname(firstname);
                T2.setLastname(lastname);
                T2.setAddress(address);
                T2.setGender(gender);
                T2.setPhoneno(phoneno);
                T2.setDob(dob);
                  
                  
                HttpSession session=request.getSession(false);  
                String email=(String)session.getAttribute("email"); 
                
                editprofile editprofile=new editprofile();
                editprofile.setEmail(email);

           editprofiledao.update(editprofile,T2);
               String site=new String("view/Edutor/login.jsp");
               response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("location", site);
               
               
              }
        } catch (ClassNotFoundException ex) {
          Logger.getLogger(editprofileservlet.class.getName()).log(Level.SEVERE, null, ex);
      }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
