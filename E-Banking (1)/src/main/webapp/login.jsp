<html>
<head>

<%@ page import="java.sql.*" contentType="text/html" errorPage=""
	session="true"%>

<title>Login</title>
<script language="JavaScript" src="eBankscripts/usefun.js"></script>
<script language="JavaScript">

var num="0123456789";
function fonload()
{
	document.form1.txt_accno.focus();
}
function vali()
{
	if(Trim(document.form1.txt_accno.value)=="")
	{
		document.form1.txt_accno.focus();
		alert("Enter the account number");
		return false;
	}
	if(Trim(document.form1.txt_pwd.value)=="")
	{
		document.form1.txt_pwd.focus();
		alert("Enter the password");
		return false;
	}
	document.form1.txt_accno.value=Trim(document.form1.txt_accno.value);
	document.form1.txt_pwd.value=Trim(document.form1.txt_pwd.value);
	return true;
}
</script>
</head>

<%
	String ent = request.getParameter("va");
	if (ent != null) {
		Connection con = null;
		Statement smt = null;
		ResultSet rs = null;
		String accno;
		String passw;
		String r;
		String pass;

		accno = request.getParameter("txt_accno");
		passw = request.getParameter("txt_pwd");

		session.setAttribute("accnum", accno);
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebanking", "root", "admin");
		} catch (ClassNotFoundException ce) {
			out.print("<p>&nbsp;</p><p align=center><strong><font color=#CC3300>");
			out.print("Check the values and try again...");
			out.print("</font></strong></p>");
		} catch (SQLException ce) {
			out.print("<p>&nbsp;</p><p align=center><strong><font color=#CC3300>");
			out.print("Check the values and try again...");
			out.print("</font></strong></p>");
		}

		smt = con.createStatement();
		String query = new String("select * from login_info where acc_no='" + accno + "'");
		rs = smt.executeQuery(query);

		if (rs.next()) {
			pass = rs.getString(2);
			r = rs.getString(5);
			out.println(pass + r);

			if (pass.equals(passw)) {
				if (r.equals("admin")) {
					session.setAttribute("entadm", "yes");
%>
<body onload=window.open("admin_home.jsp","_top");>
</body>
<%
	//					response.sendRedirect("admin_loc_home.jsp");
				} else if (r.equals("user")) {
					out.println("user");
					r = String.valueOf(accno);
					session.setAttribute("ahno", r);
					session.setAttribute("pwd", pass);
					rs = smt.executeQuery("select reg_id from acholder_info where acc_no='" + accno + "'");
					rs.next();
					int re = rs.getInt(1);
					System.out.println(re);
					System.out.println("Here");
					rs = smt.executeQuery("select f_name from reg_info where reg_id=" + re);
					System.out.println("There");
					rs.next();
					session.setAttribute("ahname", rs.getString(1));
					session.setAttribute("ahpass", passw);
					session.setAttribute("enter", "yes");
%>
<body onload=window.open("aholder.jsp","_top");>

</body>
<%
	//					response.sendRedirect("aholder.jsp");
				} else {
					session.setAttribute("entadm", "yes");
%>
<body onload=window.open("admin_home.jsp","_top");>
</body>
<%
	//					response.sendRedirect("admin_home.jsp");				
				}
			} else {
				out.print("<p>&nbsp;</p><p align=center><strong><font color=#CC3300>");
				out.print("The given password is incorrect..");
				out.print("</font></strong></p>");
			}
		} else {
			out.print("<p>&nbsp;</p><p align=center><strong><font color=#CC3300>");
			out.print("The given account number is incorrect..");
			out.print("</font></strong></p>");
		}
	}
%>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"
	onLoad="fonload()">

	<table width="779" border="0" cellpadding="0" cellspacing="0">
		<!--DWLayoutTable-->
		<tr>
			<td width="5" height="35">&nbsp;</td>
			<td width="65">&nbsp;</td>
			<td width="55">&nbsp;</td>
			<td width="130">&nbsp;</td>
			<td width="175">&nbsp;</td>
			<td width="65">&nbsp;</td>
			<td width="127">&nbsp;</td>
			<td width="48">&nbsp;</td>
			<td width="109">&nbsp;</td>
		</tr>
		<tr>
			<td height="19">&nbsp;</td>
			<td colspan="7" valign="top"><img
				src="images/reg_user_login_area.gif" width="665" height="19"></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td height="66">&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td height="19"></td>
			<td>&nbsp;</td>
			<td colspan="3" rowspan="2" valign="top"><form name="form1"
					method="post" action="login.jsp?va=1" onSubmit="return vali()">
					<p>
						<font face="Courier New, Courier, mono">Account
							Number&nbsp;&nbsp; <input name="txt_accno" type="text"
							id="txt_accno">
						</font>
					</p>
					<p>
						<font face="Courier New, Courier, mono">Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp; <input name="txt_pwd" type="password" id="txt_pwd">
						</font>
					</p>
					<p>
						<font face="Courier New, Courier, mono">&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp; &nbsp;&nbsp; <input name="btn_sub" type="submit"
							id="btn_sub" value="   Login   "> &nbsp;&nbsp; <input
							name="btn_rst" type="reset" id="btn_rst" value="   Reset   ">
						</font>
					</p>
				</form></td>
			<td>&nbsp;</td>
			<td valign="top"><a href="new_user.htm">Open New Account</a></td>
			<td>&nbsp;</td>
			<td></td>
		</tr>
		<tr>
			<td height="101"></td>
			<td></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td></td>
		</tr>
		<tr>
			<td height="24"></td>
			<td></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td></td>
		</tr>
		<tr>
			<td height="16"></td>
			<td></td>
			<td></td>
			<td valign="top"><font size="2"
				face="Courier New, Courier, mono"><a href="for_pwd.jsp">Forget
						Password?</a></font></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td height="45"></td>
			<td></td>
			<td></td>
			<td>&nbsp;</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</table>
</body>
</html>
