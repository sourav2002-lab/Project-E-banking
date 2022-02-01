<html>
<head>
</head>
<%@ page contentType="text/html;" language="java" import="java.sql.*"
	errorPage=""%>
<%
	Connection con = null;
	Statement smt = null;
	Statement smtSecond = null;
	ResultSet rs = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebanking", "root", "admin");
	} catch (ClassNotFoundException ce) {
		System.out.println("Check the values and try again...");
	} catch (SQLException ce) {
		System.out.println("Check the values and try again...");
	}

	smt = con.createStatement();
	smtSecond = con.createStatement();
	rs = smt.executeQuery("select max(req_id) from ant_req");
	int id;
	if (!rs.next()) {
		id = 0;
	} else {
		id = rs.getInt(1);
	}
	id = id + 1;
	int accexi = Integer.parseInt(request.getParameter("cmb_acc"));
	//int accno=Integer.parseInt();
	//int crd=Integer.parseInt(request.getParameter("txt_crd"));
	String sqtn = request.getParameter("txt_sq");
	String sans = request.getParameter("txt_sa");
	String fname = request.getParameter("txt_fn");
	String sname = request.getParameter("txt_sn");
	String sex = request.getParameter("cmb_sex");
	String emailid = request.getParameter("txt_email");
	//long rphone=Long.valueOf(request.getParameter("txt_rp"));
	//long ophone=Long.valueOf(request.getParameter("txt_op"));
	String hname = request.getParameter("txt_hname");
	String city = request.getParameter("txt_city");
	String branch = request.getParameter("cmb_bra");
	String ag = request.getParameter("txt_age");
	int age = 0;
	if (ag == null || ag.equals(""))
		age = 0;
	else
		age = Integer.parseInt(ag);
	String stime = request.getParameter("cmb_tst");
	String sptime = request.getParameter("cmb_tsp");
	String tpwd = request.getParameter("txt_pwd");
	//String userid =request.getParameter("userid");
	//String password =request.getParameter("password");

	int st = 1;
	String query = "insert into ant_req values(" + id + "," + accexi + ",'" + request.getParameter("txt_accno")
			+ "','" + request.getParameter("txt_crd") + "','" + sqtn + "','" + sans + "','" + fname + "','"
			+ sname + "','" + sex + "','" + emailid + "','" + request.getParameter("txt_rp") + "','"
			+ request.getParameter("txt_op") + "','" + hname + "','" + city + "','" + branch + "'," + age + ",'"
			+ stime + "','" + sptime + "','" + tpwd + "'," + st + ")";
	System.out.println(query);

	String queryone = "insert into userlogin values('" + request.getParameter("userid") + "','"
			+ request.getParameter("password") + "'," + id + ")";
	System.out.println(queryone);
	try {
		smt.executeUpdate(query);
		System.out.println("First Success");
		smtSecond.executeUpdate(queryone);
		System.out.println("second query Success");
	} catch (SQLException ce) {
		System.out.println("Check the values and try again...");
		smt.close();
		smtSecond.close();
		con.close();
	}
	smt.close();
	smtSecond.close();
	con.close();
	response.sendRedirect("new_wel.htm");
%>
<!-- <body onload="javascript.open('new_wel.htm','_top')">
						</body>
 -->
</html>