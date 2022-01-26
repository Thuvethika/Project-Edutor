<%-- 
    Document   : Admin_report
    Created on : 16-Jan-2022, 11:52:13
    Author     : thuve
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Report_Admin</title>
    <link rel="stylesheet" href="sec_report1.css" />
    <link rel="stylesheet" type="text/css" href="../footer/footer.css">
    <link rel="stylesheet" href="../finalnavbar/TopNavBartest3.css" />
    <link href='https://fonts.googleapis.com/css?family=Exo' rel='stylesheet'>
  <script  src="https://kit.fontawesome.com/7324bdcc98.js" crossorigin="anonymous" ></script>
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
        <div class="tabContents" id="servicesContainer">
         <h1>Reported Contents</h1><br>
         <table id="re_t">
          <tr>
            <th style="border-radius: 15px 0px 0px 0px;">Reported by</th>
            <th>Reported to</th>
            <th>Subject</th>
            <th>Grade</th>
            <th>Title</th>
             <th>Content</th>
            <th style="border-radius: 0px 15px 0px 0px;"> Delete</th>
          </tr>
          <%
        
        try
        {
               
             
            Class.forName("com.mysql.jdbc.Driver").newInstance();
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor", "root", "");
              
              String sql = "SELECT l_email, t_email,subject, grade, title,note,imgname,note_id  FROM reportedcontents WHERE imgname NOT LIKE'%.pdf'  ";
              PreparedStatement stmt = con.prepareStatement(sql);
               
              ResultSet rs = stmt.executeQuery();
              
              
              
              if(rs.next()== false)
              {
                  out.println("No records");
                  
              }
              else
              {
                %>
         
          <form action="<%=request.getContextPath()%>/DeleteReportedContents?note_id=<%=rs.getString("note_id") %>" method="POST">
           <%
              do
                  
              {%>
               <tr>
            <td> <%= rs.getString("l_email") %> </td>
            <td> <%= rs.getString("t_email") %> </td>
           <td> <%= rs.getString("grade") %> </td>
            <td> <%= rs.getString("subject") %> </td>
             <td> <%= rs.getString("title") %> </td>
            <%  String filename=rs.getString("imgname");%>
            
            <td>   <img src="../../T_notes/<%=filename%>"  style="width:50% ;height:15%"></td>
         
               <td> <button  class="dropbtn3" name="button3"  value="view" > Delete</button></td>  </tr>
          </form>
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
       
  
        
       
                 <%
        
        try
        {
           
                
            Class.forName("com.mysql.jdbc.Driver").newInstance();
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor", "root", "");
              
             String sql = "SELECT l_email, t_email,subject, grade, title,  note,imgname,note_id  FROM reportedcontents WHERE imgname LIKE'%.pdf' ";
              PreparedStatement stmt = con.prepareStatement(sql);
               
              ResultSet rs = stmt.executeQuery();
              
              
              
              if(rs.next()== false)
              {
                  out.println("No records");
                  
              }
              else
              {
                %>
                     
         
          
             
               <form action="<%=request.getContextPath()%>/DeleteReportedContents?note_id=<%=rs.getString("note_id") %>" method="POST">
              <%
              do
                  
              {%>
          <tr style="height:400px" >
             <td> <%= rs.getString("l_email") %> </td>
            <td> <%= rs.getString("t_email") %> </td>
           <td> <%= rs.getString("grade") %> </td>
            <td> <%= rs.getString("subject") %> </td>
             <td> <%= rs.getString("title") %> </td>
            <%  String filename=rs.getString("imgname");%>
            
            <td>    <embed src="../../T_notes/<%=filename%>" type="application/pdf" style="height:600px;width: 800px"></td>
         
               <td> <button  class="dropbtn3" name="button3"  value="view" > Delete</button></td>  </tr>
            <%
          }while(rs.next()); %>
            
        
               </form>
        
      
          </table> <%
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
