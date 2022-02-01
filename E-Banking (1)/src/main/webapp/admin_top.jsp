<%@ page contentType="text/html;" language="java" import="java.sql.*" errorPage="" %>
<%
String ent=String.valueOf(session.getAttribute("entadm"));
if (ent.equals("yes"))
{
	
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body style="background-color:brown;" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="780" border="0" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable-->
  <tr> 
    <td height="66" colspan="3" valign="top"><img src="images/admin/admin_top_1.gif" width="1366" height="66"></td>
  </tr>
  <tr> 
    <td width="663" height="30" valign="top"><img src="images/admin/admin_top_2.gif" width="1213" height="30"></td>
    <td width="97" valign="top"><a href="admin_home.jsp" target="_parent"><img src="images/admin/admin_top_3.gif" width="127" height="30" border="0"></a></td>
    <td width="20"><img src="images/admin/admin_top_4.gif" width="40" height="30"></td>
  </tr>
  <tr> 
    <td height="52" colspan="3"><img src="images/admin/admin_top_5.gif" width="1366" height="104"></td>
  </tr>
</table>
</body>
</html>
<%
}
else
	out.println("Unregistered User");
%>