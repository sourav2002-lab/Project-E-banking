<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<style type="text/css">
<!--
body {
	background-image: url(images/bg.gif);
}
.style1 {
	color: #FFFFFF;
	font-weight: bold;
}
.style2 {color: #FFFFFF}
-->
</style>
<SCRIPT LANGUAGE="JavaScript">
 function isNumber(data, type)
{
	var numStr=type;
	var thisChar;
	var counter=0;
	for(var i=0; i < data.length; i++)
		{
			thisChar=data.substring(i,i+1);
			if(numStr.indexOf(thisChar)!=-1)
			{counter++;}
		}
		if(counter==data.length)
		{return true;}
		else
		return false;
 }
 
 function Regvalidat()
 {
   var ob = this.document.login;
    if(ob.username.value =="")
   {
      alert("Enter the login name.");
      ob.username.focus();
      return false;
	}
	  if(ob.password.value =="")
   {
      alert("Enter the password.");
      ob.password.focus();
      return false;
	}
	/* 	if(ob.username.value.length < 5 || ob.username.value.length > 15)
   {
     alert("Enter username within 5 to 15 letters.");
     ob.username.focus();
     return false;
   } */
/*	if(ob.password.value.length < 5 || ob.password.value.length > 10)
   {
     alert("Enter password within 5 to 10 letters.");
     ob.password.focus();
     return false;
   }
   if(isNumber(ob.username.value, "<%@ page import="databaseconnection.*,java.sql.*" %>defghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")!=true)
   {
       alert("Please check the state. -'"+ob.username.value+"'");
       ob.username.select();
       return false;
   }
 */
 }
</SCRIPT>
</head>

<body>
<label></label>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

<form  name="login" action="information_accno1.jsp"  onsubmit="return Regvalidat();">
<table width="693" height="224" border="0">
  <tr>
    <td height="21" colspan="4"><p class="style1">Enter your user name and password for knowing accountnumber, creditcard number </p>
    <p>&nbsp;</p></td>
  </tr>
  <tr>
    <td width="209" height="66">&nbsp;</td>
    <td width="120"><span class="style2">User Name    </span></td>
    <td width="137"><input type="text" name="username"  maxlength="15"/></td>
    <td width="209">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><span class="style2">Password </span></td>
    <td><input type="password" name="password"  maxlength="10"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="62">&nbsp;</td>
    <td>&nbsp;</td>
    <td><label>
      <input type="submit" name="Submit" value="Submit" />
    </label></td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
</body>
</html>
