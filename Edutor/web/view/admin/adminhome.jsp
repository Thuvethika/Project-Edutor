<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Home_Admin</title>
    <link rel="stylesheet" href="sec.css" />
    <link rel="stylesheet" type="text/css" href="../footer/footer.css">
    <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
  />
    
	<link rel="stylesheet" type="text/css" href="TopNavadmin.css">
	<script src="../finalnavbar/side-nav.js"></script>
  <script src="admin.js"></script>
  <script
      src="https://kit.fontawesome.com/7324bdcc98.js"
      crossorigin="anonymous"
    ></script>
  </head>
  <body>
    <div class="topNavBar row">

      <div id="mySidenav" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a
        >
        <div class="profile-img">
          <img
            src="../Images/Admin.png"
            width="140px"
            style="position: relative; left: 60px; border-radius: 100px"
          />
          
          
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
        <img src="../Images/NewLogo.png" alt="Logo" class="logo" />
      </div>
      <div class="coulmn2">
        <input
          type="text"
          placeholder="  Search..."
          name="search"
          style="position: absolute; left: 527px; color: black"
        />
      </div>
      <div class="coulmn3">
        <button class="nav-btn" onclick="window.location.href='User_delete.html'"> <i class="fa fa-trash-o"></i></i></button>
        <button class="nav-btn"><i class="fas fa-video-slash"></i></button>
        <button class="nav-btn"><i class="fas fa-ad"></i></button>
        <button class="nav-btn"><i class="fa fa-money"></i></button>
      </div>
     
      <div class="coulmn4">
        <img src="../Images/Admin.png" alt="admin" width="50px" style="float: right; margin: 15px 0px 0px 60px;">
      </div>
    
      <button class="logOut"><i class="fa fa-sign-out"></i> Log Out</button>
    </div>
          
    <div class="main2">
    <center>
      <div class="d-flex justify-content-center">
        <!-- ----- Services Section ----------  -->

        <div class="tabContents" id="servicesContainer">
          <!-- Row  -->
          <div class="row">
            <!-- Column -->
            <div class="col-md-4 wrap-service5-box">
              <div class="card card-shadow card-bg">
                <div class="card-body border">
                    <i class="fas fa-user-times list-icons"></i>
                    <h4 class="font-weight-medium">Delete User</h4>
                    <h2 class="Div123" style="font-size: 15">More >>></h2>
                    <p class="listText">
                      Delete the User from the System
                    </p>
                    <button class="view-btn" onClick="window.location.href='User_delete.html'">Delete</button>
                </div>
              </div>
            </div>
            <!-- Column -->
            <!-- Column -->
            <div class="col-md-4 wrap-service5-box">
              <div class="card card-shadow card-bg ">
                <div class="card-body  border">
                    <i class="fas fa-money-check list-icons"></i>
                    <h4 class="font-weight-medium">Check Bank slip</h4>
                    <h2 class="Div123" style="font-size: 15">More >>></h2>
                    <p class="listText">
                      Check an Verify the Manual Payment 
                    </p>
                    <button class="view-btn" onClick="window.location.href='../Help.html'">Check</button>
                </div>
              </div>
            </div>
            <!-- Column -->
            <!-- Column -->
            <div class="col-md-4 wrap-service5-box">
              <div class="card card-shadow card-bg ">
                <div class="card-body border">
                    <i class="fas fa-ad list-icons"></i>
                    <h4 class="font-weight-medium">Check Advertisement Requests</h4>
                    <p class="listText">
                      Check and Verify the Advertisements 
                    </p>
                    <button class="view-btn" onClick="window.location.href='../Help.html'">Check</button>
                </div>
              </div>
            </div>
            <!-- Column -->
            <!-- Column -->
            <div class="col-md-4 wrap-service5-box">
              <div class="card card-shadow card-bg ">
                <div class="card-body border ">
                    <i class="fas fa-video-slash list-icons"></i>
                    <h4 class="font-weight-medium">Check Reported Contents</h4>
                    <p class="listText">
                      Check and Delete unwanted contents from the system
                    </p>
                    <button class="view-btn" onClick="window.location.href='../Help.html'">Check</button>
                </div>
              </div>
            </div>
            <!-- Column -->
            <!-- Column -->
            <div class="col-md-4 wrap-service5-box">
              <div class="card card-shadow card-bg ">
                <div class="card-body border ">
                    <i class="fas fa-hands-helping list-icons"></i>
                    <h4 class="font-weight-medium">Help</h4>
                    <p class="listText">
                      Help system users by answering their questions
                    </p>
                    <button class="view-btn" onClick="window.location.href='../Help.html'">View</button>
                </div>
              </div>
            </div>
            <!-- Column -->
            <!-- Column -->
            <div class="col-md-4 wrap-service5-box">
              <div class="card card-shadow card-bg ">
                <div class="card-body border">
                    <i class="fas fa-house-user list-icons"></i>
                    <h4 class="font-weight-medium">About Us</h4>
                    <p class="listText">
                      View Who we are at "EDUTOR"
                    </p>
                    <button class="view-btn" onClick="window.location.href='../About.html'">View</button>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>
  
    </center>
  </div>
  <div class="footer-bar" style="display: flex;">
    <ul>
      <li><a href="../About.html" style = "position:relative; left:30px">About us</a></li>
      <li><a href="../Help.html" style = "position:relative; left:30px" >Help</a></li>
      <li><a href="../TermsandConditions.html" style = "position:relative; left:30px">Terms and Conditions</a></li>	
    </ul>
    
    
    	

    <ul style="float: right; margin-left: 700px; right: 0;">
      <li><a href="facebook"><i class="fab fa-facebook"></i></a></li>
      <li><a href="facebook"><i class=" fab fa-twitter"></i></a></li>
      <li><a href="facebook"><i class="fab fa-google"></i></a></li>
    </ul>
    </div>
		
  </body>
</html>
