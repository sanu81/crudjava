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
    try{
        String username = request.getParameter("userId");   
        String password = request.getParameter("password");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3309/abit_master?" + "user=root&password=1234"); 
        PreparedStatement pst = conn.prepareStatement("Select userid,password from users_master where userId=? and password=?");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();                        
        if(rs.next())
        {
        	out.println("Valid login ID");
        	%>
        	<center>
        	<a href="http://localhost:8080/CRUD/Programmelist.jsp">Select Course</a>
        	</center>
        	<%
        }
        else
        {
        out.println("Invalid Login ID");
        %>
    	<center>
    	<a href="http://localhost:8080/CRUD/index.html">Goto LogIn Page</a>
    	</center>
    	<%
        }
       }
   
    catch(Exception e)
    {       
       out.println("Something went wrong !! Please try again");       
    }   
    
%>

</center>
</font>
</body>
 </html> 
