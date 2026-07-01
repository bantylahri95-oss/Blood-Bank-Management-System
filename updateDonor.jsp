<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%@include file="header.html"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Donor</title>

<link rel="stylesheet" href="style.css" type="text/css">

<style>
input[type="text"],
input[type="email"],
input[type="number"]
{
    border: none;
    background: silver;
    height: 50px;
    font-size: 16px;
    padding: 15px;
    width: 60%;
    border-radius: 25px;
    margin-left: 20%;
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
String id=request.getParameter("id");

Connection con=null;
PreparedStatement ps=null;
ResultSet rs=null;

try
{
    con=ConnectionProvider.getCon();

    ps=con.prepareStatement("SELECT * FROM donor WHERE id=?");
    ps.setInt(1,Integer.parseInt(id));

    rs=ps.executeQuery();

    if(rs.next())
    {
%>

<div class="container">

<form action="updateDonorAction.jsp" method="post">

<input type="hidden" name="id" value="<%=rs.getInt("id")%>">

<h2>Name</h2>
<input type="text" name="name" value="<%=rs.getString("name")%>" required>
<hr>

<h2>Father Name</h2>
<input type="text" name="father" value="<%=rs.getString("father")%>" required>
<hr>

<h2>Mother Name</h2>
<input type="text" name="mother" value="<%=rs.getString("mother")%>" required>
<hr>

<h2>Mobile Number</h2>
<input type="text" name="mobilenumber" value="<%=rs.getString("mobilenumber")%>" required>
<hr>

<h2>Email</h2>
<input type="email" name="email" value="<%=rs.getString("email")%>" required>
<hr>

<h2>Address</h2>
<input type="text" name="address" value="<%=rs.getString("address")%>" required>

<br><br>

<center>
<button type="submit" class="button">
Update
</button>
</center>

</form>

</div>

<%
    }
    else
    {
%>

<center>
<h2 style="color:red;">Donor Record Not Found.</h2>
</center>

<%
    }
}
catch(Exception e)
{
    out.println("<center><h3 style='color:red;'>"+e.getMessage()+"</h3></center>");
}
finally
{
    try{
        if(rs!=null) rs.close();
    }catch(Exception e){}

    try{
        if(ps!=null) ps.close();
    }catch(Exception e){}

    try{
        if(con!=null) con.close();
    }catch(Exception e){}
}
%>

<br><br><br>

<h3>
<center>
<footer style="background:#8B0000;color:white;padding:20px;text-align:center;">

<h3 style="color:white; text-align="center">Blood Bank Management System</h3>

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
2026 Blood Bank Management System
</p>

</footer>

</center>
</h3>

</body>
</html>