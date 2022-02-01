<%@ page contentType="text/html;" language="java" import="java.sql.*" errorPage="" %>
<%
String ent=String.valueOf(session.getAttribute("enter"));
if (ent.equals("yes"))
{
%>
<html>
<head>
<title>Change Address</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="JavaScript">
var num="0123456789";
var pnew=null;
var conf=null;

function sta()
{
	document.form1.txt_sq.focus();
}
function vali()
{
	if(!validate(Trim(document.form1.txt_rp.value),num))
	{
		document.form1.txt_rp.focus();
		alert("Enter a valid phone number");
		return false;
	}
	
	if(!validate(Trim(document.form1.txt_op.value),num))
	{
		document.form1.txt_op.focus();
		alert("Enter a valid phone number");
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
	if (email.charAt(document.form1.txt_email.length)=='.')
	{
		alert("Email id not a valid one");
		document.form1.txt_email.focus();
		return false;	
	}
	
	if(Trim(document.form1.txt_sq.value)=="")
	{
		document.form1.txt_sq.focus();
		alert("Enter the secret question");
		return false;
	}
	
	if(Trim(document.form1.txt_sa.value)=="")
	{
		document.form1.txt_sa.focus();
		alert("Enter the answer");
		return false;
	}
	if(Trim(document.form1.txt_email.value)=="")
	{
		document.form1.txt_email.focus();
		alert("Enter the new password");
		return false;
	}
	if(Trim(document.form1.txt_rp.value)=="")
	{
		document.form1.txt_rp.focus();
		alert("Enter the phone number");
		return false;
	}
	if(Trim(document.form1.txt_op.value)=="")
	{
		document.form1.txt_op.focus();
		alert("Enter the phone number");
		return false;
	}
	if(Trim(document.form1.txt_hn.value)=="")
	{
		document.form1.txt_hn.focus();
		alert("Enter the house name");
		return false;
	}
	if(Trim(document.form1.txt_city.value)=="")
	{
		document.form1.txt_city.focus();
		alert("Enter the city name");
		return false;
	}
	
	document.form1.txt_city.value=Trim(document.form1.txt_city.value);
	document.form1.txt_hn.value=Trim(document.form1.txt_hn.value);
	document.form1.txt_op.value=Trim(document.form1.txt_op.value);
	document.form1.txt_rp.value=Trim(document.form1.txt_rp.value);
	document.form1.txt_sq.value=Trim(document.form1.txt_sq.value);
	document.form1.txt_sa.value=Trim(document.form1.txt_sa.value);
	document.form1.txt_email.value=Trim(document.form1.txt_email.value);

	return true;
}
</script>
<script language="JavaScript" src="eBankscripts/usefun.js"></script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="sta()">
<%
	Connection con=null;
	Statement smt=null;
	Statement smt1=null;
	ResultSet rs=null;
	ResultSet rs1=null;
	ResultSet rs2=null;
	
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
	smt1=con.createStatement();
	
	String che=request.getParameter("ok");
	String accno=String.valueOf(session.getAttribute("ahno"));
	
	if (che!=null)
	{
		
		String sq=request.getParameter("txt_sq");
		String sa=request.getParameter("txt_sa");
		String email=request.getParameter("txt_email");
		String city=request.getParameter("txt_city");
		String hn=request.getParameter("txt_hn");
				
		String rp=request.getParameter("txt_rp");
		String op=request.getParameter("txt_op");
		
		rs=smt.executeQuery("select reg_id from acholder_info where acc_no='" + accno + "'");

		if(rs.next())
		{
			int rid=(int)Float.parseFloat(rs.getString(1).trim());
			try{
				smt.executeUpdate("update reg_info set h_name='" + hn + "',city='"+ city + "',emailid='" +  email + "',r_phone='" + rp + "' ,o_phone='" + op + "' where reg_id=" + rid);
				smt.executeUpdate("update login_info set s_qtn='" + sq + "',s_ans='" + sa + "' where acc_no='" + accno + "'");
			
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
			out.print("The given account number is incorrect..");
			out.print("</font></strong></p>");
		}
	}
	else
	{
		
		rs=smt.executeQuery("select reg_id from acholder_info where acc_no='" + accno + "'");
		if(rs.next())
		{
			int ri=(int)Float.parseFloat(rs.getString(1).trim());
			rs2=smt1.executeQuery("select * from login_info where acc_no='" + accno + "'");
			if(rs2.next())
			{
				rs1=smt.executeQuery("select * from reg_info where reg_id=" + ri);
				if(rs1.next())
				{
			
	}
%>
<form name="form1" method="post" action="cge_add.jsp?ok=1" onSubmit="return vali()">
  <table width="700" border="0" cellpadding="0" cellspacing="0">
    <!--DWLayoutTable-->
    <tr> 
      <td width="19" height="75"></td>
      <td colspan="6" valign="top"><img src="images/change profile.jpg" width="665" height="75"></td>
      <td width="16">&nbsp;</td>
    </tr>
    <tr> 
      <td height="6"></td>
      <td width="60"></td>
      <td width="28"></td>
      <td width="191"></td>
      <td width="146"></td>
      <td width="128"></td>
      <td width="112"></td>
      <td></td>
    </tr>
    <tr> 
      <td height="280"></td>
      <td></td>
      <td colspan="4" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <!--DWLayoutTable-->
          <tr> 
            <td width="185" height="9"></td>
            <td width="308"></td>
          </tr>
          <tr> 
            <td height="19"></td>
            <td valign="top"><div align="right"></div></td>
          </tr>
          <tr> 
            <td height="17" bgcolor="#efefe0"></td>
            <td bgcolor="#efefe0"></td>
          </tr>
          <tr> 
            <td height="20" valign="top"><div align="right"><strong><font color="#CC3300">Secret 
                Question</font></strong></div></td>
            <td valign="top"><div align="center"> 
                <input name="txt_sq" type="text" id="txt_sq" size="40" value="<%= rs2.getString("s_qtn")%>" maxlength="50" >
              </div></td>
          </tr>
          <tr> 
            <td height="12" bgcolor="#efefe0"></td>
            <td bgcolor="#efefe0"></td>
          </tr>
          <tr> 
            <td height="20" valign="top"><div align="right"><strong><font color="#CC3300">Answer</font></strong></div></td>
            <td valign="top"><div align="center"> 
                <input name="txt_sa" type="text" id="txt_sa" size="40" value="<%= rs2.getString("s_ans")%>" maxlength="30">
              </div></td>
          </tr>
          <tr> 
            <td height="12" bgcolor="#efefe0"></td>
            <td bgcolor="#efefe0"></td>
          </tr>
          <tr> 
            <td height="20" valign="top"><div align="right"><strong><font color="#CC3300">Email</font></strong></div></td>
            <td valign="top"><div align="center"> 
                <input name="txt_email" type="text" id="txt_email" size="40" value="<%= rs1.getString("emailid")%>" maxlength="50">
              </div></td>
          </tr>
          <tr> 
            <td height="14" bgcolor="#efefe0"></td>
            <td bgcolor="#efefe0"></td>
          </tr>
          <tr> 
            <td height="20" valign="top"><div align="right"><strong><font color="#CC3300">Residence 
                Phone </font></strong></div></td>
            <td valign="top"><div align="center"> 
                <input name="txt_rp" type="text" id="txt_rp" size="40" value="<%= rs1.getString("r_phone")%>" maxlength="15">
              </div></td>
          </tr>
          <tr> 
            <td height="14" bgcolor="#efefe0"></td>
            <td bgcolor="#efefe0"></td>
          </tr>
          <tr> 
            <td height="20" valign="top"><div align="right"><strong><font color="#CC3300">Office 
                Phone </font></strong></div></td>
            <td valign="top"><div align="center"> 
                <input name="txt_op" type="text" id="txt_op" size="40" value="<%= rs1.getString("o_phone")%>" maxlength="15">
              </div></td>
          </tr>
          <tr> 
            <td height="14" bgcolor="#efefe0"></td>
            <td bgcolor="#efefe0"></td>
          </tr>
          <tr> 
            <td height="20" valign="top"><div align="right"><strong><font color="#CC3300">House 
                Name </font></strong></div></td>
            <td valign="top"><div align="center"> 
                <input name="txt_hn" type="text" id="txt_hn" size="40" value="<%= rs1.getString("h_name")%>" maxlength="30">
              </div></td>
          </tr>
          <tr> 
            <td height="16" bgcolor="#efefe0"></td>
            <td bgcolor="#efefe0"></td>
          </tr>
          <tr> 
            <td height="19" valign="top"><div align="right"><strong><font color="#CC3300">City</font></strong></div></td>
            <td valign="top"><div align="center"> 
                <input name="txt_city" type="text" id="txt_city" size="40" value="<%= rs1.getString("city")%>" maxlength="30">
              </div></td>
          </tr>
          <tr> 
            <td height="13" bgcolor="#efefe0"></td>
            <td bgcolor="#efefe0"></td>
          </tr>
        </table></td>
      <td>&nbsp;</td>
      <td></td>
    </tr>
    <tr> 
      <td height="16"></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr> 
      <td height="23" colspan="3" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
      <td valign="top"><div align="center"> 
          <input type="submit" name="Submit" value="     Submit    ">
        </div></td>
      <td valign="top"><div align="center"> 
          <input type="reset" name="Submit2" value="     Reset     ">
        </div></td>
      <td colspan="3" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
    </tr>
    <tr> 
      <td height="16"></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
  </table>
</form>
</body>
</html>
<%
			}
		}
	}
}
else
	out.println("Unregistered User");
%>