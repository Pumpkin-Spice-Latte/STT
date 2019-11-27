<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>	
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
        <meta http-equiv="Pragma" content="no-cache" />
        <meta http-equiv="Expires" content="0" />
        <link rel="stylesheet" href="styles/login.css">
		<script src="scripts/errormsg.js"></script>	
        <title>listener</title>                   
        
    </head>

	<body onload="writeCodebookDropdown()">
		<div class="container-fluid">
			<div class="title col-xs-12 col-md-12 col-lg-12" align="center">
				<h1 id="font2" align="center">Speech2Teach Listening System</h1>
			</div>
			<div class="main col-xs-12 col-md-12 col-lg-12" align="center">
			
				<div id="divCodebookDropdown"></div><br>
				<div class="input">
					<textarea class="textInput" id="textbox" rows="15" cols="30"></textarea>
				</div>         
				<button id="btnStart" onclick="startRecognition()" title="Start">Start</button>
				<button id="btnStop" onClick="sessionAlert()" title="Stop">Stop</button>
				<p id="message">Press the Start button</p>
				
			    
	
				<!-- scripts loaded here in template -->   
				<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
				<script src="scripts/listener.js"></script>     	
				<!------------------------------------->   
	
		    </div>
		</div>
	</body>
</html>