<%@ page import="java.sql.*,one.connect"%>

<%
	one.connect con = new one.connect();
Statement stm = con.getStatement(); 
ResultSet rs = stm.executeQuery("SELECT * FROM users");
while(rs.next()){
	out.println("Username = " + rs.getString(2) + ", Password = " + rs.getString(3));
}

con.closeConnection() ;
%>


<html>
<head>
	<title>Auction | Home</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<link rel = 'stylesheet' media="screen" href = 'bs/css/bootstrap.css'>

	<script src="bs/js/jquery.js"></script>
	<script defer src="bs/js/fontawesome-all.js"></script>
	<script type="text/javascript" src = 'bs/js/bootstrap.js'></script>		
	<script type="text/javascript" src = 'bs/js/notify.js'></script>

</head>

<body>
	<div class="jumbotron">
		<div class="container">
			<h1>Login</h1>
			<form action="#" method="POST" role="form">
				<div class = "input-group">
					<div class="form-group">
						<input type="text" class="form-control" id="" placeholder="Username">
					</div>	
				</div>
				<div class = "input-group">
					<div class="form-group">
						<input type="text" class="form-control" id="" placeholder="Password">
					</div>	
				</div>
				<button type="submit" class="btn btn-primary">Submit</button>
			</form>
		</div>
	</div>
</body>
</html>
