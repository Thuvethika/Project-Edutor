/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Advertisement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
@WebServlet(name = "AdminCheckAdvertisement", urlPatterns = {"/AdminCheckAdvertisement"})
public class AdminCheckAdvertisement extends HttpServlet {

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
            
                int ad_id=Integer.parseInt(request.getParameter("ad_id"));
            out.println(ad_id);
           
            String decision=request.getParameter("decision");
            if("delete".equals(decision))
            {
                try {
                  
                    Class.forName("com.mysql.jdbc.Driver");  
                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor","root","");
                    String sql="DELETE FROM advertisement WHERE ad_id="+ad_id+"";
                    PreparedStatement pstmt=conn.prepareStatement(sql);
                    pstmt.execute();
                    
                out.println("<script type=\"text/javascript\">");
                out.println("alert('adevertise deleted...');");
                out.println("location='view/Admin/AdminCheckAdvertisement.jsp';");
                out.println("</script>");
                } 
                catch (Exception e) {
                    out.println(e);
                }
  
            }
            else if("approve".equals(decision))
            {
        
                Class.forName("com.mysql.jdbc.Driver");  
                Connection conn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor","root","");
                String sql1="SELECT ad_id,email,subject,date,time,classoption,fees, classid FROM advertisement WHERE ad_id="+ad_id+" ";
                PreparedStatement pstmt1=conn1.prepareStatement(sql1);                
                    ResultSet rs1= pstmt1.executeQuery();
                     
                    
                     if(rs1.next())
                     {
                         int ad_id1=Integer.parseInt(request.getParameter("ad_id"));
                      
                         String email=rs1.getString("email");
                          String subject=rs1.getString("subject");
                          
                     
                         
                         
                        String classid=rs1.getString("classid");
                         int classid1=Integer.parseInt(classid);
                          
                       
                         String date=rs1.getString("date");
                         String time=rs1.getString("time");
                          
                           String classoption=rs1.getString("classoption");
                            String fees=rs1.getString("fees");
                         
                        
                        Class.forName("com.mysql.jdbc.Driver");  
                        Connection conn2=DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor","root","");
                        // Advertisement AD1 = new Advertisement();
                         String sql4="INSERT INTO advertisementdetails(ad_id,subject,date,time,classoption,fees,email, classid) VALUES (?,?,?,?,?,?,?,?)";
                         PreparedStatement pstmt2=conn2.prepareStatement(sql4);
                            pstmt2.setInt(1,ad_id1);
                            
                             pstmt2.setString(2, subject);
                             
                                 pstmt2.setString(3, date);
                                   pstmt2.setString(4, time);
                                pstmt2.setString(5, classoption);
                                 pstmt2.setString(6, fees);
                               
                            pstmt2.setString(7, email);
                            pstmt2.setInt(8, classid1);
                            int a =pstmt2.executeUpdate();
                             
                             if(a>0)
                             {
                                    Class.forName("com.mysql.jdbc.Driver");  
                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor","root","");
                                    String sql="DELETE FROM advertisement WHERE ad_id="+ad_id+"";
                                    PreparedStatement pstmt=conn.prepareStatement(sql);
                                    pstmt.execute(); 
                                        out.println("<script type=\"text/javascript\">");
                                        out.println("alert('advertisment advertised sucessfully...');");
                                        out.println("location='view/Admin/AdminCheckAdvertisement.jsp';");
                                        out.println("</script>");
                             }
                  
                     }
            }
            
            
            
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdminCheckAdvertisement</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminCheckAdvertisement at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AdminCheckAdvertisement.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AdminCheckAdvertisement.class.getName()).log(Level.SEVERE, null, ex);
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
