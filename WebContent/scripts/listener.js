/*
 * The Chrome API interacts with Google’s Speech Recognition API
 */


//Globals
var SpeechRecognition = window.webkitSpeechRecognition;  
var recognition = new SpeechRecognition(); 
var Textbox = $('#textbox');
var instructions = $('instructions'); 
var Content = '';

var tempCount = 0;


var masterTranscript = "";

//Set property
recognition.continuous = true;

//Display message
function displayListenerMessage(message) {
	document.getElementById("message").innerHTML = message;
}

//On result 
recognition.onresult = function(event) { 
  var current = event.resultIndex; 
  var transcript = event.results[current][0].transcript; 
    Content += transcript;
    masterTranscript += transcript;
    Textbox.val(Content);  
};
 
//On start
recognition.onstart = function() { 
  displayListenerMessage("Voice recog started");
}

//On end
recognition.onend = function() {
	displayListenerMessage('Speech recognition service disconnected');
	recognition.start();
}

//On error
recognition.onerror = function(event) {
  if(event.error == 'no-speech') {
	  displayListenerMessage("No speech, try again")  
  }
}
 
//Start recognition
function startRecognition() {
	x = document.getElementById("codebookDropdown");
	if (x.value == -1) {
		alert("Error", "Please select a codebook.");
	}
	else {
		document.getElementById("btnStart").style.display = "none";
		x.disabled = "true";
		x.style.backgroundColor = "#cccccc";
		Content += ' '; 	
		recognition.start();
	}
}

//Stop recognition
function stopRecognition() {
	recognition.stop();
}
 

//Parsing function
function parseMasterTranscript(jsonString) {
	//Get array of codebookDetail objects
	var tcBook = JSON.parse(jsonString);
	masterTranscript = "blue yellow red blue blue red red grab a brush and paint";
	
	//Create Countbook to be sent to server
	var masterCountbook = [];
	for(var j = 0; j < tcBook.length; j++) {
		var tempCountbook = { detailID: tcBook[j].detailID, count : 0 };
		masterCountbook.push(tempCountbook);
	}

	//var countBook = [];
	//Test Code for code book
	// var testArr = ["cause", "effect", "science"];
	// var tcBook = [];
	// for(var i = 0; i < testArr.length; i++)
	// {
	// 	var codeWord = { str: testArr[i], count: 0, endStr: ""};
	// 	tcBook.push[codeWord];
	// }
	
	//Master Transcript check against code book
	var MT = masterTranscript.split(" "); 
	for(var i = 0; i < MT.length; i++) //iterate through length of MT
	{
		for(var j = 0; j < tcBook.length; j++) //Test each element of MT against cBook
		{
			if(MT[i] == tcBook[j].startWord) //If there is a match
			{
				if(tcBook[j].endWord) //If this cBook entry is a phrase
				{
					for(var h = i + 1; h < i + 10; h++) //Check the next 10 words 
					{
						if(MT[h] == tcBook[j].endWord) //Check if ending keyword is here.
						{
							//tcBook[j].count += 1; //if so, increment count.
							//Iterate through mastercountbook to find correct detailID
							for(var z = 0; z < masterCountbook.length; z++) {
								if (masterCountbook[z].detailID == tcBook[j].detailID)
									masterCountbook[z].count += 1;								
							}
							break;							
						}
					}
				}
				else
				{					
					for(var z = 0; z < masterCountbook.length; z++) {
						if (masterCountbook[z].detailID == tcBook[j].detailID)
							masterCountbook[z].count += 1;								
					}
				}
			}
		}
	}
	console.log(tcBook);
	console.log(masterCountbook);
}


function writeCodebookDropdown() {
	//Request	
	var xmlHttp = new XMLHttpRequest();
	xmlHttp.onreadystatechange = function() { 
		if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
			document.getElementById("divCodebookDropdown").innerHTML = this.responseText;
		}            
	}
	xmlHttp.open("GET", "listenerServlet?event=writeCodebookDropdown", true); 
	xmlHttp.send(null);
}



function createNewSession() {
	//Get sessionName
	var sessionName = document.getElementById("sessionNameInput").value;
	removeCustomAlert();

	//Get codebookID
	var codebookID = document.getElementById("codebookDropdown").value;

	//Create params
	var params = "codebookID=" + codebookID + "&sessionName=" + sessionName;

        //Request
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
			if (this.responseText == "success") {
				alert("created!");

				//Get codebook details
				getCodebook();

			} else {
				alert("failure");
			}
                }
        };
        xhttp.open("POST", "listenerServlet?event=createNewSession", true);
        xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhttp.send(params);
}


function getCodebook() {
	//Get codebookID
	var codebookID = document.getElementById("codebookDropdown").value;

	//Request	
	var xmlHttp = new XMLHttpRequest();
	xmlHttp.onreadystatechange = function() { 
		if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
			if (this.responseText != "error") {
				var jsonResponse = this.responseText;
				parseMasterTranscript(jsonResponse);
			} else {
				alert("Error retrieving codebook");
			}
		}            
	}
	xmlHttp.open("GET", "listenerServlet?event=getCodebook&codebookID=" + codebookID, true); 
	xmlHttp.send(null);
}