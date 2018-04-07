package two;
import one.connect;

import java.sql.*;

public class load {
	public static void main(String[] args) throws SQLException, ClassNotFoundException {
		connect con = new connect();
		Statement stm = con.getStatement(); 
		ResultSet rs = stm.executeQuery("SELECT * FROM users");
		while(rs.next()){
			System.out.println("Username = " + rs.getString(2) + ", Password = " + rs.getString(3));
		}
		
		con.closeConnection();
	}
}	
