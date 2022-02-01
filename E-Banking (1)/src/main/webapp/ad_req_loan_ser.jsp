<%@ page contentType="text/html; " language="java" import="java.sql.*" errorPage="" %>
<%
String id=request.getParameter("id");
System.out.println("id"+id);
String qry="select pur,lid,name,acc_no,addr,ophone,rphone,mob,email,prof,anu_income from loan_appln where lid="+id;
System.out.println(qry);
Connection con=null;
Statement smt=null;
ResultSet rs=null;

try
	{
	  Class.forName("com.mysql.jdbc.Driver");
      con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebanking","root","admin");
    	}
	catch(Exception ce){	out.print("<p>&nbsp;</p><p align=center><strong><font color=#CC3300>");
										out.print("Check the values and try again...");
										out.print("</font></strong></p>");}


try{
smt=con.createStatement();
rs=smt.executeQuery(qry);
boolean b=rs.next();
if(b)
	{
// html tags design
%><BR><BR>
<table border="0" width="100%" align="center">
    <tr>
      <td width="50%" align="right">
        <p align="right"><font face="Times New Roman" size="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        Loan Type :</font></td>
      <center>
      <td width="50%" align="left"><%= rs.getString(1)%></td>
      </tr>
    </center>
    <tr>
      <td width="50%">
        <p align="right"><font face="Times New Roman" size="4">Loan Request ID :</font></td>
      <center>
      <td width="50%" align="left"><%= rs.getString(2)%></td>
      </tr>
    </center>
    <tr>
      <td width="50%">
        <p align="right"><font face="Times New Roman" size="4">Name:</font></td>
      <center>
      <td width="50%" align="left"><%= rs.getString(3)%></td>
      </tr>
    </center>
    <tr>
      <td width="50%">
        <p align="right"><font face="Times New Roman" size="4">Account Number:</font></td>
      <center>
      <td width="50%" align="left"><%= rs.getString(4)%></td>
      </tr>
    </center>
    <tr>
      <td width="50%">
        <p align="right"><font face="Times New Roman" size="4">Address:</font></td>
      <center>
      <td width="50%" align="left"><%= rs.getString(5)%></td>
      </tr>
    </center>
    <tr>
      <td width="50%">
        <p align="right"><font size="4" face="Times New Roman">Residence Number:</font></td>
      <center>
      <td width="50%" align="left"><%= rs.getString(6)%></td>
      </tr>
    </center>
    <tr>
      <td width="50%">
        <p align="right"><font face="Times New Roman" size="4">Office Number:</font></td>
      <center>
      <td width="50%" align="left"><%= rs.getString(7)%></td>
      </tr>
    </center>
    <tr>
      <td width="50%">
        <p align="right"><font face="Times New Roman" size="4">Mobile Number:</font></td>
      <center>
      <td width="50%" align="left"><%= rs.getString(8)%></td>
      </tr>
    </center>
    <tr>
      <td width="50%">
        <p align="right"><font face="Times New Roman" size="4">Email:</font></td>
      <center>
      <td width="50%" align="left"><%= rs.getString(9)%></td>
      </tr>
    </center>
    <tr>
      <td width="50%">
        <p align="right"><font size="4" face="Times New Roman">Profession:</font></td>
      <center>
      <td width="50%" align="left"><%= rs.getString(10)%></td>
      </tr>
    </center>
    <tr>
      <td width="50%">
        <p align="right"><font face="Times New Roman" size="4">Annual Income:</font></td>
      <center>
      <td width="50%" align="left"><%= rs.getString(11)%></td> </tr>
    </table>



<%
// html tags design  ends
	}

}

	catch(SQLException ce){		out.print("<p>&nbsp;</p><p align=center><strong><font color=#CC3300>");
								out.print("Check the values and try again...");
								out.print("</font></strong></p>");}



%>