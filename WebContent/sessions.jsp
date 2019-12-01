<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>	
		<script src="scripts/sessions.js"></script>	
		<script src="scripts/errormsg.js"></script>	
		<link rel="stylesheet" href="styles/login.css">
	</head>
	
	<body onload="writeSessionDropdown()">
		<div class="container-fluid">
			<div class="title col-xs-12 col-md-12 col-lg-12" align="center">
				<h1 id="font2" align="center">Speech2Teach Listening System</h1>
			</div>
			<div class="main col-xs-12 col-md-12 col-lg-12" align="center">
				<div class="col-lg-12" align="center">
			        <div id="divSessionDropdown" align="center" style="padding-bottom: 40px;">																
			        </div>
			        <div id="divSessionDetailsTable" align="center">																
			        </div>
		        </div>
		        <div class="col-lg-12" align="center">
			        <div class="col-xs-12 col-md-12 col-lg-3" align="center"></div>
			        <div class="col-xs-12 col-md-12 col-lg-3" align="center">
				        <div class="homeButton" align="center">
							<a href="home.jsp">Back to Homepage</a>
						</div>
					</div>
					<div class="col-xs-12 col-md-12 col-lg-3" align="center">
				    	<div class="homeButton" align="center">
							<a href="loginServlet?event=logout">Log Out</a>
				    	</div>
				    </div>
				    <div class="col-xs-12 col-md-12 col-lg-3" align="center"></div>
				</div>
		    </div>
		</div>
</body>

</html>