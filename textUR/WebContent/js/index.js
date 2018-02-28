$(document).ready(function(){
	
	var user = $('#user').html();
	location.hash = user;
	
	if(user != "" )
		$('#sidebar').attr("style","display:block");
	else
		$('#sidebar').attr("style","display:none");
	$('#project').html("");
});

window.onload= function() {
	$("#loading").remove();
};