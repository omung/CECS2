package com.cecs;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Groups {
	Jdbc_conn jd = new Jdbc_conn();

	public ResultSet getGroupData(String name, String characteristic) throws ClassNotFoundException, SQLException {
		String sql = "insert into groups(name,characteristic) values('" + name + "','" + characteristic + "')";
		ResultSet rs = jd.insertop(sql);
		return rs;
	}

	public boolean retrieveGroup(String name) throws ClassNotFoundException, SQLException {
		String str = "select * from groups where name='" + name + "'";
		ResultSet rs = jd.connection(str);

		if (rs.next()) {
			String str1 = "delete from groups where name='" + name + "'";
			jd.insertop(str1);
			return true;
		} else {
			return false;
		}
	}

	public ArrayList<GroupTableAttributes> retrieveGroupName() throws ClassNotFoundException, SQLException {

		String str = "select g_id, name from groups";
		ResultSet rs = jd.connection(str);
		ArrayList<GroupTableAttributes> arr = new ArrayList<GroupTableAttributes>();
		while (rs.next()) {
			GroupTableAttributes gta = new GroupTableAttributes();
			gta.setG_id(rs.getInt("g_id"));
			gta.setName(rs.getString("name"));
			arr.add(gta);

		}
		return arr;
	}
}
