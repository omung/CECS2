package com.cecs;

import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginService {

	FetchFromDatabase fd = new FetchFromDatabase();
	public boolean validateLogin(String username, String password) throws ClassNotFoundException, SQLException{

		ResultSet rs1= fd.getUserAndPassword(username, password);
		if(rs1.next()){
			
				return true;
			
		}//while ends here
		return false;
	}
}
