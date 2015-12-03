package com.cecs;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class FetchFromDatabase {

	Jdbc_conn conn = new Jdbc_conn();

	public ResultSet getUserAndPassword(String username, String password) throws ClassNotFoundException, SQLException {
		int en = 1;
		String user = "Select * from users where username= '" + username + "' and password='" + password
				+ "'and enabled='" + en + "'";

		ResultSet rs = conn.connection(user);
		return rs;
	}

	public ResultSet getUser(String username) throws ClassNotFoundException, SQLException {

		String user = "Select * from users where username= '" + username + "'";

		ResultSet rs = conn.connection(user);
		return rs;
	}

	public boolean updateUserInfo(String firstname, String lastname, String username, String password,
			String department, String institution, String city, String state, String country)
					throws ClassNotFoundException, SQLException {
		String user = "Update users set firstname='" + firstname + "', lastname='" + lastname + "', department='"
				+ department + "', institution='" + institution + "', city='" + city + "', state='" + state
				+ "', country='" + country + "' where username= '" + username + "' and password='" + password + "'";

		conn.insertop(user);
		return true;
	}

	public ArrayList<FormData> getUserData() throws ClassNotFoundException, SQLException {
		int en = 1;
		String str = "select * from users where enabled='" + en + "'";
		ArrayList<FormData> arr = new ArrayList<FormData>();
		ResultSet rs1 = conn.connection(str);

		while (rs1.next()) {
			FormData f1 = new FormData();

			f1.setFirstname(rs1.getString("firstName"));
			f1.setLastname(rs1.getString("lastName"));
			f1.setUsername(rs1.getString("username"));
			f1.setDepartment(rs1.getString("department"));
			f1.setInstitution(rs1.getString("institution"));
			f1.setCity(rs1.getString("city"));
			f1.setState(rs1.getString("state"));
			f1.setCountry(rs1.getString("country"));
			f1.setEnabled(rs1.getString("enabled"));

			arr.add(f1);
			System.out.println(f1.getFirstname());
			System.out.println(f1.getLastname());
			System.out.println(f1.getUsername());
			System.out.println(f1.getDepartment());
			System.out.println(f1.getInstitution());
			System.out.println(f1.getCity());
			System.out.println(f1.getState());
			System.out.println(f1.getCountry());

		}

		System.out.println(arr);

		return arr;

	}

}
