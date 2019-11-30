function displayMessage(message) {
	document.getElementById("message").innerHTML = message;
}

function removeMessage() {
	document.getElementById("message").innerHTML = "";
}

function prepareToCreateAccount() {
	displayMessage("Please enter new credentials below");	
	document.getElementById("btnCancel").style.display = "inline-block";
	document.getElementById("btnCancel").style.visibility = "";	
	document.getElementById("btnCreate").style.display = "inline-block";
	document.getElementById("btnCreate").style.visibility = "";	
	document.getElementById("btnLogin").style.display = "none";
	document.getElementById("btnLogin").style.visibility = "hidden";	
	document.getElementById("anchorCreateAccount").style.visibility = "hidden";
	document.getElementById("username").focus();
}

function cancelCreateAccount() {
	document.getElementById("btnCancel").style.display = "none";
	document.getElementById("btnCancel").style.visibility = "hidden";
	document.getElementById("btnCreate").style.display = "none";
	document.getElementById("btnCreate").style.visibility = "hidden";	
	document.getElementById("btnLogin").style.display = "inline-block";
	document.getElementById("btnLogin").style.visibility = "";	
	document.getElementById("anchorCreateAccount").style.visibility = "";
	document.getElementById("username").focus();
	removeMessage();
}

function sendHttpPostRequest(URL) {
	//Get username and password
	var username = document.getElementById("username").value;
	var password = document.getElementById("password").value;
	
	//Build params
	var params = "username=" + username + "&password=" + password;
	
	//Request
	var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
    	if (this.readyState == 4 && this.status == 200) {
    		if(this.responseText == "success") {
    			
    			//Redirect to home page
    			window.location.href = "home.jsp"
    			
    		} else {
    			
    			//Alert user
			displayMessage("Error logging in");
			document.getElementById("username").focus();
    		} 
	    }
	};
	xhttp.open("POST", URL, true);
    xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhttp.send(params);
}

function createAccount() {	
	var isValid = true;
	var username = document.getElementById("username").value;
	var password = document.getElementById("password").value;
	if (username.length > 32) {
		alert("Error", "Username cannot be longer than 32 characters.");	
		isValid = false;	
	}
	if (password.length > 64) {
		alert("Error", "Password cannot be longer than 64 characters.");	
		isValid = false;	
	}
	if (isValid)
		sendHttpPostRequest("loginServlet?event=create");
}

function loginToAccount() {
	sendHttpPostRequest("loginServlet?event=login");
}














