<%-- 
    Document   : TutorDetails
    Created on : 04-Jan-2022, 17:32:46
    Author     : thuve
--%>

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
    <title>Tutor Details</title>
    <link rel="stylesheet" href="TutorDetails.css" />
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
                 <h1 style="text-align:center"> Tutor Details </h1><br>
                       
               <table id="announcement_t">
          <tr>
            <th>First Name</th>
            <th>Email</th>
            <th>Further Details</th>  </tr> 
         
              <%    try 
        {
          //  AnnouncementDao announcement = new AnnouncementDaoImpl();
                
                
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor", "root", "");
            String sql2 = "SELECT firstname, email FROM tutor";
             PreparedStatement pstmt1 = con.prepareStatement(sql2);
            ResultSet rs3 = pstmt1.executeQuery();
             
          
            
            if(rs3.next()== false)
              {
                  out.println("No records");
                  
              }
              else
              {
               
                do{   
            
               %>
                
                   
           
          
           <form action="<%=request.getContextPath()%>/AdminManageUser?email2=<%=rs3.getString("email") %> " method="POST">
                 
                       <tr>
                                    <td><%= rs3.getString("firstname") %> </td>
                                    <td><%= rs3.getString("email") %></td>
                                  
                                    <td> <button  class="dropbtn3" name="button3"  value="view" > Manage</button></td>
                                </tr>   </form>
                      <%
                       
                       }while (rs3.next()); %>
          <%
                
              }
        }
        catch(Exception e)
        {
         e.getStackTrace();
        }
        %> </table>
         
      
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

