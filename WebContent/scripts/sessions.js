function writeSessionDropdown() {
	//Request	
	var xmlHttp = new XMLHttpRequest();
	xmlHttp.onreadystatechange = function() { 
		if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
                        if (this.responseText != "error")
                                document.getElementById("divSessionDropdown").innerHTML = this.responseText;
                        else    
                                alert("Error loading session dropdown");
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
                                alert("Error loading session details");
		} 
	}
	xmlHttp.open("GET", "sessionServlet?event=writeSessionDetailsTable&sessionID=" + sessionID, true); 
	xmlHttp.send(null);
}