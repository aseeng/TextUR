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

		var button = $('<button></button').addClass("btn btn-primary center createEvent").attr({
			id: "btnCreateEvent",
			onclick: "insertEvent();"
		});
		button.html("Create Event");

		$('#createEventSpan').append(button);
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


	var summary = document.createElement("select");
	summary.classList = "js-example-basic-single";
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
	location.setAttribute("id","location");
	location.placeholder = "Location";
	
	var description = document.createElement("input");
	description.setAttribute("id","description");
	description.placeholder = "Description";
	
	var dateStart = document.createElement("input");
	dateStart.setAttribute("id","start");
	dateStart.type="date";

	var hour = document.createElement("select");
	hour.setAttribute("id","hour");
	for(i=0; i<24; i++){	
		
		var op=document.createElement("option");
		
		if(i<10){
			op.setAttribute("value","0"+i);
			op.text="0"+i;
		}
		else{
			op.setAttribute("value",i);
			op.text=i;
		}
		hour.appendChild(op);
	}
	
	
	var min = document.createElement("select");
	min.setAttribute("id","min");
	for(i=0; i<60; i++){	
		
		var op=document.createElement("option");
		
		if(i<10){
			op.setAttribute("value","0"+i);
			op.text="0"+i;
		}
		else{
			op.setAttribute("value",i);
			op.text=i;
		}
		min.appendChild(op);
	}

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
	div.appendChild(document.createElement("br"));
	div.appendChild(document.createElement("br"));
	div.appendChild(hour);
	div.appendChild(min);
	
	return div;
}
	

function insertEvent() {
	
	var div = createEvent();

	swal({
		text: 'Insert a new event.',
		content: div,
		button: {
		    text: "ok!"
		  },
		}).then(	(value)=>{
			
			if(value){	
				
				var event={
					'summary' :	$("#summary").val(),
					'location' : $("#location").val(),
					'description' : $("#description").val(),
					'start' : {
						'dateTime' : $("#start").val()+"T"+$("#hour").val()+":"+$('#min').val()+":00+00:00",
					},
					'end' : {
						'dateTime' : $("#start").val()+"T"+$("#hour").val()+":"+$('#min').val()+":00+00:00",
					},
				};
				
				var request = gapi.client.calendar.events.insert({
					'calendarId' : 'primary',
					'resource' : event
				});

				request.execute(function() {
					listUpcomingEvents();
				});
			}
		});		
}
