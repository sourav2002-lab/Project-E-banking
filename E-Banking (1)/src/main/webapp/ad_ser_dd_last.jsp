<%@ page contentType="text/html;" language="java" import="java.sql.*,java.io.*" errorPage="" %>
<%
String ent=String.valueOf(session.getAttribute("entadm"));
if (ent.equals("yes"))
{
	
%>
<html>
<head>
<title>Request accept/reject</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body background="images/bg.gif" leftmargin="175" topmargin="120" marginwidth="0" marginheight="0">
<% 
	String msg=request.getParameter("id");
	String t="hf_ddno" + msg;
	msg="id"+msg;
	String idna=String.valueOf(session.getAttribute(msg));
	int idu=Integer.parseInt(idna);
	msg=request.getParameter("pro");
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

//	Savepoint spnt=con.setSavepoint();
	smt=con.createStatement();
	String query;
	if (msg.equals("1"))
	{	try
		{
			String q4="Update dd_req set dd_date='"+new java.util.Date()+"',dd_no=" + request.getParameter("hf_ddno1") + ",sta=2 where req_id=" + idu;
			System.out.println(q4);
			smt.executeUpdate(q4);
			//  get bal $ ac um
			String subqry="select bal,acc_no from acholder_info where acc_no = (select acc_no from dd_req where req_id="+idu+")";
			System.out.println(subqry);
			ResultSet sub=smt.executeQuery(subqry);
			int bal=0;
			String acnum=null;
			if(sub.next())
			{
            bal=sub.getInt(1);
            acnum=sub.getString(2);
			}
			// ends 
			// get Trans amnt
               String   subqry2="select amt,c_amt from dd_req where req_id="+idu;
			   System.out.println(subqry2);
			   ResultSet sub1=smt.executeQuery(subqry2);
			   int ddamnt=0;int comm;
			   if(sub1.next())
			{
               ddamnt=sub1.getInt(1);
               comm=sub1.getInt(2);
               System.out.println("commission is "+comm);
               ddamnt=ddamnt+comm;
			}

			// ends
			System.out.println("update acholder_info set bal="+bal+"-"+ddamnt+" where acc_no = (select acc_no from dd_req where req_id="+idu+")");
			int it=smt.executeUpdate("update acholder_info set bal="+bal+"-"+ddamnt+" where acc_no = (select acc_no from dd_req where req_id="+idu+")");
			
			System.out.println("up acc"+it);
	//			con.releaseSavepoint(spnt);
			smt.close();
			con.close();
			out.print("<table width=400 height=203 border=5 cellpadding=0 cellspacing=0><tr> <td height=50 colspan=3>&nbsp;</td> </tr> <tr>  <td height=23 colspan=3 valign=top>");
			out.print("<p align=center><strong><font color=#CC3300>");
			out.print("Accepted the request." );
			out.print("</font></strong></p>");
			out.print("	</td>  </tr>  <tr>   <td height=26 colspan=3>&nbsp;</td> </tr>  <tr>  <td width=119 height=25>&nbsp;</td>  <td width=76 valign=top>");
			out.print("<div align=center><a href=ad_req_dd.jsp><img src=images/btn_back.gif width=90 height=30 border=0></a></div>");
			out.print("</td>  <td width=128>&nbsp;</td> </tr> <tr>  <td height=42 colspan=3>&nbsp;</td> </tr></table>");
		}
		catch(Exception exp)
		{
			smt.close();
			con.close();
			System.out.println(exp);
			out.print("<table width=400 height=203 border=5 cellpadding=0 cellspacing=0><tr> <td height=50 colspan=3>&nbsp;</td> </tr> <tr>  <td height=23 colspan=3 valign=top>");
			out.print("<p align=center><strong><font color=#CC3300>");
			out.print("Error during execution, transaction rollbacked.");
			out.print("</font></strong></p>");
			out.print("	</td>  </tr>  <tr>   <td height=26 colspan=3>&nbsp;</td> </tr>  <tr>  <td width=119 height=25>&nbsp;</td>  <td width=76 valign=top>");
			out.print("<div align=center><a href=ad_req_dd.jsp><img src=images/btn_back.gif width=90 height=30 border=0></a></div>");
			out.print("</td>  <td width=128>&nbsp;</td> </tr> <tr>  <td height=42 colspan=3>&nbsp;</td> </tr></table>");
		}
	}
	else
	{
		query="Update dd_req set sta=0 where req_id=" + idu;
		smt.executeUpdate(query);
		smt.close();
		con.close();
		out.print("<table width=400 height=203 border=5 cellpadding=0 cellspacing=0><tr> <td height=50 colspan=3>&nbsp;</td> </tr> <tr>  <td height=23 colspan=3 valign=top>");
		out.print("<p align=center><strong><font color=#CC3300>");
		out.print("Rejected the request");
		out.print("</font></strong></p>");
		out.print("	</td>  </tr>  <tr>   <td height=26 colspan=3>&nbsp;</td> </tr>  <tr>  <td width=119 height=25>&nbsp;</td>  <td width=76 valign=top>");
		out.print("<div align=center><a href=ad_req_dd.jsp><img src=images/btn_back.gif width=90 height=30 border=0></a></div>");
		out.print("</td>  <td width=128>&nbsp;</td> </tr> <tr>  <td height=42 colspan=3>&nbsp;</td> </tr></table>");	}

%>
</body>
</html>
<%
}
else
	out.println("Unregistered User");
%>