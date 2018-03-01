$(document).ready(function(){
	
	var user = $('#user').html();
	location.hash = user;
	
	if(user != "" )
		$('#sidebar').attr("style","display:block");
	else
		$('#sidebar').attr("style","display:none");
	
	$('#message').attr("disabled","true");
	$('#sendMessage').attr("disabled","true");
	$('#project').html("");
});

window.onload= function() {
	$("#loading").remove();
};