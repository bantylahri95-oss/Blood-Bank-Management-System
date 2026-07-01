<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String bloodgroup = request.getParameter("bloodgroup");
String incdec = request.getParameter("incdec");
String units = request.getParameter("units");

Connection con = null;
PreparedStatement ps = null;

try
{
    int unit = Integer.parseInt(units);

    con = ConnectionProvider.getCon();

    if("inc".equals(incdec))
    {
        ps = con.prepareStatement(
            "UPDATE stock SET units = units + ? WHERE bloodgroup = ?"
        );
    }
    else
    {
        ps = con.prepareStatement(
            "UPDATE stock SET units = units - ? WHERE bloodgroup = ? AND units >= ?"
        );
        ps.setInt(3, unit);
    }

    ps.setInt(1, unit);
    ps.setString(2, bloodgroup);

    int check = ps.executeUpdate();

    if(check > 0)
    {
        response.sendRedirect("manageStock.jsp?msg=valid");
    }
    else
    {
        response.sendRedirect("manageStock.jsp?msg=invalid");
    }
}
catch(Exception e)
{
    e.printStackTrace();
    response.sendRedirect("manageStock.jsp?msg=invalid");
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