package com.cecs;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class FetchAttributesOfSpecifiedGroup {
Jdbc_conn jd= new Jdbc_conn();

public ArrayList<GroupsAndChar> getAttributes(String g_id) throws SQLException, ClassNotFoundException{
	String str= "select m.*, gnc.combine_id from attributes m INNER JOIN groupattributes gnc ON(m._mid=gnc._mid) where gnc.g_id='"+g_id+"'";
	ResultSet rs= jd.connection(str);
ArrayList<GroupsAndChar> arr= new ArrayList<GroupsAndChar>();
	while(rs.next()){
		GroupsAndChar gac= new GroupsAndChar();
		gac.setCharName(rs.getString("name"));
		gac.setCombine_id(rs.getInt("combine_id"));
		gac.setInputType(rs.getString("inputType"));
		arr.add(gac);
		System.out.println(rs.getString("name"));
	}
	return arr;
}
	
public void storeCharasteristicValues(String username, String combine_id, String chvalue) throws ClassNotFoundException, SQLException
{
	String user= "select u_id from users where username='"+username+"'";
	ResultSet rs= jd.connection(user);
	String u_id="";
if(rs.next()){	u_id= rs.getString("u_id");}
	String str="insert into usergroupattributes(combine_id,u_id, value) values('"+combine_id+"','"+u_id+"','"+chvalue+"')";
	jd.insertop(str);
}	

}
