<%@ page contentType="text/html;" language="java" import="java.sql.*" errorPage="" %>
<%
String ent=String.valueOf(session.getAttribute("entadm"));
if (ent.equals("yes"))
{
	
%>
<%
	
	String msg=request.getParameter("id");
	msg="rid"+msg;
	String idna=String.valueOf(session.getAttribute(msg));
	
	String nam=request.getParameter("name");

	String query=null;
	
	Connection con=null;
	Statement smt=null;
	ResultSet rs=null;
	int idu=Integer.parseInt(idna);
	
	
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

%>
<html>
<head>
<title>Request for dd</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<table width="770" border="0" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable-->
  <tr> 
    <td width="67" height="25">&nbsp;</td>
    <td width="193">&nbsp;</td>
    <td width="300">&nbsp;</td>
    <td width="159">&nbsp;</td>
    <td width="51">&nbsp;</td>
  </tr>
  <tr> 
    <td height="40">&nbsp;</td>
    <td>&nbsp;</td>
    <td valign="top">
	<img src="images/tit_user_det.gif" width="300" height="40">
	</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td height="27">&nbsp;</td>
    <td>&nbsp;</td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr> 
    <td height="414">&nbsp;</td>
    <td colspan="3" valign="top"> 
      <%
		query="select * from dd_req where req_id=" + idu;
		rs=smt.executeQuery(query);
		rs.next();
	%>
      <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <!--DWLayoutTable-->
        <tr> 
          <td height="2" colspan="2" bgcolor="#000066"></td>
        </tr>
        <tr> 
          <td height="5" colspan="2" bgcolor="#000066"></td>
        </tr>
        <tr> 
          <td width="332" height="24" valign="top"><div align="right"><font color="#CC3300"><strong>Name</strong></font></div></td>
          <td width="320" valign="top"><div align="center"><font color="#CC6633"><strong> 
		  		<% out.print(nam); %>
              </strong></font></div></td>
        </tr>
        <tr> 
          <td height="5" colspan="2" bgcolor="#000066"></td>
        </tr>
        <tr> 
          <td height="24" valign="top"><div align="right"><font color="#CC3300"><strong>Account 
              Number </strong></font></div></td>
          <td height="24" valign="top"><div align="center"><strong><font color="#CC6633"> 
              <% out.print(rs.getString(2)); %>
              </font></strong></div></td>
        </tr>
        <tr> 
          <td height="5" colspan="2" bgcolor="#000066"></td>
        </tr>
        <tr> 
          <td height="24" valign="top"><div align="right"><font color="#CC3300"><strong>In 
              Favour Of</strong></font></div></td>
          <td height="24" valign="top"><div align="center"><strong><font color="#CC6633"> 
              <% out.print(rs.getString(3)); %>
              </font></strong></div></td>
        </tr>
        <tr> 
          <td height="5" colspan="2" bgcolor="#000066"></td>
        </tr>
        <tr> 
          <td height="24" valign="top"><div align="right"> 
              <div align="left"></div>
              <div align="center"></div>
              <div align="right"><strong><font color="#CC3300">Place</font></strong></div>
              <strong></strong></div></td>
          <td height="24" valign="top"><div align="center"><strong><font color="#CC6633"> 
              <% 
			  out.print(rs.getString(4)); %>
              </font></strong></div></td>
        </tr>
        <tr> 
          <td height="5" colspan="2" bgcolor="#000066"></td>
        </tr>
        <tr> 
          <td height="24" valign="top"> <div align="left"> 
              <div align="left"></div>
              <div align="center"></div>
              <div align="right"><strong><font color="#CC3300">Amount</font></strong></div>
            </div></td>
          <td height="20" valign="top"> <div align="center"><strong><font color="#CC6633"> 
              <%
			  
			  int in = rs.getInt(5);
			  int six = rs.getInt(6);
			  out.print(in); 
			  %>
              </font></strong></div></td>
        </tr>
        <tr bgcolor="#000066"> 
          <td height="5" colspan="2"></td>
        </tr>
        <tr> 
          <td height="24"><div align="right"><strong><font color="#CC3300">Commission</font></strong></div></td>
          <td height="24"><div align="center"><strong><font color="#CC6633">
              <%
			  out.print(six); 
			  %>
              </font></strong></div></td>
        </tr>
        <tr> 
          <td height="5" colspan="2" bgcolor="#000066"></td>
        </tr>
        <tr> 
          <td height="24"><div align="right"><strong><font color="#CC3300">Total 
              Amount </font></strong></div></td>
          <td height="24"><div align="center"><strong><font color="#CC6633">
              <%
			  out.print(in+six); 
			  %>
              </font></strong></div></td>
        </tr>
        <tr> 
          <td height="5" colspan="2" bgcolor="#000066"></td>
        </tr>
        <tr> 
          <td height="72" colspan="2" valign="top"> <table width="100%" height="58" border="0" cellpadding="0" cellspacing="0">
              <!--DWLayoutTable-->
              <tr> 
                <td width="290" height="15"></td>
                <td width="72"></td>
                <td width="290"></td>
              </tr>
              <tr> 
                <td height="24"></td>
                <td valign="top"><form name="form1" action="ad_rej_dd_req.jsp">
                    <input type="submit" name="Submit" value="      Back     " >
                  </form></td>
                <td></td>
              </tr>
              <tr> 
                <td height="19"></td>
                <td>&nbsp;</td>
                <td></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
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