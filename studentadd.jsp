<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
int studid;
String fullname,email,mob,dob,dept,address;
studid=Integer.parseInt(request.getParameter("studid"));
fullname=request.getParameter("fullname");
email=request.getParameter("email");
mob=request.getParameter("mob");
dob=request.getParameter("dob");
dept=request.getParameter("dept");
address=request.getParameter("address");

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/aecdb","root","Adil@123");
PreparedStatement ps=con.prepareStatement("INSERT INTO student values(?,?,?,?,?,?)");
ps.setInt(1, studid);
ps.setString(2,fullname);
ps.setString(3,email);
ps.setString(4, mob);
ps.setString(5,dept);
ps.setString(6,address);


ps.executeUpdate();
ps.close();
con.close();
%>
<script>
alert('Data added successfully');
window.location.href="http://localhost:8080/studentapp/index.jsp";
</script>
</body>
</html>
