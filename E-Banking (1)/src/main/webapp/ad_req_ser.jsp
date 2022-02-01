<%@ page contentType="text/html;" language="java" import="java.sql.*" errorPage="" %>
<%
String ent=String.valueOf(session.getAttribute("entadm"));
if (ent.equals("yes"))
{
	
%>
<%
	String msg=request.getParameter("id");
	msg="id"+msg;
	String idna=String.valueOf(session.getAttribute(msg));
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
<title>Request for new account-one user</title>
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
    <td valign="top"><img src="images/tit_user_det.gif" width="300" height="40"></td>
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
		query="select f_name,s_name,h_name,city,age,sex,r_phone,o_phone,branch,emailid,s_time,sp_time from ant_req where req_id=" + idu;
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
          <td width="332" height="24" valign="top"><div align="right"><font color="#CC3300"><strong>First 
              Name</strong></font></div></td>
          <td width="320" valign="top"><div align="center"><font color="#CC6633"><strong> 
              <% out.print(rs.getString(1)); %>
              </strong></font></div></td>
        </tr>
        <tr> 
          <td height="5" colspan="2" bgcolor="#000066"></td>
        </tr>
        <tr> 
          <td height="24" valign="top"><div align="right"><font color="#CC3300"><strong>Second 
              Name</strong></font></div></td>
          <td height="24" valign="top"><div align="center"><strong><font color="#CC6633"> 
              <% out.print(rs.getString(2)); %>
              </font></strong></div></td>
        </tr>
        <tr> 
          <td height="5" colspan="2" bgcolor="#000066"></td>
        </tr>
        <tr> 
          <td height="24" valign="top"><div align="right"><font color="#CC3300"><strong>House 
              Name</strong></font></div></td>
          <td height="24" valign="top"><div align="center"><strong><font color="#CC6633"> 
              <% out.print(rs.getString(3)); %>
              </font></strong></div></td>
        </tr>
        <tr> 
          <td height="5" colspan="2" bgcolor="#000066"></td>
        </tr>
        <tr> 
          <td height="24" valign="top"><div align="right"><font color="#CC3300"><strong>City</strong></font></div></td>
          <td height="24" valign="top"><div align="center"><strong><font color="#CC6633"> 
              <% out.print(rs.getString(4)); %>
              </font></strong></div></td>
        </tr>
        <tr> 
          <td height="5" colspan="2" bgcolor="#000066"></td>
        </tr>
        <tr> 
          <td height="24" valign="top"><div align="right"><font color="#CC3300"><strong>Age</strong></font></div></td>
          <td height="24" valign="top"><div align="center"><strong><font color="#CC6633"> 
              <% out.print(rs.getInt(5)); %>
              </font></strong></div></td>
        </tr>
        <tr> 
          <td height="5" colspan="2" bgcolor="#000066"></td>
        </tr>
        <tr> 
          <td height="24" valign="top"><div align="right"><font color="#CC3300"><strong>Sex</strong></font></div></td>
          <td height="24" valign="top"><div align="center"><strong><font color="#CC6633"> 
              <% out.print(rs.getString(6)); %>
              </font></strong></div></td>
        </tr>
        <tr> 
          <td height="5" colspan="2" bgcolor="#000066"></td>
        </tr>
        <tr> 
          <td height="24" valign="top"><div align="right"><strong><font color="#CC3300">Residence 
              Phone</font></strong></div></td>
          <td height="24" valign="top"><div align="center"><strong><font color="#CC6633"> 
              <% 
			  out.print(rs.getString(7)); %>
              </font></strong></div></td>
        </tr>
        <tr> 
          <td height="5" colspan="2" bgcolor="#000066"></td>
        </tr>
        <tr> 
          <td height="24" valign="top"><div align="left"></div>
            <div align="center"></div>
            <div align="right"><strong><font color="#CC3300">Office Phone</font></strong></div></td>
          <td height="24" valign="top"><div align="center"><strong><font color="#CC6633"> 
              <%
			  out.print(rs.getString("o_phone")); 
			  %>
              </font></strong></div></td>
        </tr>
        <tr> 
          <td height="5" colspan="2" bgcolor="#000066"></td>
        </tr>
        <tr> 
          <td height="24" valign="top"><div align="right"><font color="#CC3300"><strong>Bank 
              Branch</strong></font></div></td>
          <td height="24" valign="top"><div align="center"><strong><font color="#CC6633"> 
              <% out.print(rs.getString(9)); %>
              </font></strong></div></td>
        </tr>
        <tr> 
          <td height="5" colspan="2" bgcolor="#000066"></td>
        </tr>
        <tr> 
          <td height="24" valign="top"><div align="right"><strong><font color="#CC3300">Email 
              id</font></strong></div></td>
          <td height="24" valign="top"><div align="center"><strong><font color="#CC6633"> 
              <% out.print(rs.getString(10)); %>
              </font></strong></div></td>
        </tr>
        <tr> 
          <td height="5" colspan="2" bgcolor="#000066"></td>
        </tr>
        <tr> 
          <td height="24" valign="top"><div align="right"><font color="#CC3300"><strong>Convenient 
              time to contact you between</strong></font></div></td>
          <td height="24" valign="top"><div align="center"><strong><font color="#CC6633"> 
              <% String tmp=rs.getString(11); 
		 		tmp=tmp+" and " + rs.getString(12);
				out.print(tmp);
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
                <td valign="top"><form name="form1" action="ad_new_req.jsp">
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