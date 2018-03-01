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
		swal("Email not valid", "Please insert a valid email!", "error")
		.then(() => {
			$('#email').css("border-color","red");
			$('#email').css("border-style","solid");
			$('#email').focus();
			$('#email').val("");
			$('#password').val("");
			$('#retype_password').val("");
		});
		return;
	}
	
	var password = $('#password').val();
	var confirm = $('#retype_password').val();
	if(confirm != password){
		swal("Password don't match", "Please retype the password!", "warning")
		.then(() =>{
			$('#password').css("border-color","red");
			$('#password').css("border-style","solid");
			$('#retype_password').css("border-color","red");
			$('#retype_password').css("border-style","solid");
			$('#password').val("");
			$('#retype_password').val("");
		});
		return;
	}
	
	$.ajax({
		url : 'register',
		data : {
			username : $('#username').val(),
			email : $('#email').val(),
			password : $('#password').val(),
			image: $('#image').val()
		},
		success : function(response) {
			if(response == "exist"){
				swal("Username not valid", "Username already used!", "error")
					.then(() => {
						
						$('#username').val("");
						$('#username').css("border-color","red");
						$('#username').css("border-style","solid");
						$('#username').focus();
						$('#password').val("");
						$('#retype_password').val("");
						$('#image').val("");
					});
			}
			
			else if(response == "email_exist"){
				swal("E-mail not valid", "E-mail already used!", "error")
				.then(() =>{
					
					$('#email').val("");
					$('#email').css("border-color","red");
					$('#email').css("border-style","solid");
					$('#email').focus();					
					$('#password').val("");
					$('#retype_password').val("");
					$('#image').val("");
				});
				
			}
			else
				document.location.href = "page?action=login";
		},
		type : 'POST',
	});
}

function reset()
{
	$('.Input').removeAttr("style", null);
}
