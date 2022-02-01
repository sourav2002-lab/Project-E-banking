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

<body background="images/bg.gif" leftmargin="175" topmargin="100" marginwidth="0" marginheight="0">
<% 
	String msg=request.getParameter("id");
 
	msg="id"+msg;
	String idna=String.valueOf(session.getAttribute(msg));
	int idu=Integer.parseInt(idna);
        System.out.println(idu);
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
	{
		try
		{
                    String q10;
		System.out.print("111");
                String g="select pur from loan_appln where lid="+idu;
                ResultSet amnt= smt.executeQuery(g);
                
		String q4="Update loan_appln set sta=2 where lid=" + idu;
                smt.executeUpdate(q4);
                System.out.print("I am out");
                if(amnt.equals("1>"))
                {
                q10="Update acholder_info set bal=bal+10000 where reg_id="+idu;
                smt.executeUpdate(q10);
                System.out.print("I am in 1");
                }
                else if(amnt.equals("3>")){
                    q10="Update acholder_info set bal=bal+20000 where reg_id="+idu;
                smt.executeUpdate(q10);
                System.out.print("I am in 2");
                }
                else
                {
                    q10="Update acholder_info set bal=bal+30000 where reg_id="+idu;
                smt.executeUpdate(q10);
                System.out.print("I am in 3");
                }
                System.out.print("I am out again");
//			con.releaseSavepoint(spnt);
		out.print("<table width=400 height=203 border=5 cellpadding=0 cellspacing=0><tr> <td height=50 colspan=3>&nbsp;</td> </tr> <tr>  <td height=23 colspan=3 valign=top>");
		out.print("<p align=center><strong><font color=#CC3300>");
		out.print("Accepted the request." );
		out.print("</font></strong></p>");
		out.print("	</td>  </tr>  <tr>   <td height=26 colspan=3>&nbsp;</td> </tr>  <tr>  <td width=119 height=25>&nbsp;</td>  <td width=76 valign=top>");
		out.print("<div align=center><a href=ad_new_loan_req.jsp><img src=images/btn_back.gif width=90 height=30 border=0></a></div>");
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
			out.print("<div align=center><a href=ad_new_loan_req.jsp><img src=images/btn_back.gif width=90 height=30 border=0></a></div>");
			out.print("</td>  <td width=128>&nbsp;</td> </tr> <tr>  <td height=42 colspan=3>&nbsp;</td> </tr></table>");
		}
	}
	else
	{
		query="Update loan_appln set sta=0 where lid=" + idu;
		smt.executeUpdate(query);
		smt.close();
		con.close();
		out.print("<table width=400 height=203 border=5 cellpadding=0 cellspacing=0><tr> <td height=50 colspan=3>&nbsp;</td> </tr> <tr>  <td height=23 colspan=3 valign=top>");
		out.print("<p align=center><strong><font color=#CC3300>");
		out.print("Rejected the request");
		out.print("</font></strong></p>");
		out.print("	</td>  </tr>  <tr>   <td height=26 colspan=3>&nbsp;</td> </tr>  <tr>  <td width=119 height=25>&nbsp;</td>  <td width=76 valign=top>");
		out.print("<div align=center><a href=ad_new_loan_req.jsp><img src=images/btn_back.gif width=90 height=30 border=0></a></div>");
		out.print("</td>  <td width=128>&nbsp;</td> </tr> <tr>  <td height=42 colspan=3>&nbsp;</td> </tr></table>");	}
%>
</body>
</html>
<%
}
else
	out.println("Unregistered User");
%>