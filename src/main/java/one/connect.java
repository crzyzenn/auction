package one;

import com.matisse.*;
import java.sql.*;

public class connect {
	private Connection conn; 
	public connect() throws MtException, ClassNotFoundException, SQLException
	{
		Class.forName("com.matisse.sql.MtDriver");
		conn = DriverManager.getConnection("jdbc:mt://localhost/xxx");
	}

	
	public Statement getStatement() throws SQLException {
		Statement stm = conn.createStatement(); 
		return stm; 
	}
	
	
	public void closeConnection() throws SQLException {
		conn.close();
	}

}