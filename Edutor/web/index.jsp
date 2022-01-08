<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Edutor</title>
    <link rel="stylesheet" href="Style/style.css" />
    <link rel="stylesheet" type="text/css" href="footer/footer.css">
      <link href='https://fonts.googleapis.com/css?family=Exo' rel='stylesheet'>
    <script  src="https://kit.fontawesome.com/7324bdcc98.js" crossorigin="anonymous" ></script>
  </head>
  <body>
    <div class="main">
      <div class="nav-bar row">
        <div class="column0"></div>
        <div class="column1">
          <button class="lgn-btn" onclick="window.location.href='login.jsp'">
            Login </div>
          </button>
          <div class="column2">
          <button class="sign-btn" onclick="displaySignup()">Sign up</button>
        </div>

        <div class="column3">
          <ul class="btn">
            <li><a href="index.html">Home</a></li>
            <li><a href="About.html">About</a></li>
            <li><a href="Help.html">Help</a></li>
            <li><a href="TermsandConditions.html">Terms and Conditions</a></li>
          </ul>
        </div>
      </div>
     
      <div class="overlay hidden" id="popWindow">
        <div class="signup-form hidden">
          <div class="user-icon"></div>
          <br /><h1>What kind of user are you?</h1> <br />
          <br><img src="Images/ED.png" alt="logos" width="150" height="150">
          <div class="row">
            <div class="column">
              <h1 style="color:black;">Tutor</h1> <br> 
              <button class="newbutton button2" onclick=window.location.href='Signup/GraduatedTutorRegister.jsp'> Graduated Tutor</a></button>
          <br />
          <button class="newbutton button2" onclick=window.location.href='Signup/NongraduatedTutorRegister.jsp'>Non Graduated Tutor</button>
         <br /> </div>
          <div class="column">
         <h1 style="color:black;">Learner </h1><br> 
         <button class="newbutton button1" onclick=window.location.href='Signup/SchoolStudentRegister.jsp'>School Student</button><br>
         <button class="newbutton button1" onclick=window.location.href='Signup/UniversityStudentRegister.jsp'>University Student</button><br>
         <button class="newbutton button1" onclick=window.location.href='Signup/OtherStudentRegister.jsp'>Others</button>
        </div>
        </div>
        </div>
      </div>
   
      <div class="signup-container">
        <button class="sign-btn2" onclick="displaySignup()">Sign Up</button>
      </div>
    </div>
    

        <div class="rownew">
          <div class="columnnew">
              
                <%
        
        try
        {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor", "root", "");
              
              String sql = "SELECT advd, imgname, email, classid FROM publishadvertisments ";
              PreparedStatement stmt = con.prepareStatement(sql);
               
              ResultSet rs = stmt.executeQuery();
              
              
              
              if(rs.next()== false)
              {
                  out.println("No records");
                  
              }
              else
              {
                %>
                  <%
              do
                  
              {%>
              <%  String filename=rs.getString("imgname");%>
            
              <img src="Admin/imgadvertise/<%=filename%>"  style="width:20%">
              
                <p><button class="buttonnew" onclick="window.location.href='login.jsp'">Join</button></p>
               
                   <%
          }while(rs.next()); %>
          
          <%
            }
}
catch(Exception e)
        {
         e.getStackTrace();
        }
        %>
          </div>
                       
                
      </div>  
    </div>  
    <script src="Script/script.js"></script>
    <script src="Script/snack.js"></script>
   
  </body>
  
</html>