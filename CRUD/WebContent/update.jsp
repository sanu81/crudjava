<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3309/";
String database = "ABIT_MASTER";
String userid = "root";
String password = "1234";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from student_master WHERE regd_no="+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
<body>
<center>

<h1>Update Student Information</h1>
<form method="post" action="update-process.jsp">

<table>

<tr>
<td align="center">
&nbsp&nbsp&nbsp&nbsp&nbsp&nbspRegistration No :<%=resultSet.getString("regd_no") %>
</td>
<td>
<input type="hidden" name="id" value="<%=resultSet.getString("regd_no") %>">
</td>
</tr>

<tr>
<td align="center">
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspSession:
</td>
<td>
<input type="text" name="Session" value="<%=resultSet.getString("Session") %>">
</td>
</tr>

<tr>
<td align="center">
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspBranch:
</td>
<td>
<input type="text" name="Branch" value="<%=resultSet.getString("Branch") %>">
</td>
</tr>

<tr>
<td align="center">
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspYear:
</td>
<td>
<input type="text" name="Years" value="<%=resultSet.getString("Years") %>">
</td>
</tr>

<tr>
<td align="center">
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspSemester:
</td>
<td>
<input type="text" name="Semester" value="<%=resultSet.getString("Semester") %>">
</td>
</tr>

<tr>
<td align="center">
Student Name:
</td>
<td>
<input type="text" name="Stud_Name" value="<%=resultSet.getString("Stud_Name") %>">
</td>
</tr>


<tr>
<td></td>
<td>
<input type="submit" value="submit">
</td>
</tr>

</table>
</center>
</form>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>
