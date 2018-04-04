



<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Admin | Login</title>
	<link rel = 'stylesheet' media="screen" href = '../bs/css/bootstrap.css'>
	<script src="../bs/js/jquery.js"></script>
	<script type="text/javascript" src = '../bs/js/bootstrap.js'></script>	
	<script type="text/javascript" src = '../bs/js/notify.js'></script>		
	<script defer src="../bs/js/fontawesome-all.js"></script>

	<script type="text/javascript">
		
		$(document).ready(function(){
		    $('[data-toggle="tooltip"]').tooltip(); 

		    var a = 1; 
		    var b = 1; 
		    $("#add").on("click", function(){
				var uploadBar = "<tr><td></td><td><input type='file' id = 'uploadField' name='myImage" + (++a) + "' class='form-control'></td><td><button class = 'btn-sm btn-danger' onclick = 'return false;' id = 'remove'><span class = 'glyphicon glyphicon-remove'></span></button></td></div></tr>"; 
				$("#uploadDiv").append(uploadBar); 
			});

		    // Form validation
		    $('#login').on('click', function(event) {
		    	$.ajax({
	              type: 'POST',
	              // make sure you respect the same origin policy with this url:
	              // http://en.wikipedia.org/wiki/Same_origin_policy
	              url: 'loginResponse.jsp',
	              data: { 
	                  'username': $('#username').val(),
	                  'password': $('#password').val() 
	                  
	              },
	              success: function(msg){	                  
	            	  if (msg.length !== 12) {	                  	
	                	  window.location = 'dashboard.jsp'; 
	                  }
	                  else{
	                  	var content = '<div class="panel panel-danger"><div class="panel-heading"><h3 class="panel-title"><i class = "glyphicon glyphicon-remove-sign"></i> Username or password is incorrect</h3></div></div>'; 
	                  	$('.errorDiv').html(content);
	                  }  
	              }
	          }); 
		    });
		    // End of form validation
		    
		    
		    $('.container').on('keyup', function(){
		    	$('.errorDiv').html("");
		    }); 

		});
	</script>
</head>
<header>
	<div id = 'bar'>
		<h1>Auction</h1>					
	</div>		
</header>

<div class="jumbotron">
	<div class="container">
	<%
		if(session.getAttribute("user") == null || session.getAttribute("user") == ""){
			out.println("No users logged in"); 
		}
		else{
			out.println("Logged in as " + session.getAttribute("user"));
		}
		
		// out.println(session.getAttribute("user"));

			
	%>
		<h1><span class = 'glyphicon glyphicon-user'></span> Login</h1>
		<br>
		<div class = 'errorDiv'></div>
		
			<div class="form-group">
				<div class="input-group">

					<input type="text" class="form-control" placeholder="Username" id = 'username' name = 'username'>
					<div class="input-group-addon">					
						<span class = 'glyphicon glyphicon-user' style = 'cursor: pointer;'></span>
					</div>										
				</div>									
			</div>
			<div class = 'form-group'>
				<div class="input-group">
					
					<input type="password" class="form-control" placeholder="Password" id = 'password' name = 'password'>
					<div class="input-group-addon">					
						<i class="fas fa-key"></i>
					</div>										
				</div>				
			</div>

			<div class = 'form-group'>
				<button id="login" class="btn btn-primary">Login</button>
			</div>
			
	</div>
</div>

<?
}
else{	
	header('Location:dashboard.php');
}
?>