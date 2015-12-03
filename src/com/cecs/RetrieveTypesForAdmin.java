package com.cecs;

import java.sql.ResultSet;
import java.sql.SQLException;

public class RetrieveTypesForAdmin {
Jdbc_conn jd= new Jdbc_conn();

public ResultSet retrieveData() throws ClassNotFoundException, SQLException{
	String str= "Select * from types";
	ResultSet rs= jd.connection(str);

	return rs;

			
	
}
}

