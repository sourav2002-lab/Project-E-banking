<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" session = "true" errorPage="" %>
<html>
<style type="text/css">
<!--
.style1 {
	color: #FF0000;
	font-weight: bold;
}
body {
	background-image: url(images/bg.gif);
}
-->
</style>
<body>
<%
Connection con=null;
Statement smt=null;
ResultSet rs=null;
PreparedStatement ps;
String query,user,pass="";

%>

<%
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebanking","root","admin");

 
 user = request.getParameter("username");
 //HttpSession ss = session.getSession(true);
 session.setAttribute("user",user);
 pass = request.getParameter("password");		
 session.setAttribute("pass",pass);
 
  query = "select * from userlogin where userid=? and pass = ? ";
  
   ps = con.prepareStatement(query);
   ps.setString(1,user);
   ps.setString(2,pass);   
      
   rs = ps.executeQuery();
   if(rs.next())
   {
   response.sendRedirect("your_accno.jsp");
   }
   else
   {
    	%>
<form action="information_accno.jsp">
<table width="612" height="184" border="0">
  <tr>
    <td width="142">&nbsp;</td>
    <td width="273">&nbsp;</td>
    <td width="175">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><div align="center" class="style1">Invalid Username and Password </div></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><label>
      
      <div align="center">
        <input name="Submit" type="submit" id="Submit" value="Back">
      </div>
    </label>
      <div align="justify"></div></td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
<%
  
  
   }

%>
</body>
</html>