<%@ page contentType="text/html;" language="java" import="java.sql.*" errorPage="" %>
<%
String ent=String.valueOf(session.getAttribute("enter"));
if (ent.equals("yes"))
{
%>
<html>
<head>
<title>Transfer Fund</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<script language="JavaScript">
var num="0123456789";

function sta()
{
	document.form1.txt_accno.focus();
}
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
	if(Trim(document.form1.txt_amt.value)=="")
	{
		document.form1.txt_amt.focus();
		alert("Enter the amount");
		return false;
	}
	  if(isNumber(document.form1.txt_amt.value, "0123456789")!=true)
   {
       alert("Please check the state. -'"+ob.txt_amt.value+"'");
       ob.txt_amt.select();
       return false;
   }
	document.form1.txt_amt.value=Trim(document.form1.txt_amt.value);
	document.form1.txt_accno.value=Trim(document.form1.txt_accno.value);
	
	return true;
}
</script>

<script language="JavaScript" src="eBankscripts/usefun.js"></script>

</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="sta()">
<%
	String ente=request.getParameter("va");
	if (ente!=null)
	{
		String accno=String.valueOf(session.getAttribute("ahno"));
		Connection con=null;
		Statement smt=null;
		ResultSet rs=null;
		int amtreq=0;
		int ove=0,nacc=0,trnno=0;
		
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
		String taccno=request.getParameter("txt_accno");
		rs=smt.executeQuery("select acc_no from acholder_info where acc_no='" + taccno + "'");
		if(rs.next())
		{
			rs=smt.executeQuery("select bal from acholder_info where acc_no='" + accno + "'");
			boolean b=rs.next();
			int bamt=rs.getInt(1);
			amtreq=Integer.parseInt(request.getParameter("txt_amt"));
			if(bamt > amtreq)
			{
				System.out.println("B"+b);
				//rs=smt.executeQuery("select bk_no from cheque_req where acc_no='" + accno + "' and sta=2");
				if(b)
				{
					ove=bamt-amtreq;
					rs=smt.executeQuery("select bal from acholder_info where acc_no='" + taccno + "'");
					rs.next();
					nacc=rs.getInt(1);
					nacc=nacc+amtreq;
					
					rs=smt.executeQuery("select max(trn_id) from tran_info");
					if(rs.next())
					{
						trnno=rs.getInt(1);
						System.out.println("trnno   "+trnno);
						if(trnno < 1)
							trnno=1;
						else
							trnno=trnno+1;
					}
						System.out.println("trnno   "+trnno);				
					if((bamt > 1000) && (ove > 1000))
					{
						try
						{
							//con.setAutoCommit(false);
							String query1="Update acholder_info set bal=" + ove + " where acc_no='" + accno +"'";
							String query2="Update acholder_info set bal=" + nacc + " where acc_no='" + taccno + "'";
							String query3="insert into tran_info values(" + trnno + ",'" + accno + "','"+new java.util.Date()+"'," + amtreq + ",0)";
							String query4="insert into tran_info values(" + (trnno+1) + ",'" + taccno + "','"+new java.util.Date()+"',0," + amtreq + ")";
							System.out.println(query4);
							Statement st1=con.createStatement();
							st1.executeUpdate(query1);
							st1.executeUpdate(query2);
							st1.executeUpdate(query3);
							st1.executeUpdate(query4);
							//con.commit();
							st1.close();
							con.close();
							response.sendRedirect("msg_con.htm");
						}
						catch(Exception e)
						{
							out.print("Error during process..Transaction is rolled back.");
							con.close();
							//con.rollback();
							//con.setAutoCommit(true);
						}
					}
					else
					{
						out.print("<p>&nbsp;</p><p align=center><strong><font color=#CC3300>");
						out.print("Your balance after transaction must be greater than 1000.");
						out.print("</font></strong></p>");
					}
				}
				else
				{
					ove=bamt-amtreq;
					rs=smt.executeQuery("select bal from acholder_info where acc_no='" + taccno + "'");
					rs.next();
					nacc=rs.getInt(1);
					nacc=nacc+amtreq;
					
					rs=smt.executeQuery("select max(trn_id) from tran_info");
					if(rs.next())
					{
						trnno=rs.getInt(1);
						if(trnno < 1)
							trnno=1;
						else
							trnno=trnno+1;
					}
					try
					{
						//con.setAutoCommit(false);
						String query1="Update acholder_info set bal=" + ove + " where acc_no='" + accno + "'";
						String query2="Update acholder_info set bal=" + nacc + " where acc_no='" + taccno + "'";
						String query3="insert into tran_info values('" + trnno + "','" + accno + "','"+new java.util.Date()+"'," + amtreq + ",0)";
						String query4="insert into tran_info values('" + (trnno+1) + "','" + taccno + "','"+new java.util.Date()+"',0," + amtreq + ")";
						Statement st1=con.createStatement();
						st1.executeUpdate(query1);
						st1.executeUpdate(query2);
						st1.executeUpdate(query3);
						st1.executeUpdate(query4);
						//con.commit();
						st1.close();
						con.close();
						response.sendRedirect("msg_con.htm");
					}
					catch(Exception e)
					{
						con.close();
						out.print("Error during process..Transaction is rolled back.");
						//con.rollback();
						//con.setAutoCommit(true);
					}
				}
			}
			else
			{
				out.print("<p>&nbsp;</p><p align=center><strong><font color=#CC3300>");
				out.print("Your balance is only Rs " + bamt);
				out.print("</font></strong></p>");
			}
		}
		else
		{
			out.print("<p>&nbsp;</p><p align=center><strong><font color=#CC3300>");
			out.print("The given account number is incorrect..");
			out.print("</font></strong></p>");
		}
	}
%>
<form name="form1" method="post" action="tran_fund.jsp?va=1" onSubmit="return vali()">
<table width="756" border="0" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable-->
  <tr> 
    <td width="5" height="75">&nbsp;</td>
    <td colspan="3" valign="top"><img src="images/trnsfer fund.jpg" width="665" height="75"></td>
    <td width="86">&nbsp;</td>
  </tr>
  <tr> 
    <td height="199">&nbsp;</td>
    <td width="63">&nbsp;</td>
    <td width="482" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
        <!--DWLayoutTable-->
        <tr> 
          <td height="30" colspan="6">&nbsp;</td>
        </tr>
        <tr> 
          <td height="26" colspan="3" valign="top"><div align="center"><font color="#009933" size="+1"><strong>Account 
              Number </strong></font></div></td>
          <td colspan="3" valign="top"><input name="txt_accno" type="text" id="txt_accno" maxlength="12" size="25"></td>
        </tr>
        <tr> 
          <td height="30" colspan="6">&nbsp;</td>
        </tr>
        <tr> 
          <td height="26" colspan="3" valign="top"><div align="center"><strong><font color="#009933" size="+1">Amount</font></strong></div></td>
          <td colspan="3" valign="top"><input name="txt_amt" type="text" id="txt_amt"  maxlength="15" size="25"></td>
        </tr>
        <tr> 
          <td height="30" colspan="6">&nbsp;</td>
        </tr>
        <tr> 
          <td width="124" height="26" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
          <td width="87" valign="top"><div align="center"> 
              <input type="submit" name="Submit" value="    Submit    ">
            </div></td>
          <td colspan="2" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
          <td width="91" height="26" valign="top"><div align="center"> 
              <input type="reset" name="Submit2" value="      Reset      ">
            </div></td>
          <td width="149" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
        </tr>
        <tr> 
          <td height="30" colspan="6"></td>
        </tr>
        <tr> 
          <td height="1"></td>
          <td></td>
          <td width="22"></td>
          <td width="9"></td>
          <td></td>
          <td></td>
        </tr>
      </table></td>
    <td width="120">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="69">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
</body>
</html>
<%
}
else
	out.println("Unregistered User");
%>