<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script>var contextPath = "${pageContext.request.contextPath}";</script>
	<script src="scripts/login.js"></script>	
	<link rel="stylesheet" href="styles/login.css">
<style>

	#font {
		font-family:"Lucida Sans Unicode";
		color:white;
	}
	
	a:link {
	color: #bfbfbf;
	}
	a:visited {
		color: #c4d9ff;
	}
	a:hover {
		color: white;
	}
	a:active {
		color: yellow;
	}

	.flex {
	display: flex;
	justify-content: center;
	}
	
	.header, .footer {
		padding: 2em;
		text-align: center;
		background-image: url("images/banner.png");
		background-size: 300px 150px;
		background-color: #121e63;
	}

	.menu {
		float: left;
		text-align: center;
	}

	.menuItem {
		border: 1px solid black;
		background-image: url("images/menu.png");
		background-color: #4a60db;
		padding: 10px;
		margin-top: 30px;
		margin-left: 75px;
		margin-right: 75px;
	}
	
	.footerItem {
		border: 1px solid black;
		background-image: url("images/menu.png");
		background-color: #4a60db;
		padding: 10px;
		margin-top: 30px;
		width: 300px;
	}

	.main {
	float: left;
	margin-top:200px;
	margin-bottom:200px;
	padding: 10px 20px;
	border: 1px solid black;
	background-image: url("images/menu.png");
	background-color: #3c50b2;
	}

	body {
		background-image: url("images/hex.png");
		background-color: #121e63;
	}
	
	.message {
		color:red;
	}

</style>
</head>

<body>

	<div class="header">
		<h1 id="font">Account Creation Simulator</h1>
	</div>
	
	<div class="container-fluid">		
		<div class="main col-xs-12 col-md-12 col-lg-12" align="center">			
			<span id="message" class="message"></span><br><br>
			<label id="font" for="username">Username</label><br>
			<input type="text" name="username" id="username"><br>			
			<label id="font" for="pass">Password</label><br>
			<input type="password" name="password" id="password"><br><br>			
			<input id="btnLogin" value="Login" type="button" align="left" style="visibility:visible; display:inline-block" onclick="loginToAccount()">
			<input id="btnCreate" value="Create" type="button" align="left" style="visibility:hidden; display:none" onclick="createAccount()">
			<input id="btnCancel" value="Cancel" type="button" align="left" style="visibility:hidden; display:none" onclick="cancelCreateAccount()"><br><br>	
			<a id="anchorCreateAccount" align="left" onclick="prepareToCreateAccount()" style="visibility:visible; display:inline-block">Create Account</a>														
		</div>
	</div>

</body>
</html>