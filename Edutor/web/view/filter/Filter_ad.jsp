<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!doctype html>
<html lang="en" class="no-js">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	
	<link rel="stylesheet" href="../footer/footer.css" />
    <link rel="stylesheet" href="../finalnavbar/TopNavBartest2.css" />
    <script  src="https://kit.fontawesome.com/7324bdcc98.js" crossorigin="anonymous" ></script>
	<script src="js/scriptpay.js"></script>
    <link href='https://fonts.googleapis.com/css?family=Exo' rel='stylesheet'>
    <script src="../finalnavbar/side-nav.js"></script>
	<link rel="stylesheet" href="css/reset.css"> 
	<link rel="stylesheet" href="css/style2.css"> 
	<script src="js/modernizr.js"></script> 
  	
	<title> Find | Tutor</title>
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
			<button class="dropbtn" onclick="window.location.href='../Filter/Filter_ad.jsp'">Find Tutor</button>
			
		  </div>
		  
		</div>
		<div class="coulmn3">
		  <button class="nav-btn" onclick="window.location.href='../Learner_enroll_class/T_enrol.html'"><i class="fa fa-book"></i></button>
		  <button class="nav-btn" onclick="window.location.href='../Calender/T_calender.html.html'"><i class="fa fa-calendar"></i></button>
		  <button class="nav-btn" onclick="window.location.href='../Invite/Invite_Friends.html'"><i class="fas fa-user-plus"></i></button>
		  <button class="nav-btn" onclick="window.location.href='../index.html'"><i class="fas fa-home"></i></button>
		
		  <button class="nav-btn2" onclick="window.location.href='../user.html'"><i class="fas fa-user-circle"></i></button>
   
		<button class="dropbtn2" onclick="window.location.href='../index.html'"><i class="fa fa-sign-out"></i> Log Out</button>
	  </div>
  
	</div>

	  <center>
		<div class="overlay hidden">
			<div class="payment-form hidden">
			  <p class="payheading">Choose your payment method</p> <br> <br>
			
				  <button class="confirm-btn" onclick=window.location.href="../Payments/payment.html">Online Payment</button>
				  <button class="confirm-btn" onclick=window.location.href="../Payments/manual.jsp">Manual Payment</button>
			</div>
			</div>
		</center>


	<header class="cd-header">
		<h1>Find out your suitable Tutor </h1>
	</header>

	<main class="cd-main-content">

		<div class="cd-tab-filter-wrapper">
			
		</div> 

		<section class="cd-gallery">
                    
                     <%
        
        try
        {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor", "root", "");
              
              String sql = "SELECT advd, imgname, email, classid FROM publishadvertisments WHERE fees='paid' ";
              PreparedStatement stmt = con.prepareStatement(sql);
               
              ResultSet rs = stmt.executeQuery();
              
              
              
              if(rs.next()== false)
              {
                  out.println("No records");
                  
              }
              else
              {
                %>
			<ul>
                             <%
              do
                  
              {%>
              <%  String filename=rs.getString("imgname");%>
           
				<li class="mix color-1 check1 radio2 option3"><img src="../Admin/imgadvertise/<%=filename%>" alt="Image 1" onclick="window.location.href='../Tutor_Profile/Profile_Tutor.html'"><button class="buttonnew" onclick="displayPAY()">Enrol</button></li>
                                
				
			
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
              
              String sql = "SELECT advd, imgname, email, classid FROM publishadvertisments WHERE fees='free' ";
              PreparedStatement stmt = con.prepareStatement(sql);
               
              ResultSet rs = stmt.executeQuery();
              
              
              
              if(rs.next()== false)
              {
                  out.println("No records");
                  
              }
              else
              {
                %>
			<ul>
                             <%
              do
                  
              {%>
              <%  String filename=rs.getString("imgname");%>
           <form action="<%=request.getContextPath()%>/FreeEnroll?advd=<%=rs.getString("advd") %>" method="POST">
	 <li class="mix color-2 check2 radio2 option2"><img src="../Admin/imgadvertise/<%=filename%>" alt="Image 2" onclick="window.location.href='../Tutor_Profile/Profile_Tutor.html'"><button class="buttonnew" name="button1" value="enrol">Enrol</button></li>
				
			
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
        
           </form>
        
        
			<div class="cd-fail-message">No results found</div>
		</section> <!-- cd-gallery -->

		<div class="cd-filter">
			<form>
				<div class="cd-filter-block">
					<h4>Search</h4>
					
					<div class="cd-filter-content">
						<input type="search" placeholder="">
					</div> 
				</div> 

				<div class="cd-filter-block">
					<h4>Subjects / Classes</h4>

					<ul class="cd-filter-content cd-filters list">
						<li>
							<input class="filter" data-filter=".check1" type="checkbox" id="checkbox1">
			    			<label class="checkbox-label" for="checkbox1">Maths</label>
						</li>

						<li>
							<input class="filter" data-filter=".check2" type="checkbox" id="checkbox2">
							<label class="checkbox-label" for="checkbox2">Science</label>
						</li>

						<li>
							<input class="filter" data-filter=".check3" type="checkbox" id="checkbox3">
							<label class="checkbox-label" for="checkbox3">ICT</label>
						</li>
					</ul> 
				</div> 

				<div class="cd-filter-block">
					<h4>Select</h4>
					
					<div class="cd-filter-content">
						<div class="cd-select cd-filters">
							<select class="filter" name="selectThis" id="selectThis">
								<option value="">Medium (All)</option>
								<option value=".option1">English</option>
								<option value=".option2">Tamil</option>
								<option value=".option3">Sinhala</option>
								
							</select>
						</div> 
					</div> 
				</div> 

				<div class="cd-filter-block">
					<h4>Class Type</h4>

					<ul class="cd-filter-content cd-filters list">
						<li>
							<input class="filter" data-filter=".check1" type="checkbox" id="checkbox1">
			    			<label class="checkbox-label" for="checkbox1">Free</label>
						</li>

						<li>
							<input class="filter" data-filter=".check2" type="checkbox" id="checkbox2">
							<label class="checkbox-label" for="checkbox2">Paid</label>
						</li>

					</ul> 
				</div> 

				<div class="cd-filter-block">
					<h4>Grades</h4>

					<ul class="cd-filter-content cd-filters list">
						<li>
							<input class="filter" data-filter="" type="radio" name="radioButton" id="radio1" checked>
							<label class="radio-label" for="radio1">All</label>
						</li>

						<li>
							<input class="filter" data-filter=".radio2" type="radio" name="radioButton" id="radio2">
							<label class="radio-label" for="radio2">None</label>
						</li>

						<li>
							<input class="filter" data-filter=".radio3" type="radio" name="radioButton" id="radio3">
							<label class="radio-label" for="radio3">Grade 1</label>
						</li>
						
						<li>
							<input class="filter" data-filter=".radio4" type="radio" name="radioButton" id="radio4">
							<label class="radio-label" for="radio4">Grade 2</label>
						</li>

						<li>
							<input class="filter" data-filter=".radio5" type="radio" name="radioButton" id="radio5">
							<label class="radio-label" for="radio5">Grade 3</label>
						</li>
						<li>
							<input class="filter" data-filter=".radio6" type="radio" name="radioButton" id="radio6">
							<label class="radio-label" for="radio6">Grade 4</label>
						</li>
						<li>
							<input class="filter" data-filter=".radio7" type="radio" name="radioButton" id="radio7">
							<label class="radio-label" for="radio7">Grade 5</label>
						</li>
						<li>
							<input class="filter" data-filter=".radio8" type="radio" name="radioButton" id="radio8">
							<label class="radio-label" for="radio8">Grade 6</label>
						</li>
						<li>
							<input class="filter" data-filter=".radio9" type="radio" name="radioButton" id="radio9">
							<label class="radio-label" for="radio9">Grade 7</label>
						</li>
						<li>
							<input class="filter" data-filter=".radio10" type="radio" name="radioButton" id="radio10">
							<label class="radio-label" for="radio10">Grade 8</label>
						</li>
						<li>
							<input class="filter" data-filter=".radio11" type="radio" name="radioButton" id="radio11">
							<label class="radio-label" for="radio11">Grade 9</label>
						</li>

						<li>
							<input class="filter" data-filter=".radio12" type="radio" name="radioButton" id="radio12">
							<label class="radio-label" for="radio12">Grade 10</label>
						</li>
						<li>
							<input class="filter" data-filter=".radio13" type="radio" name="radioButton" id="radio13">
							<label class="radio-label" for="radio13">Grade 11</label>
						</li>
						<li>
							<input class="filter" data-filter=".radio14" type="radio" name="radioButton" id="radio14">
							<label class="radio-label" for="radio14">Grade 12</label>
						</li>
						<li>
							<input class="filter" data-filter=".radio15" type="radio" name="radioButton" id="radio15">
							<label class="radio-label" for="radio15">Grade 13</label>
						</li>

					</ul> <!-- cd-filter-content -->
				</div> <!-- cd-filter-block -->
			</form>

			<a href="#0" class="cd-close">Close</a>
		</div> <!-- cd-filter -->

		<a href="#0" class="cd-filter-trigger">Filters</a>
	</main> <!-- cd-main-content -->
	<div class="footer-bar" >
		<ul>
	
		<li><a href="facebook"><i class="fab fa-facebook"></i></a></li>
		<li><a href="facebook"><i class=" fab fa-twitter"></i></a></li>
		<li><a href="facebook"><i class="fab fa-google"></i></a></li>
	  
		  <li><a href="About.html" style = "position:relative; left:50px">About us</a></li>
		  <li><a href="Help.html" style = "position:relative; left:50px" >Help</a></li>
		 <li><a href="TermsandConditions.html" style = "position:relative; left:50px">Terms and Conditions</a></li>	
	  
		</ul>
		
		</div>
<script src="js/jquery-2.1.1.js"></script>
<script src="js/jquery.mixitup.min.js"></script>
<script src="js/main.js"></script> <!-- Resource jQuery -->
</body>
</html>