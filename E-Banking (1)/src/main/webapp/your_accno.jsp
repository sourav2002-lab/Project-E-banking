<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<style type="text/css">
<!--
body {
	background-image: url(images/bg.gif);
}
.style1 {color: #FFFFFF}
.style6 {
	color: #FFFFFF;
	font-weight: bold;
	font-size: large;
}
.style8 {color: #FFFFFF; font-size: large; }
.style9 {font-size: large}
-->
</style></head>

<body>
<%
Connection con=null;
Statement smt=null;
ResultSet rs=null,rs1,rs2;
PreparedStatement ps,ps1,ps2;
String query,user="",pass="",query2,query1,reg="",userid,password="",accno="",creditno="";

%>
<%
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebanking","root","admin");

  user = (String)session.getAttribute("user");
  password = (String)session.getAttribute("pass");	
  // user = request.getParameter("username");
  query = "select * from userlogin where userid = ? ";
  
   ps = con.prepareStatement(query);
     ps.setString(1,user);
   rs = ps.executeQuery();
   // out.println(user);
	if(rs.next())
   {
  // out.println("Inside If loop");
   reg = rs.getString(3);
   }
  
  query1 = "select * from acholder_info where reg_id = ? ";
  
  
  ps1 = con.prepareStatement(query1);
  ps1.setString(1, reg);
  rs1 = ps1.executeQuery();
  System.out.println(" rs1");
  
  
  if(rs1.next())
  {
	  accno = rs1.getString(1);
	  creditno = rs1.getString(5);
	  
	  ps1.executeUpdate("update ant_req set acc_no ='"+accno+"',`crd`='"+creditno+"' where `req_id`='"+reg+"'");
	  
	  
  }
  else
  {
	  System.out.println(accno);
  }
   
   %>
<table width="753" height="322" border="0">
  <tr>
    <td width="69">&nbsp;</td>
    <td width="404">&nbsp;</td>
    <td width="76">&nbsp;</td>
    <td width="186"><span class="style6"><a href="main_btm.htm">Home</a></span></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><p class="style8">Your Account Number is : <%=accno%> </p>
    	<p class="style8">Your Credit no Number is : <%=creditno%> </p>
       <% 
       System.out.println(accno);
       query2 = "select * from login_info where acc_no = "+accno;
       System.out.println(accno);
       System.out.println(query2);
       ps2 = con.prepareStatement(query2);
       System.out.println("get set");
       rs2 = ps2.executeQuery();
       System.out.println("go!!!");
        if(rs2.next())
  {{
      System.out.println("I am In!!!"); 
      password=rs2.getString(2);
       System.out.println("password :)"+password);
  }}
       System.out.println("I am Out!!!"); 
       
       /* 
        
            user = (String)session.getAttribute("user");
  password = (String)session.getAttribute("pass");	
  // user = request.getParameter("username");
  query = "select * from userlogin where userid = ? ";
  
   ps = con.prepareStatement(query);
     ps.setString(1,user);
   rs = ps.executeQuery();
   // out.println(user);
	if(rs.next())
   {
  // out.println("Inside If loop");
   reg = rs.getString(3);
   }
        String password_new=null;
            //query2 ="select pwd from login_info where reg_id= ? ";
        query2 ="select pwd from login_info where acc_no= ? ";
            ps2 = con.prepareStatement(query2);
            rs2=ps2.executeQuery();
        
            System.out.println("vrey good");
            if(rs2.next())
               password_new=rs2.getString("pwd");
  //password=rs2.getString(2);
  System.out.println("password:"+password);
      */  %>
     <p class="style1"><span class="style9">Password is : <%=password%></span></p>
      <p>&nbsp;</p></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td colspan="3"><span class="style8">Login with this account number and password .</span> <a href="login.jsp" class="style9">Login </a></td>
  </tr>
</table>
</body>
</html>
