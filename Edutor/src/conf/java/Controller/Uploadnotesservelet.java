/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Controller.DaoImpl.UploadnotesDaoImpl;
import Model.Dao.UploadnotesDao;
import Model.Uploadnotes;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
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
@WebServlet(name = "Uploadnotesservelet", urlPatterns = {"/Uploadnotes"})
@MultipartConfig(maxFileSize = 16177216)

public class Uploadnotesservelet extends HttpServlet {

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
            out.println("<title>Servlet Uploadnotesservelet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Uploadnotesservelet at " + request.getContextPath() + "</h1>");
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
        
    
        String button=request.getParameter("button");
             if("upload".equals(button))
              {
       
           String title = request.getParameter("title");
           String description = request.getParameter("description");
           Part note =  request.getPart("filename");
           String fileName= extractFileName(note);
           String savepath="C:\\Users\\Thishan\\Documents\\NetBeansProjects\\Final-Edutor\\web\\T_notes" +File.separator+fileName;  
            note.write(savepath+File.separator);
           
           HttpSession session = request.getSession();
         String email = (String) session.getAttribute("email");
         session.setAttribute("email",email);
            
           HttpSession session3=request.getSession();  
            int classid = (int) session.getAttribute("classid");
            session3.setAttribute("classid",classid);
           try (PrintWriter out = response.getWriter()) {
                
                 //   if (note != null) {
                   //     InputStream inputStream = null;
                   //     inputStream = note.getInputStream();
                        UploadnotesDao uploadnotes = new UploadnotesDaoImpl();
                       Uploadnotes N1 = new Uploadnotes();
                    N1.setTitle(title);
                   N1.setDescription(description); 
                   N1.setFilename(savepath);
                    N1.setImgname(fileName);
                   N1.setEmail(email);
                   N1.setClassid(classid);
                  uploadnotes.addUploadesnotes(N1);
  
            
             String site=new String("view/Tutor_upload/T_upload.jsp");
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("location", site);
              
        } catch (Exception e) {
               
        }
           
              } 
              else if("view".equals(button)){
                 
                String site=new String("view/Tutor_upload/T_notes.jsp");
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("location", site);
              }
           
           
           
              
    }

    private String extractFileName(Part note) {
        String contentDisp=note.getHeader("content-disposition");
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
