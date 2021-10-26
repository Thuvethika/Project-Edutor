<%-- 
    Document   : NongraduatedTutorRegister
    Created on : 02-Oct-2021, 00:37:00
    Author     : thuve
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Edutor/signinpage</title>
	<link rel="stylesheet" type="text/css" href="../Style/signin1.css">
	<link rel="stylesheet" type="text/css" href="../footer/footer.css">
	<link rel="stylesheet" type="text/css" href="valid.css">
	<script src="../finalnavbar/TopNavBar.js"></script>
    <link rel="stylesheet" href="../finalnavbar/TopNavBartest.css" />
    <script src="../finalnavbar/side-nav.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <script  src="https://kit.fontawesome.com/7324bdcc98.js" crossorigin="anonymous" ></script>
</head>
<body>
	<div class="topNavBar row">

        <div id="mySidenav" class="sidenav">
          <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a
          >
          <div class="profile-img">
            <img
              src="../Images/person.jpg"
              height="150px"
              style="position: relative; left: 40px; border-radius: 100px"
            />
            <a href="Edit_profile/edit.html"
              ><img
                src="../Images/Edit1.png"
                height="50px"
                style="position: relative; left: 50px; margin-top: -150px"
            /></a>
            
          </div>
          <div class="sidepanel" style="margin-top: 50px">
            <a href="../About.html">About</a>
            <a href="../TermsandConditions.html">Privacy and Policies</a>
            <a href="../Help.html">Help</a>
          </div>
          <div class="profile-img" style="margin-top: 250px"></div>
  
          <img
            src="../Images/ED.png"
            height="150"
            style="position: relative; left: 40px; margin-top: 50px"
          />
        </div>
  
        <div class="coulmn1">
          <button class="btn"><i class="fa fa-bars" onclick="openNav()"></i></button>
          <img src="../Images/ED.png" alt="Logo" class="logo" />
        </div>
        <div class="coulmn2">
          <img src="../Images/ED3.png" alt="Logotitle" style="margin-left: 350px; height: 80px;"/>
        </div>
        <div class="coulmn3">
          
        
        </div>
        <div class="coulmn4" style="text-align: right;">
        
        </div>
        <button class="nav-btn" style="margin-left: 60px;" onclick="window.location.href='../index.html'"><i class="fa fa-home"></i></button>
      </div>

	<div class="main">
		
		<div class="main">

		<br/>		
		<form ENCTYPE="multipart/form-data" action="<%=request.getContextPath()%>/NongraduatedTutorRegister" method="POST">
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
		<input type="text" name="nic" size="40" pattern="^[0-9+]{12}$" pattern="^[0-9+]{9}[vV|xX]$" ><br/><br/>
		
		
		<label for="phoneno">Phone No</label>
		<input type="text" name="phoneno" size="40" pattern="^[0-9+]{10}$" ><br /><br/>
		
		<label for="Qualification">Qualification</label>
		<input type="text" name="qualification" size="40" ><br /><br/>
		
		<label for="emailaddress">Email Address</label>
		<input type="text" name="email" size="40" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" ><br /><br/>
		
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
		<input type="file" name="img" name="upload NIC" >
		
		<a href="signup"><button type="submit" name="submit" class="signup" style = "position:relative; left:230px">Signup</button></a>
		<a href="reset"><button type="reset" class="reset" name="reset" style = "position:relative; left:0px">Reset</button></a>
		
		</div>
		</center>
		</form>
		<br/>
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
		  <script src="valid.js"></script>
		
	
</body>	
</html>
