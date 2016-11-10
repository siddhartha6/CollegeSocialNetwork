
<!--
      Author        : Siddhartha Karnam, Shashank Bhaskaruni, Shivaji Goud P
      Description   : This code for storing the user registration details and also sending login credentials to user via mail.
      College       : CVR College of Engineering
-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" 

 import="java.util.Date"
import="java.util.Properties"
import="java.util.*"

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
import="java.util.Random"
%>



<%
     Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork",
            "root", "root");
    Statement st = con.createStatement();
    ResultSet rs = null;
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String role = request.getParameter("role");
    String mobile = request.getParameter("mobile");
    String cname = request.getParameter("cname");
    String rollno = request.getParameter("rollno"); 
 
    int flag=0;
    int roleCount1=0;
    int value1 = Integer.parseInt(role);
    if(value1==3){


       rs = st.executeQuery("SELECT COUNT(*) AS roleCount from users where id='201'");
       if (rs.next())
            roleCount1 = rs.getInt("roleCount");
       if(roleCount1 > 0) {
              flag=1;
              out.println("Unautorized role\n");
              
               out.println("<a href=\"regHT.jsp\"></a>");
                  
       }
    }
    int emailCount1=0;
    rs = st.executeQuery("SELECT COUNT(*) AS emailCount from users where email='"+email+"'");
    if (rs.next())
           emailCount1 = rs.getInt("emailCount");
    if(emailCount1 > 0) {
         flag=1;
          out.println("Email Already exists\n");
        
           out.println("<a href=\"regHT.jsp\"></a>");
      
       }

      int mobileCount1=0;
    rs = st.executeQuery("SELECT COUNT(*) AS mobileCount from users where mobile='"+mobile+"'");
    if (rs.next())
           mobileCount1 = rs.getInt("mobileCount");
    if(mobileCount1 > 0) {
         flag=1;
         out.println("Mobile Number Already exists\n"); 
        
         out.println("<a href=\"regHT.jsp\"></a>");
        
      }
       int rollCount1=0;
    rs = st.executeQuery("SELECT COUNT(*) AS rollCount from users where rollno='"+rollno+"'");
    if (rs.next())
           rollCount1 = rs.getInt("rollCount");
    if(rollCount1 > 0) {
           flag=1;
          out.println("Rollno Already exists\n");
          out.println("<a href=\"regHT.jsp\"></a>");
       
       }
%>

<%
    String ALPHA_CAPS  = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    String ALPHA   = "abcdefghijklmnopqrstuvwxyz";
    String NUM     = "0123456789";
    String SPL_CHARS   = "!@#$%^&*_=+-/";
    int noOfCAPSAlpha = 1;
    int noOfDigits = 1;
    int noOfSplChars = 1;
    int minLen = 8;
    int maxLen = 12;
    char[] pswd = generatePswd(minLen, maxLen,noOfCAPSAlpha, noOfDigits, noOfSplChars,ALPHA,ALPHA_CAPS,NUM,SPL_CHARS);
    String pwd = new String(pswd);
%>

<%!

    public char[] generatePswd(int minLen, int maxLen, int noOfCAPSAlpha, 
            int noOfDigits, int noOfSplChars,String ALPHA,String ALPHA_CAPS,String NUM,String SPL_CHARS) {
        if(minLen > maxLen)
            throw new IllegalArgumentException("Min. Length > Max. Length!");
        if( (noOfCAPSAlpha + noOfDigits + noOfSplChars) > minLen )
            throw new IllegalArgumentException("Min. Length should be atleast sum of (CAPS, DIGITS, SPL CHARS) Length!");

        Random rnd = new Random();
        int len = rnd.nextInt(maxLen - minLen + 1) + minLen;
        char[] pswd = new char[len];
        int index = 0;
        for (int i = 0; i < noOfCAPSAlpha; i++) {
            index = getNextIndex(rnd, len, pswd);
            pswd[index] = ALPHA_CAPS.charAt(rnd.nextInt(ALPHA_CAPS.length()));
        }
        for (int i = 0; i < noOfDigits; i++) {
            index = getNextIndex(rnd, len, pswd);
            pswd[index] = NUM.charAt(rnd.nextInt(NUM.length()));
        }
        for (int i = 0; i < noOfSplChars; i++) {
            index = getNextIndex(rnd, len, pswd);
            pswd[index] = SPL_CHARS.charAt(rnd.nextInt(SPL_CHARS.length()));
        }
        for(int i = 0; i < len; i++) {
            if(pswd[i] == 0) {
                pswd[i] = ALPHA.charAt(rnd.nextInt(ALPHA.length()));
            }
        }
        return pswd;
    }

%>

<%!
    private int getNextIndex(Random rnd, int len, char[] pswd) {
        int index = rnd.nextInt(len);
        while(pswd[index = rnd.nextInt(len)] != 0);
        return index;
    }
%>

<%

         int value = Integer.parseInt(role);
   
    int i=0;
    if(value == 1 && flag==0){
        int rowCount1=0;
        rs = st.executeQuery("SELECT COUNT(*) AS rowcount,LEFT(id,1) as temp from users where LEFT(id,1)='5'");
        
        if (rs.next())
              rowCount1 = rs.getInt("rowcount");
        System.out.println(rowCount1);
        rowCount1 = 500+rowCount1+1;
        i=st.executeUpdate("INSERT INTO users"+"(id,name,email,mobile,college,rollno,pwd)"+
                "VALUES("+rowCount1+",'"+name+"','"+email+"','"+mobile+"','"+cname+"','"+rollno+"','"+pwd+"')");    
    }
    
    
    if(value == 2 && flag==0){
        int rowCount1=0;
        rs = st.executeQuery("SELECT COUNT(*) AS rowcount,LEFT(id,1) as temp from users where LEFT(id,1)='1'");
        
        if (rs.next())
              rowCount1 = rs.getInt("rowcount");
        System.out.println(rowCount1);
        rowCount1 = 100+rowCount1+1;
        i=st.executeUpdate("INSERT INTO users"+"(id,name,email,mobile,college,rollno,pwd)"+
                "VALUES("+rowCount1+",'"+name+"','"+email+"','"+mobile+"','"+cname+"','"+rollno+"','"+pwd+"')");    
   
    }
    
    
    if(value == 3 && flag==0){
        int rowCount1=201;
        i=st.executeUpdate("INSERT INTO users"+"(id,name,email,mobile,college,rollno,pwd)"+
                "VALUES("+rowCount1+",'"+name+"','"+email+"','"+mobile+"','"+cname+"','"+rollno+"','"+pwd+"')");    
   
    }
   
    
    if (i > 0 && flag==0) {
        response.sendRedirect("home.jsp");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    }
%>





<!--  FOR SENDING MAIL -->
<%
  
  ServletContext context = getServletContext();
  String host = context.getInitParameter("host");
   String port = context.getInitParameter("port");
   String user = context.getInitParameter("user");
   String pass = context.getInitParameter("pass");
  if(flag==0){
  String subject ="CVR Social Network";    
             
               String content = "Your Login Credentials\n\nUsername :"+rollno+"\nPassword :"+pwd+"";
          
              try{
                    sendEmail(host, port, user, pass,email,subject,content);
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
      
