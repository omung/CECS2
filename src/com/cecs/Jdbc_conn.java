package com.cecs;

import java.sql.*; 

public class Jdbc_conn {
	public ResultSet connection(String sql) throws ClassNotFoundException, SQLException{ 
	     
	    Class.forName("com.mysql.jdbc.Driver"); 
	 
	     
	       Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cecs","root","1234"); 
	 
	       Statement   stmt = conn.createStatement(); 
	          ResultSet rs = stmt.executeQuery(sql); 
	          return rs; 
	} 
	public ResultSet insertop(String sql) throws ClassNotFoundException, SQLException{ 
	     
	    Class.forName("com.mysql.jdbc.Driver"); 
	 
	     
	       Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cecs","root","1234"); 
	 
	       Statement   stmt = conn.createStatement();
	       System.out.println(sql);
	         stmt.executeUpdate(sql, Statement.RETURN_GENERATED_KEYS);
	         return stmt.getGeneratedKeys();
	} 
}
