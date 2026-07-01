<%@ page import="java.sql.*" %>
<%@ page import="Project.ConnectionProvider" %>
<%@ include file="header.html" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add New Donor</title>

<link rel="stylesheet" href="style.css" type="text/css">

<style>
input[type="text"],
input[type="email"],
select
{
    border:none;
    background:silver;
    height:50px;
    font-size:16px;
    padding:15px;
    width:60%;
    border-radius:25px;
    margin-left:20%;
}

h2,h1{
    margin-left:20%;
}

hr{
    width:60%;
}
</style>

</head>

<body>

<%
String msg=request.getParameter("msg");

if("valid".equals(msg))
{
%>
<center><font color="green" size="5">Donor Added Successfully.</font></center>
<%
}

if("invalid".equals(msg))
{
%>
<center><font color="red" size="5">Something Went Wrong! Try Again.</font></center>
<%
}
%>

<%
int id=1;

try
{
    Connection con=ConnectionProvider.getCon();
    Statement st=con.createStatement();

    ResultSet rs=st.executeQuery("SELECT MAX(id) FROM donor");

    if(rs.next())
    {
        id=rs.getInt(1)+1;
    }

    rs.close();
    st.close();

}
catch(Exception e)
{
    out.println("<h3>"+e+"</h3>");
}
%>

<div class="container">

<h1 style="color:red;">Donor ID : <%=id%></h1>

<form action="addNewDonorAction.jsp" method="post">

<input type="hidden" name="id" value="<%=id%>">

<h2>Name</h2>
<input type="text" name="name" placeholder="Enter Name" required>
<hr>

<h2>Father Name</h2>
<input type="text" name="father" placeholder="Enter Father Name" required>
<hr>

<h2>Mother Name</h2>
<input type="text" name="mother" placeholder="Enter Mother Name" required>
<hr>

<h2>Mobile Number</h2>
<input type="text" name="mobilenumber" placeholder="Enter Mobile Number" required>
<hr>

<h2>Gender</h2>

<select name="gender" required>
    <option value="">--Select Gender--</option>
    <option value="Male">Male</option>
    <option value="Female">Female</option>
    <option value="Other">Other</option>
</select>

<hr>

<h2>Email</h2>
<input type="email" name="email" placeholder="Enter Email" required>
<hr>

<h2>Blood Group</h2>

<select name="bloodgroup" required>
    <option value="">--Select Blood Group--</option>
    <option value="A+">A+</option>
    <option value="A-">A-</option>
    <option value="B+">B+</option>
    <option value="B-">B-</option>
    <option value="AB+">AB+</option>
    <option value="AB-">AB-</option>
    <option value="O+">O+</option>
    <option value="O-">O-</option>
</select>

<hr>

<h2>Address</h2>
<input type="text" name="address" placeholder="Enter Address" required>

<br><br>

<center>
<button type="submit" class="button">Save</button>
</center>

</form>

</div>

<br><br><br>

<h3>
<center>
<footer style="background:#8B0000;color:white;padding:20px;text-align:center;">

<h3 style="color:white;">Blood Bank Management System</h3>

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