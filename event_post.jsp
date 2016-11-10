<!--
      Author        : Siddhartha Karnam, Shashank Bhaskaruni, Shivaji Goud P
      Description   : This code for storing the details about events that we post and sending mail to all users regarding new post about the event on the site.
      College       : CVR College of Engineering
-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    	<link href='https://fonts.googleapis.com/css?family=Josefin+Sans' rel='stylesheet' type='text/css'>
    	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    	<link rel="stylesheet" type="text/css" href="css/main.css">
   
</head>
<%@ page 
import ="java.sql.*" 
 import="java.util.Date"
import="java.util.Properties"

import="javax.mail.Authenticator"
import="javax.mail.Message"
import="javax.mail.MessagingException"
import="javax.mail.PasswordAuthentication"
import="javax.mail.Session"
import="javax.mail.Transport"
import="javax.mail.internet.AddressException"
import= "javax.mail.internet.InternetAddress"
import="javax.mail.internet.MimeMessage"
import="java.io.*"  
import="javax.servlet.ServletException"  
import="javax.servlet.http.*"
import="com.oreilly.servlet.MultipartRequest" 
%>
<%String username=(String) session.getAttribute("username"); %>
<%
    String title = request.getParameter("post_title");    
    String description = request.getParameter("post_desc");
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork",
            "root", "root");
    //Statement st = con.createStatement();
    //ResultSet rs;
    Statement st = con.createStatement();
    ResultSet rs = null;
    
    rs = st.executeQuery("SELECT id from users where rollno='"+username+"'");
    int id=0;
    if(rs.next())
    	 id = rs.getInt("id");
    int rowCount=0;

    rs = st.executeQuery("SELECT COUNT(*) AS rowcount FROM posts");

    if (rs.next())
            rowCount = rs.getInt("rowcount");
    rowCount = rowCount+1;
    rowCount = 500+rowCount;

   if(title !=  null && description != null){ 		



   String query = "insert into posts(pid,uid,title,description) values(?,?,?,?)"; 
   PreparedStatement statement = con.prepareStatement(query);
   statement.setInt(1, rowCount);
   statement.setInt(2, id);
   statement.setString(3, title);
   statement.setString(4, description);
   statement.executeUpdate();

  }
  %>
  <!-- SENDING MAIL-->

  <%
  
  ServletContext context = getServletContext();
  String host = context.getInitParameter("host");
   String port = context.getInitParameter("port");
   String user = context.getInitParameter("user");
   String pass = context.getInitParameter("pass");
  String subject ="CVR Social Network";
	String query4 = "select email from users";
      rs = st.executeQuery(query4);
      while(rs.next()){
    	  
    		 
    	       String content = username+" has posted a new event visit CVR Social network to know more detials";
    		  try{
    	            sendEmail(host, port, user, pass,rs.getString(1),subject,content);
    	       } 
    		  catch (Exception ex) {
    	            ex.printStackTrace();
    		  }
    	  
      }
  
  %>
   
   
    



<%!
        public void sendEmail(String host, String port,final String userName,final String password, String toAddress,String subject, String message)throws AddressException,
        MessagingException{
     
            // sets SMTP server properties
            Properties properties = new Properties();
            properties.put("mail.smtp.host", host);
            properties.put("mail.smtp.port", port);
            properties.put("mail.smtp.auth", "true");
            properties.put("mail.smtp.starttls.enable", "true");
     
            // creates a new session with an authenticator
            Authenticator auth = new Authenticator() {
                public PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(userName, password);
                }
            };
     
            Session session = Session.getInstance(properties, auth);
     
            // creates a new e-mail message
            Message msg = new MimeMessage(session);
     
            msg.setFrom(new InternetAddress(userName));
            InternetAddress[] toAddresses = { new InternetAddress(toAddress) };
            msg.setRecipients(Message.RecipientType.TO, toAddresses);
            msg.setSubject(subject);
            msg.setSentDate(new Date());
            msg.setText(message);
     
            // sends the e-mail
            Transport.send(msg);
     
        }
    %> 
    
    
    
  

    
    
    
   
       <body>
     
  <button type="button" class="btn sn-btn" data-toggle="modal" data-target="#myModal2">
  insert event photo
</button>

<!-- Modal -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        <form action="photo.jsp" method="post" enctype="multipart/form-data">
                  <label>Photo<input type="file" name="post_photo"></label><br/>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Save changes</button>
        </form>
      </div>
    </div>
  </div>
</div>
<script src="js/jquery-1.11.3.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
</body>
</html> 