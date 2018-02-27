function changePassword(){
	
	$.ajax({
		url: 'change',
		data: {
			type: "password"			
		}
	})
}

function changeEmail(){
	$.ajax({
		url: 'change',
		data: {
			type: "email"			
		},
		success: function(response){
			
		}
	})
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
					}
				}
			})
		}
	});
}