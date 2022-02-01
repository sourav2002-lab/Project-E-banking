<%@ page contentType="text/html;" language="java" import="java.sql.*" errorPage="" %>
<%
String ent=String.valueOf(session.getAttribute("enter"));
if (ent.equals("yes"))
{
	session.invalidate();
%>
<html>
<head>
<title>Log Out</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body background="images/bg.gif" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="753" border="0" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable-->
  <tr> 
    <td width="138" height="153">&nbsp;</td>
    <td width="324">&nbsp;</td>
    <td width="61">&nbsp;</td>
    <td width="29">&nbsp;</td>
    <td width="201">&nbsp;</td>
  </tr>
  <tr>
    <td height="26">&nbsp;</td>
    <td colspan="2" valign="top"><div align="center"><strong><font color="white" size="+2">SIGN 
        OUT COMLETE</font></strong></div></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="59">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td height="30">&nbsp;</td>
    <td>&nbsp;</td>
    <td colspan="2" valign="top"><a href="main.htm"><img src="images/btn_home.gif" width="90" height="30" border="0"></a></td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td height="71">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</body>
</html>
<%
}
else
	out.println("Unregistered User");
%>