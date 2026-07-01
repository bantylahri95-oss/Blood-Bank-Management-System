<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<title>Admin Login</title>

<link rel="stylesheet" href="style.css" type="text/css">

<style>
input[type="text"],
input[type="password"]
{
    border: none;
    background: silver;
    height: 50px;
    font-size: 16px;
    margin-left: 35%;
    padding: 15px;
    width: 33%;
    border-radius: 25px;
}
</style>

</head>

<body>

<div class="header">
    <a href="index.jsp" class="logo">
        <img class="logo" src="Logo1.png">
    </a>

    <div class="header-right">
        <a href="index.jsp">Home</a>
        <a class="active" href="adminLogin.jsp">Admin Login</a>
    </div>
</div>

<div class="container">

<br><br>

<%
String msg = request.getParameter("msg");

if("invalid".equals(msg))
{
%>

<center>
<font color="red" size="5">
Invalid Username or Password
</font>
</center>

<%
}
%>

<form action="adminLoginAction.jsp" method="post">

<center><h2>Username</h2></center>

<input
type="text"
name="username"
placeholder="Enter Username"
required>

<center><h2>Password</h2></center>

<input
type="password"
name="password"
placeholder="Enter Password"
required>

<br><br>

<center>
<button type="submit" class="button">
Submit
</button>
</center>

</form>

</div>

<br><br><br><br>

<h3>
<center>
<footer style="background:#8B0000;color:white;padding:20px;text-align:center;">

<h2 style="color:white;">Blood Bank Management System</h2>

<p>
<b>Developed By</b><br>
Banty | Aradhya Singh | Bhupesh Joshi | Deepanshu | Ashutosh
</p>

<p>
Department of Master of Computer Applications (MCA)<br>
Second Year | Academic Session 2025-2026
</p>

<p>
<b>Technology Stack</b><br>
Java | JSP | JDBC | MySQL | HTML5 | CSS3 | JavaScript
</p>

<p>
© 2026 Blood Bank Management System
</p>

</footer>
</center>
</h3>

</body>
</html>