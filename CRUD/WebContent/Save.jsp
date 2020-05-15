<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<a href="http://localhost:8080/CRUD/index.html">Goto Dashboard</a>
<%@page import="java.sql.*,java.util.*"%>
<%
String br=request.getParameter("br");
String yr=request.getParameter("yr");
String sem=request.getParameter("sem");
String sess=request.getParameter("Tsess");
String regd=request.getParameter("Tregd");
String sname=request.getParameter("Tsname");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3309/ABIT_MASTER", "root", "1234");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into Student_Master(Regd_No,Session,Branch,Years,Semester,Stud_Name)values('"+regd+"','"+sess+"','"+br+"','"+yr+"','"+sem+"','"+sname+"')");
out.println("</br></br>Successfully ! Please <a href='http://localhost:8080/CRUD/Showall.jsp'>Next To See All Records</a> to continue.");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
