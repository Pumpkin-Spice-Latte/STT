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
	tempCount += 1;
  displayListenerMessage("Voice recog started" + tempCount)
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
	Content += ' '; 	
	recognition.start();
}

//Stop recognition
function stopRecognition() {
	recognition.stop();
}
 

//Parsing function
function parseMasterTranscript() {

	//End recording
	stopRecognition();

	//Get codebook (JSON)
	getCodebook();

	//Convert JSON to js object

	
	//Test Code for code book
	var testArr = ["cause", "effect", "science"];
	var tcBook = [];
	for(var i = 0; i < testArr.length; i++)
	{
		var codeWord = { str: testArr[i], count: 0, endStr: ""};
		tcBook.push[codeWord];
	}
	
	//Master Transcript check against code book
	var MT = masterTranscript.split(" "); 
	for(var i = 0; i < MT.length; i++) //iterate through length of MT
	{
		for(var j = 0; j < tcBook.length; j++) //Test each element of MT against cBook
		{
			if(MT[i] == tcBook[j].str) //If there is a match
			{
				if(tcBook[j].endStr) //If this cBook entry is a phrase
				{
					for(var h = i + 1; h < i + 10; h++) //Check the next 10 words 
					{
						if(MT[h] == tcBook[j].endStr) //Check if ending keyword is here.
						{
							tcBook[j].count += 1; //if so, increment count.
						}
					}
				}
				else
				{
					tcBook[j].count += 1; //If not phrase, go ahead and increment count.
				}
			}
		}
	}
	
	//Display code book before we get db functionality?
	
	
}




function getCodebook() {
	//Get params
	var params = "test=test";


        //Request
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                		sessionAlert();
                }
        };
        xhttp.open("POST", "listenerServlet?event=getCodebook", true);
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
	xmlHttp.open("GET", "listenerServlet?event=writeCodebookDropdown", true); 
	xmlHttp.send(null);
}