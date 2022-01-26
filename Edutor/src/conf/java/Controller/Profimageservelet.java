/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Controller.DaoImpl.ProfimageDaoImpl;
import Controller.DaoImpl.ProfimageDaoImpl2;
import Model.Dao.ProfimageDao;
import Model.Dao.ProfimageDao2;
import Model.Profimage;
import Model.Profimage2;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
 * @author Thishan
 */
@WebServlet(name = "Profimageservelet", urlPatterns = {"/Profimage"})
@MultipartConfig(fileSizeThreshold = 1024*1024*2,maxFileSize = 1024*1024*10,maxRequestSize = 1024*1024*50)
public class Profimageservelet extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Profimageservelet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Profimageservelet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        
        HttpSession session8 = request.getSession();
         String email = (String) session8.getAttribute("email");
         
         try (PrintWriter out = response.getWriter()){
             
                Class.forName("com.mysql.jdbc.Driver");  
                Connection conn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor","root","");
                String sql="SELECT  email FROM profimage WHERE email= ? ";
                PreparedStatement pstmt2=conn1.prepareStatement(sql);      
                pstmt2.setString(1,email); 
                    ResultSet rs9 = pstmt2.executeQuery();  
                   
                     if(rs9.next() == false )
                     {
                       
            
             Part filePart = request.getPart("imgprof");
             
            String fileName= extractFileName(filePart);
            String savepath="C:\\Users\\Thishan\\Documents\\NetBeansProjects\\Final-Edutor\\web\\profileimages" +File.separator+fileName;  
            filePart.write(savepath+File.separator);
             
            ProfimageDao profimage = new ProfimageDaoImpl(); 
            Profimage P1 = new Profimage();
            P1.setEmail(email);
            P1.setImgprof(savepath);
            P1.setImgname(fileName);
            
            profimage.addProfimage(P1);
            String site = new String("view/Tutor_Profile/Profile_Tutor.jsp");
                        response.setStatus(response.SC_MOVED_TEMPORARILY);
                        response.setHeader("location", site);
            
        
                  
                         }
                     else {
               
           
             Part filePart = request.getPart("imgprof");
             
            String fileName= extractFileName(filePart);
            String savepath="C:\\Users\\Thishan\\Documents\\NetBeansProjects\\Final-Edutor\\web\\profileimages" +File.separator+fileName;  
            filePart.write(savepath+File.separator);
               
            Profimage P2 = new Profimage();
            P2.setEmail(email);
            P2.setImgprof(savepath);
            P2.setImgname(fileName);
            
            
            
                        Class.forName("com.mysql.jdbc.Driver");  
                        Connection conn2=DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor","root","");
                         String sql2 = "UPDATE profimage SET imgprof= '"+P2.getImgprof()+"',imgname= '"+P2.getImgname()+"' WHERE email = '"+P2.getEmail()+"' ";
                         PreparedStatement pstmt3 =conn2.prepareStatement(sql2);
                          pstmt3.executeUpdate();
            
//            pstmt3.setString(1,P2.getImgprof());
//            pstmt3.setString(2,P2.getImgname());
//            pstmt3.setString(3,P2.getEmail());
            
            
            
            
            
//            ProfimageDao2 profimage2 = new ProfimageDaoImpl2(); 
//            Profimage2 P2 = new Profimage2();
//            
//            P2.setImgprof(savepath);
//            P2.setImgname(fileName);
//            
//            profimage2.addProfimage2(P2);
            
            String site = new String("view/Tutor_Profile/Profile_Tutor.jsp");
                        response.setStatus(response.SC_MOVED_TEMPORARILY);
                        response.setHeader("location", site);
            

                    
           }
         } catch (ClassNotFoundException ex) {
            Logger.getLogger(Profimageservelet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Profimageservelet.class.getName()).log(Level.SEVERE, null, ex);
        }
         
    
   
    }

    private String extractFileName(Part filePart) {
String contentDisp=filePart.getHeader("content-disposition");
        String[] items=contentDisp.split(";");
        for(String s:items)
        {
            if(s.trim().startsWith("filename"))
            {
                return s.substring(s.indexOf("=") +2, s.length()-1);
            }
        }
        return "";
}
       
    }
