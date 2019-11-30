function writeSessionDropdown() {
	//Request	
	var xmlHttp = new XMLHttpRequest();
	xmlHttp.onreadystatechange = function() { 
		if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
                        if (this.responseText != "error")
                                document.getElementById("divSessionDropdown").innerHTML = this.responseText;
                        else    
                                alert("Error", "Error loading session dropdown.");
		} 
	}
	xmlHttp.open("GET", "sessionServlet?event=writeSessionDropdown", true); 
	xmlHttp.send(null);
}

function writeSessionDetailsTable(sessionID) {
	//Request	
	var xmlHttp = new XMLHttpRequest();
	xmlHttp.onreadystatechange = function() { 
		if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
                        if (this.responseText != "error")
                                document.getElementById("divSessionDetailsTable").innerHTML = this.responseText;
                        else    
                                alert("Error", "Error loading session details.");
		} 
	}
	xmlHttp.open("GET", "sessionServlet?event=writeSessionDetailsTable&sessionID=" + sessionID, true); 
	xmlHttp.send(null);
}


function deleteSession() {
	//Remove alert
	removeCustomAlert();

	//params
	var params = "sessionID=" + document.getElementById("currentSessionID").value;

	//Request
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                        if(this.responseText == "success") {
                                
				alert("Success", "Codebook successfully deleted!");
				document.getElementById("divSessionDetailsTable").innerHTML = "";
				writeSessionDropdown();				
                                
                        } else {
                                
                                alert("Error", "Error processing request.");
                        } 
                }
        };
        xhttp.open("POST", "sessionServlet?event=deleteSession", true);
        xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhttp.send(params);
}