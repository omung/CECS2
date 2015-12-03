package com.cecs;

import java.sql.SQLException;

public class Register {
Jdbc_conn conn= new Jdbc_conn();
public boolean storeRegisterData(String firstname, String lastname, String username, String password, String department, String institution, String city, String state, String country) throws ClassNotFoundException, SQLException{
	int enabled=0;
	String sql= "insert into users(firstname, lastname, username, password, department, institution, city, state, country, enabled) values('"+firstname+"','"+lastname+"','"+username+"', '"+password+"', '"+department+"','"+institution+"', '"+city+"', '"+state+"','"+country+"','"+enabled+"')";
	conn.insertop(sql);
	return true;
}
}
