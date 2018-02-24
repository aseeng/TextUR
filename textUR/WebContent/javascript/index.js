window.onload = function(){
	
	$('#empty').attr("onclick", "createProject(\"empty\")");
	$('#hello').attr("onclick", "createProject(\"hello\")");

	var user = $('#user').html();
	location.hash = user;
	
	if(user != "")
		$('#sidebar').attr("style","display:block");
	else
		$('#sidebar').attr("style","display:none");
}