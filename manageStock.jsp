<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%@include file="header.html"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Stock</title>

<link rel="stylesheet" href="style.css" type="text/css">

<style>
input[type="text"], select
{
    border:none;
    background:silver;
    height:50px;
    font-size:16px;
    margin-left:35%;
    padding:15px;
    width:33%;
    border-radius:25px;
}

#customers{
    font-family:Arial, Helvetica, sans-serif;
    border-collapse:collapse;
    width:55%;
}

#customers td,#customers th{
    border:1px solid #ddd;
    padding:8px;
}

#customers tr:nth-child(even){
    background-color:#f2f2f2;
}

#customers tr:hover{
    background-color:#ddd;
}

#customers th{
    padding-top:12px;
    padding-bottom:12px;
    text-align:left;
    background-color:#4CAF50;
    color:white;
}
</style>

</head>

<body>

<div class="container">

<br>

<%
String msg=request.getParameter("msg");

if("valid".equals(msg)){
%>
<center><font color="green" size="5">Stock Updated Successfully.</font></center>
<%
}

if("invalid".equals(msg)){
%>
<center><font color="red" size="5">Something Went Wrong! Try Again.</font></center>
<%
}
%>

<form action="manageStockAction.jsp" method="post">

<center><h2>Select Blood Group</h2></center>

<select name="bloodgroup" required>
<option value="A+">A+</option>
<option value="A-">A-</option>
<option value="B+">B+</option>
<option value="B-">B-</option>
<option value="AB+">AB+</option>
<option value="AB-">AB-</option>
<option value="O+">O+</option>
<option value="O-">O-</option>
</select>

<center><h2>Operation</h2></center>

<select name="incdec" required>
<option value="inc">Increase</option>
<option value="dec">Decrease</option>
</select>

<center><h2>Units</h2></center>

<input type="text" name="units" placeholder="Enter Units" required>

<br><br>

<center>
<button type="submit" class="button">Save</button>
</center>

</form>

<br><br>

<center>

<table id="customers">

<tr>
<th>Blood Group</th>
<th>Available Units</th>
</tr>

<%
Connection con=null;
Statement st=null;
ResultSet rs=null;

try
{
    con=ConnectionProvider.getCon();
    st=con.createStatement();

    rs=st.executeQuery("SELECT * FROM stock ORDER BY bloodgroup");

    while(rs.next())
    {
%>

<tr>
<td><%=rs.getString("bloodgroup")%></td>
<td><%=rs.getInt("units")%></td>
</tr>

<%
    }
}
catch(Exception e)
{
    out.println("<center><font color='red'>"+e.getMessage()+"</font></center>");
}
finally
{
    try{
        if(rs!=null) rs.close();
    }catch(Exception e){}

    try{
        if(st!=null) st.close();
    }catch(Exception e){}

    try{
        if(con!=null) con.close();
    }catch(Exception e){}
}
%>

</table>

</center>

</div>

<br><br><br>

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