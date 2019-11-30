function deleteCodebook() {
	//Remove alert
	removeCustomAlert();

	//Get params
	var params = "codebookID=" + document.getElementById("currentCodebookID").value;

        //Request
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                        if(this.responseText == "success") {                                
				alert("Success", "codebook successfully deleted!");  
				writeCodebookDropdown();
				document.getElementById("codebookDetailsTable").innerHTML = "";

                        } else {                                
                                alert("Error", "Error processing request.");
                        } 
                }
        };
        xhttp.open("POST", "codebookServlet?event=deleteCodebook", true);
        xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhttp.send(params);
}

function writeCodebookDropdown() {
	//Request	
	var xmlHttp = new XMLHttpRequest();
	xmlHttp.onreadystatechange = function() { 
		if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
			document.getElementById("codebookDropdown").innerHTML = this.responseText;
		}            
	}
	xmlHttp.open("GET", "codebookServlet?event=writeCodebookDropdown", true); 
	xmlHttp.send(null);
}

function writeCodebookDetails(codebookID) {	
	//Request
	var xmlHttp = new XMLHttpRequest();
	xmlHttp.onreadystatechange = function() { 
		if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
			document.getElementById("codebookDetailsTable").innerHTML = this.responseText;
		}            
	}	
	xmlHttp.open("GET", "codebookServlet?event=writeCodebookDetailsTable&codebookID=" + codebookID, true);        
        xmlHttp.send(null);
}

function createCodebook() {
	var codebookWords = document.getElementById("codebookWords").innerHTML;
	var codebookName = document.getElementById("codebookName").value;
		
	if (codebookWords === "" || codebookName === "") {
		alert("Error", "One of the fields is empty!");
	}
	else {
		//Get params
		var params = "codebookName=" + codebookName + "&codebookWords=" + codebookWords;		

		//Request
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				if(this.responseText == "success") {
					
					alert("Success", "codebook successfully added!");
					document.getElementById("codebookName").value = "";
					document.getElementById("codebookWord").value = "";
					document.getElementById("codebookEndWord").value = "";
					document.getElementById("codebookWords").innerHTML = "";
					document.getElementById("codebookName").focus();
					
				} else {
					
					alert("Error", "Error processing request.");
				} 
			}
		};
		xhttp.open("POST", "codebookServlet?event=addCodebook", true);
		xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhttp.send(params);
	}
}

function showView() {
	var x = document.getElementById("codebookView");
	var y = document.getElementById("codebookCreate");
	if (y.style.display === "block") {
		y.style.display = "none";
	}
	if (x.style.display === "none") {
		writeCodebookDropdown();
		document.getElementById("codebookDetailsTable").innerHTML = "";
		x.style.display = "block";
	}
	else {
		x.style.display = "none";
	}
}

function showCreate() {	
	var x = document.getElementById("codebookCreate");
	var y = document.getElementById("codebookView");
	if (y.style.display === "block") {
		y.style.display = "none";
	}
	if (x.style.display === "none") {
		x.style.display = "block";
		document.getElementById("codebookName").focus();
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
	document.getElementById("codebookWord").focus();
}

function saveWord(select) {
	var a = document.getElementById("phraseSelect");
	var x = document.getElementById("codebookWord");
	var y = document.getElementById("codebookEndWord");
	var z = document.getElementById("codebookWords");
	var letters = /^[a-z]+$/;

	if (a.options[a.selectedIndex].value == "yes") {
		if (x.value.match(letters) && y.value.match(letters)) {
			z.innerHTML += x.value + " ... " + y.value + ", ";
			x.value ="";
			y.value = "";
			document.getElementById("codebookWord").focus();
		}
		else {
        		alert("Error", "Words can only be lowercase letters.");
		}
	}
	else {
		if (x.value.match(letters)) {
			z.innerHTML += x.value + ", ";
			x.value ="";
			document.getElementById("codebookWord").focus();
		}
		else {
        		alert("Error", "Words can only be lowercase letters.");
		}
	}

}