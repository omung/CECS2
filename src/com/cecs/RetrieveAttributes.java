package com.cecs;

import java.sql.ResultSet;
import java.sql.SQLException;

public class RetrieveAttributes {
Jdbc_conn jd= new Jdbc_conn();

	public ResultSet retrieveData(String name) throws ClassNotFoundException, SQLException{
		String str= "select * from attributes where name like '"+name+"%'";
				ResultSet rs= jd.connection(str);
		return rs;
	}
}
