<!--
      Author        : Siddhartha Karnam, Shashank Bhaskaruni, Shivaji Goud P
      Description   : After user clicks on login button on home page, the background database connectivity and validation is done and 
                      user session will be started.
      College       : CVR College of Engineering

-->

<%@ page import ="java.sql.*" %>
<%
    String username = request.getParameter("username");    
    String password = request.getParameter("password");
    String value = request.getParameter("role");
    int value1 = Integer.parseInt(value);
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork",
            "root", "root");
    Statement st = con.createStatement();
    ResultSet rs=null;
    rs = st.executeQuery("select * from users where rollno='" + username + "' and pwd='" + password + "'");
    
    int flag=0,id=0;
    if(rs.next()){
       id = rs.getInt(1);
     } 
    if (value1 == 1 && id >= 501) {
    
    	  flag=1;
        session.setAttribute("username", username);
        response.sendRedirect("student_page.jsp");
      
    }
    
    if (value1 == 2 && id >=101 && id<200) {

        session.setAttribute("username", username);
        response.sendRedirect("faculty_page.jsp");
       
    }
    if(value1 == 3 && id == 201 ){
    
      flag=1;
    	session.setAttribute("username", username);
      response.sendRedirect("placment_page.jsp");
    }
    if(flag==0){
                  out.println("Unauthorized person");
     }
    else{
        out.println("Invalid username/password <a href='home.jsp'>try again</a>");
    }
%>