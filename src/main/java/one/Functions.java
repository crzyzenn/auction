package one;

import java.sql.*; 

import com.matisse.MtException;

public class Functions {
	public String getWorkingPath() {
		String userDir = System.getProperty("user.dir");
		return userDir + "src\\main\\webapp"; 
	}
	// Unique key for each item	
	int key; 
	
	
	public int generateKey() throws MtException, ClassNotFoundException, SQLException {
		connect c = new connect();
		Statement stm = c.getStatement(); 
		ResultSet rs = stm.executeQuery("SELECT MAX(item_lot_number) FROM auction_items"); 
		if(rs.wasNull()) {
			key = 15238985; 
		}
		else {
			while(rs.next()) {
				key = Integer.parseInt(rs.getString(1)) + 1; 
			} 
		}
		c.closeConnection(); 
		return key; 
	}
}
