<%@page import="Model.Tutor"%>
<%@page import="Model.editprofile"%>
<html>
<head>
	<title>Edutor/edirprofile</title>
	<link rel="stylesheet" type="text/css" href="edit.css">
	<link rel="stylesheet" type="text/css" href="../footer/footer.css">
</head>
<body>
	<div class="main">
		<div class="heading">
		 Edit Profile
		 <img  src="edit1.png" height="80px" width="80px" align="center">
		</div>
		<br/>		
		<form action="<%=request.getContextPath()%>/editprofileservlet" method="POST">
		<center>
		<div class="editform">
		<img  src="edit2.png" height="80px" width="80px" style = "position:relative; left:220"><br/><br/>
		<label for="firstname" >First Name</label>
		<input type="text" name="firstname" size="40"<br /><br/><br/>
		
		<label for="lastname">Last Name</label>
		<input type="text" name="lastname" size="40"><br /><br/>
		
		<label for="address">Address</label>
		<input type="text" name="address" size="40"></br/><br/>
		
		<label for="gender">Gender</label>		
		<input type="text" name="gender" size="40"><br/><br/>
		
		<label for="dob">Date of Birth</label>		
		<input type="date" name="dob" ><br/><br/>
		
		<label for="phoneno">Phone No</label>
		<input type="text" size="40" name="phoneno" ><br /><br/>
                
		
		<a href="signup"><button type="submit" name="button" class="save" value="update" style = "position:relative; left:300px">Update</button></a>
                <a href="reset"><button type="reset" name="button" class="reset" value="reset" style = "position:relative; left:50px">Reset</button></a>
                <<button  class="reset" name="button" value="delete"  style = "position:relative; left:200px">Delete</button>
       
		</div>
		</center>
		<form/>
		<br/>
		<div class="footer-bar" >
			<ul>
				<li><a href="../About.html" style = "position:relative; left:50px">About us</a></li>
				<li><a href="../Help.html" style = "position:relative; left:50px" >Help</a></li>
				<li><a href="../TermsandConditions.html" style = "position:relative; left:50px">Terms and Conditions</a></li>	
		  </ul>
		  <a href="facebook"><img  src="../images/facebook2.png" width="40" height="40" style = "position:relative; left:1350px "></a>
		  <a href="facebook"><img  src="../images/twitter1.png" width="40" height="40" style = "position:relative; left:1350px"></a>
		  <a href="facebook"><img  src="../images/email1.png" width="40" height="40" style = "position:relative; left:1350px"></a>	
		  </div>
		
</body>	
</html>