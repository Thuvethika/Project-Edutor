<html>
<head>
	<title>Invite Friends</title>
	<link rel="stylesheet" type="text/css" href="Invite_Friends.css">
	<link rel="stylesheet" type="text/css" href="../footer/footer.css">
    <script src="../finalnavbar/TopNavBar.js"></script>
    <link rel="stylesheet" href="../finalnavbar/TopNavBartest2.css" />
	<link href='https://fonts.googleapis.com/css?family=Exo' rel='stylesheet'>

    <script src="../finalnavbar/side-nav.js"></script>
    
    <script  src="https://kit.fontawesome.com/7324bdcc98.js" crossorigin="anonymous" ></script>
</head>
<body>
	<div class="main2">
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
				<button class="dropbtn" onclick="window.location.href='../Filter/Filter_ad.html'">Find tutor</button>
				
			  </div>
			  
			</div>
			<div class="coulmn3">
			  <button class="nav-btn" onclick="window.location.href='../Learner_enroll_class/L_enrol.html'"><i class="fa fa-book"></i></button>
			  <button class="nav-btn" onclick="window.location.href='../Calender/T_calender.html.html'"><i class="fa fa-calendar"></i></button>
			  <button class="nav-btn" onclick="window.location.href='../In'"><i class="fas fa-plus"></i></button>
			  <button class="nav-btn" onclick="window.location.href='../Learner_home/Home_Learner.jsp'"><i class="fas fa-home"></i></button>
			
			  <button class="nav-btn2" onclick="window.location.href='../user.html'"><i class="fas fa-user-circle"></i></button>
	   
			<button class="dropbtn2" onclick="window.location.href='../index.jsp'"><i class="fa fa-sign-out"></i> Log Out</button>
		  </div>
		 	</div>	
		  
		<center>
			<div class="lgn">
                            <form action="<%=request.getContextPath()%>/invitefreindsservlet" method="POST">
                                <img src="../Images/ED.png" alt="logos" width="200" height="200"><br><br>
				 <label for="email"><h4 style="color:#162345">Enter Email Address</h4> </label><br>                         
				<input type="text" name="email" aria-label="E-Mail Address" /><br>
				<br>
				<button class="invite-btn2" onclick="">Send Invite</button>
                                </form>
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