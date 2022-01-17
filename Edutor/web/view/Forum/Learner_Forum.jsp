
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
	<title>Forum|Learner</title>
	<link rel="stylesheet" type="text/css" href="forum2.css">
	<link rel="stylesheet" href="../finalnavbar/forumnv.css" />
	<link rel="stylesheet" type="text/css" href="../footer/footer.css">
    <script src="../finalnavbar/side-nav.js"></script>
	<script src="../Script/popscript3.js"></script>
	<script src="../Script/popscript.js"></script>
<script src="getid.js"</script>
	<script src="../Script/forumscript.js"></script>
	  <script  src="https://kit.fontawesome.com/7324bdcc98.js" crossorigin="anonymous" ></script>
	  <link href='https://fonts.googleapis.com/css?family=Exo' rel='stylesheet'>
</head>
<body>
	<div class="topNavBar row">

        <div id="mySidenav" class="sidenav">
          <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a
          >
		  <img src="Images/EDname.png" class="sidelogo">
          <div class="sidepanel" style="margin-top: 50px">
            <a href="../About.html">About</a><br/>
            <a href="../TermsandConditions.html">Terms and Conditions</a><br/>
            <a href="../Help.html">Help</a>
          </div>
        </div>
  
        <div class="coulmn1">
          <button class="btn"><i class="fa fa-bars" onclick="openNav()"></i></button>
     
        </div>
        <div  class="coulmn2">
          <img src="../Images/EDname2.png"  class="edutorlogo"  alt="Logotitle" />
        </div>
        <div class="coulmn3">
			<button class="dropbtn2" onclick="window.location.href='../index.jsp'"><i class="fa fa-sign-out"></i> Log Out</button>
		<button class="nav-btn" onclick="window.location.href='../Learner_Home/home_Learner.jsp'"><i class="fas fa-home"></i></button>
        
        </div>
       
      </div>
	
	  
	 <div class="main">
		
		 <br><br>
		<center>
		 <div class="row">
            <div class="columnr">
				<h1>Discussion Forum</h1>
				</div>
          <div class="column">
			<h3>New Topic</h3>
			</div>
			<div class="columni">		
					<button class="open-btn"><i class="far fa-plus-square"></i></button>
                                        <br><br>     <p id="p1" name=postdate></p>
        </div>
        </div>
	</center>
		
			<center>
				<div class="leftside">
                                     <%
        
        try
        {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor", "root", "");
              
              String sql = "select Fquestid,sender,topic,postdate from forumquest";
              PreparedStatement stmtf = con.prepareStatement(sql);
          
              ResultSet rs1 = stmtf.executeQuery();
              
              
              if(rs1.next()== false)
              {
                  out.println("No records");
                  
              }
              else
              {
                %>
			<table id="mp_t">
				<thead>
				  <th style="border-radius: 15px 0px 0px 0px;">Question No</th>
                                  <th>Name</th>
				 <th>Question Topic</th>
				 
				  <th style="border-radius: 0px 15px 0px 0px;">Date</th>
				  
				</thead>
                                <%
              do
              {%>
				<tr>
                                    <td class="questionID"><%= rs1.getString("Fquestid") %></td>
				  <td><%= rs1.getString("sender") %></td>
                                  <td><a href="#" onclick="displayDiscuss()"><%= rs1.getString("topic") %> </a></td>
			      <td><%= rs1.getString("postdate") %></td>
                             
                                   
				  <%
          }while(rs1.next()); %>
				</tr>
			
				</table><%
            }
}
catch(Exception e)
        {
         e.getStackTrace();
        }
        %>
			</div>
			</center>
		
		
				
				<div class="popup">
				  <div class="popup-overlay"></div>
				  <div class="main-popup">
					<div class="popup-content">
					  <span class="close-btn">&times;</span>
                                            <form action="<%=request.getContextPath()%>/Postquest" method="POST"> 
					  <h1>Post a new Question</h1>
					  <br><br>
					  <label for="sender">Name</label>
					  <input type="text" size="40" name="sender"><br/><br/>
					  <label for="postdate">Date</label>	<br>	<br>
                                           <input type="date" name="postdate" > 
		              <br><br>
					  <label for="topic">Topic</label>
					  <input type="text" size="40" name="topic"><br/><br/>
					  <label for="quest">Question</label><br><br>
					  <textarea name="forumquest" rows="6" cols="60"></textarea>
					  <br><br>
					  <button type="submit" class="save" >Publish</button>
                                            </form>
					</div>
				  </div>
				</div>
                                          <center>
                           <form action="<%=request.getContextPath()%>/Discussforum" method="POST"> 
      <div class="overlay3 hidden" id="popWindow3">
      <div class="classform hidden">
         
          <center>
          <br>
        <h3>Insert the Question Number</h3> <br />
		<label for="Fquestid">Question No</label>
	  <input type="text" size="10" name="Fquestid"><br/><br/>	  

          <button class="save2" value="discuss" >Discuss It</button>
          </center>
         </div>
	</div>
           </form> 
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
      <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script> 
    function displayGetid() {
var orderID = $(this).closest("tr").find("td:eq(1)").text();
var summa = $(this).closest("tr").find("td:eq(0)").text();
console.log(summa);
alert(summa);
}
</script>			
			
</body>	

<script src="questpop.js"></script>
<script src="TopNavBar.js"></script>
<script src="datescript.js"></script>
</html>
