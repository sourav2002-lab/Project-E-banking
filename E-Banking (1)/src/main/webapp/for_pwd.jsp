<%@ page contentType="text/html;" language="java" import="java.sql.*" errorPage="" %>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<html>
<head>
<title>Untitled Document</title>
<script language="JavaScript">
var num="0123456789";
function st()
{
	document.form1.txt_accno.focus();
}
function vali()
{
	if(!validate(Trim(document.form1.txt_accno.value),num))
	{
		document.form1.txt_accno.focus();
		alert("Enter a valid account number");
		return false;
	}
	if(Trim(document.form1.txt_accno.value)=="")
	{
		document.form1.txt_accno.focus();
		alert("Enter the account number");
		return false;
	}
	if(Trim(document.form1.txt_sq.value)=="")
	{
		document.form1.txt_sq.focus();
		alert("Enter the secreat question");
		return false;
	}
	if(Trim(document.form1.txt_sa.value)=="")
	{
		document.form1.txt_sa.focus();
		alert("Enter the secreat answer");
		return false;
	}
	document.form1.txt_sq.value=Trim(document.form1.txt_sq.value);
	document.form1.txt_sa.value=Trim(document.form1.txt_sa.value);
	document.form1.txt_accno.value=Trim(document.form1.txt_accno.value);

	return true;
}
</script>

<script language="JavaScript" src="eBankscripts/usefun.js"></script>

</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="st()">
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
		
		String accno=request.getParameter("txt_accno");
		String q=request.getParameter("txt_sq");
		String a=request.getParameter("txt_sa");
		System.out.println(a);
		
		rs=smt.executeQuery("select s_qtn,s_ans,pwd from login_info where acc_no='" + accno + "'");
		if(rs.next())
		{
			String qtn=rs.getString(1);
			String ans=rs.getString(2);
			String pass=rs.getString(3);
			
			if(qtn.equals(q))
			{
				if(ans.equals(a))
				{
					out.print("<table width=364 border=0 cellpadding=0 cellspacing=0> <tr>  <td width=222 height=47>&nbsp;</td>");
					out.print("<td width=82>&nbsp;</td> <td width=60>&nbsp;</td> </tr>  <tr>  <td height=28 colspan=3 valign=top>");
					out.print("You password is recovered click back you will enter your workspace and change your password at your first login NOW");
					out.print("</td> </tr>  <tr> <td height=17></td> <td></td> <td></td> </tr> <tr><td height=29></td><td valign=top><a href=login.jsp?va=fp&txt_accno="+accno+"&txt_pwd="+pass+"><img src=./images/btn_back.gif width=90 height=30></a></td>");
					out.print(" <td></td> </tr>  <tr>  <td height=26></td> <td>&nbsp;</td> <td></td></tr></table>");
					smt.close();
					con.close();
				}
				else
				{	out.print("<p>&nbsp;</p><p align=center><strong><font color=#CC3300>");
					out.print("Your answer is incorrect..");
					out.print("</font></strong></p>");
				}
			}
			else
			{	out.print("<p>&nbsp;</p><p align=center><strong><font color=#CC3300>");
				out.print("Your secreat question is incorrect");
				out.print("</font></strong></p>");
			}
		}
		else
		{	out.print("<p>&nbsp;</p><p align=center><strong><font color=#CC3300>");
			out.print("Your account number is incorrect");
			out.print("</font></strong></p>");
		}
	}
%>

<form name="form1" method="post" action="for_pwd.jsp?ok=1" onSubmit="return vali()">
<table width="701" border="0" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable-->
  <tr> 
    <td width="2" height="15"></td>
    <td width="73"></td>
    <td width="522"></td>
    <td width="70"></td>
    <td width="34"></td>
  </tr>
  <tr> 
    <td height="75"></td>
    <td colspan="3" valign="top"><img src="images/tit_for_pwd.gif" width="665" height="75"></td>
    <td></td>
  </tr>
  <tr> 
    <td height="26"></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td></td>
  </tr>
  <tr> 
    <td height="198"></td>
    <td>&nbsp;</td>
    <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
        <!--DWLayoutTable-->
        <tr bgcolor="#FFFFCC"> 
          <td width="116" height="22"></td>
          <td width="114"></td>
          <td width="122">&nbsp;</td>
          <td width="143">&nbsp;</td>
          <td width="27"></td>
        </tr>
        <tr> 
          <td height="20" colspan="2" valign="top"> <div align="center"><font color="#996633"><strong>Account 
                Number*</strong></font></div></td>
          <td colspan="2" valign="top"> <div align="center"> 
              <input name="txt_accno" type="text" id="txt_accno" size="30">
            </div></td>
          <td valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
        </tr>
        <tr bgcolor="#FFFFCC"> 
          <td height="22">&nbsp;</td>
          <td>&nbsp;</td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr> 
          <td height="20" colspan="2" valign="top"> <div align="center"><strong><font color="#996633">Secreat 
              Question*</font></strong></div></td>
          <td colspan="2" valign="top"> <div align="center"> 
              <input name="txt_sq" type="text" id="txt_sq" size="30">
            </div></td>
          <td valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
        </tr>
        <tr bgcolor="#FFFFCC"> 
          <td height="22">&nbsp;</td>
          <td height="22">&nbsp;</td>
          <td height="22"></td>
          <td height="22"></td>
          <td height="22"></td>
        </tr>
        <tr> 
          <td height="20" colspan="2" valign="top"> <div align="center"><font color="#996633"><strong>Answer*</strong></font></div></td>
          <td colspan="2" valign="top"> <div align="center"> 
              <input name="txt_sa" type="text" id="txt_sa" size="30">
            </div></td>
          <td valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
        </tr>
        <tr bgcolor="#FFFFCC"> 
          <td height="22">&nbsp;</td>
          <td height="22">&nbsp;</td>
          <td height="22"></td>
          <td height="22"></td>
          <td height="22"></td>
        </tr>
        <tr> 
          <td height="23" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
          <td valign="top"> <div align="center"> 
              <input type="submit" name="Submit" value="Submit">
            </div></td>
          <td valign="top"> <div align="center"> 
              <input type="reset" name="Submit2" value="Reset">
            </div></td>
          <td valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
          <td valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
        </tr>
        <tr bgcolor="#FFFFCC"> 
          <td height="22">&nbsp;</td>
          <td height="22">&nbsp;</td>
          <td height="22"></td>
          <td height="22"></td>
          <td height="22"></td>
        </tr>
      </table></td>
    <td>&nbsp;</td>
    <td></td>
  </tr>
  <tr> 
    <td height="44"><a href="main_btm.htm"></a></td>
    <td>&nbsp;</td>
    <td><a href="main_btm.htm">click here to go to HOME</a></td>
    <td>&nbsp;</td>
    <td></td>
  </tr>
</table>
</form>
</body>
</html>
