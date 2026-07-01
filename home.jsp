<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="header.html" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Admin Home</title>

<style>
img{
    width:100%;
    height:609px;
}

.mySlides{
    display:none;
}
</style>

</head>

<body>

<br>

<div style="max-width:100%">
    <img class="mySlides" src="welcome.jpg" alt="Welcome">
    <img class="mySlides" src="admin.PNG" alt="Admin">
    <img class="mySlides" src="slide1.jpg" alt="Slide">
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
        x[i].style.display = "none";
    }

    myIndex++;

    if(myIndex > x.length)
    {
        myIndex = 1;
    }

    x[myIndex-1].style.display = "block";

    setTimeout(carousel,2000);
}

</script>

<br>

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