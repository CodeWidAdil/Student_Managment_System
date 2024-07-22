<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
int studid;
String fullname,email,mob,dob,dept,address;
studid=Integer.parseInt(request.getParameter("stud_id"));
fullname=request.getParameter("fullname");
email=request.getParameter("email");
mob=request.getParameter("mob_no");
dob=request.getParameter("dob");
dept=request.getParameter("dept");
address=request.getParameter("add");

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/aecdb","root","Adil@123");
PreparedStatement ps=con.prepareStatement("UPDATE student SET fullname=?,email=?,mob_no=?,dept=?,address=? WHERE stud_id=?");
ps.setInt(6, studid);
ps.setString(1,fullname);
ps.setString(2,email);
ps.setString(3, mob);
ps.setString(4,dept);
ps.setString(5,address);


ps.executeUpdate();
ps.close();
con.close();
%>
<script>
alert('Data updated successfully');
window.location.href="http://localhost:8080/studentapp/index.jsp";
</script>
</body>
</html>
