<%@ page contentType="text/html;" language="java" import="java.sql.*,java.io.*" errorPage="" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<style type="text/css">
<!--
.style1 {
	font-size: 18px;
	font-weight: bold;
}
-->
</style>
</head>

<%
	
	String accno = (String)session.getAttribute("accnum");
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	ResultSet rs1=null;
	ResultSet rs2=null;
        Statement smt=null;
        int id2;
	//String query,accn,credit,nam,res,offph,branch,cit,accno;
	
	
	  Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebanking","root","admin");
                       
                smt=con.createStatement();
                rs=smt.executeQuery("select max(id) from cheque_req");
                int id;
                if(!rs.next())
                {   
                    id=0;
                }
                else
                {
                    id=rs.getInt(1);
                    //out.println(id);
                 }
                 id=id+1;
                 
                 
                int j=1;
                //PreparedStatement ps=con.prepareStatement("insert into Location values(?,?)");
                PreparedStatement ps1=con.prepareStatement("insert into cheque_req(id,acc_no,sta) values(?,?,?)");
                ps1.setInt(1,id);
                ps1.setString(2,accno);
                ps1.setInt(3,j);
                                
                ps1.executeUpdate();
            %>
<body>
<div align="center" class="style1">
  <p align="right"><a href="aholder.jsp">Back</a></p>
  <p>&nbsp;</p>
  <p>You will receive the check book through mail within one week. </p>
</div>
</body>
</html>

