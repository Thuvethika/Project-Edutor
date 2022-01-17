
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
    <head>
        <title>Forum| Learner |Question</title>
        <link rel="stylesheet" type="text/css" href="forum.css">
        <link rel="stylesheet" href="../finalnavbar/forumnv.css" />
        <link rel="stylesheet" type="text/css" href="../footer/footer.css">
        <script src="../finalnavbar/side-nav.js"></script>
        <script src="../Script/popscript2.js"></script>
        
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
            <button class="nav-btn" onclick="window.location.href='../Tutor_Home/Home_Tutor.jsp'"><i class="fas fa-home"></i></button>
            
            </div>
           
          </div>
        
          
         <div class="main">
           
                
             <br><br>
            <center>
             <div class="row">
                <div class="columnr">
                    <h1>Reply to Question</h1>
                    </div>
              <div class="column">
                <h3>Reply</h3>
                </div>
                <div class="columni">		
                        <button class="open-btn"><i class="fas fa-reply"></i></button>
                        <br><br>
                        <p id="p1"></p>
            </div>
            </div>
        </center>
            
                <center>
                    <div class="leftside">
               
           <%
        
        try
        {
            HttpSession session4=request.getSession(false);  
                int Fquestid =(int)session4.getAttribute("Fquestid");
            Class.forName("com.mysql.jdbc.Driver").newInstance();
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor", "root", "");
              
              String sqla = "select forumquest from forumquest where Fquestid= ?";
              PreparedStatement stmtqa = con.prepareStatement(sqla);
              stmtqa.setInt(1,Fquestid); 
              ResultSet rs5 = stmtqa.executeQuery();
              
              
              if(rs5.next()== false)
              {
                  out.println("No records");
                  
              }
              else
              {
                %>
                <table id="mp_t">
				<tr>
                                    <th style="border-radius: 15px 15px 15px 15px;">Question</th> </tr>
                                    <%
              do
              {%>
                                <tr>
				  <td><%= rs5.getString("forumquest") %></td>
                                  <%
          }while(rs5.next()); %>
				</tr>
			
				</table><%
            }
}
catch(Exception e)
        {
         e.getStackTrace();
        }
        %>
                 
        <br>
        <br>
        <h1>Answers</h1>
        <%
        
        try
        {
            HttpSession session6=request.getSession(false);  
                int Fquestid =(int)session6.getAttribute("Fquestid");
            Class.forName("com.mysql.jdbc.Driver").newInstance();
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor", "root", "");
              
              String sqlan = "select forumans,replier,ansdate from ansquest where Fquestid= ?";
              PreparedStatement stmtqan = con.prepareStatement(sqlan);
              stmtqan.setInt(1,Fquestid); 
              ResultSet rs6 = stmtqan.executeQuery();
              
              
              if(rs6.next()== false)
              {
                  out.println("No records");
                  
              }
              else
              {
                %>
                 <table id="mp_t">
				<tr>
                                    <th style="border-radius: 15px 0px 0px 0px;">Answered by</th> 
                                    <th> Answer</th>
                                    <th style="border-radius: 0px 15px 0px 0px;">Date Posted</th> 
                                </tr>
                                  <%
              do
              {%>
                                <tr>
				  <td><%= rs6.getString("replier") %></td>
				  <td><%= rs6.getString("forumans") %></td>
                                  <td><%= rs6.getString("ansdate") %></td>
                                  <%
          }while(rs6.next()); %>
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
                          <form action="<%=request.getContextPath()%>/Ansquest2" method="POST"> 
                          <h1>My Reply</h1>
                          <br><br>
                          <label for="replier">Name</label>
                          <input type="text" size="40" name=replier><br/><br/>
                          <label for="ansdate">Date</label>		<br><br>
                          <input type="date" name="ansdate" > 
                          <br><br>
                          <label for="forumans">Reply</label><br><br>
                          <textarea name="forumans" rows="6" cols="60"></textarea>
                          <br><br>
                          <button type="submit" class="save" style = "position:relative;">Publish</button>
                          </form>
                        </div>
                      </div>
                    </div>
                  
    
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
    <script src="questpop.js"></script>
    <script src="TopNavBar.js"></script>
    <script src="datescript.js"></script>
    </html>
