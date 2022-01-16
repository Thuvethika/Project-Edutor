/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Learner;
import Model.Tutor;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
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
 * @author thuve
 */
@WebServlet(name = "AdminDeleteLearner", urlPatterns = {"/AdminDeleteLearner"})
public class AdminDeleteLearner extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try {
            
             HttpSession session1 = request.getSession(false);
                String email2 = (String) session1.getAttribute("email5");
                
              String button2 = request.getParameter("button2");
                 
             if("update1".equals(button2)){
                  
            String firstname = request.getParameter("firstname");
           
            String lastname = request.getParameter("lastname");
            String address = request.getParameter("address");
            String gender = request.getParameter("gender");
            String dob = request.getParameter("dob");
           int phoneno = Integer.parseInt(request.getParameter("phoneno"));
 
   //       int phoneno = Integer.parseInt(request.getParameter("phoneno"));
   
            
                Learner T2 = new Learner();
                T2.setFirstname(firstname);
                T2.setLastname(lastname);
                T2.setAddress(address);
                T2.setGender(gender);
                T2.setPhoneno(phoneno);
                T2.setDob(dob);
        //     DeleteUserDao deleteuser = new DeleteUserDaoImpl();
               
           
 
            Class.forName("com.mysql.jdbc.Driver");
                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor","root","");
                    String sql="UPDATE learner SET firstname='"+T2.getFirstname()+"',lastname='"+T2.getLastname()+"',address='"+T2.getAddress()+"',gender='"+T2.getGender()+"',dob='"+T2.getDob()+"',phoneno='"+T2.getPhoneno()+"' WHERE email='"+email2+"'";
                    PreparedStatement pstmt=conn.prepareStatement(sql);
                    pstmt.executeUpdate();
                      out.println("updated");
                        response.setContentType("text/html");
                      out.println("<script type=\"text/javascript\">");
               out.println("alert('Updated sucessfully...');");
                out.println("location='view/Admin/Home_admin.jsp';");
                out.println("</script>");
                  
            }
            
            else if("delete1".equals(button2)){
            
          
           Class.forName("com.mysql.jdbc.Driver");  
                    Connection conn4=DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor","root","");
                    String sql4="DELETE FROM learner WHERE email='"+email2+"'";
                    PreparedStatement pstmt4=conn4.prepareStatement(sql4);
                    pstmt4.execute(); 
                    out.println("Deleted");
                    
                     response.setContentType("text/html");
                out.println("<script type=\"text/javascript\">");
               out.println("alert('Deleted sucessfully...');");
                out.println("location='view/Admin/Home_admin.jsp';");
                out.println("</script>");
            }   
                
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdminDeleteLearner</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminDeleteLearner at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AdminDeleteLearner.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AdminDeleteLearner.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            out.close();
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
