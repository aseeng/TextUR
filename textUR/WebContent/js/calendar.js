var CLIENT_ID = '203419167287-v6omsdlt4t5d6ekv23ubgg776kcvfrss.apps.googleusercontent.com';
var API_KEY = 'AIzaSyBhmZF_ZMWM5gBa4Gf6fb0IYhZF1yRdBUY';

var DISCOVERY_DOCS = [ "https://www.googleapis.com/discovery/v1/apis/calendar/v3/rest" ];

var SCOPES = "https://www.googleapis.com/auth/calendar";

function handleClientLoad() {
	
	$('#sidebarButton').removeAttr("onclick",null);
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
		
		gapi.auth2.getAuthInstance().signIn();
	});
}

function updateSigninStatus(isSignedIn) {

	if (isSignedIn){
		listUpcomingEvents();

		var button = $('<button></button').addClass("btn btn-danger createEvent center").attr({
			id: "btnCreateEvent",
			onclick: "insertEvent();"
		});
		button.html("Create Event");

		$('#calendarButton').append(button);
	}
}

function appendPre(message) {
	var pre = document.getElementById('calendar');
	var textContent = document.createTextNode(message + '\n');
	pre.appendChild(textContent);
}

function listUpcomingEvents() {
	
	gapi.client.calendar.events.list({
		'calendarId': 'primary',
	}).then(function(response) {
		var events = response.result.items;
		loadCalendar(events);
	});
}

function createEvent(){

	var div = document.createElement("div");
		div.setAttribute("id", "create");
	
	var summary = document.createElement("select");
	summary.classList = "js-example-basic-single choose";
	summary.setAttribute("name","state");
	summary.setAttribute("id","summary");
	summary.placeholder = "Summary";
	
	var option1=document.createElement("option");
	option1.setAttribute("value","conference");
	option1.text='Conference';
	
	var option2=document.createElement("option");
	option2.setAttribute("value","reunion");
	option2.text='Reunion';
	
	var option3=document.createElement("option");
	option3.setAttribute("value","deadline");
	option3.text='Deadline';
	
	var option4=document.createElement("option");
	option4.setAttribute("value","other");
	option4.text='Other';
	
	summary.appendChild(option1);
	summary.appendChild(option2);
	summary.appendChild(option3);
	summary.appendChild(option4);

	var location = document.createElement("input");
	location.classList = "choose";
	location.setAttribute("id","location");
	location.placeholder = "Location";
	
	var description = document.createElement("input");
	description.classList = "choose";
	description.setAttribute("id","description");
	description.placeholder = "Description";
	
	var dateStart = document.createElement("input");
	dateStart.classList = "choose";
	dateStart.setAttribute("id","start");
	dateStart.type="date";

	var time = document.createElement("input");
	time.classList = "choose";
	time.setAttribute("id","time");
	time.type="time";
	
	div.appendChild(summary);
	div.appendChild(location);
	div.appendChild(description);
	div.appendChild(dateStart);
	div.appendChild(time);
	
	return div;
}

function insertEvent() {
	
	var div = createEvent();

	swal({
		text: 'Insert a new event',
		content: div,
		button: {
		    text: "create"
		  },
		}).then(	(value)=>{
			
			if(value){	
				
				var event={
					'summary' :	$("#summary").val(),
					'location' : $("#location").val(),
					'description' : $("#description").val(),
					'start' : {
						'dateTime' : $("#start").val()+"T"+$("#time").val()+":00+00:00",
					},
					'end' : {
						'dateTime' : $("#start").val()+"T"+$("#time").val()+":00+00:00",
					},
				};
				
				var request = gapi.client.calendar.events.insert({
					'calendarId' : 'primary',
					'resource' : event
				});

				request.execute(function() {
					swal("event created","", "success").then(()=>{
						listUpcomingEvents();
					});
				});
			}
		});		
}
