<%@ page import="java.sql.*"%>
<%
	Class.forName("com.matisse.sql.MtDriver");
	Connection conn = DriverManager.getConnection("jdbc:mt://localhost/xxx");
	Statement stm = conn.createStatement(); 
	ResultSet rs = stm.executeQuery("SELECT * FROM users") ;
	while(rs.next()){
		out.println("Username = " + rs.getString(2) + ", Password = " + rs.getString(3));
	}
	
	
%>
