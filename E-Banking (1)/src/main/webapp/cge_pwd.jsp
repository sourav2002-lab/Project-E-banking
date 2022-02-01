<%@ page contentType="text/html;" language="java" import="java.sql.*" errorPage="" %>
<%
String ent=String.valueOf(session.getAttribute("enter"));
if (ent.equals("yes"))
{
%>
<html>
<head>
<title>Change password</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="JavaScript">
var num="0123456789";
var pnew=null;
var conf=null;

function sta()
{
	document.form1.txt_old.focus();
}
function vali()
{
	if(Trim(document.form1.txt_old.value)=="")
	{
		document.form1.txt_old.focus();
		alert("Enter the old password");
		return false;
	}
	if(Trim(document.form1.txt_new.value)=="")
	{
		document.form1.txt_new.focus();
		alert("Enter the new password");
		return false;
	}
	if(Trim(document.form1.txt_con.value)=="")
	{
		document.form1.txt_con.focus();
		alert("Enter the confirm password");
		return false;
	}
	
	document.form1.txt_old.value=Trim(document.form1.txt_old.value);
	document.form1.txt_new.value=Trim(document.form1.txt_new.value);
	
	pnew=Trim(document.form1.txt_new.value);
	conf=Trim(document.form1.txt_con.value);
	
	if(pnew!=conf)
	{
		document.form1.txt_con.focus();
		alert("Enter the confirm password correctly");
		return false;
	}
	return true;
}
</script>

<script language="JavaScript" src="eBankscripts/usefun.js"></script>

</head>

<body background="images/bg_line.gif" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="sta()">
<% 
	String che=request.getParameter("ok");
	if (che!=null)
	{

		Connection con=null;
		Statement smt=null;
		ResultSet rs=null;
		try
		{
			  Class.forName("com.mysql.jdbc.Driver");
	            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebanking","root","admin");
	          		}
		catch(ClassNotFoundException ce){	out.print("<p>&nbsp;</p><p align=center><strong><font color=#CC3300>");
											out.print("Check the values and try again...");
											out.print("</font></strong></p>");}
		catch(SQLException ce){		out.print("<p>&nbsp;</p><p align=center><strong><font color=#CC3300>");
									out.print("Check the values and try again...");
									out.print("</font></strong></p>");}

		smt=con.createStatement();
		
		String passold=request.getParameter("txt_old");
		String passnew=request.getParameter("txt_new");
                System.out.println(" new password: "+passnew);
		String ano=String.valueOf(session.getAttribute("ahno"));
		int accno=Integer.parseInt(ano);

		rs=smt.executeQuery("select pwd from login_info where acc_no='" + accno + "'");
		rs.next();
		
		String pass=rs.getString(1);
		if(pass.equals(passold))
		{
			try{
				smt.executeUpdate("update login_info set pwd='" + passnew + "' where acc_no='" + accno+"'");
				smt.close();
				con.close();
				response.sendRedirect("msg_con.htm");
			}catch(SQLException se){	out.print("<p>&nbsp;</p><p align=center><strong><font color=#CC3300>");
										out.print("Check the values and try again...");
										out.print("</font></strong></p>");}
		}
		else
		{
			out.print("<p>&nbsp;</p><p align=center><strong><font color=#CC3300>");				
			out.print("The given old password is incorrect..");
			out.print("</font></strong></p>");
		}
	}
%>
<table width="700" border="0" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable-->
  <Form name="form1" method="post" action="cge_pwd.jsp?ok=1" onSubmit="return vali()">
    <tr> 
      <td width="24" height="75">&nbsp;</td>
      <td colspan="4" valign="top"><img src="images/change password.jpg" width="665" height="75"></td>
      <td width="11">&nbsp;</td>
    </tr>
    <tr> 
      <td height="44">&nbsp;</td>
      <td width="101">&nbsp;</td>
      <td width="453">&nbsp;</td>
      <td width="111">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td height="194">&nbsp;</td>
      <td>&nbsp;</td>
      <td valign="top"> <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <!--DWLayoutTable-->
          <tr> 
            <td height="21" colspan="5" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
          </tr>
          <!--DWLayoutTable-->
          <!--DWLayoutTable-->
          <tr> 
            <td height="21" colspan="2" valign="top"><div align="center"><strong><font color="#336600">OLD 
                PASSWORD</font></strong></div></td>
            <td colspan="2" valign="top"> <div align="left"> 
                <input name="txt_old" type="password" id="txt_old" value="<%=(String)session.getAttribute("pwd")%>">
              </div></td>
            <td width="2"></td>
          </tr>
          <tr> 
            <td height="21" colspan="4" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
            <td></td>
          </tr>
          <tr> 
            <td height="21" colspan="2" valign="top"><div align="center"><strong><font color="#336600">NEW 
                PASSWORD</font></strong></div></td>
            <td colspan="2" valign="top"><input name="txt_new" type="password" id="txt_new" maxlength="10"></td>
            <td></td>
          </tr>
          <tr> 
            <td height="21" colspan="4" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
            <td></td>
          </tr>
          <tr> 
            <td height="21" colspan="2" valign="top"><div align="center"><strong><font color="#336600">CONFIRM 
                PASSWORD </font></strong></div></td>
            <td colspan="2" valign="top"><input name="txt_con" type="password" id="txt_con" maxlength="10"></td>
            <td></td>
          </tr>
          <tr> 
            <td height="21" colspan="4" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
            <td></td>
          </tr>
          <tr> 
            <td width="106" height="26" valign="top"> <div align="center"> </div></td>
            <td width="107" valign="top"><div align="center"> 
                <input type="submit" name="Submit" value="    Submit    ">
              </div></td>
            <td width="125" height="26" valign="top"><div align="center"> 
                <input type="reset" name="Submit2" value="      Reset      ">
              </div></td>
            <td width="113" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
            <td></td>
          </tr>
        </table></td>
    <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td height="64">&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </form>
</table>
</body>
</html>
<%
}
else
	out.println("Unregistered User");
%>