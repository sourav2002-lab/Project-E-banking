<%@ page contentType="text/html;" language="java" import="java.sql.*" errorPage="" %>
<%
String ent=String.valueOf(session.getAttribute("enter"));
if (ent.equals("yes"))
{
%>
<html>
<head>
<title>Account Details</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="780" border="0" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable-->
  <tr> 
    <td width="33" height="75">&nbsp;</td>
    <td width="665" valign="top"><img src="images/account details.jpg" width="665" height="75"></td>
    <td width="82">&nbsp;</td>
  </tr>
  <tr> 
    <td height="242">&nbsp;</td>
    <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
        <!--DWLayoutTable-->
        <tr> 
          <td height="16" colspan="7"></td>
        </tr>
        <tr> 
          <td width="53" height="26" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
          <td colspan="2" valign="top"><div align="center"><strong><font color="#0033CC">Account 
              Holder Name</font></strong></div></td>
          <td colspan="3" valign="top"><div align="center"><strong> 
              <%
		  	String name=String.valueOf(session.getAttribute("ahname"));
			out.print(name);
		  %>
              </strong></div></td>
          <td width="110" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
        </tr>
        <tr> 
          <td height="26" colspan="7" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
        </tr>
        <tr> 
          <td height="26" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
          <td colspan="2" valign="top"><div align="center"><font color="#0033CC"><strong>Account 
              Number</strong></font></div></td>
          <td colspan="3" valign="top"><div align="center"><strong> 
              <%
		  String accno=String.valueOf(session.getAttribute("ahno"));
			out.print(accno);
		  %>
              </strong></div></td>
          <td valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
        </tr>
        <tr> 
          <td height="26" colspan="7" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
        </tr>
        <tr> 
          <td height="26" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
          <td width="139" valign="top"><div align="left"><strong><font color="#0033CC">Transaction 
              Details</font> </strong></div></td>
          <td colspan="4" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
          <td valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
        </tr>
        <tr> 
          <td height="284" colspan="7" valign="top"><table width="100%" border="1" cellpadding="0" cellspacing="0">
              <!--DWLayoutTable-->
              <tr> 
                <td height="19" colspan="3" valign="top" bgcolor="#999999"><font color="#999999">&nbsp;</font></td>
              </tr>
              <tr> 
                <td width="187" height="21" valign="top"><div align="center"><strong><font color="#339966">DATE</font></strong></div></td>
                <td width="235" valign="top"><div align="center"><strong><font color="#339966">DEBIT</font></strong></div></td>
                <td width="235" valign="top"> <div align="center"><strong><font color="#339966">CREDIT</font></strong></div></td>
              </tr>
              <%
			 		Connection con=null;
					Statement smt=null;
					ResultSet rs=null;
					int cnt;
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
			String query=new String("select trn_date,d_amt,c_amt from tran_info where acc_no='" + accno + "' ORDER BY trn_id DESC");
					//String query=new String("select trn_date,d_amt,c_amt from tran_info where acc_no= ' " +accno+" '");
                              //  String query=new String("select * from acholder_info where acc_no= ' " +accno+" '");
                                        rs=smt.executeQuery(query);
					boolean ne=rs.next();
					if (ne)
					{
				%>
              <tr> 
                <td height="15" valign="top" bgcolor="#E9E9E9"> <div align="center"> 
                    <% out.print(rs.getString(1)); %>
                  </div></td>
                <td height="15" valign="top" bgcolor="#E9E9E9"> <div align="center"> 
                    <% out.print(rs.getInt(2)); %>
                  </div></td>
                <td height="15" valign="top" bgcolor="#E9E9E9"> <div align="center"> 
                    <% out.print(rs.getInt(3)); %>
                  </div></td>
              </tr>
              <%
					ne=rs.next();
					if(ne)
					{
				%>
              <tr> 
                <td height="7" valign="top" bgcolor="#D8D8D8"> <div align="center"> 
                    <% out.print(rs.getString(1)); %>
                  </div></td>
                <td height="7" valign="top" bgcolor="#D8D8D8"> <div align="center"> 
                    <% out.print(rs.getInt(2)); %>
                  </div></td>
                <td height="7" valign="top" bgcolor="#D8D8D8"> <div align="center"> 
                    <% out.print(rs.getInt(3)); %>
                  </div></td>
              </tr>
              <%
					ne=rs.next();
					if(ne)
					{
				%>
              <tr> 
                <td height="8" valign="top" bgcolor="#E9E9E9"> <div align="center"> 
                    <% out.print(rs.getString(1)); %>
                  </div></td>
                <td height="8" valign="top" bgcolor="#E9E9E9"> <div align="center"> 
                    <% out.print(rs.getInt(2)); %>
                  </div></td>
                <td height="8" valign="top" bgcolor="#E9E9E9"> <div align="center"> 
                    <% out.print(rs.getInt(3)); %>
                  </div></td>
              </tr>
              <%
					ne=rs.next();
					if(ne)
					{
				%>
              <tr> 
                <td height="15" valign="top" bgcolor="#D8D8D8"> <div align="center"> 
                    <% out.print(rs.getString(1)); %>
                  </div></td>
                <td height="15" valign="top" bgcolor="#D8D8D8"> <div align="center"> 
                    <% out.print(rs.getInt(2)); %>
                  </div></td>
                <td height="15" valign="top" bgcolor="#D8D8D8"> <div align="center"> 
                    <% out.print(rs.getInt(3)); %>
                  </div></td>
              </tr>
              <%
					ne=rs.next();
					if(ne)
					{
				%>
              <tr> 
                <td height="7" valign="top" bgcolor="#E9E9E9"> <div align="center"> 
                    <% out.print(rs.getString(1)); %>
                  </div></td>
                <td height="7" valign="top" bgcolor="#E9E9E9"> <div align="center"> 
                    <% out.print(rs.getInt(2)); %>
                  </div></td>
                <td height="7" valign="top" bgcolor="#E9E9E9"> <div align="center"> 
                    <% out.print(rs.getInt(3)); %>
                  </div></td>
              </tr>
              <%
					ne=rs.next();
					if(ne)
					{
				%>
              <tr> 
                <td height="8" valign="top" bgcolor="#D8D8D8"> <div align="center"> 
                    <% out.print(rs.getString(1)); %>
                  </div></td>
                <td height="8" valign="top" bgcolor="#D8D8D8"> <div align="center"> 
                    <% out.print(rs.getInt(2)); %>
                  </div></td>
                <td height="8" valign="top" bgcolor="#D8D8D8"> <div align="center"> 
                    <% out.print(rs.getInt(3)); %>
                  </div></td>
              </tr>
              <%
					ne=rs.next();
					if(ne)
					{
				%>
              <tr> 
                <td height="15" valign="top" bgcolor="#E9E9E9"> <div align="center"> 
                    <% out.print(rs.getString(1)); %>
                  </div></td>
                <td height="15" valign="top" bgcolor="#E9E9E9"> <div align="center"> 
                    <% out.print(rs.getInt(2)); %>
                  </div></td>
                <td height="15" valign="top" bgcolor="#E9E9E9"> <div align="center"> 
                    <% out.print(rs.getInt(3)); %>
                  </div></td>
              </tr>
              <%
					ne=rs.next();
					if(ne)
					{
				%>
              <tr> 
                <td height="15" valign="top" bgcolor="#D8D8D8"> <div align="center"> 
                    <% out.print(rs.getString(1)); %>
                  </div></td>
                <td height="15" valign="top" bgcolor="#D8D8D8"> <div align="center"> 
                    <% out.print(rs.getInt(2)); %>
                  </div></td>
                <td height="15" valign="top" bgcolor="#D8D8D8"> <div align="center"> 
                    <% out.print(rs.getInt(3)); %>
                  </div></td>
              </tr>
              <%
					ne=rs.next();
					if(ne)
					{
				%>
              <tr> 
                <td height="10" valign="top" bgcolor="#E9E9E9"> <div align="center"> 
                    <% out.print(rs.getString(1)); %>
                  </div></td>
                <td height="10" valign="top" bgcolor="#E9E9E9"> <div align="center"> 
                    <% out.print(rs.getInt(2)); %>
                  </div></td>
                <td height="10" valign="top" bgcolor="#E9E9E9"> <div align="center"> 
                    <% out.print(rs.getInt(3)); %>
                  </div></td>
              </tr>
              <%
					ne=rs.next();
					if(ne)
					{
				%>
              <tr> 
                <td height="11" valign="top" bgcolor="#D8D8D8"> <div align="center"> 
                    <% out.print(rs.getString(1)); %>
                  </div></td>
                <td height="11" valign="top" bgcolor="#D8D8D8"> <div align="center"> 
                    <% out.print(rs.getInt(2)); %>
                  </div></td>
                <td height="11" valign="top" bgcolor="#D8D8D8"> <div align="center"> 
                    <% out.print(rs.getInt(3)); %>
                  </div></td>
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
              <tr> 
                <td height="15" colspan="3" valign="top" bgcolor="#999999"> 
				<div align="center"><strong><font color="#CC3333"> 
                    <%
					}
					else
					{
						out.print("<div align=center><strong><font color=#CC3333>");
						out.print("NO TRANSACTIONS MADE..");
						out.print("</font></strong> </div>");
					}
				%>
                    </font></strong> </div></td>
              </tr>
              <tr> 
                <td height="15" colspan="3" valign="top" bgcolor="#999999"><!--DWLayoutEmptyCell-->&nbsp;</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td height="26"></td>
          <td></td>
          <td colspan="2" valign="top"><div align="center"><strong><font color="#CC3333">BALANCE 
              AMOUNT </font></strong></div></td>
          <td width="126" valign="top"><div align="center"> <div align="center"><strong><font color="#CC3333"> 
            <% 
				query="select bal from acholder_info where acc_no='" + accno + "'";
				rs=smt.executeQuery(query);
				rs.next();
				String dca=String.valueOf(rs.getInt(1));
				out.print(dca); 
			%>
              </font></strong></div></td>
          <td width="1">&nbsp;</td>
          <td></td>
        </tr>
      </table></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="38">&nbsp;</td>
    <td>&nbsp;</td>
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