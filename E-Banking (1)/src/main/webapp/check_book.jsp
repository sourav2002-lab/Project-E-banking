<%@ page contentType="text/html;" language="java"
	import="java.sql.*,java.io.*" errorPage=""%>

<%  
	String ent = String.valueOf(session.getAttribute("enter"));
	try {
		if (ent.equals("yes")) {
			//out.println("Yes" +ent);
%>
<html>
<head>
<title>Check Book</title>
<SCRIPT LANGUAGE="JavaScript">
	function check() {

		if (document.form1.radiobutton1.checked == false
				&& document.form1.radiobutton2.checked == false) {
			alert("Select any one of the radiobutton");
			document.form1.radiobutton1.focus();
			return false;
		}
		if (document.form1.radiobutton1.checked == true) {
			document.form1.action = "check_collect.jsp";
			document.form1.submit();

		}
		if (document.form1.radiobutton2.checked == true) {
			document.form1.action = "check_thank.jsp";
			document.form1.submit();

		}

	}
</script>
</head>
<body>
	<form name="form1" method="post" onSubmit="return check();">
		<h1></h1>
		<%
			//out.println("Yes1");

					Connection con = null;
					PreparedStatement ps;
					ResultSet rs = null;
					ResultSet rs1 = null;
					ResultSet rs2 = null;
					String query, accn, credit, nam, res, offph, branch, cit, accno;

					Class.forName("com.mysql.jdbc.Driver");
					con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebanking", "root", "admin");

					String na = request.getParameter("txt_na");
					String acc = request.getParameter("txt_acc");
					String cr = request.getParameter("txt_cr");
					String ph = request.getParameter("txt_ph");
					String off = request.getParameter("txt_off");
					String bran = request.getParameter("txt_bran");
					String city = request.getParameter("txt_city");

					accno = (String) session.getAttribute("accnum");
					System.out.println(accno);
					//out.println("Yes2");
					query = "select * from ant_req where acc_no ="+accno;
					ps = con.prepareStatement(query);
					//out.println("Yes3");

					//ps.setString(1, accno);

					//out.println(accno);
					/*ps.getString(1,na);
					ps.getString(2,acc);
					ps.getString(3,cr);
					ps.getString(4,ph);
					ps.getString(5,off);
					ps.getString(6,sex);
					ps.getString(7,city);*/

					rs = ps.executeQuery();
					if (rs.next()) {
						accn = rs.getString(3);
						credit = rs.getString(4);
						nam = rs.getString(7) + rs.getString(8);
						res = rs.getString(11);
						offph = rs.getString(12);
						cit = rs.getString(14);
						branch = rs.getString(15);
						//out.println("Yes4");
					
		%>

		<!--  <form name="form1" method="post"   onSubmit="return check();" > -->
		<table width="700" border="0" cellpadding="0" cellspacing="0">
			<!--DWLayoutTable-->
			<tr>
				<td width="19" height="75"></td>
				<td colspan="6" valign="top"><div align="center">
						<p>&nbsp;</p>
						<p>
							<strong><font color="#0000CC" size="5">Check Book</font></strong>
						</p>
					</div></td>
				<td width="16">&nbsp;</td>
			</tr>
			<tr>
				<td height="6"></td>
				<td width="60"></td>
				<td width="28"></td>
				<td width="191"></td>
				<td width="146"></td>
				<td width="128"></td>
				<td width="112"></td>
				<td></td>
			</tr>
			<tr>
				<td height="280"></td>
				<td></td>
				<td colspan="4" valign="top"><table width="100%" border="0"
						cellpadding="0" cellspacing="0">
						<!--DWLayoutTable-->
						<tr>
							<td width="185" height="9"></td>
							<td width="308"></td>
						</tr>
									
						<tr>
							<td height="19"></td>
							<td valign="top"><div align="right"></div></td>
						</tr>
						<tr>
							<td height="17" bgcolor="#efefe0"></td>
							<td bgcolor="#efefe0"></td>
						</tr>
						<tr>
							<td height="20" valign="top"><div align="right">
									<strong><font color="#CC3300">Your Name is :</font></strong>
								</div></td>
							<td valign="top"><div align="center">
									<input name="txt_na" type="text" size="40" value="<%=nam%>">
								</div></td>
						</tr>
						<tr>
							<td height="12" bgcolor="#efefe0"></td>
							<td bgcolor="#efefe0"></td>
						</tr>
						<tr>
							<td height="20" valign="top"><div align="right">
									<strong><font color="#CC3300">Your Account No
											is : </font></strong>
								</div></td>
							<td valign="top"><div align="center">
									<input name="txt_acc" type="text" size="40" value="<%=accn%>">
								</div></td>
						</tr>
						<tr>
							<td height="12" bgcolor="#efefe0"></td>
							<td bgcolor="#efefe0"></td>
						</tr>
						<tr>
							<td height="20" valign="top"><div align="right">
									<strong><font color="#CC3300">Your Credit Card
											No is : </font></strong>
								</div></td>
							<td valign="top"><div align="center">
									<input name="txt_cr" type="text" size="40" value="<%=credit%>">
								</div></td>
						</tr>
						<tr>
							<td height="14" bgcolor="#efefe0"></td>
							<td bgcolor="#efefe0"></td>
						</tr>
						<tr>
							<td height="20" valign="top"><div align="right">
									<strong><font color="#CC3300">Residence Phone </font></strong>
								</div></td>
							<td valign="top"><div align="center">
									<input name="txt_ph" type="text" size="40" value="<%=res%>">
								</div></td>
						</tr>
						<tr>
							<td height="14" bgcolor="#efefe0"></td>
							<td bgcolor="#efefe0"></td>
						</tr>
						<tr>
							<td height="20" valign="top"><div align="right">
									<strong><font color="#CC3300">Office Phone </font></strong>
								</div></td>
							<td valign="top"><div align="center">
									<input name="txt_off" type="text" size="40" value="<%=offph%>">
								</div></td>
						</tr>
						<tr>
							<td height="14" bgcolor="#efefe0"></td>
							<td bgcolor="#efefe0"></td>
						</tr>
						<tr>
							<td height="20" valign="top"><div align="right">
									<strong><font color="#CC3300">Branch </font></strong>
								</div></td>
							<td valign="top"><div align="center">
									<input name="txt_bran" type="text" size="40"
										value="<%=branch%>">
								</div></td>
						</tr>
						<tr>
							<td height="16" bgcolor="#efefe0"></td>
							<td bgcolor="#efefe0"></td>
						</tr>
						<tr>
							<td height="19" valign="top"><div align="right">
									<strong><font color="#CC3300">City</font></strong>
								</div></td>
							<td valign="top"><div align="center">
									<input name="txt_city" type="text" size="40" value="<%=cit%>">
								</div></td>
						</tr>
						<tr>
							<td height="13" colspan="2" bgcolor="#efefe0"></td>
						</tr>
					</table></td>
				<td><p>&nbsp;</p>
					<p>&nbsp;</p>
					<p>&nbsp;</p></td>
				<td></td>
			</tr>
			<tr>
				<td height="16"></td>
				<td></td>
				<td></td>
				<td><label> <input name="radiobutton1" type="radio"
						value="Yes"> Yes
				</label></td>
				<td><label> <input name="radiobutton2" type="radio"
						value="No"> No
				</label></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td height="23" colspan="3" valign="top">
					<!--DWLayoutEmptyCell-->&nbsp;
				</td>
				<td valign="top"><div align="center">
						<input type="submit" name="Submit" value="     Submit    ">
					</div></td>
				<td valign="top"><div align="center">
						<input type="reset" name="Submit2" value="     Reset     ">
					</div></td>
				<td colspan="3" valign="top">
					<!--DWLayoutEmptyCell-->&nbsp;
				</td>
			</tr>
			<tr>
				<td height="16"></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
	</form>
</body>
</html>
<%
}
					} else
			out.println("Unregistered User");
		} catch (Exception e) {
		System.out.println("exception");
	}
%>