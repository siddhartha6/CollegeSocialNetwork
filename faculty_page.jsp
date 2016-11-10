
<!--
      Author        : iddhartha Karnam, Shashank Bhaskaruni, Shivaji Goud P
      Description   : This is faculty page where facutly can add,register for events.
      College       : CVR College of Engineering
-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import ="java.sql.*" %>
<%
    if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")) {
%>
 <p>You are not logged in</p><br/>
<% 
   response.sendRedirect("home.jsp"); %>
<%
   } 
    else {
%>

<%
    String username=(String) session.getAttribute("username"); 
%>       
    
<!DOCTYPE html>
<html>
<head>
	<title>SOCIAL NETWORK</title>
	<link href='https://fonts.googleapis.com/css?family=Josefin+Sans' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sn",
        "root", "root");
Statement st = con.createStatement();
 
   ResultSet rs = null; 
%>
<body>
	<div class="sn-headBg">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-4">
					<img src="images/logo.png" class="img-responsive">
				</div>
				<div class="col-md-8">
					<div class="pull-right">
						<ul class="sn-topMenu">
							<li><a href="faculty.jsp"><img src="images/profile.png" class="img-circle" width="60"></a></li>
							<li><a href="profile.html"><%=username%></a></li>
							<li><a href="logout.jsp">Log out</a></li>
						</ul>
					</div>					
				</div>
			</div>
		</div>
	</div>
	<div class="sn-mainBg">
		<div class="container">
			<div class="row PDTB50">
				<div class="col-md-4">
					<!--placement incharge content here-->
					<div class="sn-reg">
						<div class="sn-reg-head text-center">
							Post Attendance
						</div><br>
						<div class="sn-reg-head text-center">
							Registered Events
						</div>
					<div class="sn-reg-content">
						
						
						 <%
						    rs = st.executeQuery("SELECT id from common where username='"+username+"'");
						    int id=0;
						    if(rs.next())
						    	 id = rs.getInt("id");    
						 
                            
                            	  int rowCount1=0;
                            	       String query2 = "select * from registered where id = "+id+"";
                            	       rs = st.executeQuery(query2);
                            	       while(rs.next()){
                            	          
                            	          %>
                            	           <a href="#"><%=rs.getString(3)%></a><br> 	
                            	 <%
                            	    	  
                            	  }
                              
                              %>
                              </div>
                					</div>
                				</div>
				<div class="col-md-1"></div>
				<div class="col-md-7">
					<div class="sn-posts">
						<div class="sn-posts-head text-center">
							Upcoming Events
						</div>
						<div class="sn-posts-content">
							<button type="button" class="btn sn-btn" data-toggle="modal" data-target="#post">
                        Add Posts
                       </button>

<!-- Modal -->
<div class="modal fade" id="post" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Event Details</h4>
      </div>
      <div class="modal-body">
        
                      <form action="event_post.jsp" method="post">
          <label>Title<input type="text" name="post_title" placeholder="Give suitable title" required=""></label></br/><br/>
          <label>Event Description<br/><textarea rows="6" name="post_desc"></textarea></label><br/>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Save changes</button>
        </form>
      </div>
    </div>
  </div>
</div>



                    <div class="pull-right">
				            
                                           <button type="button" class="btn sn-btn" data-toggle="modal" data-target="#register">
  Register Here for Events
</button>

<!-- Modal -->
<div class="modal fade" id="register" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Event Register</h4>
      </div>
      <div class="modal-body">
        



                 <form action="eventReg.jsp" method="post">
        <label>Event ID<input type="text" name="eid" required=""></label></br/>
      
          <% 
          String query4 = "select * from common where username = '"+username+"'";
          rs = st.executeQuery(query4);
          String name=null;
          String email=null;
          String mobile=null;
          
          if(rs.next()){
               name = rs.getString(2);
               email = rs.getString(3);
               mobile = rs.getString(6);
           
          %>
          <label>Name <input type="text" name="reg_name" value="<%=name%>" placeholder="Full Name" required=""></label></br/><br/>
          <label>Email <input type="text" name="reg_email" value="<%=email%>"></label><br/>
          <label>Mobile <input type="text" name="reg_mobile" value="<%=mobile%>"></label><br/>
           <label>Year 
                   <select name="reg_year">
                  <option value="1">I</option>
                  <option  value="2">II</option>
                  <option value="3">III</option>
                  <option value="4">IV</option>
                 </select></label>
                 <br/>
            <label>Branch<input type="text" name="reg_branch"></label><br/>  

           <%
          }
           %>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Register</button>
      </form>  
      </div>
    </div>
  </div>
</div>   
                                   
                                                     
                                                  
                                                 
                                                    
                                      
                                           
							</div><br><hr/>


							
							<%  
   
                                int rowCount=0;


                                rs = st.executeQuery("SELECT COUNT(*) AS rowcount FROM posts");

                                if (rs.next())
                                      rowCount = rs.getInt("rowcount");
                                for(int index=1,index1=501;index<=rowCount;index++,index1++)
                                {
                                    String query = "select * from posts where pid = "+index1+"";
                                    rs = st.executeQuery(query);
                                    while(rs.next())
                                    {
                                      %>


							           <div class="row">
							            <div class="sn-posts-sub-content">
							              <span class="sn-posts-title">#<%=index1%></span><br></div>
								           <img src="<%=rs.getString(5)%>" class="sn-posts-img"><br>
								           <div class="sn-posts-sub-content">
									          <span class="sn-posts-title"><%=rs.getString(3)%></span><br>
									          <p><%=rs.getString(4)%><br>
									             <a href="#">View More</a>
									           </p>
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
	
	<script src="js/jquery-1.11.3.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
						
											
							
</body>
<%
}
%>
</html>