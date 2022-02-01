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

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="716" border="0" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable-->
  <tr> 
    <td width="400" height="90" valign="top"><img src="images/admin/admin_left_1.gif" width="400" height="90"></td>
    <td width="10" rowspan="8"></td>
    <td width="305">&nbsp;</td>
    <td width="1"></td>
  </tr>
  <tr> 
    <td height="28" valign="top"><a href="admin_left_appn.jsp"> <img src="images/admin/admin_left_31.gif" width="140" height="28" border="0"></a><img src="images/admin/admin_left_3.gif" width="260" height="28"> </td>
    <td rowspan="5" valign="top"><img src="images/admin/welcome1.jpg" width="306" height="100"></td>
    <td></td>
  </tr>
  <tr> 
    <td height="18" valign="top"><img src="images/admin/admin_left_4.gif" width="400" height="18"></td>
    <td></td>
  </tr>
  <tr> 
    <td height="27" valign="top"><a href="admin_left_appn_new.jsp"><img src="images/admin/admin_left_32.gif" width="140" height="27" border="0"></a><img src="images/admin/admin_left_6.gif" width="260" height="27"></td>
    <td></td>
  </tr>
  <tr> 
    <td height="18" valign="top"><img src="images/admin/admin_left_7.gif" width="400" height="18"></td>
    <td></td>
  </tr>
  <tr> 
    <td rowspan="2" valign="top"><img src="images/admin/admin_left_23.gif" width="140" height="28"><img src="images/admin/admin_left_41.gif" width="260" height="28"></td>
    <td height="9"></td>
  </tr>
  <tr> 
    <td height="19">&nbsp;</td>
    <td></td>
  </tr>
  <tr> 
    <td height="267" valign="top"><img src="images/admin/admin_left_10.gif" width="400" height="209"></td>
    <td></td>
    <td></td>
  </tr>
</table>
</body>
</html>
<%
}
else
	out.println("Unregistered User");
%>