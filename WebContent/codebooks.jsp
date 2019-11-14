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
</head>

<body>
	<div class="container-fluid">
		<div class="title col-xs-12 col-md-12 col-lg-12" align="center">
			<h1 id="font2" align="center">Speech2Teach Listening System</h1>
		</div>
		<div class="main flex col-xs-12 col-md-12 col-lg-12" align="center" style="padding-bottom: 40px;">
			<div class="homeButton col-lg-6" style="margin-right: 80px;">
				<button onclick="showEdit()">Edit Codebooks</button>
			</div>
			<div class="homeButton col-lg-6" style="margin-left: 80px;">
				<button onclick="showCreate()">Create Codebook</button>
			</div>
			<div>
				<div id="codebookEdit" align="center" style="display: none;">
					<p id="font2">test</p>
				</div>
				<div id="codebookCreate" align="center" style="display: none;">
					<p id="font2">test2</p>
				</div>
			</div>											
		</div>								
	</div>

<script>
function showEdit() {
	var x = document.getElementById("codebookEdit");
	var y = document.getElementById("codebookCreate");
	if (y.style.display === "block") {
		y.style.display = "none";
	}
	if (x.style.display === "none") {
		x.style.display = "block";
	}
	else {
		x.style.display = "none";
	}
}

function showCreate() {
	var x = document.getElementById("codebookCreate");
	var y = document.getElementById("codebookEdit");
	if (y.style.display === "block") {
		y.style.display = "none";
	}
	if (x.style.display === "none") {
		x.style.display = "block";
	}
	else {
		x.style.display = "none";
	}
}
</script>

</body>
</html>