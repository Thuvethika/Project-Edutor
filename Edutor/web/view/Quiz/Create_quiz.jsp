<%-- 
    Document   : Create_quiz
    Created on : 18-Jan-2022, 12:15:29
    Author     : thuve
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Quiz</title>
    <link rel="stylesheet" href="quiz_tutor.css" />
    <link rel="stylesheet" href="../footer/footer.css" />
    <link rel="stylesheet" href="../finalnavbar/TopNavBartest2.css" />
    <link href='https://fonts.googleapis.com/css?family=Exo' rel='stylesheet'>
    <script src="../finalnavbar/side-nav.js"></script>
    <script src="https://kit.fontawesome.com/7324bdcc98.js" crossorigin="anonymous" ></script>
      <script src="../Script/script.js"></script>
    

   

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
          <button class="nav-btn" onclick="displayAd()"><i class="fas fa-ad"></i></button>
          <button class="nav-btn" onclick="window.location.href='../Tutor_home/Home_Tutor.html'"><i class="fas fa-home"></i></button>
        <!-- </div>
        <div class="coulmn4"> -->
          <button class="nav-btn2" onclick="window.location.href='../Tutor_Profile/Profile_Tutor.html'"><i class="fas fa-user-circle"></i></button>
    
        <button class="dropbtn2" onclick="window.location.href='../index.html'"><i class="fa fa-sign-out"></i> Log Out</button>
      </div>
     
      <div class="overlay hidden" id="popWindow">
        <div class="ad-form hidden">
          <div class="user-icon"></div>
          <h3>Fill the details or Upload the advertisement image</h3> 
          <img src="../Images/ED.png" alt="logos" width="150" height="150"><br />
          <div class="row1">
          </a>
             
              <button class="button2" onclick="window.location.href='../Create_advertisement/Create_Advertisements.html'"> Fill Details</button>
          
          <button class="button2"onclick="window.location.href='../Create_advertisement/Advertisement_image.html'">Upload Image</button>
         <br />
         
        
        
        </div>
        </div>
      </div> 
      </div>
    <div class="main"> 
      
			<center>
        <div class="qzcreate">
         
        <div id="quiz"></div>
       
       
        <div id="results"></div>
        <script src="quiz.js"></script>
    
        <div>
             <form action="<%=request.getContextPath()%>/CreateQuiz" method="POST"> 
             <h1 style="text-align:center">Create Quiz </h1>
       <!--    <label for="quesNum">Question Number</label>
          <input type="text" class="quesNum" style="width:70px" required />
          <br />
          <br>-->
          <br>
         <label for="ques">Enter Question</label>
          <input type="text" name="question" class="ques"  required /> 
          <br />
          <br>
          <br>
          <label for="ans1">Enter Answer 1:</label>
          <input type="text" name="answer1" class="ans1" required />
          <input type="radio"   name="decision" value="answer1" >
          <br />
          <br>
          <br>
          <label for="ans2">Enter Answer 2:</label>
          <input type="text" name="answer2" class="ans2" required />
          <input type="radio"  name="decision" value="answer2" >
          <br />
          <br>
          <br>
          <label for="ans3">Enter Answer 3:</label>
          <input type="text" name="answer3" class="ans3" required />
          <input type="radio"  name="decision" value="answer3" >
          <br />
          <br>
          <br>
          <label for="ans4">Enter Answer 4:</label>
          <input type="text" name="answer4" class="ans4" required />
          <input type="radio"  name="decision" value="answer4" >
          <br />
          <br>
          <br>
          
          
          <button type="submit" name="save" value="save" class="confirm-btn" onclick="AddQuestion()">
            Save
          </button>
          
          <br><br>
          <button name="submit" id="submit">Submit Quiz</button>
             </form>
        </div>
    
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