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
	String atemp="hfa" + msg;
	String ctemp="hfc" + msg;
	msg="id"+msg;
	String idna=String.valueOf(session.getAttribute(msg));
	int idu=Integer.parseInt(idna);
	msg=request.getParameter("pro");
	Connection con=null;
	Statement smt=null;
	ResultSet rs=null;
	String accno=null;
	
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
		int id1;
		accno=request.getParameter(atemp);
		String crd=request.getParameter(ctemp);
		rs=smt.executeQuery("select max(reg_id) from reg_info");
		if(!rs.next())
		{
			id1=0;
		}
		else
		{
			id1=rs.getInt(1);
		}
		id1=id1+1;
		query="select * from ant_req where req_id=" + idu;
		System.out.println(query);
		rs=smt.executeQuery(query);
		rs.next();
		
		//con.setAutoCommit(false);
		Statement stmt1=con.createStatement();
		Statement stmt2=con.createStatement();
		System.out.println("before try");
		try
		{
			System.out.println("in try");

    String s_qtn=rs.getString("s_qtn");
	String s_ans=rs.getString("s_ans");
    String f_name=rs.getString("f_name");
	String s_name=rs.getString("s_name");
	String sex=rs.getString("sex");
	String emailid= rs.getString("emailid") ;
    String r_phone= rs.getString("r_phone") ;
	String o_phone= rs.getString("o_phone") ;
    String h_name=rs.getString("h_name")  ;
	String city= rs.getString("city") ;
	String branch=rs.getString("branch") ;
	int age=rs.getInt("age") ;
	



			String q1="insert into reg_info values(" + id1 +"," + idu + ",'" +f_name+ "','" +s_name+ "'," +age+ ",'"  +h_name+"','" +city+ "','" +emailid+ "','" +r_phone+ "','" +o_phone+ "','"+sex+"','India')";
			System.out.println(q1);
			String q2="insert into acholder_info values('" + accno + "'," + id1 + ",1,'" + branch+ "','" + crd + "',0)";
			System.out.println(q2);
			String q3="insert into login_info values('" + accno + "','" + accno + "','" + s_qtn + "','" +s_ans+ "','user'," + id1 + ")";
			System.out.println(q3);
			String q4="Update ant_req set sta=2 where req_id=" + idu;
			String q5="insert into ant_req (acc_no) values(" + accno + ")";
			System.out.println(q4);
			stmt1.executeUpdate(q1);
			stmt2.executeUpdate(q2);
			stmt2.executeUpdate(q3);
			stmt2.executeUpdate(q4);
//			con.releaseSavepoint(spnt);
			stmt1.close();
			stmt2.close();
			con.close();
			out.print("<table width=400 height=203 border=5 cellpadding=0 cellspacing=0><tr> <td height=50 colspan=3>&nbsp;</td> </tr> <tr>  <td height=23 colspan=3 valign=top>");
			out.print("<p align=center><strong><font color=#CC3300>");
			out.print("Accepted the request with accno " + accno + " and crdno " + crd);
			out.print("</font></strong></p>");
			out.print("	</td>  </tr>  <tr>   <td height=26 colspan=3>&nbsp;</td> </tr>  <tr>  <td width=119 height=25>&nbsp;</td>  <td width=90 height=30 valign=top>");
			out.print("<div align=center><a href=ad_amnt.jsp?accno="+accno+"><img src=images/btn_back.gif width=90 height=30 border=0></a></div>");
			out.print("</td>  <td width=128>&nbsp;</td> </tr> <tr>  <td height=42 colspan=3>&nbsp;</td> </tr></table>");
		}
		catch(Exception exp)
		{
			System.out.println(exp);
			stmt1.close();
			stmt2.close();
			con.close();
			out.print("<table width=400 height=203 border=5 cellpadding=0 cellspacing=0><tr> <td height=50 colspan=3>&nbsp;</td> </tr> <tr>  <td height=23 colspan=3 valign=top>");
			out.print("<p align=center><strong><font color=#CC3300>");
			out.print("Error during execution, transaction rollbacked.");
			out.print("</font></strong></p>");
			out.print("	</td>  </tr>  <tr>   <td height=26 colspan=3>&nbsp;</td> </tr>  <tr>  <td width=119 height=25>&nbsp;</td>  <td width=90 height=30 valign=top>");
			out.print("<div align=center><a href=ad_new_req.jsp><img src=images/btn_back.gif width=90 height=30 border=0></a></div>");
			out.print("</td>  <td width=128>&nbsp;</td> </tr> <tr>  <td height=42 colspan=3>&nbsp;</td> </tr></table>");
		}
	}
	else
	{
		query="Update ant_req set sta=0 where req_id=" + idu;
		smt.executeUpdate(query);
		smt.close();
		con.close();
		out.print("<table width=400 height=203 border=5 cellpadding=0 cellspacing=0><tr> <td height=50 colspan=3>&nbsp;</td> </tr> <tr>  <td height=23 colspan=3 valign=top>");
		out.print("<p align=center><strong><font color=#CC3300>");
		out.print("Rejected the request");
		out.print("</font></strong></p>");
		out.print("	</td>  </tr>  <tr>   <td height=26 colspan=3>&nbsp;</td> </tr>  <tr>  <td width=119 height=25>&nbsp;</td>  <td width=76 valign=top>");
		out.print("<div align=center><a href=admin_home.jsp><img src=images/btn_back.gif width=90 height=30 border=0></a></div>");
		out.print("</td>  <td width=128>&nbsp;</td> </tr> <tr>  <td height=42 colspan=3>&nbsp;</td> </tr></table>");	}
%>
</body>
</html>
<%
}
else
	out.println("Unregistered User");
%>