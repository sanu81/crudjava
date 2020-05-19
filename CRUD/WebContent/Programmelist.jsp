<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Course Name</title>
<%ResultSet resultset =null;%>
</head>
<body background="clgpic.jpg">
    
<a href="http://localhost:8080/CRUD/index.html">Goto Dashboard</a>
<form action="Yearlist.jsp">
<%
    try{
    	 Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3309/ABIT_MASTER?" + "user=root&password=1234");   

       Statement statement = conn.createStatement() ;

       resultset =statement.executeQuery("select distinct PROGRAMME_NAME from PROGRAMME_MASTER") ;
%>

<center>
    <h1>Course Name</h1>
        <select name = "cn">
        <%  while(resultset.next()){ %>
            <option><%= resultset.getString(1)%></option>
        <% } %>
        </select>
        &nbsp;
        &nbsp;
        </br>
        </br>
        <input type="submit" value="Next">
</center>

<%
//**Should I input the codes here?**
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>

</form>
</body>
</html>
 