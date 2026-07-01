<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="style.css" type="text/css">

<style>
.mySlides{
    display:none;
}

input[type="text"],
input[type="email"]
{
    border:none;
    background:silver;
    height:50px;
    font-size:16px;
    margin-left:2%;
    padding:15px;
}

</style>

</head>

<body>

<div class="header">
    <a href="#" class="logo">
       <img class="logo" src="Logo1.png">
    </a>

    <div class="header-right">
        <a class="active" href="index.jsp">Home</a>
        <a href="adminLogin.jsp">Admin Login</a>
    </div>
</div>

<div style="max-width:100%">
    <img class="mySlides" src="slide1.jpg">
    <img class="mySlides" src="slide2.png">
</div>

<script>
var myIndex = 0;
carousel();

function carousel()
{
    var i;
    var x = document.getElementsByClassName("mySlides");

    for(i=0;i<x.length;i++)
    {
        x[i].style.display="none";
    }

    myIndex++;

    if(myIndex>x.length)
    {
        myIndex=1;
    }

    x[myIndex-1].style.display="block";

    setTimeout(carousel,2000);
}
</script>

<br>

<%
String msg=request.getParameter("msg");

if("valid".equals(msg))
{
%>

<center>
<font color="green" size="5">
Form Submitted Successfully. You will get notified within 24 hours.
</font>
</center>

<%
}

if("invalid".equals(msg))
{
%>

<center>
<font color="red" size="5">
Invalid Data! Try Again.
</font>
</center>

<%
}
%>

<center>
<h1>Enter Your Details to Request Blood</h1>
</center>

<center>

<form action="indexFormAction.jsp" method="post">

<input type="text" name="name" placeholder="Enter Name" required>

<input type="text" name="mobilenumber" placeholder="Enter Mobile Number" required>

<input type="email" name="email" placeholder="Enter Email Address" required>

<input type="text" name="bloodgroup" placeholder="Enter Blood Group" required>

<br><br>

<button type="submit" class="button1">
<span>Submit</span>
</button>

</form>

</center>

<br><br>

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