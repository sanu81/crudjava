<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Year List</title>
<%ResultSet resultset =null;%>
<%!
String nm , br;
%>
</head>
<body background="clgpic.jpg">
<a href="http://localhost:8080/CRUD/index.html">Goto Dashboard</a>
<form action="StudentInfo.jsp">
<%
nm = request.getParameter("cn");
Branch : out.print(nm);
    try{
    	 Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3309/ABIT_MASTER?" + "user=root&password=1234");   

       Statement statement = conn.createStatement() ;

       resultset =statement.executeQuery("select * from PROGRAMME_MASTER where programme_name ='"+nm+"'") ;
%>

<center>
    <h1>Course Name</h1>
        <input type = "hidden" name="br" value=<%=nm%>>
        <%  while(resultset.next()){ %>
            <input type="radio" NAME="yr" value= "<%= resultset.getString(2) %>"><%= resultset.getString(2)%>
        <% } %>
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