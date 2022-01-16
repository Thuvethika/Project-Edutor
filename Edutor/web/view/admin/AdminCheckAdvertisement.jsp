<%-- 
    Document   : AdminCheckAdvertisement
    Created on : 20-Oct-2021, 16:40:57
    Author     : thuve
--%>

<%@page import="Model.Advertisement"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.util.Base64"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="javax.swing.ImageIcon"%>
<%@page import="java.awt.Image"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Adrequest_Admin</title>
    <link rel="stylesheet" href="sec_adrequest.css" />
    <link rel="stylesheet" type="text/css" href="../footer/footer.css">
    <link href='https://fonts.googleapis.com/css?family=Exo' rel='stylesheet'>
  <script  src="https://kit.fontawesome.com/7324bdcc98.js" crossorigin="anonymous" ></script>
	<link rel="stylesheet" type="text/css" href="../finalnavbar/TopNavBartest3.css">
	<script src="../finalnavbar/side-nav.js"></script>
  <script src="admin.js"></script>
 
  </head>
  <body>
    <div class="topNavBar row">

      <div id="mySidenav" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a >
    <img src="../Images/EDname.png" class="sidelogo">
        <div class="sidepanel" style="margin-top: 50px">
          <a href="../About.html">About</a>
          <a href="../TermsandConditions.html">Terms and Conditions</a>
          <a href="../Help.html">Help</a>
        </div>
        

      </div>

      <div class="coulmn1">
        <button class="btn"><i class="fa fa-bars" onclick="openNav()"></i></button>
        <img src="../Images/EDname2.png" alt="Logo" class="logo" />
      </div>
      <div class="coulmn2">
        
          
        </div>
        
      <div class="coulmn3">

        <button class="nav-btn" onclick="window.location.href='Admin_Tutor.html'"><i class="fas fa-upload"></i></button>
        <button class="nav-btn" onclick="window.location.href='Admin_Tutor.html'"><i class="fas fa-chalkboard-teacher"></i></button>
        <button class="nav-btn" onclick="window.location.href='Admin_Learner.html'">"<i class="fas fa-user-graduate"></i></button>
        <button class="nav-btn" onclick="window.location.href='Admin_report.html'"><i class="fas fa-video-slash"></i></button>
        <button class="nav-btn" onclick="window.location.href='Admin_Tutor.html'"><i class="fas fa-id-badge"></i></button>
        <button class="nav-btn" onclick="window.location.href='AdminCheckAdvertisement.jsp'"><i class="fas fa-ad"></i></button>
        <button class="nav-btn" onclick="window.location.href='Admin_manualpayment.html'"><i class="fa fa-money"></i></button>
        <button class="nav-btn" onclick="window.location.href='Home_admin.html'"><i class="fas fa-home"></i></button>
      
        <button class="nav-btn2" onclick="window.location.href='../user.html'"><i class="fas fa-user-cog"></i></button>
 
      <button class="dropbtn2" onclick="window.location.href='../index.html'"><i class="fa fa-sign-out"></i> Log Out</button>
    </div>
    </div>
          
    <div class="main2">
    <center>
      <div class="d-flex justify-content-center">
        <!-- ----- Services Section ----------  -->

        <div class="tabContents" id="servicesContainer">
        
            <center>
                 <br><h1 style="text-align:center">Advertisement Details </h1><br>
                 
                   
                 
                <table id="ad_t">
              <tr>
                <th style="border-radius: 15px 0px 0px 0px;">AD ID</th>
                <th>User Email</th>
                <th>First name</th>
                 <th>last name</th>
                <th>Class Name</th>
                <th>Grade</th>
                <th>Medium</th>
                <th>Start Date</th>
                <th>Time</th>
                <th>Class Type</th>
                <th>Fees</th>
                <th style="border-radius: 0px 15px 0px 0px;">Status</th>
              </tr>
              
                   <%
                                try {

                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor", "root", "");
                                    String sql1 = "SELECT ad_id,email,subject,date,time,classoption,fees,classid FROM advertisement";
                                    PreparedStatement pstmt = con.prepareStatement(sql1);
                                    ResultSet rs1 = pstmt.executeQuery();
                                    
                                    

                                    if (rs1.next() == false) {
                                        out.println("No records");

                                    } else {
                            
                                    do {%>
              <form action="<%=request.getContextPath()%>/AdminCheckAdvertisement?ad_id=<%=rs1.getString("ad_id") %> " method="POST">
                                    <tr>
                   <td><%= rs1.getString("ad_id")%></td>                 
                   <td><%= rs1.getString("email")%></td>
                   
                    
                     <%

                                   
                                   String email=rs1.getString("email");
                                     Advertisement A = new Advertisement();
                                     A.setEmail(email);
                                     String sql3 = "SELECT firstname, lastname FROM tutor WHERE email = '" + A.getEmail()+ "'";
                                     PreparedStatement pstmt2 = con.prepareStatement(sql3);
                                    ResultSet rs3 = pstmt2.executeQuery();
                                    
                                    
                                     if (rs3.next() == false) {
                                        out.println("No records");

                                    } else {
                            %><%
                                    do {%> 
                                   <td><%= rs3.getString("firstname")%></td>
                     <td><%= rs3.getString("lastname")%></td>
                                    <%

                                    } while (rs3.next())  ; %>
                                    <td><%= rs1.getString("subject")%></td>  <%

                                   
                                    String classid1=rs1.getString("classid");
                                    int classid2 = Integer.parseInt( classid1);
                                     
                                     A.setClassid(classid2);
                                     
                                    String sql2 = "SELECT grade,medium FROM class WHERE classid = '" + A.getClassid()+ "'";
                                 PreparedStatement pstmt1 = con.prepareStatement(sql2);
                                    ResultSet rs2 = pstmt1.executeQuery();
                                    
                                    
                                     if (rs2.next() == false) {
                                        out.println("No records");

                                    } else {
                            %><%
                                    do {%> 
                                    <td><%= rs2.getString("grade")%></td>
                                    <td><%= rs2.getString("medium")%></td>
                                    <%

                                    } while (rs2.next())  ; %>
                             
                                  <td><%= rs1.getString("date")%></td>
                                    <td><%= rs1.getString("time")%></td>
                                    <td><%= rs1.getString("classoption")%></td>
                                    <td><%= rs1.getString("fees")%></td> 
                                  
               <td>
                  <button  class="dropbtn2" name="decision" value="approve">Approve</button>
                  <button  class="dropbtn2" name="decision" value="delete">Reject</button> 
                  
                </td>
                 </form> </tr><%

                                     }}} while (rs1.next())  ; 

                                  
                                 }} catch (Exception e) {
                                    e.getStackTrace();
                                         }
                            %>
         </table>
        
            </center>
           
        </div>

      </div>
	 
  
    </center>
  
    </center>
  </div>

  </body>
  <div class="footer-bar" >
    <ul>

      <li><a href="facebook"><i class="fab fa-facebook"></i></a></li>
    <li><a href="facebook"><i class=" fab fa-twitter"></i></a></li>
    <li><a href="facebook"><i class="fab fa-google"></i></a></li>
  
      <li><a href="../About.html" style = "position:relative; left:50px">About us</a></li>
      <li><a href="../Help.html" style = "position:relative; left:50px" >Help</a></li>
          <li><a href="../TermsandConditions.html" style = "position:relative; left:50px">Terms and Conditions</a></li>	
  
    </ul>
    
    </div>

</html>
