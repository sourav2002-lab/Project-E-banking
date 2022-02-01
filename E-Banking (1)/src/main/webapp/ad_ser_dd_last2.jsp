<%@ page contentType="text/html; " language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*" %>
<%
String ent=String.valueOf(session.getAttribute("entadm"));
//Date d=new Date();
//out.println(d);
if (ent.equals("yes"))
{

%>
<html>
    <head>
        <title>Check Request</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <script language="JavaScript">
function ib(no)
{
	var ddno=0;
        var ddno2=0;
	while(ddno==0 || isNaN(ddno))
	{
		ddno=prompt("Enter the Check Starting2 Number",0,"DD Number");
		ddno=78;
               
	}
	switch(no)
	{
	case 1: 
			document.f1.hf_ddno1.value=ddno;
                        document.f1.hf_ddno12.value=ddno2;
			break;
	case 2:	
			document.f2.hf_ddno2.value=ddno;
                        document.f2.hf_ddno22.value=ddno2;
			break;
	case 3:	
			document.f3.hf_ddno3.value=ddno;
                        document.f3.hf_ddno32.value=ddno2;
			break;
	case 4:	
			document.f4.hf_ddno4.value=ddno;
                        document.f4.hf_ddno42.value=ddno2;
			break;
	case 5:	
			document.f5.hf_ddno5.value=ddno;
                        document.f5.hf_ddno52.value=ddno2;
			break;
	case 6:	
			document.f6.hf_ddno6.value=ddno;
                        document.f6.hf_ddno62.value=ddno2;
			break;
	case 7:	
			document.f7.hf_ddno7.value=ddno;
                        document.f7.hf_ddno72.value=ddno2;
			break;
	case 8:	
			document.f8.hf_ddno8.value=ddno;
                        document.f8.hf_ddno82.value=ddno2;
			break;
	case 9:	
			document.f9.hf_ddno9.value=ddno;
                        document.f9.hf_ddno92.value=ddno2;
			break;
	case 10:	
			document.f10.hf_ddno10.value=ddno;
                        document.f10.hf_ddno102.value=ddno2;
			break;
	}
	return true;
}
        </script>
    </head>
    
    <body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
        <table width="701" border="0" cellpadding="0" cellspacing="0">
            <!--DWLayoutTable-->
            <tr> 
                <td height="75" colspan="2" valign="top"><img src="images/tit_pro_req.gif" width="665" height="75"></td>
                <td width="36">&nbsp;</td>
            </tr>
            <tr> 
                <td width="5" height="20">&nbsp;</td>
                <td width="660"><div align="center">
                        <h2>Check Order </h2>
                </div></td>
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
                            <td width="187" valign="top"><div align="center"><strong><font color="#996600">Name</font></strong></div></td>
                            <td width="142" valign="top"><div align="center"><strong></strong></div></td>
                            <td width="142" valign="top"> <div align="center"><strong></strong></div></td>
                            <td colspan="2" valign="top"><div align="center"><strong><font color="#996600">Action</font></strong></div></td>
                        </tr>
                        <tr> 
                            <td colspan="6" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td></tr>
                            <%           Connection con=null;
                        Statement smt=null;
                        ResultSet rs=null;
                        Statement smt1=null;
                        ResultSet rs1=null;
                        Statement smt2=null;
                        ResultSet rs2=null;
                        String s= request.getParameter("hf_ddno1");
                        String s2= request.getParameter("hf_ddno12");
                       
                        try
                        {
                        	  Class.forName("com.mysql.jdbc.Driver");
                              con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebanking","root","admin");
                                                   }
                        catch(ClassNotFoundException ce)
                        {	out.print("<p>&nbsp;</p><p align=center><strong><font color=#CC3300>");
                                out.print("Check the values and try again...");
                                out.print("</font></strong></p>");}
                        catch(SQLException ce)
                        {		out.print("<p>&nbsp;</p><p align=center><strong><font color=#CC3300>");
                                        out.print("Check the values and try again...");
                                        out.print("</font></strong></p>");}
                        
                        smt=con.createStatement();
                        smt1=con.createStatement();
                        smt2=con.createStatement();
                        
                        String ev=null;
                        String query=new String("select * from cheque_req where sta=1");
                        rs=smt.executeQuery(query);
                        boolean ne=rs.next();
                        int idu=0;
                        System.out.println(query);
                        System.out.println(rs);
                        System.out.println(ne);
                        if (ne)
                        {
                            idu=rs.getInt(1);
                            session.setAttribute("id1",String.valueOf(idu));
                            //System.out.println("select reg_id from acholder_info where acc_no='" + rs.getString(2) + "'");
                            
                            rs1=smt1.executeQuery("select reg_id from acholder_info where acc_no='" + rs.getString(2) + "'");
                            
                            rs1.next();
                            int req_id=rs1.getInt(1);
                            System.out.println("select f_name from reg_info where reg_id=" + req_id);
                            rs2=smt2.executeQuery("select f_name from reg_info where reg_id=" + req_id);
                            System.out.println("select f_name from reg_info where reg_id=" + req_id);
                            rs2.next();
                            ev=rs2.getString("F_NAME");
                            System.out.println(ev);
                            
                            //if (ddno!=0)
                            //{
                                
                                PreparedStatement ps=con.prepareStatement("update cheque_req SET  issue_date=?, start_no=?, end_no=? ,sta=2 where id=?");
                                
                                ps.setString(1,new java.util.Date().toString());
                                ps.setInt(2,(Integer.parseInt(s)));
                                ps.setInt(3,((Integer.parseInt(s))+20));
                                ps.setInt(4,idu);
                                ps.executeUpdate();
                            /*}
                            else
                            {
                                PreparedStatement ps=con.prepareStatement("update cheque_req SET  ista=3 where id=?");
                                
                                ps.setInt(1,idu);
                                ps.executeUpdate();
                            }*/
                       
                        %>
                        <tr> 
                            <td valign="top"> <div align="center"> <a href="ad_req_dd_ser.jsp?id=1&name=<%= ev%>"> 
                                        <% out.print(idu); %>
                            </a></div></td>
                            <td valign="top"><div align="center"> <a href="ad_req_dd_ser.jsp?id=1&name=<%= ev%>" > 
                                        <%   out.print(ev);  %>
                            </a> </div></td>
                            <td valign="top"><div align="center"> 
                            </div></td>
                            <td valign="top"> <div align="center"> 
                                </div>
                            <div align="center"> </div></td>
                            <form name="f1" action="ad_ser_dd_last2.jsp?id=1&pro=1" method="post" onSubmit="return ib(1)">
                                <td width="68" valign="top"><div align="center"> 
                                        <input name="hf_ddno1" type="hidden" id="hf_ddno1" value="0">
                                        <input name="hf_ddno12" type="hidden" id="hf_ddno12" value="0">
                                        <input type="submit" name="Submit" value="Accept">
                                </div></td>
                            </form>
                            <form name="f11" action="ad_ser_dd_last2.jsp?id=1&pro=2"  method="post">
                                <td valign="top"><div align="center"> 
                                        <input type="submit" name="Submit2" value="Reject">
                                </div></td>
                            </form>
                        </tr>
                        <%
                        ne=rs.next();
                        System.out.println(ne);
                        if(ne)
                        {
                            idu=rs.getInt(1);
                            session.setAttribute("id2",String.valueOf(idu));
                            rs1=smt1.executeQuery("select reg_id from acholder_info where acc_no='" + rs.getString(2) + "'");
                            rs1.next();
                            rs2=smt2.executeQuery("select f_name from reg_info where reg_id=" + rs1.getInt(1));
                            rs2.next();
                            ev=rs2.getString(1);
                            
                            
                            
                            //
                            
                            ps=con.prepareStatement("update cheque_req SET  issue_date=?, start_no=?, end_no=? ,sta=2 where id=?");
                            
                            ps.setString(1,new java.util.Date().toString());
                            ps.setInt(2,(Integer.parseInt(s)));
                            ps.setInt(3,((Integer.parseInt(s))+20));
                            ps.setInt(4,idu);
                            ps.executeUpdate();
                            //
                        %>
                        <tr> 
                            <td valign="top"> <div align="center"> <a href="ad_req_dd_ser.jsp?id=2&name=<%= ev%>" > 
                                        <% out.print(idu); %>
                            </a> </div></td>
                            <td valign="top"><div align="center"> <a href="ad_req_dd_ser.jsp?id=2&name=<%= ev%>"> 
                                        <% 
                                        out.print(ev);  %>
                            </a> </div></td>
                            <td valign="top"><div align="center"> 
                            </div></td>
                            <td valign="top"> <div align="center"> 
                                </div>
                            <div align="center"></div></td>
                            <form name="f2" action="ad_ser_dd_last2.jsp?id=2&pro=1"  method="post" onSubmit="return ib(2)">
                                <td valign="top">
                                    <div align="center">
                                        <input name="hf_ddno2" type="hidden" id="hf_ddno2" value="0">
                                        <input name="hf_ddno22" type="hidden" id="hf_ddno22" value="0">
                                        <input type="submit" name="Submit3" value="Accept">
                                </div></td>
                            </form>
                            <form name="f12" action="ad_ser_dd_last2.jsp?id=2&pro=2"  method="post">
                                <td valign="top"><div align="center"> 
                                        <input type="submit" name="Submit5" value="Reject">
                                </div></td>
                            </form>
                        </tr>
                        <%
                        ne=rs.next();
                        System.out.println(ne);
                        if(ne)
                        {
                            idu=rs.getInt(1);
                            session.setAttribute("id3",String.valueOf(idu));
                            rs1=smt1.executeQuery("select reg_id from acholder_info where acc_no='" + rs.getString(2) + "'");
                            rs1.next();
                            rs2=smt2.executeQuery("select f_name from reg_info where reg_id=" + rs1.getInt(1));
                            rs2.next();
                            ev=rs2.getString(1);
                            
                            
                            //
                            
                            ps=con.prepareStatement("update cheque_req SET  issue_date=?, start_no=?, end_no=? ,sta=2 where id=?");
                            
                            ps.setString(1,new java.util.Date().toString());
                            ps.setInt(2,(Integer.parseInt(s)));
                            ps.setInt(3,((Integer.parseInt(s))+20));
                            ps.setInt(4,idu);
                            ps.executeUpdate();
                            //
                        
                        %>
                        <tr> 
                            <td valign="top"> <div align="center"> <a href="ad_req_dd_ser2.jsp?id=3&name=<%= ev%>"> 
                                        <% out.print(idu); %>
                            </a> </div></td>
                            <td valign="top"><div align="center"> <a href="ad_req_dd_ser2.jsp?id=3&name=<%= ev%>"> 
                                        <% 
                                        out.print(ev);  %>
                            </a> </div></td>
                            <td valign="top"><div align="center"> 
                            </div></td>
                            <td valign="top"> <div align="center"> 
                                </div>
                            <div align="center"></div></td>
                            <form name="f3" action="ad_ser_dd_last2.jsp?id=3&pro=1" method="post" onSubmit="return ib(3)">
                                <td valign="top"><div align="center">
                                        <input name="hf_ddno3" type="hidden" id="hf_ddno3" value="0">
                                        <input name="hf_ddno32" type="hidden" id="hf_ddno32" value="0">
                                        <input type="submit" name="Submit4" value="Accept">
                                </div></td>
                            </form>
                            <form name="f13" action="ad_ser_dd_last2.jsp?id=3&pro=2" method="post">
                                <td valign="top"><div align="center"> 
                                        <input type="submit" name="Submit6" value="Reject">
                                </div></td>
                            </form>
                        </tr>
                        <%
                        ne=rs.next();
                        System.out.println(ne);
                        if(ne)
                        {
                            idu=rs.getInt(1);
                            session.setAttribute("id4",String.valueOf(idu));
                            rs1=smt1.executeQuery("select reg_id from acholder_info where acc_no='" + rs.getString(2) + "'");
                            rs1.next();
                            rs2=smt2.executeQuery("select f_name from reg_info where reg_id=" + rs1.getInt(1));
                            rs2.next();
                            ev=rs2.getString(1);
                            
                            
                            //
                            
                            ps=con.prepareStatement("update cheque_req SET  issue_date=?, start_no=?, end_no=? ,sta=2 where id=?");
                            
                            ps.setString(1,new java.util.Date().toString());
                            ps.setInt(2,(Integer.parseInt(s)));
                            ps.setInt(3,((Integer.parseInt(s))+20));
                            ps.setInt(4,idu);
                            ps.executeUpdate();
                            //
                        
                        
                        %>
                        <tr> 
                            <td valign="top"> <div align="center"> <a href="ad_req_dd_ser2.jsp?id=4&name=<%= ev%>"> 
                                        <% out.print(idu); %>
                            </a> </div></td>
                            <td valign="top"><div align="center"> <a href="ad_req_dd_ser2.jsp?id=4&name=<%= ev%>"> 
                                        <% 
                                        out.print(ev);  %>
                            </a> </div></td>
                            <td valign="top"><div align="center"> 
                            </div></td>
                            <td valign="top"> <div align="center"> 
                                </div>
                            <div align="center"></div></td>
                            <form name="f4" action="ad_ser_dd_last2.jsp?id=4&pro=1"  method="post" onSubmit="return ib(4)">
                                <td valign="top"><div align="center"> 
                                        <input name="hf_ddno4" type="hidden" id="hf_ddno4" value="0">
                                        <input name="hf_ddno42" type="hidden" id="hf_ddno42" value="0">
                                        <input type="submit" name="Submit7" value="Accept">
                                </div></td>
                            </form>
                            <form name="f14" action="ad_ser_dd_last2.jsp?id=4&pro=2"  method="post">
                                <td valign="top"><div align="center"> 
                                        <input type="submit" name="Submit8" value="Reject">
                                </div></td>
                            </form>
                        </tr>
                        <%
                        ne=rs.next();
                        System.out.println(ne);
                        if(ne)
                        {
                            idu=rs.getInt(1);
                            session.setAttribute("id5",String.valueOf(idu));
                            rs1=smt1.executeQuery("select reg_id from acholder_info where acc_no='" + rs.getString(2) + "'");
                            rs1.next();
                            rs2=smt2.executeQuery("select f_name from reg_info where reg_id=" + rs1.getInt(1));
                            rs2.next();
                            ev=rs2.getString(1);
                            
                            
                            //
                            
                            ps=con.prepareStatement("update cheque_req SET  issue_date=?, start_no=?, end_no=? ,sta=2 where id=?");
                            
                            ps.setString(1,new java.util.Date().toString());
                            ps.setInt(2,(Integer.parseInt(s)));
                            ps.setInt(3,((Integer.parseInt(s))+20));
                            ps.setInt(4,idu);
                            ps.executeUpdate();
                            //
                        
                        
                        
                        %>
                        <tr> 
                            <td valign="top"> <div align="center"> <a href="ad_req_dd_ser2.jsp?id=5&name=<%= ev%>"> 
                                        <% out.print(idu); %>
                            </a> </div></td>
                            <td valign="top"><div align="center"> <a href="ad_req_dd_ser2.jsp?id=5&name=<%= ev%>"> 
                                        <% 
                                        out.print(ev);  %>
                            </a> </div></td>
                            <td valign="top"><div align="center"> 
                            </div></td>
                            <td valign="top"> <div align="center"> 
                                </div>
                            <div align="center"></div></td>
                            <form name="f5" action="ad_ser_dd_last2.jsp?id=5&pro=1"  method="post" onSubmit="return ib(5)">
                                <td valign="top"><div align="center">
                                        <input name="hf_ddno5" type="hidden" id="hf_ddno5" value="0">
                                        <input name="hf_ddno52" type="hidden" id="hf_ddno52" value="0">
                                        <input type="submit" name="Submit9" value="Accept">
                                </div></td>
                            </form>
                            <form name="f15" action="ad_ser_dd_last2.jsp?id=5&pro=2"  method="post">
                                <td valign="top"><div align="center"> 
                                        <input type="submit" name="Submit10" value="Reject">
                                </div></td>
                            </form>
                        </tr>
                        <%
                        ne=rs.next();
                        System.out.println(ne);
                        if(ne)
                        {
                            idu=rs.getInt(1);
                            session.setAttribute("id6",String.valueOf(idu));
                            rs1=smt1.executeQuery("select reg_id from acholder_info where acc_no='" + rs.getString(2) + "'");
                            rs1.next();
                            rs2=smt2.executeQuery("select f_name from reg_info where reg_id=" + rs1.getInt(1));
                            rs2.next();
                            ev=rs2.getString(1);
                            
                            
                            
                            //
                            
                            ps=con.prepareStatement("update cheque_req SET  issue_date=?, start_no=?, end_no=? ,sta=2 where id=?");
                            
                            ps.setString(1,new java.util.Date().toString());
                            ps.setInt(2,(Integer.parseInt(s)));
                            ps.setInt(3,((Integer.parseInt(s))+20));
                            ps.setInt(4,idu);
                            ps.executeUpdate();
                            //
                        
                        
                        %>
                        <tr> 
                            <td valign="top"> <div align="center"> <a href="ad_req_dd_ser2.jsp?id=6&name=<%= ev%>"> 
                                        <% out.print(idu); %>
                            </a> </div></td>
                            <td valign="top"><div align="center"> <a href="ad_req_dd_ser2.jsp?id=6&name=<%= ev%>"> 
                                        <% 
                                        out.print(ev);  %>
                            </a> </div></td>
                            <td valign="top"><div align="center"> 
                            </div></td>
                            <td valign="top"> <div align="center"> 
                                </div>
                            <div align="center"></div></td>
                            <form name="f6" action="ad_ser_dd_last2.jsp?id=6&pro=1"  method="post" onSubmit="return ib(6)">
                                <td valign="top"><div align="center">
                                        <input name="hf_ddno6" type="hidden" id="hf_ddno6" value="0">
                                        <input name="hf_ddno62" type="hidden" id="hf_ddno62" value="0">
                                        <input type="submit" name="Submit11" value="Accept">
                                </div></td>
                            </form>
                            <form name="f16" action="ad_ser_dd_last2.jsp?id=6&pro=2"  method="post">
                                <td valign="top"><div align="center"> 
                                        <input type="submit" name="Submit12" value="Reject">
                                </div></td>
                            </form>
                        </tr>
                        <%
                        ne=rs.next();
                        System.out.println(ne);
                        if(ne)
                        {
                            idu=rs.getInt(1);
                            session.setAttribute("id7",String.valueOf(idu));
                            rs1=smt1.executeQuery("select reg_id from acholder_info where acc_no='" + rs.getString(2) + "'");
                            rs1.next();
                            rs2=smt2.executeQuery("select f_name from reg_info where reg_id=" + rs1.getInt(1));
                            rs2.next();
                            ev=rs2.getString(1);
                            
                            
                            //
                            
                            ps=con.prepareStatement("update cheque_req SET  issue_date=?, start_no=?, end_no=? ,sta=2 where id=?");
                            
                            ps.setString(1,new java.util.Date().toString());
                            ps.setInt(2,(Integer.parseInt(s)));
                            ps.setInt(3,((Integer.parseInt(s))+20));
                            ps.setInt(4,idu);
                            ps.executeUpdate();
                            //
                        
                        
                        %>
                        <tr> 
                            <td valign="top"> <div align="center"> <a href="ad_req_dd_ser2.jsp?id=7&name=<%= ev%>"> 
                                        <% out.print(idu); %>
                            </a> </div></td>
                            <td valign="top"><div align="center"> <a href="ad_req_dd_ser2.jsp?id=7&name=<%= ev%>"> 
                                        <% 
                                        out.print(ev); %>
                            </a> </div></td>
                            <td valign="top"><div align="center"> 
                            </div></td>
                            <td valign="top"> <div align="center"> 
                                </div>
                            <div align="center"></div></td>
                            <form name="f7" action="ad_ser_dd_last2.jsp?id=7&pro=1"  method="post" onSubmit="return ib(7)">
                                <td valign="top"><div align="center">
                                        <input name="hf_ddno7" type="hidden" id="hf_ddno7" value="0">
                                        <input name="hf_ddno72" type="hidden" id="hf_ddno72" value="0">
                                        <input type="submit" name="Submit13" value="Accept">
                                </div></td>
                            </form>
                            <form name="f17" action="ad_ser_dd_last2.jsp?id=7&pro=2"  method="post">
                                <td valign="top"><div align="center"> 
                                        <input type="submit" name="Submit14" value="Reject">
                                </div></td>
                            </form>
                        </tr>
                        <%
                        ne=rs.next();
                        System.out.println(ne);
                        if(ne)
                        {
                        idu=rs.getInt(1);
                        session.setAttribute("id8",String.valueOf(idu));
                        rs1=smt1.executeQuery("select reg_id from acholder_info where acc_no='" + rs.getString(2) + "'");
                        rs1.next();
                        rs2=smt2.executeQuery("select f_name from reg_info where reg_id=" + rs1.getInt(1));
                        rs2.next();
                        ev=rs2.getString(1);
                        
                        
                        //
                        
                        ps=con.prepareStatement("update cheque_req SET  issue_date=?, start_no=?, end_no=? ,sta=2 where id=?");
                        
                        ps.setString(1,new java.util.Date().toString());
                        ps.setInt(2,(Integer.parseInt(s)));
                        ps.setInt(3,((Integer.parseInt(s))+20));
                        ps.setInt(4,idu);
                        ps.executeUpdate();
                        //
                        
                        
                        %>
                        <tr> 
                            <td valign="top"> <div align="center"> <a href="ad_req_dd_ser2.jsp?id=8&name=<%= ev%>"> 
                                        <% out.print(idu); %>
                            </a> </div></td>
                            <td valign="top"><div align="center"> <a href="ad_req_dd_ser2.jsp?id=8&name=<%= ev%>"> 
                                        <% 
                                        out.print(ev);  %>
                            </a> </div></td>
                            <td valign="top"><div align="center"> 
                            </div></td>
                            <td valign="top"> <div align="center"> 
                                </div>
                            <div align="center"></div></td>
                            <form name="f8" action="ad_ser_dd_last2.jsp?id=8&pro=1"  method="post" onSubmit="return ib(8)">
                                <td valign="top"><div align="center"> 
                                        <input name="hf_ddno8" type="hidden" id="hf_ddno8" value="0">
                                        <input name="hf_ddno82" type="hidden" id="hf_ddno82" value="0">
                                        <input type="submit" name="Submit15" value="Accept">
                                </div></td>
                            </form>
                            <form name="f18" action="ad_ser_dd_last2.jsp?id=8&pro=2"  method="post">
                                <td valign="top"><div align="center"> 
                                        <input type="submit" name="Submit16" value="Reject">
                                </div></td>
                            </form>
                        </tr>
                        <%
                        ne=rs.next();
                        System.out.println(ne);
                        if(ne)
                        {
                        idu=rs.getInt(1);
                        session.setAttribute("id9",String.valueOf(idu));
                        rs1=smt1.executeQuery("select reg_id from acholder_info where acc_no='" + rs.getString(2) + "'");
                        rs1.next();
                        rs2=smt2.executeQuery("select f_name from reg_info where reg_id=" + rs1.getInt(1));
                        rs2.next();
                        ev=rs2.getString(1);
                        
                        
                        
                        //
                        
                        ps=con.prepareStatement("update cheque_req SET  issue_date=?, start_no=?, end_no=? ,sta=2 where id=?");
                        
                        ps.setString(1,new java.util.Date().toString());
                        ps.setInt(2,(Integer.parseInt(s)));
                        ps.setInt(3,((Integer.parseInt(s))+20));
                        ps.setInt(4,idu);
                        ps.executeUpdate();
                        //
                        
                        
                        
                        %>
                        <tr> 
                            <td valign="top"> <div align="center"> <a href="ad_req_dd_ser2.jsp?id=9&name=<%= ev%>"> 
                                        <% out.print(idu); %>
                            </a> </div></td>
                            <td valign="top"><div align="center"> <a href="ad_req_dd_ser2.jsp?id=9&name=<%= ev%>"> 
                                        <% 
                                        out.print(ev);  %>
                            </a> </div></td>
                            <td valign="top"><div align="center"> 
                            </div></td>
                            <td valign="top"> <div align="center"> 
                                </div>
                            <div align="center"></div></td>
                            <form name="f9" action="ad_ser_dd_last2.jsp?id=9&pro=1"  method="post" onSubmit="return ib(9)">
                                <td valign="top"><div align="center">
                                        <input name="hf_ddno9" type="hidden" id="hf_ddno9" value="0">
                                        <input name="hf_ddno92" type="hidden" id="hf_ddno92" value="0">
                                        <input type="submit" name="Submit17" value="Accept">
                                </div></td>
                            </form>
                            <form name="f19" action="ad_ser_dd_last2.jsp?id=9&pro=2"  method="post">
                                <td valign="top"><div align="center"> 
                                        <input type="submit" name="Submit18" value="Reject">
                                </div></td>
                            </form>
                        </tr>
                        <%
                        ne=rs.next();
                        System.out.println(ne);
                        if(ne)
                        {
                        idu=rs.getInt(1);
                        session.setAttribute("id10",String.valueOf(idu));
                        rs1=smt1.executeQuery("select reg_id from acholder_info where acc_no='" + rs.getString(2) + "'");
                        rs1.next();
                        rs2=smt2.executeQuery("select f_name from reg_info where reg_id=" + rs1.getInt(1));
                        rs2.next();
                        ev=rs2.getString(1);
                        
                        
                        //
                        
                        ps=con.prepareStatement("update cheque_req SET  issue_date=?, start_no=?, end_no=? ,sta=2 where id=?");
                        
                        ps.setString(1,new java.util.Date().toString());
                        ps.setInt(2,(Integer.parseInt(s)));
                        ps.setInt(3,((Integer.parseInt(s))+20));
                        ps.setInt(4,idu);
                        ps.executeUpdate();
                        //
                        
                        %>
                        <tr> 
                            <td valign="top"> <div align="center"> <a href="ad_req_dd_ser2.jsp?id=10&name=<%= ev%>"> 
                                        <% out.print(idu); %>
                            </a> </div></td>
                            <td valign="top"><div align="center"> <a href="ad_req_dd_ser2.jsp?id=10&name=<%= ev%>"> 
                                        <% out.print(ev);  %>
                            </a> </div></td>
                            <td valign="top"><div align="center"> 
                            </div></td>
                            <td valign="top"> <div align="center"> 
                                </div>
                            <div align="center"></div></td>
                            <form name="f10" action="ad_ser_dd_last2.jsp?id=10&pro=1"  method="post" onSubmit="return ib(10)">
                                <td valign="top"><div align="center">
                                        <input name="hf_ddno10" type="hidden" id="hf_ddno10" value="0">
                                        <input name="hf_ddno102" type="hidden" id="hf_ddno102" value="0">
                                        <input type="submit" name="Submit19" value="Accept">
                                </div></td>
                            </form>
                            <form name="f20" action="ad_ser_dd_last2.jsp?id=10&pro=2"  method="post">
                                <td valign="top"><div align="center"> 
                                        <input name="Submit20" type="submit" id="Submit20" value="Reject">
                                </div></td>
                            </form>
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