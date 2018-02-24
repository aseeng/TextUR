function checkEnter(){
	
	document.getElementById('username').addEventListener('keypress', function check(event){
		var keycode = event.keyCode;
		if(keycode == '13') {
		    $('#button').click();   
		}
	});
	document.getElementById('password').addEventListener('keypress', function check(event){
		var keycode = event.keyCode;
		if(keycode == '13') {
		    $('#button').click();   
		}
	});
	
};


function login(){
	$.ajax({
		url : 'login',
		data : {
			username : $('#username').val(),
			password : $('#password').val()
		},
		success : function(response) {
			if(response == "password"){
				swal("Error", "Wrong password!", "error")
					.then(() => {
						
						$('#password').val("")
						$('#password').css("border-color","red")
					});
			}
			else if(response == "user"){
				swal("Error","User not found!", "error")
					.then(() => {
						$('#username').val("")
						$('#password').val("")
						
					});
			} else {
				document.location.href = "page?action=homepage";
			}
		},
		type : 'GET',
	});
}

function logout()
{
	$.ajax({
		url : 'logout',
		success : function(response) {
			document.location.href = "index.jsp";
		},
		error : function()
		{
			alert("logout error");
		},
		type : 'GET',
	});	
}
function facebookLogout(){
 	  alert("facebook signOut");
     FB.logout();
//     function(response){
//         document.getElementById('logout').style.display = 'none';
//         document.getElementById('profile').style.display = 'none';
//         document.getElementById('feed').style.display = 'none';
//         document.getElementById('fb-btn').style.display = 'block';
//         document.getElementById('heading').style.display = 'block';
//     });
   }
function signOutGoogle() {
	   alert("google signOut");
		var auth2 = gapi.auth2.getAuthInstance();
	    auth2.signOut().then(function () {
	      console.log('User signed out.');
	    });
	  }