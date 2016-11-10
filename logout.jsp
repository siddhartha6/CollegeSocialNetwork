
<!--
      Author        : Siddhartha Karnam, Shashank Bhaskaruni, Shivaji Goud P
      Description   : This is logout code, where the session is invalidated and killed.
      College       : CVR College of Engineering
-->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> <%@page import = "java.sql.PreparedStatement"%>
<%if ((session.getAttribute("username") != null)){

%>


<!DOCTYPE html>
<html>
    <head>

      <title>logout</title>
    </head>
    <body>
        <%
          session.invalidate();
          response.sendRedirect("home.jsp");
        %>
        <p>You have been successfully logged out</p>
    </body>
    <%
        }
    %>
</html>
