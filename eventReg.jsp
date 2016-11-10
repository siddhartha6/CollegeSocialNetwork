<!--
      Author        : Siddhartha Karnam, Shashank Bhaskaruni, Shivaji Goud P
      Description   : This code is about storing the details about the events registered by students and faculty.
      College       : CVR College of Engineering
-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%String username=(String) session.getAttribute("username"); %>
<%
    String e_id= request.getParameter("eid");
    int pid = Integer.parseInt(e_id);
    String year = request.getParameter("reg_year");
    String branch = request.getParameter("reg_branch");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork",
            "root", "root");
    Statement st = con.createStatement();
    
    ResultSet rs = null;
    String title = null;
    rs = st.executeQuery("SELECT title from posts where pid="+pid+"");
    if(rs.next())
    	 title = rs.getString(1);
  
    rs = st.executeQuery("SELECT id from users where rollno='"+username+"'");
    int id=0;
    if(rs.next())
    	 id = rs.getInt("id");
    
    st.executeUpdate("INSERT INTO registered"+"(uid,pid,title,year,branch)"+"VALUES("+id+","+pid+",'"+title+"','"+year+"','"+branch+"')");
    if(id >= 501 )
            response.sendRedirect("student_page.jsp");
    else
           response.sendRedirect("faculty_page.jsp");
%>