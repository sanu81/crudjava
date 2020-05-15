<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Records In Detail</title>
<%ResultSet resultset =null;%>
</head>
<body>
<form action="index.html">
<%
   try{
    	 Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3309/ABIT_MASTER?" + "user=root&password=1234");   

       Statement statement = conn.createStatement() ;

       resultset =statement.executeQuery("select * from STUDENT_MASTER") ;
%>

<center>
    <h1>Student List</h1>
    <table border=1>
    <tr><th>Registration No</th><th>Session</th><th>Branch</th><th>
Years</th><th>Semester</th> <th>Student Name</th></tr>
        <%  while(resultset.next()){ %>
<tr><td><%= resultset.getString(1) %></td><td><%= resultset.getString(2) %></td><td><%= resultset.getString(3) %></td><td>
<%= resultset.getString(4) %></td><td><%= resultset.getString(5) %></td><td><%= resultset.getString(6) %></td></tr>
        <% } %>
        
       </table>
</center>

<%
//**Should I input the codes here?**
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>
<br> 
 <center>
 
 <input type="submit" value="Back">
 </center>
</form>

<br>
<center>
<table>
<tr>
<td>
<form action="delete.jsp">
<input type="submit" value="DelRecord"> 
</form>
</td>

<td>
<form action = "UpdateRegdno.jsp">
 <input type="submit" value="Update">
 </form>
 </td>
  </tr>
 </table>
 </center>
</body>
</html>
    