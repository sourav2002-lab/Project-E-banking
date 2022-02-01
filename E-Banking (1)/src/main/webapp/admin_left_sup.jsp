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
<style type="text/css">
<!--
#Layer1 {
	position:absolute;
	width:200px;
	height:115px;
	z-index:1;
	left: 42px;
	top: 312px;
}
.style1 {font-size: 14px}
-->
</style>
</head>

<body style="background-color:white" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="708"  border="0" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable-->
  <tr> 
    <td height="26" colspan="2" valign="top"><a href="admin_logout.jsp" target="_parent"><img src="images/admin/admin_left_01.gif" width="139" height="37" border="0"></a><img src="images/admin/admin_left_02.gif" width="261" height="37"></td>
    <td width="306" rowspan="2">&nbsp;</td>
    <td width="1" rowspan="2"></td>
  </tr>
  <tr> 
    <td height="45" colspan="2" valign="top"><img src="images/admin/admin_left_03.gif" width="400" height="53"></td>
  </tr>
  <tr> 
    <td height="28" colspan="2" valign="top"><a href="ad_adm_regist.jsp" target="_self"><img src="images/admin/admin_left_2.gif" width="140" height="28" border="0"></a><img src="images/admin/admin_left_3.gif" width="260" height="28"></td>
    <td rowspan="13" colspan="11" valign="top"><img src="images/admin/welcome1.jpg" width="606" height="220"></td>
    <td></td>
  </tr>
  <tr> 
    <td height="18" colspan="2" valign="top"><img src="images/admin/admin_left_4.gif" width="400" height="18"></td>
    <td></td>
  </tr>
  <tr> 
    <td height="27" colspan="2" valign="top"><a href="admin_left_loan.jsp"><img src="images/admin/admin_left_5.gif" width="140" height="27" border="0"></a><img src="images/admin/admin_left_6.gif" width="260" height="27"></td>
    <td></td>
  </tr>
  <tr> 
    <td height="18" colspan="2" valign="top"><img src="images/admin/admin_left_7.gif" width="400" height="18"></td>
    <td></td>
  </tr>
  <tr> 
    <td colspan="2" rowspan="2" valign="top"><a href="admin_left_dd.jsp"><img src="images/admin/admin_left_8.gif" width="140" height="28" border="0"></a><img src="images/admin/admin_left_9.gif" width="260" height="28"></td>
    <td height="9"></td>
  </tr>
  <tr> 
    <td height="19">&nbsp;</td>
    <td></td>
  </tr>
  <tr> 
    <td height="39" colspan="2" valign="top"><a href="admin_left_check.jsp"><img src="images/admin/admin_left_13.gif" width="139" height="39" border="0"></a><img src="images/admin/admin_left_11.gif" width="261" height="39"></td>
    <td></td>
    <td></td>
  </tr>
  <tr> 
    <td width="400" height="19" valign="top"><img src="images/admin/admin_left_012.gif" width="400" height="19"></td>
    <td width="1" rowspan="5"></td>
    <td rowspan="5"></td>
    <td rowspan="5"></td>
  </tr>
  <tr> 
    <td width="400" height="19" valign="top"><img src="images/admin/admin_left_012.gif" width="400" height="19"></td>
    <td width="1" rowspan="5"></td>
    <td rowspan="5"></td>
    <td rowspan="5"></td>
  </tr>
   <tr> 
    <td width="400" height="19" valign="top"><img src="images/admin/admin_left_012.gif" width="400" height="19"></td>
    <td width="1" rowspan="5"></td>
    <td rowspan="5"></td>
    <td rowspan="5"></td>
  </tr>
 
  <tr> 
    <td height="21" valign="top"><img src="images/admin/admin_left_016.gif" width="140" height="26"><img src="images/admin/admin_left_017.gif" width="260" height="26"></td>
  </tr>
  
  <tr> 
    <td height="19"></td>
    <td></td>
    <td></td>
  </tr>
</table>
<div class="style1" id="Layer1"><a href="Deposit_form.jsp">Deposit Amount</a> </div>
</body>
</html>
<%
}
else
	out.println("Unregistered User");
%>