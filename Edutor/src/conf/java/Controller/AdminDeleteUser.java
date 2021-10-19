/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Controller.DaoImpl.DeleteUserDaoImpl;
import Model.Dao.DeleteUserDao;
import Model.DeleteUser;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author thuve
 */
@WebServlet(name = "AdminDeleteUser", urlPatterns = {"/AdminDeleteUser"})
public class AdminDeleteUser extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //    processRequest(request, response);
        String email = request.getParameter("email");

        try (PrintWriter out = response.getWriter()) {
            DeleteUserDao deleteuser = new DeleteUserDaoImpl();

            DeleteUser user = new DeleteUser();
            user.setEmail(email);

            String result = deleteuser.Deleteuser(user);

              
            if (result.equals("tutor")) {
                out.println("tutor deleted");
                

            } else if (result.equals("learner")) {
                out.println("learner deleted");

            } else {
                out.println("data not found");
          /*     request.setAttribute("alertMsg", "data add sucess");
               RequestDispatcher rd=request.getRequestDispatcher("view/Edutor/admin/adminhome.jsp");  
               rd.include(request, response);
               String message = (String)request.getAttribute("alertMsg");
       // <script type="text/javascript">
  //  var msg = "<%=message%>";
    message.equals("deleted");
   // alert(msg); */

            }
         //   String site=new String("view/Edutor/admin/adminhome.jsp");
         //       response.setStatus(response.SC_MOVED_TEMPORARILY);
        //        response.setHeader("location", site);

        } catch (SQLException ex) {

            Logger.getLogger(AdminDeleteUser.class.getName()).log(Level.SEVERE, null, ex);

        }
    }
}
