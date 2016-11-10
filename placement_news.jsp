
<!--
      Author        : Siddhartha Karnam, Shashank Bhaskaruni, Shivaji Goud P
      Description   : This code is about diplaying the placement news that is posted by placement incharge.
      College       : CVR College of Engineering
-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<html>
<head>
  
  <script src="js/jquery.min.js"></script>
  <link href='https://fonts.googleapis.com/css?family=Josefin+Sans' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">

        <!-- Website CSS style -->
        <link rel="stylesheet" type="text/css" href="css/placement.css">
        <link rel="stylesheet" type="text/css" href="css/main.css"> 
    <style>
        .morecontent span {
             display: none;
         }
         .morelink {
             display: block;
          }
    </style>
            <script>
        $(document).ready(function() {
    // Configure/customize these variables.
    var showChar = 100;  // How many characters are shown by default
    var ellipsestext = "...";
    var moretext = "Show more >";
    var lesstext = "Show less";
    

    $('.more').each(function() {
        var content = $(this).html();
 
        if(content.length > showChar) {
 
            var c = content.substr(0, showChar);
            var h = content.substr(showChar, content.length - showChar);
 
            var html = c + '<span class="moreellipses">' + ellipsestext+ '&nbsp;</span><span class="morecontent"><span>' + h + '</span>&nbsp;&nbsp;<a href="" class="morelink">' + moretext + '</a></span>';
 
            $(this).html(html);
        }
 
    });
 
    $(".morelink").click(function(){
        if($(this).hasClass("less")) {
            $(this).removeClass("less");
            $(this).html(moretext);
        } else {
            $(this).addClass("less");
            $(this).html(lesstext);
        }
        $(this).parent().prev().toggle();
        $(this).prev().toggle();
        return false;
    });
});
    </script>

</head>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork",
        "root", "root");
Statement st = con.createStatement();
 
   ResultSet rs = null; 
%>
<body>
<div class="container">
	<div class="row">
		<h2 class="text-center">Placement News</h2>
            <div class="row">
                
                <div class="col-md-4 col-md-offset-4 text-center">
                    <div class="sn-posts">
                        <div class="sn-posts-content">
                           <%  
   
                                int rowCount=0;


                                rs = st.executeQuery("SELECT COUNT(*) AS rowcount FROM placementnews");

                                if (rs.next())
                                      rowCount = rs.getInt("rowcount");
                                for(int index=1,index1=501;index<=rowCount;index++,index1++)
                                {
                                    String query = "select * from placementnews where pid = "+index1+"";
                                    rs = st.executeQuery(query);
                                    while(rs.next())
                                    {
                                      %>


							           <div class="row">
								           <img src="<%=rs.getString(4)%>" class="sn-posts-img"><br>
								           <div class="sn-posts-sub-content">
								              <div class="pull-left">
									          <span class="sn-posts-title"><%=rs.getString(2)%></span><br>
									          </div><br>
									          <span class="more">
									          <%=rs.getString(3)%><br>
									          </span>
								            </div><hr/>
							            </div>
							     <%
							        }
							    }
							    %>
                        </div>
                    </div>
                </div>
            </div> 
                    
        </div>
	</div>


    </body>

</html>