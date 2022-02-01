<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>Enter The Amount</title>
</head>

<body>
<%@ page import="java.sql.*" %>
<%
if(request.getParameter("act")!=null && request.getParameter("act").equals("update"))
{
String upd="update acholder_info set bal="+request.getParameter("amnt")+" where acc_no='"+request.getParameter("accno")+"'";
System.out.println(upd);
Connection con=null;
Statement smt=null;
	try
	{
		  Class.forName("com.mysql.jdbc.Driver");
          con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebanking","root","admin");
        	}
	catch(ClassNotFoundException ce){
		System.out.println(ce);
	}
	try
	{
		smt=con.createStatement();
		int i= smt.executeUpdate(upd);
		if(i>0)
		{
       out.println("Money deposited sucessfully");
		}
	}
catch(Exception e){
		System.out.println(e);
	}

}
else
{

%>
<form method="POST" name="frm" action="ad_amnt.jsp">
<INPUT TYPE="hidden" name="act" value="update">
	<INPUT TYPE="hidden" name="accno" value="<%=request.getParameter("accno")%>">
  <!--webbot bot="SaveResults" U-File="E:\ebanking\_private\form_results.txt"
  S-Format="TEXT/CSV" S-Label-Fields="TRUE" -->
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <div align="center">
    <center>
    <table border="0" width="75%">
      <tr>
        <td width="100%" colspan="2">
          <p align="center"><font size="5" face="Times New Roman">Enter The
          Amount</font></td>
      </tr>
    </center>
    <tr>
      <td width="50%">
        <p align="right">Amount</td>
      <center>
      <td width="50%"><input type="text" name="amnt" size="20"></td>
      </tr>
    </center>
    <tr>
      <td width="50%">
        <p align="right"><input type="submit" value="Submit" name="B1"></td>
      <td width="50%">
        <p align="left"><input type="reset" value="Reset" name="B2"></td>
    </tr>
    </table>
  </div>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
</form>
<%

}
%>
</body>

</html>
