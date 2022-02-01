<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%
String radio = request.getParameter("radiobutton");
//String solution = request.getParameter("Solution");
if(radio.equals("Yes"))
{
response.sendRedirect("check_collect.jsp");
}

else if(radio.equals("No"))
{
response.sendRedirect("check_thank.jsp");
}

%>
