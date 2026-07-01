<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String father = request.getParameter("father");
String mother = request.getParameter("mother");
String mobilenumber = request.getParameter("mobilenumber");
String gender = request.getParameter("gender");
String email = request.getParameter("email");
String bloodgroup = request.getParameter("bloodgroup");
String address = request.getParameter("address");

Connection con = null;
PreparedStatement ps = null;

try
{
    con = ConnectionProvider.getCon();

    ps = con.prepareStatement(
        "INSERT INTO donor (id,name,father,mother,mobilenumber,gender,email,bloodgroup,address) VALUES (?,?,?,?,?,?,?,?,?)"
    );

    ps.setInt(1, Integer.parseInt(id));
    ps.setString(2, name);
    ps.setString(3, father);
    ps.setString(4, mother);
    ps.setString(5, mobilenumber);
    ps.setString(6, gender);
    ps.setString(7, email);
    ps.setString(8, bloodgroup);
    ps.setString(9, address);

    int i = ps.executeUpdate();

    if(i > 0)
    {
        response.sendRedirect("addNewDonor.jsp?msg=valid");
    }
    else
    {
        response.sendRedirect("addNewDonor.jsp?msg=invalid");
    }
}
catch(Exception e)
{
    e.printStackTrace();
    response.sendRedirect("addNewDonor.jsp?msg=invalid");
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