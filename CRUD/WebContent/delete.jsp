<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Data</title>
</head>
<body background="clgpic.jpg">
<a href="Showall.jsp">Goto Show All Records</a>

<form action="delete.jsp">
<br><br><br><br><br><br><br><br><br><br>
<table align="center" bgcolor="gray" height="100px" width="300px">

<tr><td height="15"></td></tr>
<tr>
<td>Enter ID To Delete</td>
<td><input type="text" name="id"/></td>
</tr>

<tr><td height="10"></td></tr>

<tr>
<td></td>
<td><input type="submit" value="Delete"/></td>
</tr>
<tr><td height="10"></td></tr>
</table>
</form>

<%
String id = request.getParameter("id");
try
{
	Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3309/ABIT_MASTER?" + "user=root&password=1234");   
String sql = "DELETE FROM student_master WHERE regd_no="+id;
PreparedStatement ps = conn.prepareStatement(sql);
int i = ps.executeUpdate();
if(i > 0)
{%>
<%
out.print("Record Deleted Successfully");
%>
<% 
}
else
{%>
<%
out.println("There is a problem in Deleting Record."); 
out.print("Check Manually in your Database");
 %>
<%}
}
catch(SQLException sqe)
{
request.setAttribute("error", sqe);
out.println(sqe);
}

%>


</body>
</html>
