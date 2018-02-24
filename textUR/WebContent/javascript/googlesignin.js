function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
	  $.ajax({
			url : 'loginAPI',
			data : {
				email : profile.getEmail()
			},
			success : function(responseText) {
				if(responseText == "register")
				{
					alert("register");
					swal("Please choose your username:", {
						content: "input",
						})
						.then((value) => {
							if (value != null && value != "") {
								$.ajax({
									url: 'loginAPI',
									data : {
										email : profile.getEmail(),
										name :  value
									},
									error : function(){ 
										alert("error");
									},
									type : 'POST'
								});
							}
						}).then(() => {
							document.location.href = "home.jsp";								
						})
				}	
				else
					document.location.href = "home.jsp";
			},
			type : 'GET'
	});
}

function signOutGoogle() {
   alert("google signOut");
	var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      console.log('User signed out.');
    });
  }