<%@page import="Model.Createclass"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Learners Details</title>
    <link rel="stylesheet" href="L_details.css" />
    <link rel="stylesheet" href="../footer/footer.css" />
    <link rel="stylesheet" href="../finalnavbar/TopNavBartest2.css" />
    <link href='https://fonts.googleapis.com/css?family=Exo' rel='stylesheet'>
    <script src="../finalnavbar/side-nav.js"></script>
    <script src="https://kit.fontawesome.com/7324bdcc98.js" crossorigin="anonymous"></script>
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
		  <button class="nav-btn" onclick="window.location.href='../Tutor_enroll_class/T_enrol.html'"><i class="fa fa-group"></i></button>
		  <button class="nav-btn" onclick="window.location.href='../Calender/T_calender.html.html'"><i class="fa fa-calendar"></i></button>
		  <button class="nav-btn" onclick="window.location.href='../Tutor_upload/T_upload.html'"><i class="fas fa-ad"></i></button>
		  <button class="nav-btn" onclick="window.location.href='../index.html'"><i class="fas fa-home"></i></button>
		<!-- </div>
		<div class="coulmn4"> -->
		  <button class="nav-btn2" onclick="window.location.href='../user.html'"><i class="fas fa-user-circle"></i></button>
	
		<button class="dropbtn2" onclick="window.location.href='../index.html'"><i class="fa fa-sign-out"></i> Log Out</button>
	  </div>
	
	</div>
			
        
    <div class="main"> 
      <br>
      <h1 style="text-align:center">Details of the Learners </h1><br>
			<center>
      <div class="ancreate">
       <center>
           <%
        try
        {
            HttpSession session3=request.getSession(false);  
                int classid =(int)session3.getAttribute("classid");
            Class.forName("com.mysql.jdbc.Driver").newInstance();
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor", "root", "");
              String sql = "select l_email, classid from enrolledclasses where classid = ?";
              PreparedStatement stmt3 = con.prepareStatement(sql);
              stmt3.setInt(1,classid); 
              ResultSet rs = stmt3.executeQuery();
              if(rs.next()== false)
              {
                  out.println("No rcords");
                  
              }
              else
              {
                %>
        <table id="announcement_t">
          <tr>
            <th>Learner Mail</th>
            <th>First name</th>
            <th>last name</th>
             <th>Gender</th>
                 
          
          </tr>
          	<%
                       do
                       {%>
             <tr>
                           <td>  <%= rs.getString("l_email") %> </td>
                           <%
        
                             String email=rs.getString("l_email");
                                     Createclass C2 = new Createclass();
                                     C2.setEmail(email);
                                     String sql3 = "SELECT firstname, lastname,gender FROM learner WHERE email = '" + C2.getEmail()+ "'";
              
             
              PreparedStatement stmt = con.prepareStatement(sql3);
             
         
              ResultSet rs1 = stmt.executeQuery();
              
              
              if(rs1.next()== false)
              {
                  out.println("No records");
                  
              }
              else
              {
                %>
                <td>  <%= rs1.getString("firstname") %> </td>
                <td>  <%= rs1.getString("lastname") %> </td>
                <td>  <%= rs1.getString("gender") %> </td>
             </tr>
             <%
                           
                    }   }while(rs.next()); %>
                       
                </table><% 
                
              }
        }
        catch(Exception e)
        {
         e.getStackTrace();
        }
        %>
            
           
         
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