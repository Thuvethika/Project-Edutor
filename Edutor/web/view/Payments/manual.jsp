<Doctype html>

<head>
	
	<title>Edutor/payment</title>
	<link rel="stylesheet" type="text/css" href="payment2.css">
	<link rel="stylesheet" href="../finalnavbar/TopNavBartest2.css" />
	<link rel="stylesheet" type="text/css" href="../footer/footer.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"  />
	<link href='https://fonts.googleapis.com/css?family=Exo' rel='stylesheet'>
  <script  src="https://kit.fontawesome.com/7324bdcc98.js" crossorigin="anonymous" ></script>
	<script src="../finalnavbar/side-nav.js"></script>
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
		  <button class="nav-btn" onclick="window.location.href='../Create_advertisement/Create_Advertisement.html'"><i class="fas fa-ad"></i></button>
		  <button class="nav-btn" onclick="window.location.href='Home_Tutor.html'"><i class="fas fa-home"></i></button>
		<!-- </div>
		<div class="coulmn4"> -->
		  <button class="nav-btn2" onclick="window.location.href='../user.html'"><i class="fas fa-user-circle"></i></button>
	
		<button class="dropbtn2" onclick="window.location.href='../index.html'"><i class="fa fa-sign-out"></i> Log Out</button>
	  </div>
	
	</div>
	<div class ="main">
		<div class="heading">
		Payment details
		</div>
		<div class="flexbox">
		
		<div>
		<form action="<%=request.getContextPath()%>/manualpaymentservlet" method="POST" enctype="multipart/form-data">	
		<br/>
		<h2>Attach clear image of the bank slip here</h2>
		<br>
		<h3>Bank : Bank of Ceylon</h3><br>
		<h3>Account holder : EDUTOR</h3><br>
		<h3>Account no : xxxxxxxxxxxxxxx</h3>		
		<div class = "fileupload">
            <input type="file" class="myFile" name="file"><br/>
	    <br>
			 <button type="submit" name="upload" class="Upload-btn" style = "position:relative">upload</button>
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