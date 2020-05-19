<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Information</title>
<%ResultSet resultset =null;%>
<%!
String nm ,  br;
%>
</head>
<body background="clgpic.jpg">
<a href="http://localhost:8080/CRUD/index.html">Goto Dashboard</a>
<form action="Save.jsp">
<%
nm = request.getParameter("yr");
br = request.getParameter("br");
//out.print(nm);
    try{
    	 Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3309/ABIT_MASTER?" + "user=root&password=1234");   

       Statement statement = conn.createStatement() ;

       resultset =statement.executeQuery("select * from semester_MASTER where years ='"+nm+"'") ;
%>

<center>
    <h1>Student Information</h1>
    </br>
        <table  align="center" bgcolor="gray" height="100px" width="300px">
        
        <tr><td height="20"></td></tr>
        <tr>
        <td align="center">
         &nbsp &nbsp &nbsp &nbsp &nbsp  Branch:
        </td>
        <td><input type = "hidden" name="br" value=<%=br%>><%=br %>
        </td>
        </tr>
       
        <tr>
        <td align="center">
          &nbsp &nbsp &nbsp &nbsp &nbsp  &nbsp &nbsp Year:  
        </td>
        <td>
         <input type = "hidden" name="yr" value=<%=nm%>><%=nm %>
        </td>
        </tr>
        
        <tr>
        <td align="center">
         &nbsp &nbsp &nbsp &nbsp Semester:
        </td>
        <td>
        <select name = "sem">
        <%  while(resultset.next()){ %>
            <option><%= resultset.getString(2)%></option>
        <% } %>
        </select>
        </td>
        </tr>
        
        <tr>
        <td align="center">
         &nbsp &nbsp &nbsp &nbsp &nbsp &nbspSession: 
        </td>
        <td>
         <input type = "text" name="Tsess">
         </td>
        </tr>
        
        <tr>
        <td>
         &nbsp Registration No:  
        </td>
        <td>
        <input type = "text" name="Tregd">
        </td>
        </tr>
        
        
        <tr>
        <td>
        &nbsp &nbsp  &nbsp Student name:  
        </td>
        <td>
        <input type = "text" name="Tsname">
        </td>
        </tr>
        
        <tr><td height="10"></td></tr>
        
        <tr>
        <td></td>
        <td>
        <input type="submit" value="Save">
        </td>
        
        <tr><td height="10"></td></tr>
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

</body>
</html>