<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%@include file="header.html"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit / Delete Donor</title>

<style>
#customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 95%;
}

#customers td, #customers th {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: center;
}

#customers tr:nth-child(even){
    background-color: #f2f2f2;
}

#customers tr:hover{
    background-color: #ddd;
}

#customers th{
    background-color: #4CAF50;
    color: white;
    padding: 12px;
}
</style>

</head>

<body>

<br>

<%
String msg = request.getParameter("msg");

if("valid".equals(msg))
{
%>
<center><font color="green" size="5">Donor Updated Successfully.</font></center>
<%
}

if("deleted".equals(msg))
{
%>
<center><font color="green" size="5">Donor Deleted Successfully.</font></center>
<%
}

if("invalid".equals(msg))
{
%>
<center><font color="red" size="5">Something Went Wrong! Try Again.</font></center>
<%
}
%>

<br>

<center>

<table id="customers">

<tr>
<th>ID</th>
<th>Name</th>
<th>Father Name</th>
<th>Mother Name</th>
<th>Mobile Number</th>
<th>Gender</th>
<th>Email</th>
<th>Blood Group</th>
<th>Address</th>
<th>Edit</th>
<th>Delete</th>
</tr>

<%
Connection con = null;
Statement st = null;
ResultSet rs = null;

try
{
    con = ConnectionProvider.getCon();
    st = con.createStatement();

    rs = st.executeQuery("SELECT * FROM donor WHERE name IS NOT NULL AND name<>'' ORDER BY id");

    while(rs.next())
    {
%>

<tr>

<td><%=rs.getInt("id")%></td>
<td><%=rs.getString("name")%></td>
<td><%=rs.getString("father")%></td>
<td><%=rs.getString("mother")%></td>
<td><%=rs.getString("mobilenumber")%></td>
<td><%=rs.getString("gender")%></td>
<td><%=rs.getString("email")%></td>
<td><%=rs.getString("bloodgroup")%></td>
<td><%=rs.getString("address")%></td>

<td>
<a href="updateDonor.jsp?id=<%=rs.getInt("id")%>">
Edit
</a>
</td>

<td>
<a href="deleteDonor.jsp?id=<%=rs.getInt("id")%>"
onclick="return confirm('Are you sure you want to delete this donor?');">
Delete
</a>
</td>

</tr>

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
        if(st!=null) st.close();
    }catch(Exception e){}

    try{
        if(con!=null) con.close();
    }catch(Exception e){}
}
%>

</table>

</center>

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