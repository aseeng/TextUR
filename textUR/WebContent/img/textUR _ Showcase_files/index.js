$(document).ready(function(){
	
	var user = $('#user').html();
	location.hash = user;
	
	if(user != "" )
	{
		$('#sidebar').attr("style","display:block");
		$('#aside').attr("style","display:block");
	}
	else
	{
		$('#sidebar').attr("style","display:none");
		$('#aside').attr("style","display:none");
	}
	$('#project').html("");
});