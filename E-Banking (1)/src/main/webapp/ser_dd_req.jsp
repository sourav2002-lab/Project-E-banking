<%@ page contentType="text/html;" language="java" import="java.sql.*" errorPage="" %>

<html>
<head>
<title>DD Request</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body background="images/bg.gif" leftmargin="175" topmargin="120" marginwidth="0" marginheight="0">
<%
	Connection con=null;
	Statement smt=null;
	ResultSet rs=null;
	try
	{
		  Class.forName("com.mysql.jdbc.Driver");
          con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebanking","root","admin");
        	}
	catch(ClassNotFoundException ce){out.println("Check the values and try again...");}
	catch(SQLException ce){out.println("Check the values and try again...");}
	
	smt=con.createStatement();
	rs=smt.executeQuery("select max(req_id) from dd_req");
	int id;
	if(!rs.next())
	{
		id=0;
	}
	else
	{
		id=rs.getInt(1);
	}
	id=id+1;
	rs=smt.executeQuery("select max(req_id) from dd_req");
	int ddno;
	String temp=null;
	if(!rs.next())
	{
		ddno=0;
	}
	else 
	{
		System.out.println("in lese");
		temp=rs.getString(1);
		System.out.println("temp    "+temp);
		if(temp==null)
		{

			System.out.println("in null of temp");
			temp="0";
			ddno=Integer.parseInt(temp);
		}
		else if(temp.indexOf(".")!=-1)
		{
			temp=temp.substring(0,temp.indexOf("."));
			ddno=Integer.parseInt(temp);
		}
		else
		{
           ddno=Integer.parseInt(temp);
		}
	}
	ddno=ddno+1;
	System.out.println("dd no"+ddno);
	String ano=(String)session.getAttribute("ahno");
	String ifo=request.getParameter("txt_ifo");
	String pla=request.getParameter("txt_pla");
	int amt=Integer.parseInt(request.getParameter("txt_amt"));
	int camt=Integer.parseInt(request.getParameter("hf_camt"));
	System.out.println("insert into dd_req values(" + id + ",'" + ano + "','" + ifo + "','" + pla + "'," + amt + ","+ camt + "," + ddno + ",sysdate,1)");
	int ret=smt.executeUpdate("insert into dd_req values(" + id + ",'" + ano + "','" + ifo + "','" + pla + "'," + amt + ","+ camt + "," + ddno + ",'"+new java.util.Date()+"',1)");
	smt.close();
	con.close();
	out.print("<table width=400 height=203 border=5 cellpadding=0 cellspacing=0><tr> <td height=50 colspan=3>&nbsp;</td> </tr> <tr>  <td height=23 colspan=3 valign=top>");
	out.print("<p align=center><strong><font color=#CC3300>");
	out.print("Request send to the server.");
	out.print("</font></strong></p>");
	out.print("	</td>  </tr>  <tr>   <td height=26 colspan=3>&nbsp;</td> </tr>  <tr>  <td width=119 height=25>&nbsp;</td>  <td width=76 valign=top>");
	out.print("<div align=center><a href=aholder.jsp><img src=images/btn_back.gif width=90 height=30 border=0></a></div>");
	out.print("</td>  <td width=128>&nbsp;</td> </tr> <tr>  <td height=42 colspan=3>&nbsp;</td> </tr></table>");
%>
</body>
</html>
