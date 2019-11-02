<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="styles/login.css"/>
</head>

<body>

	<div class="header">
		<h1 id="font2">Speech2Teach Listening System</h1>
	</div>

	<div class="container-fluid">
		
		<div class="main col-xs-12 col-md-12 col-lg-12" align="center">
			<form action="login.php" method="post" target="_blank" id="myForm">
					<label id="font" for="usernameLogin">Username</label><br>
					<input type="text" name="usernameLogin" id="usernameLogin"><br>
					
					<label id="font" for="passLogin">Password</label><br>
					<input type="password" name="passLogin" id="passLogin"><br>
					
					<input type="submit" value="Log in" align="left">
					&nbsp; &nbsp;
					<input type="button" onclick="reset()" value="Reset" align="right">					
			</form>
			
			<p id = "font">Don't have an account? Create one!</p>
			<button onclick = "showHide()">Create account</button>
			
			<form id = "accountCreate" action="registration.php" method="post" target="_blank" id="myForm">
					<label id="font" for="username">Username</label><br>
					<input type="text" name="username" id="username"><br>
					
					<label id="font" for="pass1">Password</label><br>
					<input type="password" name="pass1" id="pass1"><br>
					
					<label id="font" for="pass2">Confirm Password</label><br>
					<input type="password" name="pass2" id="pass2"><br>
					
					<input type="submit" value="Create" align="left">
					&nbsp; &nbsp;
					<input type="button" onclick="reset()" value="Reset" align="right">					
			</form>	
			
			<script>
				function reset() {
					document.getElementById("myForm").reset();
				}
			</script>
			
			<script>
				function showHide() {
					var x = document.getElementById("accountCreate");
					if (x.style.display === "block") {
						x.style.display = "none";
					}
					else {
						x.style.display = "block";
					}
				}
			</script>
			
		</div>
	</div>

</body>
</html>