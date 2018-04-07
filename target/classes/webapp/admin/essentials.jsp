<%@ page import = "java.io.File, java.nio.file.Paths" %>

<%
	String url = request.getRequestURI();
%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>
		<%
			if(url.equals("/auction/admin/dashboard.jsp")){
				out.print("Admin | Dashboard"); 	
			}
			else if(url.equals("/auction/admin/addItem.jsp")){
				out.print("Admin | Add Item"); 	
			}
		%>
	</title>
	<link rel = 'stylesheet' media="screen" href = '../bs/css/bootstrap.css'>
	<script src="../bs/js/jquery.js"></script>
	<script type="text/javascript" src = '../bs/js/bootstrap.js'></script>	
	<script type="text/javascript" src = '../bs/js/notify.js'></script>		

</head>
<header>
	<div id = 'bar'>
		
		<img src="C:\upload\logo.jpg" style = 'width:10%;'>						
		

		<div id = 'logStatus'>
			Admin
			<a href = "loginResponse.php?logout" class = 'gray' data-toggle = 'tooltip' data-placement = 'bottom' title = 'Log-out'><span class = 'glyphicon glyphicon-log-out'></span></a>
		</div>			
		

	</div>		
</header>
<body>		
	
	
			
			
	

	<div id = 'left-container'>
			
		<ul class="myNav">
			<% 
				if(url.equals("/auction/admin/dashboard.jsp")){
					out.println("<a class = 'myLink' href='dashboard.jsp'><li class = 'active'>Dashboard</li></a>"); 	
					out.println("<a class = 'myLink' href='addItem.jsp'><li>Add Item</li></a>");						
				}
				else if(url.equals("/auction/admin/addItem.jsp")){
					out.println("<a class = 'myLink' href='dashboard.jsp'><li class = 'active'>Dashboard</li></a>"); 	
					out.println("<a class = 'myLink' href='addItem.jsp'><li>Add Item</li></a>");						
				}
			%>
						
			
		</ul>				
	</div>
	<%
				//String filePath = getServletContext().getRealPath("/") + "admin\\Images\\logo.jpg";
	
							%>