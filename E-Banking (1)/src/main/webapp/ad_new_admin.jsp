<%@ page contentType="text/html;" language="java" import="java.sql.*"
	errorPage=""%>
<%
	String ent = String.valueOf(session.getAttribute("entadm"));

	if (ent.equals("yes")) {

		Connection con = null;
		Statement smt = null;
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebanking", "root", "admin");
			System.out.println(con);
		} catch (ClassNotFoundException ce) {
			ce.printStackTrace();
			out.println("Check the values and try again...");
		} catch (SQLException ce) {
			out.println("Check the values and try again...");
		}

		smt = con.createStatement();
		rs = smt.executeQuery("select max(req_id) from ant_req");
		int id;
		if (!rs.next()) {
			id = 0;
		} else {
			id = rs.getInt(1);
		}
		id = id + 1;
		int accexi = 0;
		String accno = request.getParameter("txt_accno");
		String apwd = request.getParameter("txt_pwd");
		//int crd=Integer.parseInt(request.getParameter("txt_crd"));
		String sqtn = request.getParameter("txt_sq");
		String sans = request.getParameter("txt_sa");
		String fname = request.getParameter("txt_fn");
		String sname = request.getParameter("txt_sn");
		String sex = request.getParameter("cmb_sex");
		String emailid = request.getParameter("txt_email");
		//long rphone=Long.valueOf(request.getParameter("txt_rp"));
		//long ophone=Long.valueOf(request.getParameter("txt_op"));
		String hname = "Admin";
		String city = request.getParameter("txt_city");
		String branch = request.getParameter("cmb_bra");
		int age = 1;
		String stime = "Admin";
		String sptime = "Admin";
		String tpwd = request.getParameter("txt_pwd");
		int st = 3;
		int id1;

		rs = smt.executeQuery("select max(reg_id) from reg_info");
		if (!rs.next()) {
			id1 = 0;
		} else {
			id1 = rs.getInt(1);
		}
		id1 = id1 + 1;

		String query = "insert into ant_req values(" + id + "," + accexi + ",'" + accno + "','0','" + sqtn
				+ "','" + sans + "','" + fname + "','" + sname + "','" + sex + "','" + emailid + "','"
				+ request.getParameter("txt_rp") + "','" + request.getParameter("txt_op") + "','" + hname
				+ "','" + city + "','" + branch + "'," + age + ",'" + stime + "','" + sptime + "','" + tpwd
				+ "'," + st + ")";

		String q1 = "insert into reg_info values(" + id1 + "," + id + ",'" + fname + "','" + sname + "'," + age
				+ ",'admin','" + city + "','" + emailid + "','" + request.getParameter("txt_rp") + "','"
				+ request.getParameter("txt_op") + "','" + sex + "','" + city + "')";

		String q2 = "insert into login_info values('" + accno + "','" + apwd + "','" + sqtn + "','" + sans
				+ "','admin'," + id1 + ")";

		try {
			smt.executeUpdate(query);
			smt.executeUpdate(q1);
			smt.executeUpdate(q2);
		} catch (SQLException ce) {
			out.println("Check the values and try again...");
			smt.close();
			con.close();
		}
		smt.close();
		con.close();
		response.sendRedirect("ad_msg_con.htm");

	} else
		out.println("Unregistered User");
%>
