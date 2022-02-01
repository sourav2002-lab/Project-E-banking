<%@ page contentType="text/html;" language="java" import="java.sql.*" errorPage="" %>

<html>
<head>
<title>DD Request</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="JavaScript">
var num="0123456789";
function check()
{

	for(i=3;i<6;i++)
	{
		if(document.form1.elements[i].value=="")
		{
			document.form1.elements[i].focus();
			alert("Enter a value");
			return false;
		}
	}
	if(!validate(Trim(document.form1.txt_amt.value),num))
	{
		document.form1.txt_amt.focus();
		alert("Enter a valid amount");
		return false;
	}

	document.form1.txt_ifo.value=Trim(document.form1.txt_ifo.value);
	document.form1.txt_pla.value=Trim(document.form1.txt_pla.value);
	document.form1.txt_amt.value=Trim(document.form1.txt_amt.value);
	document.form1.hf_camt.value=(document.form1.txt_amt.value/1000);
	
	var t=document.form1.hf_camt.value.indexOf(".");
	var a=0;
	if(t>0)
	{
		a=document.form1.hf_camt.value.substring(0,t);
	}
	else
	{
		a=document.form1.hf_camt.value;
	}
	a=a*20;
	if(document.form1.txt_amt.value%1000>1)
		a=a+20;
	document.form1.hf_camt.value=a;
	alert("Commission is Rs: " +a); 
	return true;
}
function sta()
{
	document.form1.txt_ifo.focus();
}
</script>
<script language="JavaScript" src="eBankscripts/usefun.js"></script>

</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="sta()">
<form name="form1" method="post" action="ser_dd_req.jsp" onSubmit="return check()">
  <table width="779" border="0" cellpadding="0" cellspacing="0">
    <!--DWLayoutTable-->
    <tr> 
      <td height="75" colspan="4" valign="top"><img src="images/request dd.jpg" width="665" height="75"></td>
      <td width="114">&nbsp;</td>
    </tr>
    <tr> 
      <td width="96" height="30">&nbsp;</td>
      <td colspan="2"><input name="hf_acno" type="hidden" id="hf_acno"> 
        <input name="hf_camt" type="hidden" id="hf_camt"></td>
      <td width="123">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td height="170"></td>
      <td width="442" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <!--DWLayoutTable-->
          <tr> 
            <td width="218" height="25">&nbsp;</td>
            <td width="224">&nbsp;</td>
          </tr>
          <tr> 
            <td height="24" valign="top"><div align="center"><font color="#333399"><strong>IN 
                FAVOUR OF</strong></font></div></td>
            <td valign="top"> <div align="left"> 
                <input name="txt_ifo" type="text" id="txt_ifo" size="25">
              </div></td>
          </tr>
          <tr> 
            <td height="19">&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr> 
            <td height="50" valign="top"> <div align="center"><font color="#333399"><strong>PLACE</strong></font></div></td>
            <td valign="top"> <div align="left"> 
                <textarea name="txt_pla" cols="20" rows="2" id="txt_pla"></textarea>
              </div></td>
          </tr>
          <tr> 
            <td height="11"></td>
            <td></td>
          </tr>
          <tr> 
            <td height="24" valign="top"><div align="center"><strong><font color="#333399">AMOUNT</font></strong></div></td>
            <td valign="top"> <div align="left"> 
                <input name="txt_amt" type="text" id="txt_amt">
              </div></td>
          </tr>
          <tr> 
            <td height="17"></td>
            <td></td>
          </tr>
        </table></td>
      <td width="4"></td>
      <td></td>
      <td></td>
    </tr>
    <tr> 
      <td height="21">&nbsp;</td>
      <td valign="top"> <hr></td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td height="23"></td>
      <td valign="top"> <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <!--DWLayoutTable-->
          <tr> 
            <td width="40" height="23">&nbsp;</td>
            <td width="179" valign="top"> <div align="center"> 
                <input type="submit" name="Submit" value="Submit">
              </div></td>
            <td width="179" valign="top"><div align="center"> 
                <input type="reset" name="Submit2" value="Reset">
              </div></td>
            <td width="44">&nbsp;</td>
          </tr>
        </table></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr> 
      <td height="3"></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td height="21"></td>
      <td valign="top"> <hr></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td height="30"></td>
      <td>&nbsp;</td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
  </table>
</form>
</body>
</html>
