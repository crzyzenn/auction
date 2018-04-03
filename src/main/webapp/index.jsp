<%@ page import="java.sql.*, one.one"%>

<%
one con = new one();
Statement stm = con.getStatement(); 
ResultSet rs = stm.executeQuery("SELECT * FROM users");
while(rs.next()){
	out.println("Username = " + rs.getString(2) + ", Password = " + rs.getString(3));
}
%>


<html>
<body>
<h2>Hello World! This is the auction site.</h2>
</body>
</html>
