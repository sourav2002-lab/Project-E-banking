<%@ page contentType="text/html;" language="java" import="java.sql.*" errorPage="" %>

<html>
<head>
<title>Loan request processed</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body background="" leftmargin="200" topmargin="100">
<%!
Connection con,conn;
	Statement smt=null,smt1=null;
	ResultSet rs,rs1,rs2;
	PreparedStatement ps;
	String query,ide,st="1";
%>
<% 
	String pur=request.getParameter("for");
  
	if(pur.equals("1"))
	{
		pur="Car Loan";

	}
	else if(pur.equals("2"))
	{
		pur="Housing Loan";
	}
	else if(pur.equals("3"))
	{
		pur="Educational Loan";
        }
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
        String temp=null;
	int id=0;
        String accno=request.getParameter("txt_accno");
        rs2=smt1.executeQuery("select * from acholder_info where acc_no="+accno);
        System.out.println("This is rs"+rs2);
        if(!rs2.next())
        {
            System.out.println("I am in!!!");
            out.print("<table width=400 height=203 border=5 cellpadding=0 cellspacing=0><tr> <td height=50 colspan=3>&nbsp;</td> </tr> <tr>  <td height=23 colspan=3 valign=top>");
		out.print("<p align=center><strong><font color=#CC3300>");
		out.print("ENTER A VALID ACCOUNT NUMBER.");
		out.print("</font></strong></p>");
		out.print("	</td>  </tr>  <tr>   <td height=26 colspan=3>&nbsp;</td> </tr>  <tr>  <td width=119 height=25>&nbsp;</td>  <td width=90 height=30 valign=top>");
		out.print("<div align=center><a href=main_btm.htm><img src=images/btn_back.gif width=90 height=30 border=0></a></div>");
		out.print("</td><td width=128>&nbsp;</td> </tr> <tr>  <td height=42 colspan=3>&nbsp;</td> </tr></table>");
	
        }
        else
        {
	rs=smt.executeQuery("select max(lid) from loan_appln");
	boolean b=rs.next();
	System.out.println(b);
	if(!b)
	{
		System.out.println("here in false");
		id=0;
	}
	else
	{
	temp=rs.getString(1);
	System.out.println(temp);
	if(temp==null)
		id=0;
	else
		{
        //	id=Integer.parseInt(temp);    write the code from here
		if(temp.indexOf(".")!=-1)
			{
			temp=temp.substring(0,temp.indexOf("."));
             	System.out.println(temp);
            id=Integer.parseInt(temp);
			}


		}
        }
        System.out.println("End");
	try
	{
	id=id+1;
	ide = (new Integer(id)).toString();
	//String accno=request.getParameter("txt_accno");
	String name=request.getParameter("hf_name");
	String pr=request.getParameter("slt_pro");
	String aincome=request.getParameter("slt_inc");
	String add=request.getParameter("txt_add");
	String city=request.getParameter("sel_city");
	String pin=request.getParameter("txt_pin");
	String rph=request.getParameter("txt_rphone");
	String oph=request.getParameter("txt_ophone");
	String mo=request.getParameter("txt_mob");
	String crd=request.getParameter("txt_crd");
	String det=request.getParameter("txt_other");
	String puri=request.getParameter(pur);
	String email=request.getParameter("txt_email");
	
	
	System.out.println("This is inside ser_loan page");
	
/*	int st = 1;
	String query = "insert into loan_appln values('" + id + "','" + accno + "','" + name + "','" + pr + "','" + aincome + "','" + add + "','" + city + "','" + pin + "','" + rph + "','" + oph + "','" + mo + "','" + crd + "','" + det + "','"+puri+"','" + email + "','1')" ;
	
	System.out.println(query);
	
	/* System.out.println("insert into loan_appln values(" + id + ",'" + accno + "','" + name + "','" + pr + "','" + aincome + "','" + add + "','" + city + "','" + pin + "','" + rph + "','" + oph + "','" + mo + "','" + crd + "','" + det + "','" + pur + "','" + email + "','1')"); */
	
/*	out.println("This is inside try");	
	smt = con.createStatement();	
			//rs = smt.executeUpdate(query);
		/*smt1=conn.createStatement();	*/
		
	/*	smt.executeUpdate("insert into loan_appln values('" + id + "','" + accno + "','" + name + "','" + pr + "','" + aincome + "','" + add + "','" + city + "','" + pin + "','" + rph + "','" + oph + "','" + mo + "','" + crd + "','" + det + "','" + email + "','1')" );*/
		
				
		query = "insert into loan_appln values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		ps=con.prepareStatement(query);
		
		
		ps.setString(1,ide);
		ps.setString(2,accno);
		ps.setString(3,name);
		ps.setString(4,pr);
		ps.setString(5,aincome);
		ps.setString(6,add);
		ps.setString(7,city);
		ps.setString(8,pin);
		ps.setString(9,oph);
		ps.setString(10,rph);
		ps.setString(11,mo);
		ps.setString(12,crd);
		ps.setString(13,det);
		ps.setString(14,pur);
		ps.setString(15,email);
		ps.setString(16,st);
			System.out.println("Before execution!");
	    ps.executeUpdate();
			System.out.println("Executing");
				
		//rs2=smt1.executeUpdate("update acholder_info set acc_no="+accno);	
				
		
		System.out.print("!!");
		out.print("<table width=400 height=203 border=5 cellpadding=0 cellspacing=0><tr> <td height=50 colspan=3>&nbsp;</td> </tr> <tr>  <td height=23 colspan=3 valign=top>");
		out.print("<p align=center><strong><font color=#CC3300>");
		out.print("You will be informed through mail after processing the request.");
		out.print("</font></strong></p>");
		out.print("	</td>  </tr>  <tr>   <td height=26 colspan=3>&nbsp;</td> </tr>  <tr>  <td width=119 height=25>&nbsp;</td>  <td width=90 height=30 valign=top>");
		out.print("<div align=center><a href=main_btm.htm><img src=images/btn_back.gif width=90 height=30 border=0></a></div>");
		out.print("</td><td width=128>&nbsp;</td> </tr> <tr>  <td height=42 colspan=3>&nbsp;</td> </tr></table>");
	}
	
		catch(Exception ee)
	{
		smt.close();
		con.close();
		System.out.println(ee);
		out.print("<table width=400 height=203 border=5 cellpadding=0 cellspacing=0><tr> <td height=50 colspan=3>&nbsp;</td> </tr> <tr>  <td height=23 colspan=3 valign=top>");
		out.print("<p align=center><strong><font color=#CC3300>");
		out.print("Error in data");
		out.print("</font></strong></p>");
		out.print("	</td></tr>  <tr>   <td height=26 colspan=3>&nbsp;</td> </tr>  <tr>  <td width=119 height=25>&nbsp;</td>  <td width=76 valign=top>");
		out.print("<div align=center><a href=main_btm.htm><img src=images/btn_back.gif width=90 height=30 border=0></a></div>");
		out.print("</td><td width=128>&nbsp;</td> </tr> <tr>  <td height=42 colspan=3>&nbsp;</td> </tr></table>");
	}
}       
%>
</body>
</html>
