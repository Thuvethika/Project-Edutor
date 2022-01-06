/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.DaoImpl;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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
 * @author user
 */
@WebServlet(name = "imgadvertise", urlPatterns = {"/imgadvertise"})
@MultipartConfig(fileSizeThreshold = 1024*1024*2,maxFileSize = 1024*1024*10,maxRequestSize = 1024*1024*50)
public class imgadvertise extends HttpServlet {

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
          
            int classid=Integer.parseInt(request.getParameter("classid"));
            String fees = request.getParameter("fees");
            
            HttpSession session=request.getSession(false);  
            String email=(String)session.getAttribute("email");
            
            Part filePart = request.getPart("advfile");
            
            String fileName= extractFileName(filePart);
            
            String savepath="C:\\Users\\user\\Documents\\NetBeansProjects\\finalEdutor\\web\\view\\Admin\\imgadvertise" +File.separator+fileName;
            
            File fileSavedir=new File(savepath);
          
            filePart.write(savepath+File.separator);
            
            try {
                out.println("success");
                Class.forName("com.mysql.jdbc.Driver");
            Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor","root","");           
            String sql="INSERT INTO customadvertisement( uploadimage, imgname,fees, email, classid) VALUES (?,?,?,?,?)";
                
            PreparedStatement pstmt=conn.prepareStatement(sql);
            
            
            pstmt.setString(1, savepath);
            pstmt.setString(2, fileName);
             pstmt.setString(3, fees);
            pstmt.setString(4, email);
            pstmt.setInt(5, classid);
            

            pstmt.executeUpdate();
                 out.println("<script type=\"text/javascript\">");
                out.println("alert('adverstisment sent to the admin...');");
                out.println("location='view/Tutor_home/Home_Tutor.jsp';");
                out.println("</script>");
             
                
            } catch (Exception e) {
                out.println(e);
            }
            
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
    }// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
