<%@ page contentType="text/html;" language="java" import="java.sql.*" errorPage="" %>
<%
String ent=String.valueOf(session.getAttribute("entadm"));
if (ent.equals("yes"))
{
	
%>
<html>
<head>

<title>New Account Creation</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<script language="JavaScript">
var no="0123456789"
function validateForm()
{

	for(i=0;i<=6;i++)
	{	
		if (Trim(document.form1.elements[i].value)=="")
		{
			document.form1.elements[i].focus();
			alert("Enter a value");
			return false;
		}
	}
	if(document.form1.cmb_sex.value=="false")
	{
		alert("Select a value");
		document.form1.cmb_sex.focus();
		return false;
	}
	for(i=8;i<=11;i++)
	{	
		if (Trim(document.form1.elements[i].value)=="")
		{
			document.form1.elements[i].focus();
			alert("Enter a value");
			return false;
		}
	}
	if(document.form1.cmb_bra.value=="false")
	{
		alert("Select a value");
		document.form1.cmb_bra.focus();
		return false;
	}	
	if(Trim(document.form1.txt_age.value)=="false")
	{
		alert("Select a value");
		document.form1.txt_age.focus();
		return false;
	}	
	
	var email=document.form1.txt_email.value;
	var at=email.indexOf('@');
			
	if (at == -1 )
	{
		alert("Email id not a valid one");
		document.form1.txt_email.focus();
		return false;
	}
	else if (email.indexOf('@',at+1) != -1)
	{
		alert("Email id not a valid one");
		document.form1.txt_email.focus();
		return false;		
	}
	at=email.indexOf('.',at+1);
	if (at == -1 )
	{
		alert("Email id not a valid one");
		document.form1.txt_email.focus();
		return false;
	}
	
	var le=email.length;
	
	if (email.charAt(le-1)=='.')
	{
		alert("Email id not a valid one");
		document.form1.txt_email.focus();
		return false;	
	}
	
	if(!validate(Trim(document.form1.txt_rp.value),no))
	{
		document.form1.txt_rp.focus();
		alert("Enter the valid phone number");
		return false;
	}
	if(!validate(Trim(document.form1.txt_op.value),no))
	{
		document.form1.txt_op.focus();
		alert("Enter the valid phone number");
		return false;
	}	
	if(!validate(Trim(document.form1.txt_age.value),no))
	{
		document.form1.txt_age.focus();
		alert("Enter the valid age");
		return false;
	}
	
	var pnew=Trim(document.form1.txt_pwd.value);
	var conf=Trim(document.form1.txt_cpwd.value);
	
	if(pnew!=conf)
	{
		document.form1.txt_pwd.focus();
		alert("Enter the confirm password correctly");
		return false;
	}
	
	document.form1.txt_sq.value=Trim(document.form1.txt_sq.value);
	document.form1.txt_sa.value=Trim(document.form1.txt_sa.value);
	document.form1.txt_fn.value=Trim(document.form1.txt_fn.value);
	document.form1.txt_sn.value=Trim(document.form1.txt_sn.value);
	document.form1.txt_email.value=Trim(document.form1.txt_email.value);
	document.form1.txt_rp.value=Trim(document.form1.txt_rp.value);
	document.form1.txt_op.value=Trim(document.form1.txt_op.value);
	document.form1.txt_city.value=Trim(document.form1.txt_city.value);
	document.form1.txt_age.value=Trim(document.form1.txt_age.value);
	document.form1.txt_accno.value=Trim(document.form1.txt_accno.value);
	document.form1.txt_pwd.value=Trim(document.form1.txt_pwd.value);

	return true;
}
function sta()
{
	document.form1.txt_sq.focus()
}
</script>

<script language="JavaScript" src="eBankscripts/usefun.js"></script>

</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="sta()">
<form name="form1" method="post" action="ad_new_admin.jsp" onSubmit="return validateForm()">
  <table width="713" border="0" cellpadding="0" cellspacing="0">
    <!--DWLayoutTable-->
    <tr> 
      <td width="81" height="19">&nbsp;</td>
      <td width="1">&nbsp;</td>
      <td width="277">&nbsp;</td>
      <td width="176">&nbsp;</td>
      <td width="110">&nbsp;</td>
      <td width="68">&nbsp;</td>
    </tr>
    <tr> 
      <td height="30"></td>
      <td colspan="3" valign="top"><img src="images/tit_apy_new_user.gif" width="500" height="30"></td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td height="10"></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td height="19"></td>
      <td></td>
      <td></td>
      <td colspan="2" valign="top"><div align="right"><font color="#CC3300">* 
          indicates mandatory fields</font></div></td>
      <td></td>
    </tr>
    <tr>
      <td height="4"></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr> 
      <td height="722"></td>
      <td></td>
      <td colspan="3" valign="top"> <table width="100%" height="602" border="1" cellpadding="0" cellspacing="0" bgcolor="#ded7bd">
          <!--DWLayoutTable-->
          <tr> 
            <td height="21" colspan="4" valign="top" bgcolor="#efefe0"> <font color="#CC3300" face="Times New Roman, Times, serif">&nbsp;</font></td>
          </tr>
          <tr> 
            <td height="27" colspan="2" valign="top" bgcolor="#ded7bd"> <div align="right"><strong><font color="#CC3300">Secreat 
                Question*</font></strong></div></td>
            <td colspan="2" valign="top" bgcolor="#ded7bd"> <input name="txt_sq" type="text" id="txt_sq" size="45"></td>
          </tr>
          <tr> 
            <td height="21" colspan="4" valign="top" bgcolor="#efefe0"><!--DWLayoutEmptyCell-->&nbsp;</td>
          </tr>
          <tr> 
            <td height="27" colspan="2" valign="top" bgcolor="#ded7bd"> <div align="right"><strong><font color="#CC3300">Answer*</font></strong></div></td>
            <td colspan="2" valign="top" bgcolor="#ded7bd"> <input name="txt_sa" type="text" id="txt_sa" size="45"></td>
          </tr>
          <tr> 
            <td height="5" colspan="4" valign="top" bgcolor="#efefe0"><!--DWLayoutEmptyCell-->&nbsp;</td>
          </tr>
          <tr bgcolor="#ded7bd"> 
            <td height="27" colspan="2" valign="top"> <div align="right"><strong><font color="#CC3300">User 
                ID*</font></strong></div></td>
            <td colspan="2" valign="top" bgcolor="#ded7bd"><input name="txt_accno" type="text" id="txt_accno"></td>
          </tr>
          <tr> 
            <td height="5" colspan="4" valign="top" bgcolor="#efefe0"><!--DWLayoutEmptyCell-->&nbsp;</td>
          </tr>
          <tr bgcolor="#ded7bd"> 
            <td height="27" colspan="2" valign="top" bgcolor="#ded7bd"><div align="right"><strong><font color="#CC3300">Password*</font></strong></div></td>
            <td colspan="2" valign="top"><input name="txt_pwd" type="password" id="txt_pwd"></td>
          </tr>
          <tr bgcolor="#efefe0"> 
            <td height="5" colspan="4" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
          </tr>
          <tr bgcolor="#ded7bd"> 
            <td height="27" colspan="2" valign="top"> <div align="right"><strong><font color="#CC3300">Confirm 
                Password* </font></strong></div></td>
            <td colspan="2" valign="top"><input name="txt_cpwd" type="password" id="txt_cpwd"></td>
          </tr>
          <tr bgcolor="#efefe0"> 
            <td height="10" colspan="4" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
          </tr>
          <tr> 
            <td height="27" colspan="2" valign="top" bgcolor="#ded7bd"><div align="right"><strong><font color="#CC3300">First 
                Name*</font></strong></div></td>
            <td colspan="2" valign="top" bgcolor="#ded7bd"> <input name="txt_fn" type="text" id="txt_fn2"></td>
          </tr>
          <tr> 
            <td height="21" colspan="4" valign="top" bgcolor="#efefe0"><!--DWLayoutEmptyCell-->&nbsp;</td>
          </tr>
          <tr> 
            <td height="27" colspan="2" valign="top" bgcolor="#ded7bd"> <div align="center"><strong></strong></div>
              <div align="right"><font color="#CC3300"><strong>Last Name*</strong></font> 
              </div></td>
            <td colspan="2" valign="top" bgcolor="#ded7bd"> <div align="center"><font color="#CC3300"></font></div>
              <div align="left"> 
                <input name="txt_sn" type="text" id="txt_sn">
              </div></td>
          </tr>
          <tr> 
            <td height="10" colspan="4" valign="top" bgcolor="#efefe0"><!--DWLayoutEmptyCell-->&nbsp;</td>
          </tr>
          <tr> 
            <td height="27" colspan="2" valign="top" bgcolor="#ded7bd"><div align="right"><strong><font color="#CC3300">Sex*</font></strong></div></td>
            <td colspan="2" valign="top" bgcolor="#ded7bd"> <select name="cmb_sex" size="1" id="select2">
                <option value="false" selected>--Select Please--</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
              </select></td>
          </tr>
          <tr> 
            <td height="21" colspan="4" valign="top" bgcolor="#efefe0"><!--DWLayoutEmptyCell-->&nbsp;</td>
          </tr>
          <tr> 
            <td height="27" colspan="2" valign="top" bgcolor="#ded7bd"> <div align="center"><strong></strong></div>
              <div align="right"><strong><font color="#CC3300">Email*</font></strong> 
              </div></td>
            <td colspan="2" valign="top" bgcolor="#ded7bd"> <div align="center"><strong></strong></div>
              <div align="left"> 
                <input name="txt_email" type="text" id="txt_email">
              </div></td>
          </tr>
          <tr> 
            <td height="10" colspan="4" valign="top" bgcolor="#efefe0"><!--DWLayoutEmptyCell-->&nbsp;</td>
          </tr>
          <tr> 
            <td height="27" colspan="2" valign="top" bgcolor="#ded7bd"> <div align="right"><strong><font color="#CC3300">Residence 
                Phone*</font></strong></div></td>
            <td colspan="2" valign="top" bgcolor="#ded7bd"> <input name="txt_rp" type="text" id="txt_rp"></td>
          </tr>
          <tr> 
            <td height="21" colspan="4" valign="top" bgcolor="#efefe0"><!--DWLayoutEmptyCell-->&nbsp;</td>
          </tr>
          <tr> 
            <td height="27" colspan="2" valign="top" bgcolor="#ded7bd"> <div align="center"></div>
              <div align="center"></div>
              <div align="right"><strong><font color="#CC3300">Office Phone*</font></strong> 
              </div></td>
            <td colspan="2" valign="top" bgcolor="#ded7bd"> <div align="left"><strong></strong></div>
              <div align="left"> 
                <input name="txt_op" type="text" id="txt_op">
              </div></td>
          </tr>
          <tr> 
            <td height="10" colspan="4" valign="top" bgcolor="#efefe0"><!--DWLayoutEmptyCell-->&nbsp;</td>
          </tr>
          <tr> 
            <td height="27" colspan="2" valign="top" bgcolor="#ded7bd"> <div align="center"><strong></strong></div>
              <div align="right"><strong><font color="#CC3300">City*</font></strong> 
              </div></td>
            <td colspan="2" valign="top" bgcolor="#ded7bd"> <div align="left"><strong></strong></div>
              <div align="left"> 
                <input name="txt_city" type="text" id="txt_city">
              </div></td>
          </tr>
          <tr> 
            <td height="10" colspan="4" valign="top" bgcolor="#efefe0"><!--DWLayoutEmptyCell-->&nbsp;</td>
          </tr>
          <tr> 
            <td height="27" colspan="2" valign="top"><div align="right"><font color="#CC3300"><strong>Bank 
                Branch*</strong></font></div></td>
            <td colspan="2" valign="top"><select name="cmb_bra" id="select3">
                <option value="false" selected>--Select Please--</option>
                <option value="Ahmedabad">Ahmedabad</option>
                <option value="Bangalore">Bangalore</option>
                <option value="Chandigarh">Chandigarh</option>
                <option value="Chennai">Chennai</option>
                <option value="Coimbatore">Coimbatore</option>
                <option value="Hyderabad">Hyderabad</option>
                <option value="Jaipur">Jaipur</option>
                <option value="Kolkata">Kolkata</option>
                <option value="Mumbai">Mumbai</option>
                <option value="New Delhi">New Delhi</option>
                <option value="Pune">Pune</option>
                <option value="Trivandrum">Trivandrum</option>
                <option value="Visakhapatnam">Visakhapatnam</option>
              </select></td>
          </tr>
          <tr> 
            <td height="21" colspan="4" valign="top" bgcolor="#efefe0"><!--DWLayoutEmptyCell-->&nbsp;</td>
          </tr>
          <tr> 
            <td height="27" colspan="2" valign="top"> <div align="center"><font color="#CC3300"></font></div>
              <div align="right"><font color="#CC3300"><strong>Age*</strong></font> 
              </div></td>
            <td colspan="2" valign="top"> <div align="left"><font color="#CC3300"></font></div>
              <div align="left"> 
                <input name="txt_age" type="text" id="txt_age">
              </div></td>
          </tr>
          <tr> 
            <td height="21" colspan="4" valign="top" bgcolor="#efefe0"><!--DWLayoutEmptyCell-->&nbsp;</td>
          </tr>
          <tr> 
            <td width="164" height="27" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
            <td width="110" height="27" valign="top"><div align="center"> 
                <input type=submit name="Submit" value="Submit" >
              </div></td>
            <td width="115" height="27" valign="top"><div align="center"> 
                <input type="reset" name="Reset" value="Reset">
              </div></td>
            <td width="121" height="27" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
          </tr>
        </table></td>
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td height="34"></td>
      <td></td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td></td>
      <td></td>
    </tr>
  </table>
</form>
</body>
</html><%
}
else
	out.println("Unregistered User");
%>
