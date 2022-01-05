<%-- 
    Document   : DisplayAnnouncement
    Created on : 18-Oct-2021, 20:33:18
    Author     : thuve
--%>

<%@page import="Model.login"%>
<%@page import="Model.Announcement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Announcements for Tutors</title>
    <link rel="stylesheet" href="Announcements_Tutors.css" />
    <link rel="stylesheet" href="../footer/footer.css" />
    <link rel="stylesheet" href="../finalnavbar/TopNavBartest2.css" />
    <script  src="https://kit.fontawesome.com/7324bdcc98.js" crossorigin="anonymous" ></script>
  <script  src="https://kit.fontawesome.com/7324bdcc98.js" crossorigin="anonymous" ></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
	<link href='https://fonts.googleapis.com/css?family=Exo' rel='stylesheet'>
    <script  src="https://kit.fontawesome.com/7324bdcc98.js" crossorigin="anonymous" ></script>
    <script src="../finalnavbar/side-nav.js"></script>
    <script src="../Script/script.js"></script>
    

   

  </head>
  <body>
    <div class="topNavBar row">
  
      <div id="mySidenav" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a >
    <img src="../Images/EDname.png" class="sidelogo">
        <div class="sidepanel" style="margin-top: 50px">
          <a href="../About.html">About</a>
          <a href="../Learner_home/forum.html">Forum</a>
          <a href="../TermsandConditions.html">Terms and Conditions</a>
          <a href="../Help.html">Help</a>
        </div>
        
  
      </div>
  
      <div class="coulmn1">
        <button class="btn"><i class="fa fa-bars" onclick="openNav()"></i></button>
        <img src="../Images/EDname2.png" alt="Logo" class="logo" />
      </div>
      <div class="coulmn2">
        <div class="dropdown">
          
          
        </div>
        
      </div>
      <div class="coulmn3">
         <button class="nav-btn" onclick="window.location.href='../Tutor_enroll_class/T_enrol.jsp'"><i class="fa fa-group"></i></button>
      <button class="nav-btn" onclick="window.location.href='../Calender/T_calender.html.html'"><i class="fa fa-calendar"></i></button>
        <button class="nav-btn" onclick="displayAd()"><i class="fas fa-ad"></i></button>
        <button class="nav-btn" onclick="window.location.href='../Tutor_home/Home_Tutor.html'"><i class="fas fa-home"></i></button>
      <!-- </div>
      <div class="coulmn4"> -->
        <button class="nav-btn2" onclick="window.location.href='../Tutor_Profile/Profile_Tutor.html'"><i class="fas fa-user-circle"></i></button>
  
      <button class="dropbtn2" onclick="window.location.href='../index.html'"><i class="fa fa-sign-out"></i> Log Out</button>
    </div>
   
    <div class="overlay hidden" id="popWindow">
      <div class="ad-form hidden">
        <div class="user-icon"></div>
        <h3>Fill the details or Upload the advertisement image</h3> 
        <img src="../Images/ED.png" alt="logos" width="150" height="150"><br />
        <div class="row1">
        </a>
           
            <button class="button2" onclick="window.location.href='../Create_advertisement/Create_Advertisements.html'"> Fill Details</button>
        
        <button class="button2"onclick="window.location.href='../Create_advertisement/Advertisement_image.html'">Upload Image</button>
       <br />
       
      
      
      </div>
      </div>
    </div> 
    </div>
       
    <div class="main"> 
      <br><h1 style="text-align:center">Announcement </h1><br>
			<center>
         <div class="ancreate">
        <%--  <form action="<%=request.getContextPath()%>/DisplayAnnouncement" method="POST"> --%>
                        <center>
                            
                            <%
        try 
        {
          //  AnnouncementDao announcement = new AnnouncementDaoImpl();
                HttpSession session1 = request.getSession(false);
                String email = (String) session1.getAttribute("email");
                
                  HttpSession session2 = request.getSession(false);
           
     int classid = ((Integer) session2.getAttribute("classid"));
                Announcement A = new Announcement();
                A.setEmail(email);
                A.setClassid(classid);
              //  announcement.displayAnnnouncement(A);
                
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor", "root", "");
           
            
            String sql2 = "SELECT topic,date,details FROM announcement where email='" + A.getEmail() + "' && classid='" + A.getClassid() + "' ";
             PreparedStatement pstmt1 = con.prepareStatement(sql2);
            ResultSet rs = pstmt1.executeQuery();
            
            if(rs.next()== false)
              {
                  out.println("No records");
                  
              }
              else
              {
               
                 
            
               %>
              <table id="announcement_t">
                                <tr>
                                    <th>Topic</th>
                                    <th>Date</th>
                                    
                                    <th>Details</th>
                                </tr>
                      <% 
                       do{  %> <tr>
                                  
                                    
                                    <td><%= rs.getString("topic") %> </td>
                                    <td><%= rs.getString("date") %></td>
                                  
                                    <td><%= rs.getString("details") %> </td>
                                </tr> <%
                       
                       }while(rs.next()); %>
                       </table><%
                
              }
        }
        catch(Exception e)
        {
         e.getStackTrace();
        }
        %>
                 
              
       
                            
                                <%--     <%
                                    List<Announcement> Announce = (List<Announcement>) session.getAttribute("list");
                                    for (Announcement A1 : Announce) {
                                %> 
                                <tr><td><%=A1.getTopic() %> </td><td><%=A1.getDate() %> </td><td> <%= A1.getLink() %></td><td><%= A1.getDetails() %></td></tr>
	--%>
        
                                
                               
                            
                            <br>
                           
<button class="confirm-btn" onclick="window.location.href= 'CreateAnnouncement.jsp'">Create</button>
                        </center>
                 
        
      </div>
      </center>
		 

    </div> 
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
	
</body>
</html>