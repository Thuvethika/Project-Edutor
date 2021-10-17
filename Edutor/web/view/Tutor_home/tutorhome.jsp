<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Announcements for Tutors</title>
    <link rel="stylesheet" href="tutor-home.css" />
    <link rel="stylesheet" href="../footer/footer.css" />
    <link rel="stylesheet" href="../finalnavbar/TopNavBartest.css" />
    <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
  />
    <script src="../finalnavbar/side-nav.js"></script>
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
        <a href="../Edit_profile/edit.jsp"
          ><img
            src="../Images/Edit1.png"
            height="50px"
            style="position: relative; left: 50px; margin-top: -150px"
        /></a>
        
      </div>
      <div class="sidepanel" style="margin-top: 50px">
        <a href="../About.html">About</a>
        <a href="../Learner_home/forum.html">Forum</a>
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
      <div class="dropdown">
        <button class="dropbtn" onclick="window.location.href='../Filter/Filter_ad.html'">Find tutor</button>
        
      </div>
      <input
        type="text"
        placeholder="  Search..."
        name="search"
        style="position: absolute; left: 527px; color: black"
      />
    </div>
    <div class="coulmn3">
      <button class="nav-btn" onclick="window.location.href='../Tutor_enroll_class/T_enrol.html'"><i class="fa fa-group"></i></button>
      <button class="nav-btn" onclick="window.location.href='../Calender/T_calender.html.html'"><i class="fa fa-calendar"></i></button>
      <button class="nav-btn" onclick="window.location.href='../Tutor_upload/T_upload.html'"><i class="fa fa-upload"></i></button>
    </div>
    <div class="coulmn4">
      <div class="profileImg"></div>
      <!-- <img src="../Images/ProfileIMG.png" alt="Prifle" class="profileImg" /> -->
    </div>
  <!-- </div>
  <div class="profileEdit hidden"> -->
    <button class="logOut" onclick="window.location.href='../index.html'"><i class="fa fa-sign-out"></i> Log Out</button>
  </div>
        
    <div class="main"> 
      <div class="tutorclass">
       <div>
        <img  src="Class.png" height="100px" width="100px" align="center"> <br/>
			<input type="text" placeholder="Class name" name="classname"  style = "position:relative" > <br/>
			<input type="text" placeholder="Grade" name="grade"  style = "position:relative" > <br/>
			<input type="text" placeholder="Medium" name="medium"  style = "position:relative" > <br/>
       </div>
       <div>
        <img  src="Class.png" height="100px" width="100px" align="center"> <br/>
			<input type="text" placeholder="Class name" name="classname"  style = "position:relative" > <br/>
			<input type="text" placeholder="Grade" name="grade"  style = "position:relative" > <br/>
			<input type="text" placeholder="Medium" name="medium"  style = "position:relative" > <br/>
       </div>
       <div>
        <img  src="Class.png" height="100px" width="100px" align="center"> <br/>
			<input type="text" placeholder="Class name" name="classname"  style = "position:relative" > <br/>
			<input type="text" placeholder="Grade" name="grade"  style = "position:relative" > <br/>
			<input type="text" placeholder="Medium" name="medium"  style = "position:relative" > <br/>
       </div>
       <div>
        <img  src="Class.png" height="100px" width="100px" align="center"> <br/>
			<input type="text" placeholder="Class name" name="classname"  style = "position:relative" > <br/>
			<input type="text" placeholder="Grade" name="grade"  style = "position:relative" > <br/>
			<input type="text" placeholder="Medium" name="medium"  style = "position:relative" > <br/>
       </div>
      </div>
     
      <div class="tutorclass">
        <div>
         <img  src="Class.png" height="100px" width="100px" align="center"> <br/>
       <input type="text" placeholder="Class name" name="classname"  style = "position:relative" > <br/>
       <input type="text" placeholder="Grade" name="grade"  style = "position:relative" > <br/>
       <input type="text" placeholder="Medium" name="medium"  style = "position:relative" > <br/>
        </div>
        <div>
         <img  src="Class.png" height="100px" width="100px" align="center"> <br/>
       <input type="text" placeholder="Class name" name="classname"  style = "position:relative" > <br/>
       <input type="text" placeholder="Grade" name="grade"  style = "position:relative" > <br/>
       <input type="text" placeholder="Medium" name="medium"  style = "position:relative" > <br/>
        </div>
        <div>
         <img  src="Class.png" height="100px" width="100px" align="center"> <br/>
       <input type="text" placeholder="Class name" name="classname"  style = "position:relative" > <br/>
       <input type="text" placeholder="Grade" name="grade"  style = "position:relative" > <br/>
       <input type="text" placeholder="Medium" name="medium"  style = "position:relative" > <br/>
        </div>
        <div>
         <img  src="Class.png" height="100px" width="100px" align="center"> <br/>
       <input type="text" placeholder="Class name" name="classname"  style = "position:relative" > <br/>
       <input type="text" placeholder="Grade" name="grade"  style = "position:relative" > <br/>
       <input type="text" placeholder="Medium" name="medium"  style = "position:relative" > <br/>
        </div>
       </div>

			
		 

    </div> 
    <br><br><br><br>
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