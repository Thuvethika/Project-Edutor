<%-- 
    Document   : AdminDeleteLearner
    Created on : 26-Nov-2021, 21:42:21
    Author     : thuve
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="Model.DeleteUser"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Learner_Admin</title>
    <link rel="stylesheet" href="sec_delete.css" />
    <link rel="stylesheet" type="text/css" href="../footer/footer.css">
    
  <script  src="https://kit.fontawesome.com/7324bdcc98.js" crossorigin="anonymous" ></script>
	<link rel="stylesheet" href="../finalnavbar/TopNavBartest3.css" />
    <link href='https://fonts.googleapis.com/css?family=Exo' rel='stylesheet'>
	<script src="../finalnavbar/side-nav.js"></script>
  <script src="admin.js"></script>
  <script src="https://kit.fontawesome.com/7324bdcc98.js" crossorigin="anonymous"></script>
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

        <button class="nav-btn" onclick="window.location.href='Admin_Tutor.html'"><i class="fas fa-chalkboard-teacher"></i></button>
        <button class="nav-btn" onclick="window.location.href='Admin_Learner.html'">"<i class="fas fa-user-graduate"></i></button>
        <button class="nav-btn" onclick="window.location.href='Admin_report.html'"><i class="fas fa-video-slash"></i></button>
        <button class="nav-btn" onclick="window.location.href='Admin_adrequest.html'"><i class="fas fa-ad"></i></button>
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
          <h1>Manage Learner</h1><br>
          <div class="enrolbox">
          
  <br>
  <br>
  <div>
      <form action="<%=request.getContextPath()%>/AdminDeleteLearner" method="POST"> 
        <% 
      try{
      HttpSession session1 = request.getSession(false);
                String email2 = (String) session1.getAttribute("email5");
           DeleteUser user = new DeleteUser();
            user.setEmail(email2);
            Class.forName("com.mysql.jdbc.Driver");  
                  Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor","root","");
                   String sql="SELECT firstname,lastname,address,gender,dob,phoneno FROM learner where email='"+ user.getEmail()+"'";            
                                PreparedStatement pstmt=conn.prepareStatement(sql);                
                                ResultSet rs= pstmt.executeQuery(); 
                                
                                 if(rs.next())
                                 {
                       do
                       {%>   
  <label for="firstname" >First Name</label>
   <input type="text" name="firstname" size="40" value="<%= rs.getString("firstname") %>"><br><br/>
    
    <label for="lastname">Last Name</label>
    <input type="text" name="lastname" size="40" value="<%= rs.getString("lastname") %>"><br /><br/>
    
    <label for="address">Address</label>
    <input type="text" name="address" size="40" value="<%= rs.getString("address") %>"></br/><br/>
    
    <label for="gender">Gender</label>		
    <input type="text" name="gender" size="40" value="<%= rs.getString("gender") %>"><br/><br/>
    
    <label for="dob">Date of Birth</label>		
   <input type="date" name="dob" value="<%= rs.getString("dob") %>" ><br/><br/>
    
    <label for="phoneno">Phone No</label>
    <input type="text" size="40" name="phoneno" value="<%= rs.getString("phoneno") %>" ><br /><br/>
    
                                                <%
                       
                       }while(rs.next()); %>
                
             
                                                     <%
                                 }
        }
               
        catch(Exception e)
        {
         e.getStackTrace();
        }
 
    %>      
  
    <a href="reset"><button value="reset" type="reset" class="del-btn" name="button2" >Reset</button></a>
    <a href="signup"><button type="submit" class="del-btn" name="button2" value="update1" >Save</button></a>
    
    <button  class="del-btn" name="button2" value="delete1"  >Delete</button>
      </form>
  </div>
  </div>
          
          
        </div>
        <!-- <img  src="edit2.png" height="80px" width="80px" style = "position:relative; left:220"><br/><br/> -->
       
      </div>
  
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
