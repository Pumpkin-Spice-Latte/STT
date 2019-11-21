<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="scripts/codebook.js"></script>	
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
						<button id="submitCodebook" onclick="createCodebook()">Finish and Create</button>
					</div>					
				</div>
			</div>											
		</div>								
	</div>
</body>
</html>