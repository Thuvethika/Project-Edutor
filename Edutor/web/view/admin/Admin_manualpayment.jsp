<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>ManualPayment_Admin</title>
    <link rel="stylesheet" href="sec_manualpayment.css" />
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
        <button class="nav-btn" onclick="window.location.href='Admin_adrequest.html'"><i class="fas fa-ad"></i></button>
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
          <h1>Manual Payments</h1><br>
          
           <%
        try
        {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor", "root", "");
              String sql = "select email,classid,paymentslip,imagename,paymentid from manualpayment";
              PreparedStatement stmt = con.prepareStatement(sql);
              ResultSet rs1 = stmt.executeQuery();
              if(rs1.next()== false)
              {
                  out.println("No records");
                  
              }
              else
              {
                %>
               <form action="<%=request.getContextPath()%>/AdminSlipCheck?paymentid=<%=rs1.getString("paymentid") %>" method="POST">     
          <table id="mp_t">
            <tr>
              <th style="border-radius: 15px 0px 0px 0px;">User E-mail</th>
              <th> Payment ID </th>
              <th> Class ID </th>
              <th> Slip Name </th>
              <th>Slip image</th>
              <th style="border-radius: 0px 15px 0px 0px;">Status</th>
              
            </tr>
            <%
              do
              {%>
          <tr>
            <td> <%= rs1.getString("email") %> </td> 
            <td> <%= rs1.getString("paymentid") %> </td>
            <td> <%= rs1.getString("classid") %> </td>
              <td> <%= rs1.getString("imagename") %> </td>
            <%  String filename=rs1.getString("imagename");%>
            
            <td> <image src="../../manualslips/<%=filename%>" width="200"/></td>
        
               <td>
                  <button  class="viewbutton" name="decide" value="accept">Accept</button>
                  <button  class="viewbutton" name="decide" value="omit">Reject</button> 
                   
                </td></form>
            <%
          }while(rs1.next()); %>

            </tr>
           
            </table>
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

