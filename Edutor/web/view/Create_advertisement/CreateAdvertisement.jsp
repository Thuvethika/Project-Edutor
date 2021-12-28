<%-- 
    Document   : CreateAdvertisement
    Created on : 12-Oct-2021, 16:04:19
    Author     : thuve
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="Model.Createclass"%>
<html>

    <head>
        <title>Edutor/createadvertisements</title>

        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" type="text/css" href="Create_Ad.css">
        <link rel="stylesheet" type="text/css" href="../footer/footer.css">
        <script src="../finalnavbar/TopNavBar.js"></script>
        <link rel="stylesheet" href="../finalnavbar/TopNavBartest2.css" />

        <script src="../finalnavbar/side-nav.js"></script>
        <script src="https://kit.fontawesome.com/7324bdcc98.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
        <link href='https://fonts.googleapis.com/css?family=Exo' rel='stylesheet'>
        <script src="https://kit.fontawesome.com/7324bdcc98.js" crossorigin="anonymous"></script>
        <script src="../Script/script.js">
        </script>




    </head>

    <body>
        <div class="topNavBar row">

            <div id="mySidenav" class="sidenav">
                <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
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
                <button class="nav-btn" onclick="window.location.href = '../Tutor_enroll_class/T_enrol.html'"><i
                        class="fa fa-group"></i></button>
                <button class="nav-btn" onclick="window.location.href = '../Calender/T_calender.html.html'"><i
                        class="fa fa-calendar"></i></button>
                <button class="nav-btn" onclick="displayAd()"><i class="fas fa-ad"></i></button>
                <button class="nav-btn" onclick="window.location.href = '../Tutor_home/Home_Tutor.html'"><i class="fas fa-home"></i></button>
                <!-- </div>
<div class="coulmn4"> -->
                <button class="nav-btn2" onclick="window.location.href = '../Tutor_Profile/Profile_Tutor.html'"><i
                        class="fas fa-user-circle"></i></button>

                <button class="dropbtn2" onclick="window.location.href = '../index.html'"><i class="fa fa-sign-out"></i> Log
                    Out</button>
            </div>

            <div class="overlay hidden" id="popWindow">
                <div class="ad-form hidden">
                    <div class="user-icon"></div>
                    <h3>Fill the details or Upload the advertisement image</h3>
                    <img src="../Images/ED.png" alt="logos" width="150" height="150"><br />

                    <button class="button2" onclick="window.location.href = '../Create_advertisement/Create_Advertisements.html'"> Fill Details</a></button>

                    <button class="button2" onclick="window.location.href = '../Create_advertisement/Advertisement_image.html'">Upload Image</button>
                    <br />




                </div>
            </div>
        </div>

        <div class="main2">
            <br />
            <h1 style="text-align:center">Advertisement </h1>
            <div class="flexbox">
              <form  action="<%=request.getContextPath()%>/CreateAdvertisement" method="POST">
                    <div class="editform">

                        <img src="edit2.png" class="edit" height="80px" width="80px"
                             style="position:relative; left:220"><br /><br />
                        <label for="classid"> Class Code  </label>
                  <select name="classid" id="selectThis" style="width: 300px; height:30px; font-size: 15px; border :2px solid">
       
                    
                        
  <%
        try 
        {
          //  AnnouncementDao announcement = new AnnouncementDaoImpl();
                HttpSession session1 = request.getSession(false);
                String email = (String) session1.getAttribute("email");
                Createclass A = new Createclass();
                A.setEmail(email);
              //  announcement.displayAnnnouncement(A);
                
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edutor", "root", "");
           
            
            String sql2 = "SELECT classid FROM class where email='" + A.getEmail() + "'";
             PreparedStatement pstmt1 = con.prepareStatement(sql2);
            ResultSet rs = pstmt1.executeQuery();
            
            if(rs.next()== false)
              {
                  out.println("No records");
                  
              }
              else
              {
               
                 
            
               %>
              
                      <% 
                       do{  %> 
                                   <option ><%= rs.getString("classid") %></option>
                           
                                    
                                    <%
                       
                       }while(rs.next()); %>
                      <%
                
              }
        }
        catch(Exception e)
        {
         e.getStackTrace();
        }
        %>  </select>
                        <br><br>
                        <label for="subject">Subject</label>
                        <input type="text" name = "subject" size="40"><br/><br/>

                        <label for="grade">Grade</label>
                        <input type="text" name = "grade" size="40"><br /><br/>

                        <label for="medium">Medium</label>
                        <input type="text" name = "medium" size="40"><br/><br/>

                        <p>Select Class:</p>
                
                <input type="radio" id="free" name="classoption" value="free">
                � <label for="free">Free Demo</label>
                � <input type="radio" id="paid" name="classoption" value="paid">
                <label for="paid">Paid</label><br><br>

                <label for="fees">Fees</label>
                <input type="text" name = "fees" size="40"><br/>
                <small>(required for paid classes)</small><br />
                <br>
                <button type="submit" class="save" style="position:relative; left:200px">Submit</button>
            </div></form>





    </div>
</div>
<div class="footer-bar">
    <ul>

        <li><a href="facebook"><i class="fab fa-facebook"></i></a></li>
        <li><a href="facebook"><i class=" fab fa-twitter"></i></a></li>
        <li><a href="facebook"><i class="fab fa-google"></i></a></li>

        <li><a href="../About.html" style="position:relative; left:50px">About us</a></li>
        <li><a href="../Help.html" style="position:relative; left:50px">Help</a></li>
        <li><a href="../TermsandConditions.html" style="position:relative; left:50px">Terms and Conditions</a></li>

    </ul>

</div>

</body>

</html>