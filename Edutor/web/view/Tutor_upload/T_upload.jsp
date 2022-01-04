<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
	<title>Tutor / Upload </title>
	<link rel="stylesheet" type="text/css" href="../finalnavbar/TopNavBartest2.css">
	<link rel="stylesheet" type="text/css" href="../footer/footer.css">
	<script  src="https://kit.fontawesome.com/7324bdcc98.js" crossorigin="anonymous" ></script>
	<script src="../finalnavbar/side-nav.js"></script>
    <link rel="stylesheet" type="text/css" href="Upload.css">
	<link href='https://fonts.googleapis.com/css?family=Exo' rel='stylesheet'>
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
		  <button class="nav-btn2" onclick="window.location.href='../user.jsp'"><i class="fas fa-user-circle"></i></button>
	
		<button class="dropbtn2" onclick="window.location.href='../index.jsp'"><i class="fa fa-sign-out"></i> Log Out</button>
	  </div>
	
	</div>
				
					
<div class="main">
			
			  

			   <div class="Tutorclass">
				   <div>
					   <br>
			<h1> Uploaded Files</h1>
		<br> <center>  
                   
                    		<%
        try
        {
            HttpSession session3=request.getSession(false);  
                int classid =(int)session3.getAttribute("classid");
            Class.forName("com.mysql.jdbc.Driver").newInstance();
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor", "root", "");
              String sql = "select title, classid from notes where classid = ?";
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
				<table id="mp_t">
                                   
					<tr>
					  <th style="border-radius: 15px 15px 0px 0px;">Title</th>
                                          
					</tr>
					<%
                       do
                       {%>
                       <tr>
                           <td>  <%= rs.getString("title") %> </td> </tr><%
                           
                       }while(rs.next()); %>
                       
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
				
        <div style="flex-grow: 8">
            <form action="<%=request.getContextPath()%>/Uploadnotes" method="POST" enctype="multipart/form-data">  
			<br>
			<h1> Upload learning materials</h1>
			<br>
			
			<h4>Title</h4>
			<input type="text" placeholder="Title" name="title"  style = "position:relative" > <br/>
			<h4>Description</h4>
			<textarea name="description" rows="4" cols="50"></textarea>
			
			<div class = "fileupload">
            <input type="file" class="myFile" name="filename"><br/>

            
			</div>
			<br>
			<br>
			<button class="Upload-btn" name="button" value="upload" style = "position:relative">
				Upload</button>	
                        <button class="Upload-btn" name="button" value="view" style = "position:relative">View</button>	
		</form>
		</div>
		</div>
            
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
