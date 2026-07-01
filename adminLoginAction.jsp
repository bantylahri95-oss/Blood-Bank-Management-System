<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");

if (username != null && password != null)
{
    if ("admin".equals(username.trim()) && "1234".equals(password.trim()))
    {
        response.sendRedirect("home.jsp");
    }
    else
    {
        response.sendRedirect("adminLogin.jsp?msg=invalid");
    }
}
else
{
    response.sendRedirect("adminLogin.jsp?msg=invalid");
}
%>