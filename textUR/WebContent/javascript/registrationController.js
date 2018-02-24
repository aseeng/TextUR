function checkEnter(){
	document.getElementById('username').addEventListener('keypress', function check(event){
		var keycode = event.keyCode;
		if(keycode == '13') {
		    $('#button').click();   
		}
	});
	document.getElementById('email').addEventListener('keypress', function check(event){
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
	document.getElementById('retype_password').addEventListener('keypress', function check(event){
		var keycode = event.keyCode;
		if(keycode == '13') {
		    $('#button').click();   
		}
	});
	
};

function register(){
	var str = $('#email').val(); 
	var res = str.match(/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/g);
	if(res == null ){
		swal("Error", "Please insert a valid email!", "error")
		.then(() => {
			document.location = "register.html";
		});
		return;
	}
	$.ajax({
		url : 'register',
		data : {
			username : $('#username').val(),
			email : $('#email').val(),
			password : $('#password').val(),
			rePassword : $('#retype_password').val()
		},
		success : function(response) {
			if(response == "exist"){
				swal("Username not valid", "Username already used!", "error")
					.then(() => {
						document.location = "register.html";
					});
			}
			
			else if(response == "email_exist"){
				swal("E-mail not valid", "E-mail already used!", "error")
				.then(() =>{
					msg.innerHTML = "<b>select another e-mail</b>";
					msg.style.color = "red";
					$('#mail').focus();
				});
				
			}
			else if(response == "not_match"){

				swal("Password don't match", "Please retype the password!", "warning")
				.then(() =>{
					msg.innerHTML = "<b>Passwords don't match</b>";
					msg.style.color = "red";
					$('#password').focus();
				});
			}
			else document.location.href = "login.html";

		},
		type : 'POST',

	});
}