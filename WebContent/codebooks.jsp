<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="scripts/codebook.js"></script>	
		<script src="scripts/errormsg.js"></script>	
		<link rel="stylesheet" href="styles/login.css">
	</head>
	
	<body>
		<div class="container-fluid">
			<div class="title col-xs-12 col-md-12 col-lg-12" align="center">
				<h1 id="font2" align="center">Speech2Teach Listening System</h1>
			</div>
			<div class="main col-xs-12 col-md-12 col-lg-12" align="center">
				<div class="col-lg-12" align="center">
					<div class="col-xs-12 col-md-12 col-lg-3" align="center"></div>
					<div class="col-xs-12 col-md-12 col-lg-3" align="center">
						<button onclick="showView()" class="homeButton" align="center">
							<p>View Codebooks</p>
						</button>
					</div>
					<div class="col-xs-12 col-md-12 col-lg-3" align="center">
						<button onclick="showCreate()" class="homeButton" align="center">
							<p>Create Codebook</p>
						</button>
					</div>
					<div class="col-xs-12 col-md-12 col-lg-3" align="center"></div>
					<div id="codebookView" align="center" style="display: none; padding-top: 80px;">
						<br>
						<div id="codebookDropdown" align="center">
						</div><br>					
						<div id="codebookDetailsTable" align="center">
						</div>		
					</div>
					<div id="codebookCreate" align="center" style="display: none; padding-top: 80px;">
						<label id="font" for="codebookName">Codebook Name</label><br>
						<input type="text" name="codebookName" id="codebookName"><br>
						<div style="padding-top: 50px; padding-bottom: 25px;">
							<div class="col-lg-3"></div>
							<div class="col-lg-2">
								<label id="font" for="wordOrPhrase">Phrase?</label><br>
								<select name="wordOrPhrase" id="phraseSelect" onchange="showIfPhrase(this.options[this.selectedIndex].value)">
									<option value="no">No</option>
									<option value="yes">Yes</option>
								</select>
							</div>
							<div class="col-lg-2">
								<label id="font" for="codebookWord">Word</label><br>
								<input type="text" name="codebookWord" id="codebookWord"><br>
								<div id="isPhrase" style="display: none;">
									<label id="font" for="codebookEndWord">End Word</label><br>
									<input type="text" name="codebookEndWord" id="codebookEndWord"><br>
								</div>
							</div>
							<div class="col-lg-2" style="padding-top: 25px;">
								<button onClick="saveWord()">Add to Codebook</button><br>
							</div>
							<div class="col-lg-3"></div>
						</div>
						<div class="col-lg-12" style="padding-top: 50px;">
							<p id="font2">Current Words</p>
							<p class="homeButton" id="codebookWords"></p><br>
						</div>
						<div class="col-lg-12" style="padding-top: 20px;">
							<button id="submitCodebook" onclick="createCodebook()">Finish and Create</button>
						</div>					
					</div>
				</div>
				<div class="col-lg-12">
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