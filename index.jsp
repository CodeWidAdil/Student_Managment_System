<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Management System</title>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<%@ page import="java.sql.*" %>
   <div class="header">
        <h2>Student Management System</h2>
        <button onclick ="toggle()">Add Student</button>
   </div> 
   <div class="panel">
   <table>
   <thead>
      <tr>
      <th>stud_id</th>
      <th>fullname</th>
      <th>email</th>
      <th>mob_no</th>
      <th>dept</th>
      <th>address</th>  
      <th>action</th>   
      </tr>
   </thead>
   <tbody>
   <%
   Class.forName("com.mysql.jdbc.Driver");
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/aecdb","root","Adil@123");
   PreparedStatement stmt =con.prepareStatement("Select * from student ");
   ResultSet resultset= stmt.executeQuery();
   while(resultset.next()){
   
   
   
   %>
   <tr>
    <td><%=resultset.getInt("stud_id") %></td>
    <td><%=resultset.getString("fullname") %></td>
    <td><%=resultset.getString("email") %></td>
    <td><%=resultset.getString("mob_no") %></td>
    <td><%=resultset.getString("dept") %></td>
    <td><%=resultset.getString("address") %></td>
    <td>
    	<a href="update.jsp?studid=<%=resultset.getInt(1)%>"><i class="fa-solid fa-pen-to-square"></i></a>
    	<a href="studentdelete.jsp?stud_id=<%=resultset.getInt(1)%>"><i class="fa-solid fa-trash"></i></a>
    </td>
   </tr>
   <%} %>
   </tbody>
   
   
   </table>
   </div>
   <div class="add-student" id ="studentForm" style="display: none;">
    <div class="title">
    <h2>Student Registration Form</h2>
    </div>
    <form method="post" action="studentadd.jsp">
        <input type="number" name="studid" placeholder="studentid">
        <input type="text"  name="fullname" placeholder="Full name">
        <input type="email" name="email"  placeholder="email id">
        <input type="text" name="mob" placeholder="mobile no">
        <input type="date" name="dob" >
        <input type="text"  name="dept" placeholder="department">
        <textarea name="address">
         
        </textarea>
        <input type="submit" value ="Add student">
    </form>
   </div>
   <script>
    var studentForm =document.querySelector("#studentForm")
    function toggle(){
        if(studentForm.style.display=='none'){
            studentForm.style.display='block';
            studentForm.style.animation='anim1 linear 0.5s';
            console.log("In If block");
        }
            else{
                studentForm.style.display='none';
                console.log("Coming to else");
            }
    }  
        
    
    
    </script>
    
</body>
</html>
