$(document).ready(function() { 
	$.ajax({  
		url: 'checkLogin',
		data : {
			page : document.location.href
		},
		success: function(response){				
			if(response=="false"){

				swal("You are not logged in!", "You will be redirected to the login page", "warning")
				.then(() => {
					document.location.href = "page?action=login";
				});
			}
		},
		type: 'GET'
	});
})

function openProfile(user)
{
	$.ajax({
		url: 'page',
		data : {
			action : "openProfile",
			name : user
		},
		type: 'GET',
		success : function(response){
			document.location.href = "page?action=profile";
		}
	})
}