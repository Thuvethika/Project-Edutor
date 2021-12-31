<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login</title>
    <link rel="stylesheet" href="Style/login.css" />
    <link rel="stylesheet" href="footer/footer.css" />
    <script src="finalnavbar/TopNavBar.js"></script>
    <link rel="stylesheet" href="finalnavbar/signupnav.css"/>
    <script src="finalnavbar/side-nav.js"></script>
    <link href='https://fonts.googleapis.com/css?family=Exo' rel='stylesheet'>
    <script  src="https://kit.fontawesome.com/7324bdcc98.js" crossorigin="anonymous" ></script>
  </head>
  <body>
    <div class="main">
      <div class="topNavBar row">

        <div id="mySidenav" class="sidenav">
          <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a
          >
		  <img src="Images/EDname.png" class="sidelogo">
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
          <img src="Images/EDname2.png"  class="edutorlogo"  alt="Logotitle" />
        </div>
        <div class="coulmn3">
		<button class="nav-btn" onclick="window.location.href='../index.html'"><i class="fas fa-home"></i></button>
        
        </div>
       
      </div>
<form action="<%=request.getContextPath()%>/login" method="POST">
     
    <center>
      <div class="lgn">
        <img src="Images/ED.png" alt="logos" width="200" height="200"><br>
        <label for="email"><h2 style="color:black"> Email Address</h2></label><br />
       <input type="text" name="email" aria-label="E-Mail Address" /><br />
        <label for="password"><h2 style="color:black"> Password</h2></label><br />
       <input type="password" name="password" aria-label="Password" /><br />
        <br>
        <button class="log-btn"onclick=window.location.href='Learner home page/learner-home.html'>Login</button>
        <br><br><br>
        <a href="Reset/reset.jsp">Forgot Password</a>
        </div>
    </center>
</form>
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
