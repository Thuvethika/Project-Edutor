/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Controller.DaoImpl.InsertAdsDaoImpl;
import Model.Dao.InsertAdsDao;
import Model.InsertAds;
import java.io.File;
import java.io.IOException;
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
import javax.servlet.http.Part;

/**
 *
 * @author Thishan
 */
@WebServlet(name = "Insertadsservelet", urlPatterns = {"/InsertAds"})
@MultipartConfig(maxFileSize = 16177216)
public class Insertadsservelet extends HttpServlet {

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
            out.println("<title>Servlet Insertadsservelet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Insertadsservelet at " + request.getContextPath() + "</h1>");
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
         Part adv =  request.getPart("ads");
        String email = request.getParameter("email");
            int classid = Integer.parseInt(request.getParameter("classid"));
            
            String Ads= extractFileName(adv);
           String savepath="C:\\Users\\Thishan\\Documents\\NetBeansProjects\\Final-Edutor\\web\\Adminads" +File.separator+Ads;  
            adv.write(savepath+File.separator);
            
             try (PrintWriter out = response.getWriter()) {
                  InsertAdsDao insertads = new InsertAdsDaoImpl();
                       InsertAds I1 = new InsertAds();
                       I1.setAds(savepath);
                 I1.setImgname(Ads);
              
                   I1.setEmail(email);
                   I1.setClassid(classid);
                   insertads.addInsertAds(I1);
                   
                 String site=new String("view/admin/Addads.jsp");
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("location", site);
             } catch (SQLException ex) {
            
        }
            
            
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

    private String extractFileName(Part adv) {
        
       String contentDisp=adv.getHeader("content-disposition");
        String[] items=contentDisp.split(";");
        for(String s:items)
        {
            if(s.trim().startsWith("ads"))
            {
                return s.substring(s.indexOf("=") +2, s.length()-1);
            }
        }
        return "";
    }

}
