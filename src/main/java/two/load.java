package two;
import one.one;

import java.sql.*;

public class load {
	public static void main(String[] args) throws SQLException, ClassNotFoundException {
		one con = new one();
		Statement stm = con.getStatement(); 
		ResultSet rs = stm.executeQuery("SELECT * FROM users");
		while(rs.next()){
			System.out.println("Username = " + rs.getString(2) + ", Password = " + rs.getString(3));
		}
	}
}	
