<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login</title>
    <link rel="stylesheet" href="Style/login.css" />
    <link rel="stylesheet" href="footer/footer.css" />
  </head>
  <body>
    <div class="main">
          <form action="<%=request.getContextPath()%>/login" method="POST">
    <center>
      <div class="lgn">
        <img src="Images/ED.png" alt="logos" width="200" height="200"><br>
        <label for="email"><h1 style="color:black"> Email Address</h1></label><br />
        <input type="text" name="email" aria-label="E-Mail Address" /><br />
        

        <label for="password"><h1 style="color:black"> Password</h1></label><br />
        <input type="password" name="password" aria-label="Password" /><br />
        <br>
        <button class="log-btn">Login</button>
        <br><br><br>
        <a href="Reset/reset.html">Forgot Password</a>
    </center>
        </form>
  </div>

  <div class="footer-bar" >
    <ul>
      <li><a href="../About.html" style = "position:relative; left:50px">About us</a></li>
      <li><a href="../Help.html" style = "position:relative; left:50px" >Help</a></li>
          <li><a href="../TermsandConditions.html" style = "position:relative; left:50px">Terms and Privacy and policy</a></li>	
    </ul>
    <a href="facebook"><img  src="Images/facebook2.png" width="40" height="40" style = "position:relative; left:1350px "></a>
    <a href="facebook"><img  src="Images/twitter1.png" width="40" height="40" style = "position:relative; left:1350px"></a>
    <a href="facebook"><img  src="Images/email1.png" width="40" height="40" style = "position:relative; left:1350px"></a>	
    </div>
  </body>
</html>
