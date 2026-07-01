<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String name = request.getParameter("name");
String mobilenumber = request.getParameter("mobilenumber");
String email = request.getParameter("email");
String bloodgroup = request.getParameter("bloodgroup");

String status = "pending";

Connection con = null;
PreparedStatement ps = null;

try
{
    con = ConnectionProvider.getCon();

    ps = con.prepareStatement(
        "INSERT INTO bloodrequest(name,mobilenumber,email,bloodgroup,status) VALUES(?,?,?,?,?)"
    );

    ps.setString(1, name);
    ps.setString(2, mobilenumber);
    ps.setString(3, email);
    ps.setString(4, bloodgroup);
    ps.setString(5, status);

    int i = ps.executeUpdate();

    if(i > 0)
    {
        response.sendRedirect("index.jsp?msg=valid");
    }
    else
    {
        response.sendRedirect("index.jsp?msg=invalid");
    }
}
catch(Exception e)
{
    e.printStackTrace();
    response.sendRedirect("index.jsp?msg=invalid");
}
finally
{
    try
    {
        if(ps != null)
            ps.close();
    }
    catch(Exception e){}

    try
    {
        if(con != null)
            con.close();
    }
    catch(Exception e){}
}
%>