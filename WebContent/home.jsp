<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>	
	<script src="scripts/login.js"></script>	
	<link rel="stylesheet" href="styles/login.css">
</head>

<body>
	<div class="container-fluid">
		<div class="title col-xs-12 col-md-12 col-lg-12" align="center">
			<h1 id="font2" align="center">Speech2Teach Listening System</h1>
		</div>
		<div class="main flex col-xs-12 col-md-12 col-lg-12" align="center" style="padding-bottom: 40px;">
			<div class="homeButton col-lg-4">
			<a href="listener.jsp" target="_blank">View Past Sessions</a></div>
			<div class="homeButton col-lg-4" style="margin-left: 70px; margin-right: 70px">
			<a href="listenerServlet?event=init" target="_blank">Start Recording</a></div>
			<div class="homeButton col-lg-4">
			<a href="codebookServlet" target="_blank">Manage Codebooks</a></div>														
		</div>								
	</div>

</body>
</html>