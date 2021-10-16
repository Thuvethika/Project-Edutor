<%-- 
    Document   : NongraduatedTutorRegister
    Created on : 02-Oct-2021, 00:37:00
    Author     : thuve
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edutor/signinpage</title>
	<link rel="stylesheet" type="text/css" href="../Style/signin1.css">
	<link rel="stylesheet" type="text/css" href="../footer/footer.css">
	<link rel="stylesheet" type="text/css" href="valid.css">
    </head>
    <body>
       <div class="main">
		<div class="smallbar">
			<marquee width="60%" direction="left" height="100px">Welcome to Edutor & learn smart with us...</marquee>
			</div>
		<div class="main">

		<br/>		
		<form action="<%=request.getContextPath()%>/NongraduatedTutorRegister" method="POST">
		<center>
		<div class="singinform">
		<label for="Registration" style = "position:relative; left:200px" >Registration</label><br/><br/>
		
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
		
		<label for="nic">NIC</label>		
		<input type="text" name="nic" size="40" ><br/><br/>
		
		
		<label for="phoneno">Phone No</label>
		<input type="text" name="phoneno" size="40" ><br /><br/>
		
		<label for="Qualification">Qualification</label>
		<input type="text" name="qualification" size="40" ><br /><br/>
		
		<label for="emailaddress">Email Address</label>
		<input type="text" name="email" size="40" ><br /><br/>
		
		<label for="password">Password</label>
		<input type="password" id="psw" name="password" size="40" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required><br /><br/>

		<div id="message">
			<p>Password must contain the following:</p>
			<div class="row">
				<div class="column">
					<p id="letter" class="invalid">A <b>lowercase</b> letter</p>
					<p id="capital" class="invalid">A <b>capital (uppercase)</b> letter</p> 
				</div>
				<div class="column">
					<p id="number" class="invalid">A <b>number</b></p>
					<p id="length" class="invalid">Minimum <b>8 characters</b></p>
				</div>
			  </div>
				</div>
		
		<label for="retypepassword">Re-type password</label>
		<input type="password" id="psw" name="retypepassword" size="40" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required><br /><br/>
		
		<h5>Please Upload your NIC true copy here with certification of GS or JP</h5>		
		<input type="file" name="img" >
		
		<a href="signup"><button type="submit" class="signup" style = "position:relative; left:230px">Signup</button></a>
		<a href="reset"><button type="reset" class="reset" style = "position:relative; left:0px">Reset</button></a>
		
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
		  <script src="valid.js"></script>
		</div>
    </body>
</html>