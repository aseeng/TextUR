function changePassword(){

	var password = $('#newPasswordInput').val();
	var confirm = $('#confirmPasswordInput').val();
	var oldPassword = $('#oldPasswordInput').val();
	
	if(password != confirm)
	{
		swal("Error", "Passwords not match!", "error");
		$('#newPasswordInput').css("border-color","red");
		$('#newPasswordInput').css("border-style", "solid");
		$('#confirmPasswordInput').css("border-color","red");
		$('#confirmPasswordInput').css("border-style", "solid");
		return;
	}
	
	$.ajax({
		url: 'change',
		data: {
			type: "password",
			oldPassword: oldPassword,
			name: password
		},
		type: 'POST',
		success: function(response){
			if(response == "exist")
				swal("Your password is wrong", "Insert correct password", "error").then(()=>{
					$('#oldPasswordInput').css("border-color","red");
					$('#oldPasswordInput').css("border-style", "solid");
				});
			else {
				swal("Success", "Password changed successfully!", "success").then(()=>{
					document.location.href = "page?action=profile";
				});
			}
		}
	})
}

function changeEmail(){
	var value = $('#mailInput').val();
	var res = value.match(/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/g);
	if(res == null ){
		swal("Error", "Email not valid!", "error");
		$('#mailInput').css("border-color","red");
		$('#mailInput').css("border-style", "solid");
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
					swal("Success", "Email changed successfully!", "success").then(()=>{
						document.location.href = "page?action=profile";
					});
				}
			}
		})
	}
}

function changeUsername(){
	var value = $('#usernameInput').val();
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
					swal("Success", "Username changed successfully!", "success").then(()=>{
						$('#profile').html(value);
						$('#user').html(value);
						document.location.href = "page?action=profile";
					});
				}
			}
		})
	}
}

function changeImage(){
	var value = $('#imageInput').val();
	if (value != null && value != "") {
		$.ajax({
			url: 'change',
			data: {
				type: "image",
				name: value
			},
			type: 'POST',
			success: function(response){
				swal("Success", "Image changed successfully!", "success").then(()=>{
					document.location.href = "page?action=profile";
				});
			}
		})
	}
}


function options(){
	var h3 = $('<h3></h3>').addClass("site-heading text-center");
	var h3Span = $('<span></span>').addClass("site-heading-lower").html("Options");
	h3.append(h3Span);
	
	var emailDiv = $('<div></div>').addClass("col-md-6"); 
	var emailBoxDiv = $('<div></div>').addClass("box box-danger collapsed-box");
	var emailBoxBorder = $('<div></div>').addClass("box-header with-border");
	var emailTitle = $('<h3></h3>').addClass("box-title").html("change email ");
	var emailCollapseDiv = $('<div></div>').addClass("box-tools pull-right");
	var emailCollapse = $('<button></button>').addClass("btn btn-box-tool").attr("data-widget", "collapse");
	var emailIcon = $('<i></i>').addClass("fa fa-plus");
	
	emailCollapse.append(emailIcon);
	emailCollapseDiv.append(emailCollapse);
	emailBoxBorder.append(emailTitle);
	emailBoxBorder.append(emailCollapseDiv);
	emailBoxDiv.append(emailBoxBorder);
	
	var emailBody = $('<div></div>').addClass("box-body");
	var emailInput = $('<input>').addClass("col-xs-12 Input");
		emailInput.attr({
			autofocus: "true",
			onfocus: "reset();",
			id: "mailInput",
			placeholder: "insert new mail"
		});

		var emailSave = $('<button></button>').addClass("btn btn-danger save").html("save");
			emailSave.attr("onclick","changeEmail()");
	emailBody.append(emailInput);
	emailBody.append(emailSave);
	emailBoxDiv.append(emailBody);
	emailDiv.append(emailBoxDiv);

	var usernameDiv = $('<div></div>').addClass("col-md-6");
	var usernameBoxDiv = $('<div></div>').addClass("box box-danger collapsed-box");
	var usernameBoxBorder = $('<div></div>').addClass("box-header with-border");
	var usernameTitle = $('<h3></h3>').addClass("box-title").html("change username ");
	var usernameCollapseDiv = $('<div></div>').addClass("box-tools pull-right");
	var usernameCollapse = $('<button></button>').addClass("btn btn-box-tool").attr("data-widget", "collapse");
	var usernameIcon = $('<i></i>').addClass("fa fa-plus");
	
	usernameCollapse.append(usernameIcon);
	usernameCollapseDiv.append(usernameCollapse);
	usernameBoxBorder.append(usernameTitle);
	usernameBoxBorder.append(usernameCollapseDiv);
	usernameBoxDiv.append(usernameBoxBorder);

	var usernameBody = $('<div></div>').addClass("box-body");
	var usernameInput = $('<input>').addClass("col-xs-12 Input");
		usernameInput.attr({
			autofocus: "true",
			onfocus: "reset();",
			id: "usernameInput",
			placeholder: "insert new username"
		});
	var usernameSave = $('<button></button>').addClass("btn btn-danger save").html("save");
		usernameSave.attr("onclick","changeUsername()");
	usernameBody.append(usernameInput);
	usernameBody.append(usernameSave);
	usernameBoxDiv.append(usernameBody);
	usernameDiv.append(usernameBoxDiv);
	
	var passwordDiv = $('<div></div>').addClass("col-md-6");
	var passwordBoxDiv = $('<div></div>').addClass("box box-danger collapsed-box");
	var passwordBoxBorder = $('<div></div>').addClass("box-header with-border");
	var passwordTitle = $('<h3></h3>').addClass("box-title").html("change password ");
	var passwordCollapseDiv = $('<div></div>').addClass("box-tools pull-right");
	var passwordCollapse = $('<button></button>').addClass("btn btn-box-tool").attr("data-widget", "collapse");
	var passwordIcon = $('<i></i>').addClass("fa fa-plus");
	
	passwordCollapse.append(passwordIcon);
	passwordCollapseDiv.append(passwordCollapse);
	passwordBoxBorder.append(passwordTitle);
	passwordBoxBorder.append(passwordCollapseDiv);
	passwordBoxDiv.append(passwordBoxBorder);

	var passwordBody = $('<div></div>').addClass("box-body");
	var oldPasswordInput = $('<input>').addClass("col-xs-12 Input");
		oldPasswordInput.attr({
			type: "password",
			autofocus: "true",
			onfocus: "reset();",
			id: "oldPasswordInput",
			placeholder: "insert old password"
		});
	var newPasswordInput = $('<input>').addClass("col-xs-12 Input");
		newPasswordInput.attr({
			type: "password",
			autofocus: "true",
			onfocus: "reset();",
			id: "newPasswordInput",
			placeholder: "insert new password"
		});
	var confirmPasswordInput = $('<input>').addClass("col-xs-12 Input");
		confirmPasswordInput.attr({
			type: "password",
			autofocus: "true",
			onfocus: "reset();",
			id: "confirmPasswordInput",
			placeholder: "insert your password"
		});
	var passwordSave = $('<button></button>').addClass("btn btn-danger save").html("save");
		passwordSave.attr("onclick","changePassword()");
	
	passwordBody.append(oldPasswordInput);
	passwordBody.append(newPasswordInput);
	passwordBody.append(confirmPasswordInput);
	passwordBody.append(passwordSave);
	passwordBoxDiv.append(passwordBody);
	passwordDiv.append(passwordBoxDiv);
	
	var imageDiv = $('<div></div>').addClass("col-md-6");
	var imageBoxDiv = $('<div></div>').addClass("box box-danger collapsed-box");
	var imageBoxBorder = $('<div></div>').addClass("box-header with-border");
	var imageTitle = $('<h3></h3>').addClass("box-title").html("change image");
	var imageCollapseDiv = $('<div></div>').addClass("box-tools pull-right");
	var imageCollapse = $('<button></button>').addClass("btn btn-box-tool").attr("data-widget", "collapse");
	var imageIcon = $('<i></i>').addClass("fa fa-plus");
	
	imageCollapse.append(imageIcon);
	imageCollapseDiv.append(imageCollapse);
	imageBoxBorder.append(imageTitle);
	imageBoxBorder.append(imageCollapseDiv);
	imageBoxDiv.append(imageBoxBorder);

	var imageBody = $('<div></div>').addClass("box-body");
	var imageInput = $('<input>').addClass("col-xs-12 Input");
		imageInput.attr({
			autofocus: "true",
			onfocus: "reset();",
			id: "imageInput",
			placeholder: "insert image url"
		});
	var imageSave = $('<button></button>').addClass("btn btn-danger save").html("save");
	imageSave.attr("onclick","changeImage()");
	imageBody.append(imageInput);
	imageBody.append(imageSave);
	imageBoxDiv.append(imageBody);
	imageDiv.append(imageBoxDiv);
	
	$('#contentDiv').html(h3);
	$('#contentDiv').append(emailDiv);
	$('#contentDiv').append(usernameDiv);
	$('#contentDiv').append(passwordDiv);
	$('#contentDiv').append(imageDiv);
}

function reset()
{
	$('.Input').removeAttr("style", null);
}

function invitations(){
	$.ajax({
		url: 'collaborationRequest',
		type: 'GET',
		success: function(response){
			var box = $('<div></div>').addClass("box");
			var boxBorder = $('<div></div>').addClass("box-header with-border");
			var h3 = $('<h3></h3>').addClass("box-title").html("Invitations");
			
			boxBorder.append(h3);
			box.append(boxBorder);
			
			var body = $('<div></div>').addClass("box-body");
			var table = $('<table></table>').addClass("table table-bordered");
			var tbody = $('<tbdoy><tbody>');
			var tr1 = $('<tr></tr>').addClass("myTable");
			var th1 = $('<th></th>').addClass("name").html("Project");
			var th2 = $('<th></th>').addClass("columns");
			var th3 = $('<th></th>').addClass("columns");
			
			tr1.append(th1);
			tr1.append(th2);
			tr1.append(th3);
			tbody.append(tr1);
			
			$.each(JSON.parse(response), function(idx,obj){
				var tr = $('<tr></tr>').attr("id", "row"+obj.id).addClass();
				var td1 = $('<td></td>').html(obj.name);
				
				tr.append(td1);
				
				var td2 = $('<td></td>');
				var accept = $('<button></button>').addClass("btn btn-success").html("accept");
					accept.attr("onclick","answer("+obj.id+",true);");
				td2.append(accept);
				tr.append(td2);
				
				var td3 = $('<td></td>');
				var refuse = $('<button></button>').addClass("btn btn-danger").html("refuse");
					refuse.attr("onclick","answer("+ obj.id + ",false);");
				
				td3.append(refuse);
				tr.append(td3);
				
				tbody.append(tr);
			});
			
			table.append(tbody);
			body.append(table);
			
			var footer = $('<div></div>').addClass("box-footer clearfix");
			var ul = $('<ul></ul>').addClass("pagination pagination-sm no-margin pull-right");
			var li1 = $('<li></li>');
			var a1 = $('<a></a>').attr("href","#").html("<");
			
			li1.append(a1);
			ul.append(li1);

			var li2 = $('<li></li>');
			var a2 = $('<a></a>').attr("href","#").html("1");
			
			li2.append(a2);
			ul.append(li2);
			
			var li3 = $('<li></li>');
			var a3 = $('<a></a>').attr("href","#").html(">");
			
			li3.append(a3);
			ul.append(li3);
			footer.append(ul);
			body.append(footer);
			box.append(body);
			$('#contentDiv').html(box);
		}
	})
}

function answer(id, accepted)
{
	$.ajax({
		url: 'collaborationRequest',
		type: 'POST',
		data: {
			id: id,
			accepted: accepted
		},
		success: function(response){
			var row = "#row" + id;
			$(row).remove();
		}
	})
}
