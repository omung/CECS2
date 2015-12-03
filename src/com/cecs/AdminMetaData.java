package com.cecs;

import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminMetaData {
Jdbc_conn jd= new Jdbc_conn();



public boolean checkData(String characteristic) throws ClassNotFoundException, SQLException{
	String str="select * from attributes where name='"+characteristic+"'";
	ResultSet rs= jd.connection(str);
	
	if(rs.next()){
		return false;
	}
	return true;
}
public boolean checkGroupName(String characteristic) throws ClassNotFoundException, SQLException{
	
	String str="select * from groups where name='"+characteristic+"'";
	ResultSet rs= jd.connection(str);
	if(rs.next()){
		return false;
	}
	return true;
}

public boolean checkRegName(String characteristic) throws ClassNotFoundException, SQLException{
	
	String str="select * from users where username='"+characteristic+"'";
	ResultSet rs= jd.connection(str);
	if(rs.next()){
		return false;
	}
	return true;
}


public boolean storeAttributes(String name, String inputType, String min, String max, String minD, String maxD, String length, String date, String date1, String mon, String str2) throws ClassNotFoundException, SQLException{
	
	String str= "insert into attributes(name, inputType, min, max, minD, maxD, length, date, date1, mon, list) values('"+name+"', '"+inputType+"', '"+min+"', '"+max+"', '"+minD+"', '"+maxD+"', '"+length+"', '"+date+"', '"+date1+"', '"+mon+"','"+str2+"')";
	 jd.insertop(str);
	
	return true;
	
	
}
}
