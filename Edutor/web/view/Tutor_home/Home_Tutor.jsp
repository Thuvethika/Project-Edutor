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
    <title>Home_Tutor</title>
    <link rel="stylesheet" href="tutor-home.css" />
    <link rel="stylesheet" href="slide.css" />
    <link rel="stylesheet" href="../footer/footer.css" />
    <link rel="stylesheet" href="../finalnavbar/TopNavBartest2.css" />
    <script  src="https://kit.fontawesome.com/7324bdcc98.js" crossorigin="anonymous" ></script>
    <link href='https://fonts.googleapis.com/css?family=Exo' rel='stylesheet'>
    <script src="../finalnavbar/side-nav.js"></script>
    <script src="../Script/adscript.js"></script>
     <script src="../Script/popscript.js"></script>

   

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
      <button class="nav-btn" onclick="displayManage()"><i class="fa fa-group"></i></button>
      <button class="nav-btn" onclick="window.location.href='../Calender/T_calender.jsp'"><i class="fa fa-calendar"></i></button>
      <button class="nav-btn" onclick="displayAd()"><i class="fas fa-ad"></i></button>
      <button class="nav-btn" onclick="window.location.href='Home_Tutor.jsp'"><i class="fas fa-home"></i></button>
    <!-- </div>
    <div class="coulmn4"> -->
      <button class="nav-btn2" onclick="window.location.href='../Tutor_Profile/Profile_Tutor.jsp'"><i class="fas fa-user-circle"></i></button>

    <button class="dropbtn2" onclick="window.location.href='../index.jsp'"><i class="fa fa-sign-out"></i> Log Out</button>
  </div>

  <div class="overlay hidden" id="popWindow">
      
    <div class="ad-form hidden">
      <div class="user-icon"></div>
      <h3>Fill the details or Upload the advertisement image</h3> 
      <img src="../Images/ED.png" alt="logos" width="150" height="150"><br />
      <div class="row">
       
         
          <button class="button2" onclick="window.location.href='../Create_advertisement/Create_Advertisements.html'"> Fill Details</a></button>
      
      <button class="button2"onclick="window.location.href='../Create_advertisement/Advertisement_image.html'">Upload Image</button>
     <br />
     
    
    
    </div>
    </div>
        
  </div> 
      <center>
           <form action="<%=request.getContextPath()%>/Manageclass" method="POST"> 
      <div class="overlay2 hidden" id="popWindow2">
      <div class="manage-form hidden">
         
        <div class="user-icon"></div>
        <br /><h1>Manage Class</h1> <br />
        <br><img src="../Images/ED.png" alt="logos" width="150" height="150">
        
        <br>
            <label for="classid">Class ID</label>
            <input type="text" name = "classid"><br/><br/>
            <button class="button2" > Manage</a></button>
      
      </div>
    </div>
           </form> 
      </center>
  </div>



        
    <div class="main4"> 
      
      <img class="terms" src="../Images/welflex.jpg" alt="welcome" width="100%">
<br><br>

			<div class="flexbox">
        <div class="classform">
         <form action="<%=request.getContextPath()%>/Createclass" method="POST">   
      <center>
      <img  src="../Images/teach.png"  width="150px" style = "position:relative;"><br/><br/>
      <h3>Create New Class</h3>
      <br><br>
      <label for="classname">Subject</label>
      <input type="text" name= "classname" size="40"><br/><br/>
      
      <label for="grade">Grade</label>
      <input type="text" name= "grade" size="40"><br /><br/>
      
      <label for="medium">Medium</label>
      <select name="medium" id="selectThis" style="width: 300px; height:40px; font-size: 15px; border :2px solid">
                                                     
            <option value="English">English</option> 
								<option value="Tamil">Tamil</option>
								<option value="Sinhala">Sinhala</option>
								
							</select>
      
      <br><br>
      <button type="submit" class="save" style = "position:relative;">Create</button>
    </center>
      
       </form>
  
      </div>
    
      <div class="viewform">
        <form>
      <center>
     <%
        
        try
        {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor", "root", "");
              
              String sql = "select classname,classid,grade,email from class where email=?";
              PreparedStatement stmt = con.prepareStatement(sql);
             
              HttpSession session1 = request.getSession(false);
         String email = (String) session1.getAttribute("email");
              stmt.setString(1,email);
              
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
            <th style="border-radius: 15px 0px 0px 0px;">My Classes</th>
            <th>Class Code</th>
            <th style="border-radius: 0px 15px 0px 0px;">Grade</th>
            
          </tr>
           <%
              do
              {%>
          <tr>
            <td> <%= rs1.getString("classname") %> </td>
            <td> <%= rs1.getString("classid") %> </td>
            <td> <%= rs1.getString("grade") %> </td>
            <%
          }while(rs1.next()); %>
            
        
        
          </tr>
      
          </table> <%
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