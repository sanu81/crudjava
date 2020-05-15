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

<h1>Update Student Information</h1>
<form method="post" action="update-process.jsp">
Registration No :<%=resultSet.getString("regd_no") %>
<input type="hidden" name="id" value="<%=resultSet.getString("regd_no") %>">
<br>
Session:<br>
<input type="text" name="Session" value="<%=resultSet.getString("Session") %>">
<br>
Branch:<br>
<input type="text" name="Branch" value="<%=resultSet.getString("Branch") %>">
<br>
Year:<br>
<input type="text" name="Years" value="<%=resultSet.getString("Years") %>">
<br>
Semester:<br>
<input type="text" name="Semester" value="<%=resultSet.getString("Semester") %>">
<br>
Student Name:<br>
<input type="text" name="Stud_Name" value="<%=resultSet.getString("Stud_Name") %>">
<br>
<br>
<input type="submit" value="submit">
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
