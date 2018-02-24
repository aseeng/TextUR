var CLIENT_ID = '203419167287-v6omsdlt4t5d6ekv23ubgg776kcvfrss.apps.googleusercontent.com';
var API_KEY = 'AIzaSyBhmZF_ZMWM5gBa4Gf6fb0IYhZF1yRdBUY';

var DISCOVERY_DOCS = [ "https://www.googleapis.com/discovery/v1/apis/calendar/v3/rest" ];

var SCOPES = "https://www.googleapis.com/auth/calendar";

var authorizeButton = document.getElementById('authorize-button');
var signoutButton = document.getElementById('signout-button');

function handleClientLoad() {
	gapi.load('client:auth2', initClient);
}

function initClient() {
	gapi.client.init({
		apiKey : API_KEY,
		clientId : CLIENT_ID,
		discoveryDocs : DISCOVERY_DOCS,
		scope : SCOPES
	}).then(function() {
		gapi.auth2.getAuthInstance().isSignedIn.listen(updateSigninStatus);

		updateSigninStatus(gapi.auth2.getAuthInstance().isSignedIn.get());
		authorizeButton.onclick = handleAuthClick;
		signoutButton.onclick = handleSignoutClick;
	});
}

function updateSigninStatus(isSignedIn) {
	if (isSignedIn) {
		authorizeButton.style.display = 'none';
		signoutButton.style.display = 'block';
		listUpcomingEvents();
	} else {
		authorizeButton.style.display = 'block';
		signoutButton.style.display = 'none';
	}
}

function handleAuthClick(event) {
	gapi.auth2.getAuthInstance().signIn();
}

function handleSignoutClick(event) {
	gapi.auth2.getAuthInstance().signOut();
}

function appendPre(message) {
	var pre = document.getElementById('calendar');
	var textContent = document.createTextNode(message + '\n');
	pre.appendChild(textContent);
}

function listUpcomingEvents() {
	gapi.client.calendar.events.list({
		'calendarId': 'primary',
        'timeMin': (new Date()).toISOString(),
        'showDeleted': false,
        'singleEvents': true,
        'maxResults': 10,
        'orderBy': 'startTime'
	}).then(function(response) {
		var events = response.result.items;
		appendPre('Upcoming events:');

		if (events.length > 0) {
			for (i = 0; i < events.length; i++) {
				var event = events[i];
				var when = event.start.dateTime;
				if (!when) {
					when = event.start.date;
				}
				appendPre(event.summary + ' (' + when + ')')
			}
		} else {
			appendPre('No upcoming events found.');
		}
	});
}

function createEvent(){
	
	var summary = document.createElement("input");
	summary.setAttribute("id","summary");
	summary.placeholder = "Summary";
	
	var location = document.createElement("input");
	location.setAttribute("id","location");
	location.placeholder = "Location";
	
	var description = document.createElement("input");
	description.setAttribute("id","description");
	description.placeholder = "Description";
	
	var dateStart = document.createElement("input");
	dateStart.setAttribute("id","start");
	dateStart.type="date";
	
	var dateEnd = document.createElement("input");
	dateEnd.setAttribute("id","end");
	dateEnd.type="date";
	
	var div = document.createElement("div");
	
	div.appendChild(summary);
	div.appendChild(document.createElement("br"));
	div.appendChild(document.createElement("br"));
	div.appendChild(location);
	div.appendChild(document.createElement("br"));
	div.appendChild(document.createElement("br"));
	div.appendChild(description);
	div.appendChild(document.createElement("br"));
	div.appendChild(document.createElement("br"));
	div.appendChild(dateStart);
	div.appendChild(dateEnd);
	
	return div;
}
	

function insertEvent() {
	
	var div = createEvent();
	alert(div.innerHTML);

	swal({
		text: 'Insert a new event.',
		content: div,
		button: {
		    text: "ok!"
		  },
		}).then(	()=>{
			
			var event={

					
					'summary' :	$("#summary").val(),
					'location' : $("#location").val(),
					'description' : $("#description").val(),
					'start' : {
						'dateTime' : $("#start").val()+'T09:00:00-07:00',
					},
					'end' : {
						'dateTime' : $("#end").val()+'T09:00:00-07:00',
					},
				};
			
				var request = gapi.client.calendar.events.insert({
				'calendarId' : 'primary',
				'resource' : event
				});

				request.execute(function(event) {
					appendPre('Event created: ' + event.htmlLink);
					console.log(event);
				});
		});			

}