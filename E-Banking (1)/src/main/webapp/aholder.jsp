<%@ page contentType="text/html;" language="java" import="java.sql.*" errorPage="" %>

<html>
<head>
<title>Registered User</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
#Layer1 {
	position:absolute;
	width:200px;
	height:115px;
	z-index:1;
	left: 640px;
	top: 56px;
}
-->
</style>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="780" border="0" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable-->
  <tr> 
    <td height="108" colspan="3" valign="top"><img src="images/reg_user/1.gif" width="140" height="108"><img src="images/reg_user/2.gif" width="84" height="108"><img src="images/reg_user/3.gif" width="556" height="108"></td>
  </tr>
  <tr> 
    <td height="31" colspan="3" valign="top"><a href="cge_pwd.jsp"><img src="images/reg_user/18.gif" width="140" height="31" border="0"></a><img src="images/reg_user/5.gif" width="640" height="31"></td>
  </tr>
  <tr> 
    <td height="32" colspan="3" valign="top"><a href="ant_det.jsp"><img src="images/reg_user/6.gif" width="140" height="32" border="0"></a><img src="images/reg_user/7.gif" width="84" height="32"><img src="images/reg_user/8.gif" width="434" height="32"><img src="images/reg_user/9.gif" width="122" height="32"></td>
  </tr>
  <tr> 
    <td width="223" height="33" valign="top"><!-- <a href="cge_add.jsp"> -->
    <a href="cge_add.jsp"><img src="images/reg_user/10.gif" width="139" height="33" border="0"></a><img src="images/reg_user/11.gif" width="83" height="33"></td>
    <td width="435" valign="top"><div align="center"><font color="#FF0000" size="5" face="Georgia, Times New Roman, Times, serif"><strong>WELCOME</strong></font></div></td>
    <td width="122" valign="top"><img src="images/reg_user/13.gif" width="122" height="33"></td>
  </tr>
  <tr> 
    <td height="34" valign="top"><a href="tran_fund.jsp"><img src="images/reg_user/14.gif" width="140" height="34" border="0"></a><img src="images/reg_user/15.gif" width="84" height="34"></td>
    <td height="34" valign="top"><div align="center"><strong><font color="#669933" size="+2"><strong> 
        <%
		
		String name=String.valueOf(session.getAttribute("ahname"));
		out.print(name);
			
		%>
        </strong></font></strong></div></td>
    <td height="34" valign="top"><img src="images/reg_user/17.gif" width="122" height="34"></td>
  </tr>
  
  <tr> 
    <td height="33" colspan="3" valign="top"><a href="req_dd.jsp"><img src="images/reg_user/50.gif" width="138" height="35" border="0"></a><img src="images/reg_user/51.gif" width="642" height="35"></td>
  </tr>
  <tr>
    <td height="26" colspan="3" valign="top"><img src="images/reg_user/52.gif" width="780" height="32"></td>
  </tr>
  <tr> 
    <td height="27" colspan="3" valign="top"><a href="logout.jsp"><img src="images/reg_user/23.gif" width="140" height="27" border="0"></a><img src="images/reg_user/24.gif" width="640" height="27"></td>
  </tr>
  <tr> 
    <td height="70" colspan="3" valign="top" bgcolor="#BB002F"> <div align="right"><img src="images/reg_user/25.gif" width="672" height="70"></div></td>
  </tr>
</table>
<div id="Layer1"><a href="login.jsp">Back</a></div>
</body>
</html>
