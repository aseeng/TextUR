function changePassword(){
	
	var div = document.createElement('div')
		div.classList = "box-body ";
	var oldPassword = document.createElement('input');
		oldPassword.id = "old";
		oldPassword.classList = "form-control change";
		oldPassword.type = "password";
		oldPassword.placeholder = "insert your password";
	
	var newPassword = document.createElement('input');
		newPassword.id = "new";
		newPassword.classList = "form-control change";
		newPassword.type = "password";
		oldPassword.name = "newPassword";
		newPassword.placeholder = "insert new password";
	
	var confirmPassword = document.createElement('input');
		confirmPassword.id = "confirm";
		confirmPassword.classList = "form-control change";
		confirmPassword.type = "password";
		oldPassword.name = "confirmPassword";
		confirmPassword.placeholder = "confirm your password";
		
	div.append(oldPassword);
	div.append(newPassword);
	div.append(confirmPassword);
	
	swal({
		content: div,
	}).then(() => {
		var password = document.querySelector('#new').value;
		var confirm = document.querySelector('#confirm').value;
		if(password != confirm)
		{
			$('#new').css("border-color","red");
			$('#confirm').css("border-color","red");
		}
		if (value != null && value != "") {
			$.ajax({
				url: 'change',
				data: {
					type: "password"			
				}
			})
		}
	});
}

function changeEmail(){
	swal("Please enter new mail:", {
		content: "input",
	}).then((value) => {
		var res = value.match(/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/g);
		if(res == null ){
			input.css("border-color","red");
			input.focus();
			return;
		}
		if (value != null && value != "") {
			$.ajax({
				url: 'change',
				data: {
					type: "mail",
					name: value
				},
				type: 'POST',
				success: function(response){
					if(response == "exist")
						swal("Error", "There is already an user with the same mail", "error").then(()=>{
							changeEmail();
						});
					else {
						swal("Success", "Email changed successfully!", "success");
					}
				}
			})
		}
	});
}

function changeUsername(){
	swal("Please enter new name:", {
		content: "input",
	}).then((value) => {
		if (value != null && value != "") {
			$.ajax({
				url: 'change',
				data: {
					type: "username",
					name: value
				},
				type: 'POST',
				success: function(response){
					if(response == "exist")
						swal("Error", "There is already an user with the same name", "error").then(()=>{
							changeUsername();
						});
					else {
						swal("Success", "Username changed successfully!", "success");
						$('#profile').html(value);
						location.hash = value;
						$('#user').html(value);
					}
				}
			})
		}
	});
}

