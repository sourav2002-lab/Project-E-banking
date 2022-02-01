<%@ page contentType="text/html;" language="java" import="java.sql.*" errorPage="" %>
<%
String ent=String.valueOf(session.getAttribute("entadm"));
if (ent.equals("yes"))
{
	
%>
<html>
<head>
<title>Rejected requests for dd</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<table width="701" border="0" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable-->
  <tr> 
    <td height="75" colspan="2" valign="top"><img src="images/Slide1 - Copy.JPG" width="665" height="75"></td>
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
          <td colspan="5" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
        </tr>
        <tr> 
          <td width="66" valign="top"> <div align="center"><font color="#996600"><strong>ID</strong></font></div></td>
          <td width="172" valign="top"><div align="center"><strong><font color="#996600">Name</font></strong></div></td>
          <td width="141" valign="top"><div align="center"><strong><font color="#996600">In 
              Favour Of</font></strong></div></td>
          <td valign="top"> <div align="center"><strong><font color="#996600">Amount</font></strong></div></td>
          <td valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
        </tr>
        <tr> 
          <td colspan="5" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
        </tr>
        <% 
		Connection con=null;
		Statement smt=null;
		ResultSet rs=null;
		int idu=0;
		String ev=null;
		Statement smt1=null;
		ResultSet rs1=null;
		Statement smt2=null;
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
		smt2=con.createStatement();
		String query=new String("select acc_no,infavourof,amt,req_id from dd_req where sta=0");
		rs=smt.executeQuery(query);
		boolean ne=rs.next();
		if (ne)
		{
		idu=rs.getInt(4);
		session.setAttribute("rid1",String.valueOf(idu));
		rs1=smt1.executeQuery("select reg_id from acholder_info where acc_no='" + rs.getString(1) + "'");
		rs1.next();
		rs2=smt2.executeQuery("select f_name from reg_info where reg_id=" + rs1.getInt(1));
		rs2.next();
		ev=rs2.getString(1);
		%>
        <tr> 
          <td valign="top"> <div align="center"> <a href="ad_ser_dd_last1.jsp?id=1&name=<%= ev%>"> 
              <% out.print(idu); %>
              </a></div></td>
          <td valign="top"><div align="center"> <a href="ad_ser_dd_last1.jsp?id=1&name=<%= ev%>"> 
              <% out.print(ev); %>
              </a> </div></td>
          <td valign="top"><div align="center"> 
              <% out.print(rs.getString(2)); %>
            </div></td>
          <td valign="top"> <div align="center"> 
              <% out.print(rs.getInt(3)); %>
            </div>
            <div align="center"> </div>
            <div align="center"> </div></td>
          <form name="f11" action="ad_rej_last_dd.jsp?id=1"  method="post">
            <td valign="top"><div align="center"> 
                <input type="submit" name="Submit2" value="Delete">
              </div></td>
          </form>
        </tr>
        <%
		ne=rs.next();
		if(ne)
		{
		idu=rs.getInt(4);
		session.setAttribute("rid2",String.valueOf(idu));
		rs1=smt1.executeQuery("select reg_id from acholder_info where acc_no='" + rs.getString(1) + "'");
		rs1.next();
		rs2=smt2.executeQuery("select f_name from reg_info where reg_id=" + rs1.getInt(1));
		rs2.next();
		ev=rs2.getString(1);
		%>
        <tr> 
          <td valign="top"> <div align="center"> <a  href="ad_ser_dd_last1.jsp?id=2&name=<%= ev%>"> 
              <% out.print(idu); %>
              </a> </div></td>
          <td valign="top"><div align="center"> <a href="ad_ser_dd_last1.jsp?id=2&name=<%= ev%>"> 
              <% out.print(ev); %>
              </a> </div></td>
          <td valign="top"><div align="center"> 
              <% out.print(rs.getString(2)); %>
            </div></td>
          <td valign="top"> <div align="center"> 
              <% out.print(rs.getInt(3)); %>
            </div>
            <div align="center"></div>
            <div align="center"> </div></td>
          <form name="f12" action="ad_rej_last_dd.jsp?id=2"  method="post">
            <td valign="top"><div align="center"> 
                <input type="submit" name="Submit5" value="Delete">
              </div></td>
          </form>
        </tr>
        <%
		ne=rs.next();
		if(ne)
		{
		idu=rs.getInt(4);
		session.setAttribute("rid3",String.valueOf(idu));
		rs1=smt1.executeQuery("select reg_id from acholder_info where acc_no='" + rs.getString(1) + "'");
		rs1.next();
		rs2=smt2.executeQuery("select f_name from reg_info where reg_id=" + rs1.getInt(1));
		rs2.next();
		ev=rs2.getString(1);
		%>
        <tr> 
          <td valign="top"> <div align="center"><a href="ad_ser_dd_last1.jsp?id=3&name=<%= ev%>"> 
              <% out.print(idu); %>
              </a> </div></td>
          <td valign="top"><div align="center"> <a href="ad_ser_dd_last1.jsp?id=3&name=<%= ev%>"> 
              <% out.print(ev); %>
              </a> </div></td>
          <td valign="top"><div align="center"> 
              <% out.print(rs.getString(2)); %>
            </div></td>
          <td valign="top"> <div align="center"> 
              <% out.print(rs.getInt(3)); %>
            </div>
            <div align="center"></div>
            <div align="center"> </div></td>

          <form name="f13" action="ad_rej_last_dd.jsp?id=3" method="post">
            <td valign="top"><div align="center"> 
                <input type="submit" name="Submit6" value="Delete">
              </div></td>
          </form>
        </tr>
        <%
		ne=rs.next();
		if(ne)
		{
		idu=rs.getInt(4);
		session.setAttribute("rid4",String.valueOf(idu));
		rs1=smt1.executeQuery("select reg_id from acholder_info where acc_no='" + rs.getString(1) + "'");
		rs1.next();
		rs2=smt2.executeQuery("select f_name from reg_info where reg_id=" + rs1.getInt(1));
		rs2.next();
		ev=rs2.getString(1);
		%>
        <tr> 
          <td valign="top"> <div align="center"> <a href="ad_ser_dd_last1.jsp?id=4&name=<%= ev%>"> 
              <% out.print(idu); %>
              </a> </div></td>
          <td valign="top"><div align="center"><a href="ad_ser_dd_last1.jsp?id=4&name=<%= ev%>"> 
              <% out.print(ev); %>
              </a> </div></td>
          <td valign="top"><div align="center"> 
              <% out.print(rs.getString(2)); %>
            </div></td>
          <td valign="top"> <div align="center"> 
              <% out.print(rs.getInt(3)); %>
            </div>
            <div align="center"></div>
            <div align="center"> </div></td>

          <form name="f14" action="ad_rej_last_dd.jsp?id=4"  method="post">
            <td valign="top"><div align="center"> 
                <input type="submit" name="Submit8" value="Delete">
              </div></td>
          </form>
        </tr>
        <%
		ne=rs.next();
		if(ne)
		{
		idu=rs.getInt(4);
		session.setAttribute("rid5",String.valueOf(idu));
		rs1=smt1.executeQuery("select reg_id from acholder_info where acc_no='" + rs.getString(1) + "'");
		rs1.next();
		rs2=smt2.executeQuery("select f_name from reg_info where reg_id=" + rs1.getInt(1));
		rs2.next();
		ev=rs2.getString(1);
		%>
        <tr> 
          <td valign="top"> <div align="center"> <a href="ad_ser_dd_last1.jsp?id=5&name=<%= ev%>"> 
              <% out.print(idu); %>
              </a> </div></td>
          <td valign="top"><div align="center"><a href="ad_ser_dd_last1.jsp?id=5&name=<%= ev%>"> 
              <% out.print(ev); %>
              </a> </div></td>
          <td valign="top"><div align="center"> 
              <% out.print(rs.getString(2)); %>
            </div></td>
          <td valign="top"> <div align="center"> 
              <% out.print(rs.getInt(3)); %>
            </div>
            <div align="center"></div>
            <div align="center"> </div></td>
          <form name="f15" action="ad_rej_last_dd.jsp?id=5"  method="post">
            <td valign="top"><div align="center"> 
                <input type="submit" name="Submit10" value="Delete">
              </div></td>
          </form>
        </tr>
        <%
		ne=rs.next();
		if(ne)
		{
		idu=rs.getInt(4);
		session.setAttribute("rid6",String.valueOf(idu));
		rs1=smt1.executeQuery("select reg_id from acholder_info where acc_no='" + rs.getString(1) + "'");
		rs1.next();
		rs2=smt2.executeQuery("select f_name from reg_info where reg_id=" + rs1.getInt(1));
		rs2.next();
		ev=rs2.getString(1);
		%>
        <tr> 
          <td valign="top"> <div align="center"><a href="ad_ser_dd_last1.jsp?id=6&name=<%= ev%>"> 
              <% out.print(idu); %>
              </a> </div></td>
          <td valign="top"><div align="center"> <a href="ad_ser_dd_last1.jsp?id=6&name=<%= ev%>"> 
              <% out.print(ev); %>
              </a> </div></td>
          <td valign="top"><div align="center"> 
              <% out.print(rs.getString(2)); %>
            </div></td>
          <td valign="top"> <div align="center"> 
              <% out.print(rs.getInt(3)); %>
            </div>
            <div align="center"></div>
            <div align="center"> </div></td>
          <form name="f16" action="ad_rej_last_dd.jsp?id=6"  method="post">
            <td valign="top"><div align="center"> 
                <input type="submit" name="Submit12" value="Delete">
              </div></td>
          </form>
        </tr>
        <%
		ne=rs.next();
		if(ne)
		{
		idu=rs.getInt(4);
		session.setAttribute("rid7",String.valueOf(idu));
		rs1=smt1.executeQuery("select reg_id from acholder_info where acc_no='" + rs.getString(1) + "'");
		rs1.next();
		rs2=smt2.executeQuery("select f_name from reg_info where reg_id=" + rs1.getInt(1));
		rs2.next();
		ev=rs2.getString(1);
		%>
        <tr> 
          <td valign="top"> <div align="center"><a href="ad_ser_dd_last1.jsp?id=7&name=<%= ev%>"> 
              <% out.print(idu); %>
              </a> </div></td>
          <td valign="top"><div align="center"> <a href="ad_ser_dd_last1.jsp?id=7&name=<%= ev%>"> 
              <% out.print(ev); %>
              </a> </div></td>
          <td valign="top"><div align="center"> 
              <% out.print(rs.getString(2)); %>
            </div></td>
          <td valign="top"> <div align="center"> 
              <% out.print(rs.getInt(3)); %>
            </div>
            <div align="center"></div>
            <div align="center"> </div></td>

          <form name="f17" action="ad_rej_last_dd.jsp?id=7"  method="post">
            <td valign="top"><div align="center"> 
                <input type="submit" name="Submit14" value="Delete">
              </div></td>
          </form>
        </tr>
        <%
		ne=rs.next();
		if(ne)
		{
		idu=rs.getInt(4);
		session.setAttribute("rid8",String.valueOf(idu));
		rs1=smt1.executeQuery("select reg_id from acholder_info where acc_no='" + rs.getString(1) + "'");
		rs1.next();
		rs2=smt2.executeQuery("select f_name from reg_info where reg_id=" + rs1.getInt(1));
		rs2.next();
		ev=rs2.getString(1);
		%>
        <tr> 
          <td valign="top"> <div align="center"> <a href="ad_ser_dd_last1.jsp?id=8&name=<%= ev%>"> 
              <% out.print(idu); %>
              </a> </div></td>
          <td valign="top"><div align="center"> <a href="ad_ser_dd_last1.jsp?id=8&name=<%= ev%>"> 
              <% out.print(ev); %>
              </a> </div></td>
          <td valign="top"><div align="center"> 
              <% out.print(rs.getString(2)); %>
            </div></td>
          <td valign="top"> <div align="center"> 
              <% out.print(rs.getInt(3)); %>
            </div>
            <div align="center"></div>
            <div align="center"> </div></td>
          <form name="f18" action="ad_rej_last_dd.jsp?id=8"  method="post">
            <td valign="top"><div align="center"> 
                <input type="submit" name="Submit16" value="Delete">
              </div></td>
          </form>
        </tr>
        <%
		ne=rs.next();
		if(ne)
		{
		idu=rs.getInt(4);
		session.setAttribute("rid9",String.valueOf(idu));
		rs1=smt1.executeQuery("select reg_id from acholder_info where acc_no='" + rs.getString(1) + "'");
		rs1.next();
		rs2=smt2.executeQuery("select f_name from reg_info where reg_id=" + rs1.getInt(1));
		rs2.next();
		ev=rs2.getString(1);
		%>
        <tr> 
          <td valign="top"> <div align="center"> <a href="ad_ser_dd_last1.jsp?id=9&name=<%= ev%>"> 
              <% out.print(idu); %>
              </a> </div></td>
          <td valign="top"><div align="center"> <a href="ad_ser_dd_last1.jsp?id=9&name=<%= ev%>"> 
              <% out.print(ev); %>
              </a> </div></td>
          <td valign="top"><div align="center"> 
              <% out.print(rs.getString(2)); %>
            </div></td>
          <td valign="top"> <div align="center"> 
              <% out.print(rs.getInt(3)); %>
            </div>
            <div align="center"></div>
            <div align="center"> </div></td>
          <form name="f19" action="ad_rej_last_dd.jsp?id=9"  method="post">
            <td valign="top"><div align="center"> 
                <input type="submit" name="Submit18" value="Delete">
              </div></td>
          </form>
        </tr>
        <%
		ne=rs.next();
		if(ne)
		{
		idu=rs.getInt(4);
		session.setAttribute("rid10",String.valueOf(idu));
		rs1=smt1.executeQuery("select reg_id from acholder_info where acc_no='" + rs.getString(1) + "'");
		rs1.next();
		rs2=smt2.executeQuery("select f_name from reg_info where reg_id=" + rs1.getInt(1));
		rs2.next();
		ev=rs2.getString(1);
		%>
        <tr> 
          <td valign="top"> <div align="center"> <a href="ad_ser_dd_last1.jsp?id=10&name=<%= ev%>"> 
              <% out.print(idu); %>
              </a> </div></td>
          <td valign="top"><div align="center"> <a href="ad_ser_dd_last1.jsp?id=10&name=<%= ev%>"> 
              <% out.print(ev); %>
              </a> </div></td>
          <td valign="top"><div align="center"> 
              <% out.print(rs.getString(2)); %>
            </div></td>
          <td valign="top"> <div align="center"> 
              <% out.print(rs.getInt(3)); %>
            </div>
            <div align="center"></div>
            <div align="center"> </div></td>
          <form name="f20" action="ad_rej_last_dd.jsp?id=10"  method="post">
            <td valign="top"><div align="center"> 
                <input name="Submit20" type="submit" id="Submit20" value="Delete">
              </div></td>
          </form>
        </tr>
        <tr> 
          <td height="2"></td>
          <td></td>
          <td></td>
          <td></td>
          <td width="81"></td>
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
			if (con!=null)
			{
				smt.close();
				con.close();
			}
		%></td>
    <td></td>
  </tr>
</table>

</body>
</html>
<%
}
else
	out.println("Unregistered User");
%>