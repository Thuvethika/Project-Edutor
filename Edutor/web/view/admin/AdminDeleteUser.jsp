<%-- 
    Document   : AdminDeleteUser
    Created on : 14-Oct-2021, 09:38:59
    Author     : thuve
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Delete_User</title>
    <link rel="stylesheet" href="User_delete.css" />
    <link rel="stylesheet" type="text/css" href="../footer/footer.css">
    <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
  />
    
 
  </head>
  <body>
   
      <form action="<%=request.getContextPath()%>/AdminDeleteUser" method="POST">     
    <div class="main2">
    <center>
      <div class="lgn">
        <img src="../Images/Del.png" alt="logos" width="200"><br>
        <label for="email"><h1 style="color:black">Enter Email Address</h1></label><br />
        <input type="text" name="email" aria-label="E-Mail Address" /><br />
        <br>
        
        <button class="del-btn">Delete User</button>
    </center>
        
  </div>
        

        
        </form>
    
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
