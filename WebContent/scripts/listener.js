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
	  displayListenerMessage("No speech, try aagin")  
  }
}
 
//Start recognition
function startRecognition() {	
	Content += ' '; 	
	recognition.start();
}
 



//Parsing function
function parseMasterTranscript() {
	
	//TEMPORARILY CREATE FAKE CODEBOOK TO TEST
	
	
}

//recognition.onspeechend = function() {
//	displayListenerMessage("speech ended?");
//}	

