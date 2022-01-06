<%@page import="Model.Createclass"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Learner home</title>
    <link rel="stylesheet" href="Home_Learner.css" />
    <link rel="stylesheet" type="text/css" href="../footer/footer.css">
    <script  src="https://kit.fontawesome.com/7324bdcc98.js" crossorigin="anonymous" ></script>
	<link rel="stylesheet" type="text/css" href="../finalnavbar/TopNavBartest2.css">
	<script src="../finalnavbar/side-nav.js"></script>
  <script src="../Script/popscript2.js"></script>
  </head>
  <body>
    <div class="topNavBar row">

      <div id="mySidenav" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a >
    <img src="../Images/EDname.png" class="sidelogo">
        <div class="sidepanel" style="margin-top: 50px">
          <a href="../About.html">About</a>
          <a href="../Forum/Learner_Forum.jsp">Forum</a>
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
        <button class="nav-btn" onclick="window.location.href='Home_Learner.jsp'"><i class="fas fa-home"></i></button>
      
        <button class="nav-btn2" onclick="window.location.href='../Learner_Profile/Profile_Learner.jsp'"><i class="fas fa-user-circle"></i></button>
 
      <button class="dropbtn2" onclick="window.location.href='../index.jsp'"><i class="fa fa-sign-out"></i> Log Out</button>
    </div>
 
    
  </div>
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
    <div class="main2">
      <img class="terms" src="../Images/welflex.jpg" alt="welcome" width="100%">
      
   <br>
   <div class="flexbox">
    <div class="tutorform">
  <center>
    <div class="box"  onclick="window.location.href='../Filter/Filter_ad.jsp'">Find Tutor</div>

  </div>
  
  <div class="view2form">
    <form>
  <center>
 <%
        
        try
        {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor", "root", "");
              
              String sql = "select classid,l_email from enrolledclasses where l_email=?";
              PreparedStatement stmt = con.prepareStatement(sql);
             
              HttpSession session1 = request.getSession(false);
         String l_email = (String) session1.getAttribute("email");
              stmt.setString(1,l_email);
              
              ResultSet rs1 = stmt.executeQuery();
              
              
              if(rs1.next()== false)
              {
                  out.println("No records");
                  
              }
              else
              {
                %>
    <table id="mp_t">
      <tr>
        <th style="border-radius: 15px 0px 0px 0px;">Enrolled Classes</th>
        <th style="border-radius: 0px 15px 0px 0px;">Class Code</th>
        
      </tr>
       <%
              do
              {%>
      <tr>
        <td>Tamil</td>
        <td><%= rs1.getString("classid") %></td>
     <%
          }while(rs1.next()); %>
      </tr>
      
      </table><%
            }
}
catch(Exception e)
        {
         e.getStackTrace();
        }
        %>
    
  </center>
</form>
  </div>
    
</div>
  </div>
  <div class="footer-bar" >
    <ul>

    <li><a href="facebook"><i class="fab fa-facebook"></i></a></li>
    <li><a href="facebook"><i class=" fab fa-twitter"></i></a></li>
    <li><a href="facebook"><i class="fab fa-google"></i></a></li>
  
      <li><a href="About.html" style = "position:relative; left:50px">About us</a></li>
      <li><a href="Help.html" style = "position:relative; left:50px" >Help</a></li>
     <li><a href="TermsandConditions.html" style = "position:relative; left:50px">Terms and Conditions</a></li>	
  
    </ul>
    
    </div>
		
  </body>
</html>
