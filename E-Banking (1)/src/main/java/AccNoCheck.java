import java.io.*;
import java.sql.*;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class AccNoCheck extends HttpServlet
{

    public AccNoCheck()
    {
        con = null;
        ps = null;
        rs = null;
    }

    public void init(ServletConfig servletconfig)
        throws ServletException
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebanking","root","admin");
            ps = con.prepareStatement("select * from acholder_info where acc_no=?");
        }
        catch(Exception exception)
        {
            System.out.println(exception);
        }
    }

    public void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
        throws ServletException, IOException
    {
        try
        {
            String s = null;
            s = httpservletrequest.getParameter("accountnumber");
            ps.setString(1, s);
            rs = ps.executeQuery();
            if(rs.next())
            {
                httpservletresponse.setContentType("text/xml");
                httpservletresponse.setHeader("Cache-Control", "no-cache");
                httpservletresponse.getWriter().write("<message>");
                httpservletresponse.getWriter().write("<msg>");
                httpservletresponse.getWriter().write("invalid");
                httpservletresponse.getWriter().write("</msg>");
                httpservletresponse.getWriter().write("</message>");
                ps.clearParameters();
            } else
            {
                httpservletresponse.setContentType("text/xml");
                httpservletresponse.setHeader("Cache-Control", "no-cache");
                httpservletresponse.getWriter().write("<message>");
                httpservletresponse.getWriter().write("<msg>");
                httpservletresponse.getWriter().write("valid");
                httpservletresponse.getWriter().write("</msg>");
                httpservletresponse.getWriter().write("</message>");
                ps.clearParameters();
            }
        }
        catch(Exception exception)
        {
            System.out.println(exception);
        }
    }

    public void doPost(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
        throws ServletException, IOException
    {
    }

    Connection con;
    PreparedStatement ps;
    ResultSet rs;
}