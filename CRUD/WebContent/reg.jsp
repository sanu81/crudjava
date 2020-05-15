<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<html>
 <head>
  <title>Dashboard</title>
 </head>
 <body background="clgpic.jpg">
 <font color="white">
     <table width="90%" height="200px" align="center" bgcolor="#004048">
	 <tr>
	      <td width="20%" height="200px">
		    <img src="logo.png" height="200px" width="90%" align="center">
		  </td>
		  <td width="80%" height="200px" bgcolor="" valign="top">
		     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span><font face="calibri" size="30px" color="white"><b>ABIT</b></font></span>
			 
			 <hr width="15%" align="left" size="6px" color="white" align="left">
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 <span><font face="calibri" size="6" color="white"><b>AJAY BINAY INSTITUTE OF TECHNOLOGY</b></font></span>
			 <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 <span><font face="calibri" size="3" color="white"><b>
			      AICTE &nbsp;&nbsp;&nbsp;||&nbsp;&nbsp; NAAC ACCREDITED
				  &nbsp;&nbsp;||&nbsp;&nbsp;&nbsp;BPUT AFFILIATED
			 
			 </b></font></span>
		  </td>
		 
	 </tr>
	 </table>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
 
<center>
<%
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String email=request.getParameter("email");
String userid=request.getParameter("userid");
String password=request.getParameter("password");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3309/abit_master", "root", "1234");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into users_master(fname,lname,email,userid,password)values('"+fname+"','"+lname+"','"+email+"','"+userid+"','"+password+"')");
out.println("Thank you for Register ! Please <a href='index.html'>Login</a> to continue.");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
</center>
</font>
</body>
 </html> 