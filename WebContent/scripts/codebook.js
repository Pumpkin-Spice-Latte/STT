function sendHttpPostRequest(URL, params) {
        //Request
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                        if(this.responseText == "success") {
                                
                                alert("codebook successfully added!");
                                
                        } else {
                                
                                alert("Error processing request.");
                        } 
                }
        };
        xhttp.open("POST", URL, true);
        xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhttp.send(params);
}

function createCodebook() {
        var codebookWords = document.getElementById("codebookWords").innerHTML;
        var codebookName = document.getElementById("codebookName").value;
        var params = "codebookName=" + codebookName + "&codebookWords=" + codebookWords;
        sendHttpPostRequest("codebookServlet?event=addCodebook", params);
}

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