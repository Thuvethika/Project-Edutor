/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.DaoImpl;

import Model.Dao.logindao;
import Model.editprofile;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.login;
import javax.servlet.http.HttpSession;
import org.apache.commons.codec.digest.DigestUtils;

/**
 *
 * @author user
 */
@WebServlet(name = "loginservlet", urlPatterns = {"/login"})
public class loginservlet extends HttpServlet {
    
  private logindao logindao=new logindao();

      private String hashpassword;
            public String Hashpassword(String password)
            {
                hashpassword=DigestUtils.sha256Hex(password);
                return hashpassword;
            }
  
  
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
            /* TODO output your page here. You may use following sample code. */
            String email=request.getParameter("email");
            String password=request.getParameter("password");
            String pass=Hashpassword(password);
            HttpSession session=request.getSession();  
            session.setAttribute("email",email);         
            
            login login=new login();
            login.setEmail(email);
            login.setPassword(pass);
            
            String result= logindao.registerlogin(login);
            
            if(result.equals("tutor"))
            {
                 
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Succesfully login the system');");
                out.println("location='view/Tutor_home/Home_Tutor.jsp';");
                out.println("</script>");
                     //out.println("tutor");
               /*String site=new String("view/Edutor/Tutor_home/tutorhome.jsp");
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("location", site);*/   
            }
            else if(result.equals("learner"))
            {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Succesfully login the system');");
                out.println("location='view/Learner_home/Home_Learner.jsp';");
                out.println("</script>");
                
               /* String site=new String("view/Learner_home/Home_Learner.jsp");
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("location", site);*/
            }
            else if(result.equals("admin"))
            {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Succesfully login the system');");
                out.println("location='view/Admin/Home_admin.jsp';");
                out.println("</script>");  
                
                
               // out.println("admin");
                /*String site=new String("view/admin/adminhome.jsp");
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("location", site);*/
                
            }   
            else
            {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('data not found');");
                out.println("location='view/login.jsp';");
                out.println("</script>");
                //out.println("data not found");
            }
        } 
        catch (ClassNotFoundException ex)
        {
            Logger.getLogger(loginservlet.class.getName()).log(Level.SEVERE, null, ex);
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
