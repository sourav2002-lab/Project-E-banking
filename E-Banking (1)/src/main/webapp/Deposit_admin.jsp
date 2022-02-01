<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%
Connection con=null;
Statement smt=null;
ResultSet rs=null,rs1;
PreparedStatement ps,ps1;
String query,accountnum="",deposit="",reg="",userid,pword,accno="";
String bal,query1,total="";
float tot=0,balance = 0,depo=0;

%>
<%
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebanking","root","admin");

  String check = (String)session.getAttribute("deposit");
  accountnum = request.getParameter("accountnumber");
  deposit = request.getParameter("deposit");
  //	out.println("outside if loop");
	//out.println(check);
   if (check!=null && check.equals("yes"))
   { 
   session.removeAttribute("deposit");
  query = "select * from acholder_info where acc_no = ? ";
  
   ps = con.prepareStatement(query);
   ps.setString(1,accountnum);
   rs = ps.executeQuery();
   // out.println(user);
	if(rs.next())
   {
    bal = rs.getString(6);
	//out.println(bal);
	balance = Float.parseFloat(bal);
	depo = Integer.parseInt(deposit); 
	tot = balance + depo;	
	//out.println(tot);
	total = String.valueOf(tot);
		
   }
   
   query1 = "update acholder_info set bal = ? where acc_no = ? ";
	ps1 = con.prepareStatement(query1);
	ps1.setString(1,total);
	ps1.setString(2,accountnum);
	ps1.executeUpdate();
    
     //String query2="insert into tran_info values(",,)";    
        
  
   response.sendRedirect("Deposited.html");
   }
   else
   {
   response.sendRedirect("Deposit_form.jsp");
   }
   %>