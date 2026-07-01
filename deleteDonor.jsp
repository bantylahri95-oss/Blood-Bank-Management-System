<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String id = request.getParameter("id");

Connection con = null;
PreparedStatement ps = null;

try
{
    con = ConnectionProvider.getCon();

    ps = con.prepareStatement("DELETE FROM donor WHERE id=?");
    ps.setInt(1, Integer.parseInt(id));

    int check = ps.executeUpdate();

    if(check > 0)
    {
        response.sendRedirect("editDeleteList.jsp?msg=deleted");
    }
    else
    {
        response.sendRedirect("editDeleteList.jsp?msg=invalid");
    }
}
catch(Exception e)
{
    e.printStackTrace();
    response.sendRedirect("editDeleteList.jsp?msg=invalid");
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