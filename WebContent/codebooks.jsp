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
			<div>
				<button onclick="showEdit()" class="homeButton col-lg-6" style="margin-right: 80px;">
					<p>Edit Codebooks</p>
				</button>
				<button onclick="showCreate()" class="homeButton col-lg-6" style="margin-left: 80px;">
					<p>Create Codebook</p>
				</button>
				<div id="codebookEdit" align="center" style="display: none;">
					<p id="font2">test</p>
				</div>
				<div id="codebookCreate" align="center" style="display: none; padding-top: 150px;">
					<label id="font" for="codebookName">Codebook Name</label><br>
					<input type="text" name="codebookName" id="codebookName"><br>
					<div style="padding-top: 50px; padding-bottom: 25px;">
						<div class="col-lg-4">
							<label id="font" for="wordOrPhrase">Phrase?</label><br>
							<select name="wordOrPhrase" id="phraseSelect" onchange="showIfPhrase(this.options[this.selectedIndex].value)">
								<option value="no">No</option>
								<option value="yes">Yes</option>
							</select>
						</div>
						<div class="col-lg-4">
							<label id="font" for="codebookWord">Word</label><br>
							<input type="text" name="codebookWord" id="codebookWord"><br>
							<div id="isPhrase" style="display: none;">
								<label id="font" for="codebookEndWord">End Word</label><br>
								<input type="text" name="codebookEndWord" id="codebookEndWord"><br>
							</div>
						</div>
						<div class="col-lg-4" style="padding-top: 25px;">
							<button onClick="saveWord()">Add to Codebook</button><br>
						</div><br>
					</div>
					<div style="padding-top: 50px;">
						<p id="font2">Current Words</p>
						<p class="homeButton" id="codebookWords"></p><br>
					</div>
					<div style="padding-top: 20px;">
						<button id="submitCodebook">Finish and Create</button>
					</div>
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

function showIfPhrase(select) {
	var x = document.getElementById("isPhrase");
	if (select == "yes") {
		x.style.display = "block";
	}
	else {
		x.style.display = "none";
	}
}

function saveWord(select) {
	var a = document.getElementById("phraseSelect");
	var x = document.getElementById("codebookWord");
	var y = document.getElementById("codebookEndWord");
	var z = document.getElementById("codebookWords");

	if (a.options[a.selectedIndex].value == "yes") {
		z.innerHTML += x.value + " ... " + y.value + ", ";
		x.value ="";
		y.value = "";
	}
	else {
		z.innerHTML += x.value + ", ";
		x.value ="";
	}

}
</script>

</body>
</html>