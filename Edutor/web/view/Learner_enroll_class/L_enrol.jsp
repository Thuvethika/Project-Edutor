<%@page import="Model.Createclass"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enrol Learner</title>
    <link rel="stylesheet" href="L2_enrol.css" />
    <link rel="stylesheet" href="STrate.css" />
    <link rel="stylesheet" href="../footer/footer.css" />
    <link rel="stylesheet" href="../finalnavbar/TopNavBartest2.css" />
    <link href='https://fonts.googleapis.com/css?family=Exo' rel='stylesheet'>
    <script src="../finalnavbar/side-nav.js"></script>
    <script src="https://kit.fontawesome.com/7324bdcc98.js" crossorigin="anonymous"></script>
    <script src="../Script/popscript2.js"></script>
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
        <button class="dropbtn" onclick="window.location.href='../Filter/Filter_ad.jsp'">Find Tutor</button>
        
      </div>
      
    </div>
    <div class="coulmn3">
      <button class="nav-btn" onclick="displayManage()"><i class="fa fa-book"></i></button>
      <button class="nav-btn" onclick="window.location.href='../Calender/T_calender.jsp'"><i class="fa fa-calendar"></i></button>
      <button class="nav-btn" onclick="window.location.href='../Invite/Invite_Friends.jsp'"><i class="fas fa-user-plus"></i></button>
      <button class="nav-btn" onclick="window.location.href='../Learner_home/Home_Learner.jsp'"><i class="fas fa-home"></i></button>
    
      <button class="nav-btn2" onclick="window.location.href='../Learner_Profile/Profile_Learner.jsp'"><i class="fas fa-user-circle"></i></button>

    <button class="dropbtn2" onclick="window.location.href='../index.jsp'"><i class="fa fa-sign-out"></i> Log Out</button>
  </div>

</div>
<center>
    <form action="<%=request.getContextPath()%>/Manageclass2" method="POST"> 
<div class="overlay3 hidden" id="popWindow3">
  <div class="manage-form hidden">
      <div class="user-icon"></div>
      <br /><h1>Manage Class</h1> <br />
      <br><img src="../Images/ED.png" alt="logos" width="150" height="150">
      
      <br>
          <label for="classid">Class ID</label>
           <select name="classid" id="selectThis" style="width: 300px; height:30px; font-size: 15px; border :2px solid">
       
                    
                        
  <%
        try 
        {
          //  AnnouncementDao announcement = new AnnouncementDaoImpl();
                HttpSession session1 = request.getSession(false);
                String email = (String) session1.getAttribute("email");
                Createclass A = new Createclass();
                A.setEmail(email);
              //  announcement.displayAnnnouncement(A);
                
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor", "root", "");
           
            
            String sql2 = "SELECT classid FROM enrolledclasses where l_email='" + A.getEmail() + "'";
             PreparedStatement pstmt1 = con.prepareStatement(sql2);
            ResultSet rs = pstmt1.executeQuery();
            
            if(rs.next()== false)
              {
                  out.println("No records");
                  
              }
              else
              {
               
                 
            
               %>
              
                      <% 
                       do{  %> 
                                   <option ><%= rs.getString("classid") %></option>
                           
                                    
                                    <%
                       
                       }while(rs.next()); %>
                      <%
                
              }
        }
        catch(Exception e)
        {
         e.getStackTrace();
        }
        %>  </select>
          <br/><br/>
          <button class="button2" > Manage</a></button>
      
     </div>
    

</div>
    </form>
</center>
    <div class="main"> 
      <center>
        <div class="overlay hidden" id="popWindow">
          <div class="link-form hidden">
            <br />
            <h2>Link ?</h2>
            <br />
            <h2>(.......................)</h2>
            <br />
          </div>
        </div>
      </center>
      <center>
        <div class="overlay2 hidden" id="popWindow2">
          <div class="rating-form hidden">
            <form action="<%=request.getContextPath()%>/Starrate" method="POST"> 
            <br>
            <br>
            <h2>Give your rating</h2>
            <br>
          
            <ul class="rate-area">
              <input type="radio" id="5-star" name="rating" value="5" /><label for="5-star" title="Amazing">5 stars</label>
              <input type="radio" id="4-star" name="rating" value="4" /><label for="4-star" title="Good">4 stars</label>
              <input type="radio" id="3-star" name="rating" value="3" /><label for="3-star" title="Average">3 stars</label>
              <input type="radio" id="2-star" name="rating" value="2" /><label for="2-star" title="Not Good">2 stars</label>
              <input type="radio" id="1-star" name="rating" value="1" /><label for="1-star" title="Bad">1 star</label>
            </ul>
         <br>
         <br>
         <br>
         <br>
         
         <br>
            <button class="notes-btn" style="position: relative; left: 0px" >Save Rating</button>
            </form>
          </div>
        </div>
      </center>

     <center>
      <div class="lgn">
			
				<h1 style="color:#162345">Manage Classes</h1><br>
			
        <div class="enrolbox">
          <div>
        
        <img src="../Images/tuk2.png" alt="tut" class="tut" />
	</div>
<br>
<br>
<div>
  <br>
  <br>
 <%
        
        try
        {
            HttpSession session3=request.getSession(false);  
                int classid =(int)session3.getAttribute("classid"); 
             Class.forName("com.mysql.jdbc.Driver").newInstance();  
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor", "root", "");
             String sql = "select grade,medium,classname,classid from class where classid= ?";
              PreparedStatement stmt1 = con.prepareStatement(sql);
          
              stmt1.setInt(1,classid); 
              ResultSet rs2 = stmt1.executeQuery();
              
             
              if(rs2.next()== false)
              {
                  out.println("No Classes");
                  
              }
              else
              {
                %>
<table id="cl_t">
  <tr>
    <th style=" border-radius: 15px 0px 0px 0px;">Subject</th>
    <th>Grade</th>
    <th style="border-radius: 0px 15px 0px 0px;">Medium</th>
  </tr>
   <%
       do
      {%>
  <tr>
    <td><%= rs2.getString("classname") %></td>
    <td><%= rs2.getString("grade") %></td>
    <td><%= rs2.getString("medium") %></td>
     <%
          }while(rs2.next()); %>
  </tr>
  
</table>
   <%
            }
}
catch(Exception e)
        {
         e.getStackTrace();
        }
        %>
        
</div>
</div>
<br>
<button
class="starrating-btn"
style="position: relative; left: 0px"
onclick="displaySTAR()"
>
Rate Class
</button>

<button
class="annoucement-btn"
style="position: relative; left: 0px"
onclick="window.location.href='../Announce/DisplayAnnouncement.jsp'"
>
Annoucements
</button>

<button
class="notes-btn"
style="position: relative; left: 0px"
onclick="window.location.href='../Learner_home/L_notes2.jsp'"
>
Notes
</button>
<button
class="annoucement-btn"
style="position: relative; left: 0px"
onclick="window.location.href='QuizLink_Learners.jsp'"
>
View link
</button>

<button
class="notes-btn"
style="position: relative; left: 0px"
onclick="window.location.href='../Quiz/Attempt_quiz.html'"
>
Attempt quiz
</button>
</div>
<div>


<br />


          </div>
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
<script src="script3.js"></script>
    <script src="script4.js"></script>
</html>