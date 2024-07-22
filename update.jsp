<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Update Form</title>
<link rel="stylesheet" href="style1.css">
</head>
<body>
<%@ page import ="java.sql.*" %>
<%
int stud_id=Integer.parseInt(request.getParameter("studid"));
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/aecdb","root","Adil@123");
PreparedStatement st=con.prepareStatement("Select * from student where stud_id=?");
st.setInt(1,stud_id);
ResultSet rs= st.executeQuery();

String fullname="",email="",mob_no="",dept="",address="";
if(rs.next()){
	fullname=rs.getString(2);
	email=rs.getString(3);
	mob_no=rs.getString(4);
	dept=rs.getString(5);
	address=rs.getString(6);
	
}
st.close();
con.close();
%>
<div class="header">
 <h2>Student Managment App</h2>
</div>
<div class = "add-student" id="studentForm">
   <div class="title">
    <h2>Update Student Details</h2> 
   </div>
   
  <form method ="post" action="studentupdate.jsp">
     <input type ="number" value ="<%=stud_id %>" name="stud_id"  placeholder="Student Id">
     <input type ="text" name="fullname" value="<%=fullname%>"  placeholder="Full Name">
     <input type ="email"  name="email" value="<%=email%>"  placeholder="Email">
     <input type ="text"  name="mob_no" value="<%=mob_no%>"  placeholder="Mobile no">
     <input type ="text"  name="dept" value="<%=dept%>"  placeholder="Department">
     <textarea name="add">
      <%=address%>
     
     </textarea>
     <input type="submit" value ="Update Student">
  </form> 
 
</div>

</body>
</html>
