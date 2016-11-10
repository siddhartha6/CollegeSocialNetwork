<!--
      Author        : Siddhartha Karnam, Shashank Bhaskaruni, Shivaji Goud P
      Description   : This code for storing the images at specified location that we upload for events.
      College       : CVR College of Engineering
-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% 


Class.forName("com.mysql.jdbc.Driver");

Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork",
        "root", "root");
Statement st = con.createStatement();
ResultSet rs = null;
int id=0,rowCount=0;
rs = st.executeQuery("SELECT id from users where rollno='"+username+"'");

id=0;
if(rs.next())
   id = rs.getInt("id");
if(username.equals("placement")) {
      
         rowCount=0;
         rs = st.executeQuery("SELECT COUNT(*) AS pncount FROM placementnews");
         if(rs.next())
             rowCount = rs.getInt("pncount");
         rowCount = rowCount+1;
 }
 else{

rowCount=0;
rs = st.executeQuery("SELECT COUNT(*) AS rowcount FROM posts");

if (rs.next())
        rowCount = rs.getInt("rowcount");
//rowCount = rowCount+1;
rowCount = 500+rowCount;
}
    MultipartRequest m=new MultipartRequest(request,"C:/Program Files/Apache Software Foundation/Tomcat 8.0/webapps/CollegeSocialNetwork/images");  
   

    String str1=m.getFile("post_photo").toString();
    //System.out.println(str1);
    int len = str1.length();
    for(int i=0;i<len;i++){
      if(str1.charAt(i) == '\\')
        str1.replace('\\', '/');
    } 
    File oldName = new File(str1);
    String temp = Integer.toString(rowCount);
    String str2 = "C:/Program Files/Apache Software Foundation/Tomcat 8.0/webapps/CollegeSocialNetwork/images/"+temp+".jpg";
    String str3 = "images/"+temp+".jpg";
    File newName = new File(str2); 
    
    if(oldName.renameTo(newName)) {
        System.out.println("renamed");
     } 
      else {
       System.out.println("Error");
     } 

     if(username.equals("placement")) {
      
          int pncount=0;
         rs = st.executeQuery("SELECT COUNT(*) AS pncount FROM placementnews");
         if(rs.next())
             pncount = rs.getInt("pncount");
         if(pncount > 0){
             pncount = 500+pncount;
             String query1 = "update placementnews set src='"+str3+"' where pid="+pncount+"";
             st.executeUpdate(query1);
         }
      }
     else{
          String query = "update posts set src='"+str3+"' where uid="+id+" and pid="+rowCount+"";
    
   
       st.executeUpdate(query);
      }
   
       
  %>
  <% 
    if(username.equals("placement"))
          response.sendRedirect("placement_user_page.jsp");
    else if(id > 100 && id <= 200)
           response.sendRedirect("faculty_page.jsp");
    else
           response.sendRedirect("student_page.jsp");
%>
  <script src="js/jquery-1.11.3.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
</body>
</html>s