<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% 
int studid;

studid=Integer.parseInt(request.getParameter("stud_id"));


Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/aecdb","root","Adil@123");
String sql = "Delete from student where stud_id =?";
PreparedStatement ps =con.prepareStatement(sql);
ps.setInt(1, studid);


ps.executeUpdate();
ps.close();
con.close();
%>
<script>
alert('Data Deleted successfully');
window.location.href="http://localhost:8080/studentapp/index.jsp";
</script>




%>
