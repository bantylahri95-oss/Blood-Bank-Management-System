<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%@include file="header.html"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Completed Blood Requests</title>

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

#customers tr:nth-child(even) {
    background-color: #f2f2f2;
}

#customers tr:hover {
    background-color: #ddd;
}

#customers th {
    padding-top: 12px;
    padding-bottom: 12px;
    background-color: #4CAF50;
    color: white;
}
</style>

</head>

<body>

<br>

<center>

<h2>Completed Blood Requests</h2>

<table id="customers">

<tr>
    <th>Name</th>
    <th>Mobile Number</th>
    <th>Email</th>
    <th>Blood Group</th>
</tr>

<%
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try
{
    con = ConnectionProvider.getCon();

    ps = con.prepareStatement(
        "SELECT * FROM bloodrequest WHERE status=?"
    );

    ps.setString(1, "completed");

    rs = ps.executeQuery();

    while(rs.next())
    {
%>

<tr>
    <td><%=rs.getString("name")%></td>
    <td><%=rs.getString("mobilenumber")%></td>
    <td><%=rs.getString("email")%></td>
    <td><%=rs.getString("bloodgroup")%></td>
</tr>

<%
    }
}
catch(Exception e)
{
    out.println("<h3 style='color:red'>" + e.getMessage() + "</h3>");
}
finally
{
    try{
        if(rs != null) rs.close();
    }catch(Exception e){}

    try{
        if(ps != null) ps.close();
    }catch(Exception e){}

    try{
        if(con != null) con.close();
    }catch(Exception e){}
}
%>

</table>

</center>

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