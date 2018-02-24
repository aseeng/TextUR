var sessionUser ="";
function sendMessage() {
	
	if($('#text').val() == "" || $('#text').val() == " ")
		return;
	
	$.ajax({
		url : 'load',
		data : {
			text : $('#text').val()
		},
		success : function() {
			$('#text').val("");
			olist = $('#chat_zone').val();
			olist.scrollTop = olist.scrollHeight;
		},
		type : 'POST'
	});
}

function load(user) {
	sessionUser = user;
	$.ajax({
		url : 'load',

		success : function(response) {
			
			$("#chat_zone").html("");
			
			$.each(JSON.parse(response), function(idx, obj) {
				var div;
				
				if(user == obj.user.username)
					div = $('<div></div>').addClass("direct-chat-msg right");
				else
					div = $('<div></div>').addClass("direct-chat-msg left");
				
				var div1 = $('<div></div>').addClass("direct-chat-info clearfix");
				var span;
				var span1;
				var div3;
				
				if(user == obj.user.username){
					span = $('<span></span>').addClass("direct-chat-name pull-right").text(obj.user.username);
					span1 = $('<span></span>').addClass("direct-chat-timestamp pull-left").text(obj.date.substr(0,19));
					div3 = $('<div></div>').addClass("direct-chat-text pull-right").text(obj.text);
				}
				else{
					span = $('<span></span>').addClass("direct-chat-name pull-left").text(obj.user.username);
					span1 = $('<span></span>').addClass("direct-chat-timestamp pull-right").text(obj.date.substr(0,19));
					div3 = $('<div></div>').addClass("direct-chat-text pull-left").text(obj.text);
				}
				
				div1.append(span);
				div1.append(span1);
				div.append(div1);
				div.append(div3);
				$('#chat_zone').append(div);
			});
			
			olist = $('#chat_zone');
			olist.scrollTop = olist.scrollHeight;
		},
		type : 'GET'
	});
}

if($("#chat_zone")[0] != undefined)
{
	var scrollHeight = $("#chat_zone")[0].scrollHeight;
	$("#chat_zone").scrollTop(scrollHeight);
}	

$('#chat_zone').scroll(function() { 
	if ($('#chat_zone').scrollTop() == 0) {
		$.ajax({ 
			url : 'loadOld',
			
			success : function(response) {
				var tmp="";
				
				if(response!=null && response != "") {
									
					$.each(JSON.parse(response), function(idx, obj) {	
						var div;
						
						if(sessionUser == obj.user.username)
							div = $('<div></div>').addClass("direct-chat-msg right");
						else
							div = $('<div></div>').addClass("direct-chat-msg left");
						
						var div1 = $('<div></div>').addClass("direct-chat-info clearfix");
						var span;
						var span1;
						var div3;
						
						if(user == obj.user.username){
							span = $('<span></span>').addClass("direct-chat-name pull-right").text(obj.user.username);
							span1 = $('<span></span>').addClass("direct-chat-timestamp pull-left").text(obj.date.substr(0,19));
							div3 = $('<div></div>').addClass("direct-chat-text pull-right").text(obj.text);
						}
						else{
							span = $('<span></span>').addClass("direct-chat-name pull-left").text(obj.user.username);
							span1 = $('<span></span>').addClass("direct-chat-timestamp pull-right").text(obj.date.substr(0,19));
							div3 = $('<div></div>').addClass("direct-chat-text pull-left").text(obj.text);
						}
						
						div1.append(span);
						div1.append(span1);
						div.append(div1);
						div.append(div3);
						$('#chat_zone').append(div);
					});

					$("#chat_zone").prepend(tmp);
					$('#chat_zone').scrollTop(30); 
				}
			}, 
			type : 'GET'
		}); 
	}
});
 
