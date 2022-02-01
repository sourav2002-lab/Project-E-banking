<%@ page contentType="text/html;" language="java" import="java.sql.*" errorPage="" %>
<%
String ent=String.valueOf(session.getAttribute("entadm"));
if (ent.equals("yes"))
{
	
%>
<html>
<head>
<title>Requests for new account-Account Holder</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">


<table width="701" border="0" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable-->
  <tr> 
    <td height="75" colspan="2" valign="top"><img src="images/Slide1.JPG" width="665" height="75"></td>
    <td width="36">&nbsp;</td>
  </tr>
  <tr> 
    <td width="5" height="20">&nbsp;</td>
    <td width="660">&nbsp;</td>
    <td></td>
  </tr>
  <tr>
    <td height="278">&nbsp;</td>
    <td colspan="2" valign="top"><table width="96%" border="1" cellpadding="0" cellspacing="0">
        <!--DWLayoutTable-->
        <tr> 
          <td colspan="6" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
        </tr>
        <tr> 
          <td width="47" valign="top"> <div align="center"><font color="#996600"><strong>ID</strong></font></div></td>
          <td width="142" valign="top"><div align="center"><strong><font color="#996600">Name</font></strong></div></td>
          <td width="143" valign="top"><div align="center"><strong><font color="#996600">City</font></strong></div></td>
          <td width="186" valign="top"> <div align="center"><strong><font color="#996600">Email</font></strong></div></td>
          <td width="68" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
          <td valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
        </tr>
        <tr> 
          <td colspan="6" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
        </tr>
        <% 
		Connection con=null;
		Statement smt=null;
		ResultSet rs=null;
		int idu=0;
		
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
		String query=new String("select req_id,f_name,city,emailid from ant_req where sta=1 and acc_exi=1");
		System.out.println(query);
		rs=smt.executeQuery(query);
		boolean ne=rs.next();
		if (ne)
		{
		idu=rs.getInt(1);
		session.setAttribute("id1",String.valueOf(idu));
		%>
        <tr> 
          <td valign="top"> <div align="center"> <a href="ad_req_ser2.jsp?id=1"> 
              <% out.print(idu); %>
              </a></div></td>
          <td valign="top"><div align="center"> <a href="ad_req_ser2.jsp?id=1"> 
              <% out.print(rs.getString(2)); %></a>
            </div></td>
          <td valign="top"><div align="center"> 
              <% out.print(rs.getString(3)); %>
            </div></td>
          <td valign="top"> <div align="center"> 
              <% out.print(rs.getString(4)); %>
            </div>
            <div align="center"> </div></td>
			<form name="f1" action="ad_ser_aho.jsp?id=1&pro=1" method="post">
          <td valign="top"><div align="center">
<input type="submit" name="Submit" value="Accept">
            </div></td>
			</form>
			<form name="f11" action="ad_ser_aho.jsp?id=1&pro=2"  method="post">
          <td valign="top"><div align="center"> 
              <input type="submit" name="Submit2" value="Reject">
            </div></td></form>
        </tr>
        <%
		ne=rs.next();
		if(ne)
		{
		idu=rs.getInt(1);
		session.setAttribute("id2",String.valueOf(idu));
		%>
        <tr> 
          <td valign="top"> <div align="center"> <a href="ad_req_ser2.jsp?id=2" > 
              <% out.print(idu); %>
              </a> </div></td>
          <td valign="top"><div align="center"> <a href="ad_req_ser2.jsp?id=2" > 
              <% out.print(rs.getString(2)); %></a>
            </div></td>
          <td valign="top"><div align="center"> 
              <% out.print(rs.getString(3)); %>
            </div></td>
          <td valign="top"> <div align="center"> 
              <% out.print(rs.getString(4)); %>
            </div>
            <div align="center"></div></td>
			<form name="f2" action="ad_ser_aho.jsp?id=2&pro=1"  method="post">
          <td valign="top"><div align="center">
<input type="submit" name="Submit3" value="Accept">
            </div></td>
			</form><form name="f12" action="ad_ser_aho.jsp?id=2&pro=2"  method="post">
          <td valign="top"><div align="center">
              <input type="submit" name="Submit5" value="Reject">
            </div></td></form>
        </tr>
        <%
		ne=rs.next();
		if(ne)
		{
		idu=rs.getInt(1);
		session.setAttribute("id3",String.valueOf(idu));
		%>
        <tr> 
          <td valign="top"> <div align="center"> <a href="ad_req_ser2.jsp?id=3"> 
              <% out.print(idu); %>
              </a> </div></td>
          <td valign="top"><div align="center">  <a href="ad_req_ser2.jsp?id=3"> 
              <% out.print(rs.getString(2)); %></a>
            </div></td>
          <td valign="top"><div align="center"> 
              <% out.print(rs.getString(3)); %>
            </div></td>
          <td valign="top"> <div align="center"> 
              <% out.print(rs.getString(4)); %>
            </div>
            <div align="center"></div></td>
			<form name="f3" action="ad_ser_aho.jsp?id=3&pro=1" method="post">
          <td valign="top"><div align="center"> 
                <input type="submit" name="Submit4" value="Accept">
            </div></td>
			</form><form name="f13" action="ad_ser_aho.jsp?id=3&pro=2" method="post">
          <td valign="top"><div align="center">
              <input type="submit" name="Submit6" value="Reject">
            </div></td></form>
        </tr>
        <%
		ne=rs.next();
		if(ne)
		{
		idu=rs.getInt(1);
		session.setAttribute("id4",String.valueOf(idu));
		%>
        <tr> 
          <td valign="top"> <div align="center"> <a href="ad_req_ser2.jsp?id=4"> 
              <% out.print(idu); %>
              </a> </div></td>
          <td valign="top"><div align="center">  <a href="ad_req_ser2.jsp?id=4"> 
              <% out.print(rs.getString(2)); %></a>
            </div></td>
          <td valign="top"><div align="center"> 
              <% out.print(rs.getString(3)); %>
            </div></td>
          <td valign="top"> <div align="center"> 
              <% out.print(rs.getString(4)); %>
            </div>
            <div align="center"></div></td>
			<form name="f4" action="ad_ser_aho.jsp?id=4&pro=1"  method="post">
          <td valign="top"><div align="center">
<input type="submit" name="Submit7" value="Accept">
            </div></td>
			</form><form name="f14" action="ad_ser_aho.jsp?id=4&pro=2"  method="post">
          <td valign="top"><div align="center">
              <input type="submit" name="Submit8" value="Reject">
            </div></td></form>
        </tr>
        <%
		ne=rs.next();
		if(ne)
		{
		idu=rs.getInt(1);
		session.setAttribute("id5",String.valueOf(idu));
		%>
        <tr> 
          <td valign="top"> <div align="center"> <a href="ad_req_ser2.jsp?id=5"> 
              <% out.print(idu); %>
              </a> </div></td>
          <td valign="top"><div align="center"> <a href="ad_req_ser2.jsp?id=5"> 
              <% out.print(rs.getString(2)); %></a>
            </div></td>
          <td valign="top"><div align="center"> 
              <% out.print(rs.getString(3)); %>
            </div></td>
          <td valign="top"> <div align="center"> 
              <% out.print(rs.getString(4)); %>
            </div>
            <div align="center"></div></td>
			<form name="f5" action="ad_ser_aho.jsp?id=5&pro=1"  method="post">
          <td valign="top"><div align="center">
<input type="submit" name="Submit9" value="Accept">
            </div></td>
			</form><form name="f15" action="ad_ser_aho.jsp?id=5&pro=2"  method="post">
          <td valign="top"><div align="center">
              <input type="submit" name="Submit10" value="Reject">
            </div></td></form>
        </tr>
        <%
		ne=rs.next();
		if(ne)
		{
		idu=rs.getInt(1);
		session.setAttribute("id6",String.valueOf(idu));
		%>
        <tr> 
          <td valign="top"> <div align="center"> <a href="ad_req_ser2.jsp?id=6"> 
              <% out.print(idu); %>
              </a> </div></td>
          <td valign="top"><div align="center"> <a href="ad_req_ser2.jsp?id=6"> 
              <% out.print(rs.getString(2)); %></a>
            </div></td>
          <td valign="top"><div align="center"> 
              <% out.print(rs.getString(3)); %>
            </div></td>
          <td valign="top"> <div align="center"> 
              <% out.print(rs.getString(4)); %>
            </div>
            <div align="center"></div></td>
			<form name="f6" action="ad_ser_aho.jsp?id=6&pro=1"  method="post">
          <td valign="top"><div align="center">
<input type="submit" name="Submit11" value="Accept">
            </div></td>
			</form><form name="f16" action="ad_ser_aho.jsp?id=6&pro=2"  method="post">
          <td valign="top"><div align="center">
              <input type="submit" name="Submit12" value="Reject">
            </div></td></form>
        </tr>
        <%
		ne=rs.next();
		if(ne)
		{
		idu=rs.getInt(1);
		session.setAttribute("id7",String.valueOf(idu));
		%>
        <tr> 
          <td valign="top"> <div align="center"> <a href="ad_req_ser2.jsp?id=7"> 
              <% out.print(idu); %>
              </a> </div></td>
          <td valign="top"><div align="center"> <a href="ad_req_ser2.jsp?id=7"> 
              <% out.print(rs.getString(2)); %></a>
            </div></td>
          <td valign="top"><div align="center"> 
              <% out.print(rs.getString(3)); %>
            </div></td>
          <td valign="top"> <div align="center"> 
              <% out.print(rs.getString(4)); %>
            </div>
            <div align="center"></div></td>
			<form name="f7" action="ad_ser_aho.jsp?id=7&pro=1"  method="post">
          <td valign="top"><div align="center">
<input type="submit" name="Submit13" value="Accept">
            </div></td>
			</form><form name="f17" action="ad_ser_aho.jsp?id=7&pro=2"  method="post">
          <td valign="top"><div align="center">
              <input type="submit" name="Submit14" value="Reject">
            </div></td></form>
        </tr>
        <%
		ne=rs.next();
		if(ne)
		{
		idu=rs.getInt(1);
		session.setAttribute("id8",String.valueOf(idu));
		%>
        <tr> 
          <td valign="top"> <div align="center"> <a href="ad_req_ser2.jsp?id=8"> 
              <% out.print(idu); %>
              </a> </div></td>
          <td valign="top"><div align="center"> <a href="ad_req_ser2.jsp?id=8"> 
              <% out.print(rs.getString(2)); %></a>
            </div></td>
          <td valign="top"><div align="center"> 
              <% out.print(rs.getString(3)); %>
            </div></td>
          <td valign="top"> <div align="center"> 
              <% out.print(rs.getString(4)); %>
            </div>
            <div align="center"></div></td>
			<form name="f8" action="ad_ser_aho.jsp?id=8&pro=1"  method="post">
          <td valign="top"><div align="center"> 
                <input type="submit" name="Submit15" value="Accept">
            </div></td>
			</form><form name="f18" action="ad_ser_aho.jsp?id=8&pro=2"  method="post">
          <td valign="top"><div align="center">
              <input type="submit" name="Submit16" value="Reject">
            </div></td></form>
        </tr>
        <%
		ne=rs.next();
		if(ne)
		{
		idu=rs.getInt(1);
		session.setAttribute("id9",String.valueOf(idu));
		%>
        <tr> 
          <td valign="top"> <div align="center"> <a href="ad_req_ser2.jsp?id=9"> 
              <% out.print(idu); %>
              </a> </div></td>
          <td valign="top"><div align="center"> <a href="ad_req_ser2.jsp?id=9"> 
              <% out.print(rs.getString(2)); %></a>
            </div></td>
          <td valign="top"><div align="center"> 
              <% out.print(rs.getString(3)); %>
            </div></td>
          <td valign="top"> <div align="center"> 
              <% out.print(rs.getString(4)); %>
            </div>
            <div align="center"></div></td>
			<form name="f9" action="ad_ser_aho.jsp?id=9&pro=1"  method="post">
          <td valign="top"><div align="center">
<input type="submit" name="Submit17" value="Accept">
            </div></td>
			</form><form name="f19" action="ad_ser_aho.jsp?id=9&pro=2"  method="post">
          <td valign="top"><div align="center"> 
              <input type="submit" name="Submit18" value="Reject">
            </div></td></form>
        </tr>
        <%
		ne=rs.next();
		if(ne)
		{
		idu=rs.getInt(1);
		session.setAttribute("id10",String.valueOf(idu));
		%>
        <tr> 
          <td valign="top"> <div align="center"> <a href="ad_req_ser2.jsp?id=10"> 
              <% out.print(idu); %>
              </a> </div></td>
          <td valign="top"><div align="center">  <a href="ad_req_ser2.jsp?id=10"> 
              <% out.print(rs.getString(2)); %></a>
            </div></td>
          <td valign="top"><div align="center"> 
              <% out.print(rs.getString(3)); %>
            </div></td>
          <td valign="top"> <div align="center"> 
              <% out.print(rs.getString(4)); %>
            </div>
            <div align="center"></div></td>
			<form name="f10" action="ad_ser_aho.jsp?id=10&pro=1"  method="post">
          <td valign="top"><div align="center">
<input type="submit" name="Submit19" value="Accept">
            </div></td>
			</form><form name="f20" action="ad_ser_aho.jsp?id=10&pro=2"  method="post">
          <td valign="top"><div align="center">
              <input name="Submit20" type="submit" id="Submit20" value="Reject">
            </div></td></form>
        </tr>
        <tr> 
          <td height="2"></td>
          <td></td>
          <td></td>
          <td colspan="2"></td>
          <td width="68"></td>
        </tr>
        <%
		}
		}
		}
		}
		}
		}
		}
		}
		}
		%>
      </table></td>
  </tr>
  <tr>
    <td height="47">&nbsp;</td>
    <td><% }
			else
			{
				out.print("<p>&nbsp;</p><p align=center><strong><font color=#CC3300>");
				out.print("No new requests...");
				out.print("</font></strong></p>");
			}
		%></td>
    <td></td>
  </tr>
</table>
<%
	if (con!=null)
	{
		smt.close();
		con.close();
	}
%>
</body>
</html>
<%
}
else
	out.println("Unregistered User");
%>