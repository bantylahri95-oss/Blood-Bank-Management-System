<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String mobilenumber = request.getParameter("mobilenumber");

Connection con = null;
PreparedStatement ps = null;

try
{
    con = ConnectionProvider.getCon();

    ps = con.prepareStatement(
        "UPDATE bloodrequest SET status=? WHERE mobilenumber=?"
    );

    ps.setString(1, "completed");
    ps.setString(2, mobilenumber);

    int check = ps.executeUpdate();

    if(check > 0)
    {
        response.sendRedirect("requestForBlood.jsp");
    }
    else
    {
        response.sendRedirect("requestForBlood.jsp");
    }
}
catch(Exception e)
{
    e.printStackTrace();
    response.sendRedirect("requestForBlood.jsp");
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