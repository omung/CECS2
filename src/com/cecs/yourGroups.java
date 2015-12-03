package com.cecs;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class yourGroups {
	Jdbc_conn jd = new Jdbc_conn();
	String query;
	String u_id;
	int user_id;
	int g_id;

	public ArrayList<UserGroupAttributesTableData> getYourGroups(String username)
			throws ClassNotFoundException, SQLException {
		String u_id = "select u_id from users where username='" + username + "'";
		ResultSet rs = jd.connection(u_id);
		if (rs.next()) {
			user_id = rs.getInt("u_id");
		}

		query = "select distinct ga.g_id, ga._mid, uga.value, uga.combine_id from groupattributes ga join usergroupattributes uga on ga.combine_id=uga.combine_id where uga.u_id='"
				+ user_id + "'";

		ResultSet rs2 = jd.connection(query);
		ArrayList<UserGroupAttributesTableData> list = new ArrayList<UserGroupAttributesTableData>();

		while (rs2.next()) {
			UserGroupAttributesTableData uga = new UserGroupAttributesTableData();

			g_id = rs2.getInt("g_id");
			int _mid = rs2.getInt("_mid");
			String Stt = "select name from groups where g_id='" + g_id + "'";
			String ttt = "select name from attributes where _mid='" + _mid + "'";
			String value = rs2.getString("value");

			ResultSet rs3 = jd.connection(Stt);
			rs3.next();
			String temp = rs3.getString("name");
			ResultSet rs4 = jd.connection(ttt);
			rs4.next();
			String temp1 = rs4.getString("name");
			int temp3 = rs2.getInt("combine_id");
			uga.setValue(value);
			uga.setGroupname(temp);
			uga.setAttributename(temp1);
			uga.setCombine_id(temp3);
			list.add(uga);
			System.out.println(list.get(0));

		}

		return list;
	}

	public void updateUserGroupsAttributesValues(String username, String combine_id, String value)
			throws ClassNotFoundException, SQLException {

		System.out.println("combine_id is:"+ combine_id );
		u_id = "Select u_id from users where username='" + username + "'";
		ResultSet rs= jd.connection(u_id);
		while(rs.next()){
		String user_id= rs.getString("u_id");
		query= "Update usergroupattributes set value='"+value+"' where combine_id='"+combine_id+"'&& u_id='"+user_id+"'";
		}
		jd.insertop(query);
	}

}
