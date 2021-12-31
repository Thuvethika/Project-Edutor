
<html>
<head>
	<title>Reset Password</title>
	<link rel="stylesheet" type="text/css" href="reset.css">
	<link rel="stylesheet" type="text/css" href="../footer/footer.css">
	<script src="../finalnavbar/TopNavBar.js"></script>
    <link rel="stylesheet" href="../finalnavbar/signupnav.css"/>
    <script src="../finalnavbar/side-nav.js"></script>
	<script src="script2.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
	<link href='https://fonts.googleapis.com/css?family=Exo' rel='stylesheet'>
    <script  src="https://kit.fontawesome.com/7324bdcc98.js" crossorigin="anonymous" ></script>
</head>
<body>

	<div class="topNavBar row">

        <div id="mySidenav" class="sidenav">
          <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a
          >
		  <img src="../Images/EDname.png" class="sidelogo">
          <div class="sidepanel" style="margin-top: 50px">
            <a href="../About.html">About</a><br/>
            <a href="../TermsandConditions.html">Terms and Conditions</a><br/>
            <a href="../Help.html">Help</a>
          </div>
        </div>
  
        <div class="coulmn1">
          <button class="btn"><i class="fa fa-bars" onclick="openNav()"></i></button>
     
        </div>
        <div  class="coulmn2">
          <img src="../Images/EDname2.png"  class="edutorlogo"  alt="Logotitle" />
        </div>
        <div class="coulmn3">
		<button class="nav-btn" onclick="window.location.href='../index.html'"><i class="fas fa-home"></i></button>   
        </div>     
      </div>
	<div class="main">
		<br/>		
		<center>
		<div class="resetform">
			<br>
		<h1> Reset your password</h1><br>
		<h3>Enter the email associated with your account and we will send an OTP</h3> 	
		<br/>
                  <form action="<%=request.getContextPath()%>/forgotemail" method="POST">
		<label for="email"  ><h4>EmailAddress</h4></label><br/>
		<input type="text" name="forgotemail" size="60"/>	
		<br/>
		<br/>

			<button class="enter-btn" style = "position:relative; left:200px" onclick=window.location.href="newpassword.jsp">Enter</button>	
                  </form>
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