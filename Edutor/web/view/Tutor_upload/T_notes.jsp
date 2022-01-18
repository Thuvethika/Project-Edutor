
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
	

	  <link rel="stylesheet" type="text/css" href="../finalnavbar/TopNavBartest2.css">
	<link rel="stylesheet" type="text/css" href="../footer/footer.css">
	<script  src="https://kit.fontawesome.com/7324bdcc98.js" crossorigin="anonymous" ></script>
	<script src="../finalnavbar/side-nav.js"></script>
	<link rel="stylesheet" type="text/css" href="T_notes2.css">
	<link href='https://fonts.googleapis.com/css?family=Exo' rel='stylesheet'>
	<script  src="https://kit.fontawesome.com/7324bdcc98.js" crossorigin="anonymous" ></script>
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
			 <button class="nav-btn" onclick="displayManage()"><i class="fa fa-group"></i></button>
      <button class="nav-btn" onclick="window.location.href='../Calender/T_calender.html'"><i class="fa fa-calendar"></i></button>
      <button class="nav-btn" onclick="displayAd()"><i class="fas fa-ad"></i></button>
      <button class="nav-btn" onclick="window.location.href='Home_Tutor.jsp'"><i class="fas fa-home"></i></button>
    <!-- </div>
    <div class="coulmn4"> -->
      <button class="nav-btn2" onclick="window.location.href='../Tutor_Profile/Profile_Tutor.jsp'"><i class="fas fa-user-circle"></i></button>

    <button class="dropbtn2" onclick="window.location.href='../index.jsp'"><i class="fa fa-sign-out"></i> Log Out</button>
	  </div>

	  </div>




	 <div class="main">

	 <h1>Notes</h1><br>
	
            <center>
                 <%
        
        try
        {
                HttpSession session3=request.getSession(false);  
                String classid1 =(String)session3.getAttribute("classid");
                int classid=Integer.parseInt(classid1);
             
            Class.forName("com.mysql.jdbc.Driver").newInstance();
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor", "root", "");
              
              String sql = "SELECT note_id, title, description, note, imgname, email FROM notes WHERE classid="+classid+" && imgname NOT LIKE'%.pdf'  ";
              PreparedStatement stmt = con.prepareStatement(sql);
               
              ResultSet rs = stmt.executeQuery();
              
              
              
              if(rs.next()== false)
              {
                  out.println("No records");
                  
              }
              else
              {
                %>
                     
         
            <table id="ad_t">
              <tr>
           
                <th>title</th>
                <th>description</th>
                <th>note</th>
            
                
                
              </tr>
              
              <%
              do
                  
              {%>
          <tr>
            <td> <%= rs.getString("title") %> </td>
            <td> <%= rs.getString("description") %> </td>
          
            <%  String filename=rs.getString("imgname");%>
            
            <td>   <img src="../../T_notes/<%=filename%>"  style="width:50% ;height:15%"></td>
         
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
         
        
            <center>
                 <%
        
        try
        {
            HttpSession session3=request.getSession(false);  
                 String classid1 =(String)session3.getAttribute("classid");
                int classid=Integer.parseInt(classid1);
                
            Class.forName("com.mysql.jdbc.Driver").newInstance();
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor", "root", "");
              
              String sql = "SELECT note_id, title, description, note, imgname, email FROM notes WHERE classid="+classid+" && imgname LIKE'%.pdf' ";
              PreparedStatement stmt = con.prepareStatement(sql);
               
              ResultSet rs = stmt.executeQuery();
              
              
              
              if(rs.next()== false)
              {
                  out.println("No records");
                  
              }
              else
              {
                %>
                     
         
            <table id="ad_t" style="width: 100%">
              <tr>
           
                <th>title</th>
                <th>description</th>
                <th>note</th>
            
                
                
              </tr>
              
              <%
              do
                  
              {%>
          <tr style="height:400px" >
            <td> <%= rs.getString("title") %> </td>
            <td> <%= rs.getString("description") %> </td>
          
            <%  String filename=rs.getString("imgname");%>
            
            <td>    <embed src="../../T_notes/<%=filename%>" type="application/pdf" style="height:600px;width: 800px"></td>
         
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
              
                  
              </tr>
        
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
<script src="TopNavBar.js"></script>
</html>
