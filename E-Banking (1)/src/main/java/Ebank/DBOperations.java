package Ebank;

import java.io.PrintStream;
import java.sql.*;

public class DBOperations
{

    public DBOperations()
    {
    }

    public void sta()
    {
        System.out.println("HELLO");
    }

    public void makeConnection()
        throws ClassNotFoundException, SQLException
    {
    	  Class.forName("com.mysql.jdbc.Driver");
          con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebanking","root","admin");
         }

    public ResultSet selectData(String s)
        throws ClassNotFoundException, SQLException
    {
        makeConnection();
        smt = con.createStatement();
        rs = smt.executeQuery(s);
        smt.close();
        con.close();
        return rs;
    }

    public void updateTable(String s)
        throws ClassNotFoundException, SQLException
    {
        makeConnection();
        smt = con.createStatement();
        smt.executeUpdate(s);
        smt.close();
        con.close();
    }

    Connection con;
    Statement smt;
    ResultSet rs;
}