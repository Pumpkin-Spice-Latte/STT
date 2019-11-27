var ALERT_BUTTON_TEXT = "Ok";

if(document.getElementById) {
	window.alert = function(noticeMsg, txt) {
		createCustomAlert(noticeMsg, txt);
	}
}

function createCustomAlert(noticeMsg, txt) {
	var ALERT_TITLE = noticeMsg;
	d = document;

	if(d.getElementById("modalContainer")) return;

	mObj = d.getElementsByTagName("body")[0].appendChild(d.createElement("div"));
	mObj.id = "modalContainer";
	
	alertObj = mObj.appendChild(d.createElement("div"));
	alertObj.id = "alertBox";
	alertObj.className = "flex col-xs-12 col-md-12 col-lg-12";
	alertObj.style.visiblity="visible";

	h1 = alertObj.appendChild(d.createElement("h1"));
	h1.appendChild(d.createTextNode(ALERT_TITLE));

	msg = alertObj.appendChild(d.createElement("p"));
	//msg.appendChild(d.createTextNode(txt));
	msg.innerHTML = txt;

	btn = alertObj.appendChild(d.createElement("a"));
	btn.id = "closeBtn";
	btn.appendChild(d.createTextNode(ALERT_BUTTON_TEXT));
	btn.href = "#";
	btn.focus();
	btn.onclick = function() { removeCustomAlert();return false; }

	alertObj.style.display = "block";
	
}

function sessionAlert() {
	var ALERT_TITLE = "Session Name";
	d = document;

	if(d.getElementById("modalContainer")) return;

	mObj = d.getElementsByTagName("body")[0].appendChild(d.createElement("div"));
	mObj.id = "modalContainer";
	
	alertObj = mObj.appendChild(d.createElement("div"));
	alertObj.id = "alertBox";
	alertObj.className = "flex col-xs-12 col-md-12 col-lg-12";
	alertObj.style.visiblity="visible";
	alertObj.align = "center";

	h1 = alertObj.appendChild(d.createElement("h1"));
	h1.appendChild(d.createTextNode(ALERT_TITLE));

	msg = alertObj.appendChild(d.createElement("p"));
	msg.innerHTML = "Please provide a name for this session:";
	
	giveSessionName = alertObj.appendChild(d.createElement("input"));
	giveSessionName.id = "sessionNameInput";

	btn = alertObj.appendChild(d.createElement("a"));
	btn.id = "closeBtn";
	btn.appendChild(d.createTextNode(ALERT_BUTTON_TEXT));
	btn.href = "#";
	btn.focus();
	btn.onclick = function() { createNewSession();return false; }

	alertObj.style.display = "block";
	
}

function deleteCodebookAlert() {
	var ALERT_TITLE = "Hold up!";
	d = document;

	if(d.getElementById("modalContainer")) return;

	mObj = d.getElementsByTagName("body")[0].appendChild(d.createElement("div"));
	mObj.id = "modalContainer";
	
	alertObj = mObj.appendChild(d.createElement("div"));
	alertObj.id = "alertBox";
	alertObj.className = "flex col-xs-12 col-md-12 col-lg-12";
	alertObj.style.visiblity="visible";
	alertObj.align = "center";

	h1 = alertObj.appendChild(d.createElement("h1"));
	h1.appendChild(d.createTextNode(ALERT_TITLE));

	msg = alertObj.appendChild(d.createElement("p"));
	msg.innerHTML = "You sure you want to delete this session? This cannot be undone.";

	btnYes = alertObj.appendChild(d.createElement("a"));
	btnYes.id = "deleteSession";
	btnYes.appendChild(d.createTextNode("Yes"));
	btnYes.href = "#";
	btnYes.focus();
	btnYes.onclick = function() { removeCustomAlert();return false; }
	
	btnNo = alertObj.appendChild(d.createElement("a"));
	btnNo.id = "closeBtn";
	btnNo.appendChild(d.createTextNode("No"));
	btnNo.href = "#";
	btnNo.focus();
	btnNo.onclick = function() { removeCustomAlert();return false; }

	alertObj.style.display = "block";
}

function removeCustomAlert() {
	document.getElementsByTagName("body")[0].removeChild(document.getElementById("modalContainer"));
}