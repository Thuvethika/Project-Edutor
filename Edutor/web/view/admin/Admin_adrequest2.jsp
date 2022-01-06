<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Adrequest_Admin</title>
    <link rel="stylesheet" href="sec_adrequest.css" />
    <link rel="stylesheet" type="text/css" href="../footer/footer.css">
    <link href='https://fonts.googleapis.com/css?family=Exo' rel='stylesheet'>
  <script  src="https://kit.fontawesome.com/7324bdcc98.js" crossorigin="anonymous" ></script>
	<link rel="stylesheet" type="text/css" href="../finalnavbar/TopNavBartest3.css">
	<script src="../finalnavbar/side-nav.js"></script>
  <script src="admin.js"></script>
 
  </head>
  <body>
    <div class="topNavBar row">

      <div id="mySidenav" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a >
    <img src="../Images/EDname.png" class="sidelogo">
        <div class="sidepanel" style="margin-top: 50px">
          <a href="../About.html">About</a>
          <a href="../TermsandConditions.html">Terms and Conditions</a>
          <a href="../Help.html">Help</a>
        </div>
        

      </div>

      <div class="coulmn1">
        <button class="btn"><i class="fa fa-bars" onclick="openNav()"></i></button>
        <img src="../Images/EDname2.png" alt="Logo" class="logo" />
      </div>
      <div class="coulmn2">
        
        </div>

      <div class="coulmn3">

        <button class="nav-btn" onclick="window.location.href='Admin_Tutor.html'"><i class="fas fa-upload"></i></button>
        <button class="nav-btn" onclick="window.location.href='Admin_Tutor.html'"><i class="fas fa-chalkboard-teacher"></i></button>
        <button class="nav-btn" onclick="window.location.href='Admin_Learner.html'">"<i class="fas fa-user-graduate"></i></button>
        <button class="nav-btn" onclick="window.location.href='Admin_report.html'"><i class="fas fa-video-slash"></i></button>
        <button class="nav-btn" onclick="window.location.href='Admin_Tutor.html'"><i class="fas fa-id-badge"></i></button>
        <button class="nav-btn" onclick="window.location.href='Admin_adrequest2.jsp'"><i class="fas fa-ad"></i></button>
        <button class="nav-btn" onclick="window.location.href='Admin_manualpayment.html'"><i class="fa fa-money"></i></button>
        <button class="nav-btn" onclick="window.location.href='Home_admin.html'"><i class="fas fa-home"></i></button>
      
        <button class="nav-btn2" onclick="window.location.href='../user.html'"><i class="fas fa-user-cog"></i></button>
 
      <button class="dropbtn2" onclick="window.location.href='../index.html'"><i class="fa fa-sign-out"></i> Log Out</button>
    </div>
    </div>
          
    <div class="main2">
    <center>
      <div class="d-flex justify-content-center">
        <!-- ----- Services Section ----------  -->

        <div class="tabContents" id="servicesContainer">
        
            <center>
                 <%
        
        try
        {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor", "root", "");
              
              String sql = "SELECT  Customad_id,uploadimage, imgname, email, classid FROM customadvertisement ";
              PreparedStatement stmt = con.prepareStatement(sql);
               
              ResultSet rs = stmt.executeQuery();
              
              
              
              if(rs.next()== false)
              {
                  out.println("No records");
                  
              }
              else
              {
                %>
                     
              <h1>Advertisement Requests</h1><br>
            <table id="ad_t">
              <tr>
                <th style="border-radius: 15px 0px 0px 0px;">User Email</th>  
                <th>Class_ID</th>
                <th>Image Name</th>
                <th>Image</th>
                
                <th style="border-radius: 0px 15px 0px 0px;">Status</th>
              </tr>
              
              <%
              do
                  
              {%>
          <tr>
            <td> <%= rs.getString("email") %> </td>
            <td> <%= rs.getString("classid") %> </td>
            <td> <%= rs.getString("imgname") %> </td>
            <%  String filename=rs.getString("imgname");%>
            
            <td> <image src="imgadvertise/<%=filename%>" width="400" height="400"/></td>
             <form action="<%=request.getContextPath()%>/admin2_adrequestservlet?customid=<%=rs.getString("Customad_id") %> " method="POST">
               <td>
                  <button  class="dropbtn2" name="decision" value="approve">Approve</button>
                  <button  class="dropbtn2" name="decision" value="delete">Reject</button> 
                   </form>
                </td>
            <%
          }while(rs.next()); %>
            
        
        
          </tr>
      
          </table> <%
            }
}
catch(Exception e)
        {
         e.getStackTrace();
        }
        %>
              
              </tr></table>
        
            </center>
           
        </div>

      </div>
	 
  
    </center>
  
    </center>
  </div>

  </body>
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

</html>
