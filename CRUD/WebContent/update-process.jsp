<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3309/ABIT_MASTER";%>
<%!String user = "root";%>
<%!String psw = "1234";%>
<html>
<head>
  <title>Upadte Record</title>
 </head>
 <body background="clgpic.jpg">
<%
String id = request.getParameter("id");
String ses =request.getParameter("Session");
String br =request.getParameter("Branch");
String yrs =request.getParameter("Years");
String sem =request.getParameter("Semester");
String sname =request.getParameter("Stud_Name");
if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update student_master set Regd_No=?, Session=?, Branch=?,Years=?,Semester=?,Stud_Name=? where Regd_No="+id;
ps = con.prepareStatement(sql);
ps.setString(1,id);
ps.setString(2, ses);
ps.setString(3, br);
ps.setString(4, yrs);
ps.setString(5, sem);
ps.setString(6, sname);
int i = ps.executeUpdate();
if(i > 0)
{
	%><a href="Showall.jsp">Goto Show All Records</a><br> <%
			%><center><%out.print("Record Updated Successfully");%></center><%

}
else
{
	%><a href="Showall.jsp">Goto Show All Records</a><br> <%
			%><center><%out.print("There is a problem in updating Record.");%></center><%

}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>

</body>
</html>
