<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
        <meta http-equiv="Pragma" content="no-cache" />
        <meta http-equiv="Expires" content="0" />
        <title>listener</title>   
        
        <script>var contextPath = "${pageContext.request.contextPath}";</script>
        
    </head>

	<body>
		<div class="mywebapp"> 
	        <div class="input">
	            <textarea id="textbox" rows="6"></textarea>
           </div>         
           <button id="btnStart" onclick="startRecognition()" title="Start">Start</button>
           <p id="message">Press the Start button</p>
	    </div>		
	    
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	    <script src="scripts/listener.js"></script>     	    
	    
	</body>
</html>