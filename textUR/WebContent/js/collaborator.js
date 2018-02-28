function loadCollaboratorPage(creator,currUser) {
    $('.js-example-basic-multiple').select2();
    findUsers();    
    showCollaborator(creator,currUser);
};

function findUsers(){

	$.ajax({
		url: 'findUsers',
		success: function(response){		
			document.getElementById("selectUsers").innerHTML = "";
			$.each(JSON.parse(response), function(idx, obj) {	
				var option = document.createElement("OPTION");
				option.text = obj;
				document.getElementById("selectUsers").appendChild(option);
			});
		},
		type : 'GET'
	});
}

function addCollaborator(projectId, creator, currUser) {
	
	var users = $('#selectUsers').select2().val();
	if(users.length == 0)
	{
		swal("Warning","Select an user, please", "warning");
	}
	else {
		swal({
			title: "Are you sure? ", 
			buttons: {
				catch: "Yes!",
			    cancel:  "No!"
			  },
			}).then((value) => {
			  switch (value) {
			    case "catch": 	
			    		if (users != null && users != "") {
			
			    			var json = JSON.stringify(users);
			
			    			$.ajax({
			    				url: 'collaborator',
			    				data : {
			    					names : json
			    				},
			    				success: function(){
			    					swal("Success", "Collaboration request sent successfully!", "success");
			    					$('#selectUsers').val(null).trigger('change');
			    					findUsers();
			    					showCollaborator(creator,currUser);
			    				},
			    				error : function(){ 
			    					alert("error");
			    				},
			    				type : 'POST'
			    			});
			    		}
			    		break
			    	}
			});
	}
}

function showCollaborator(creator, currUser){
	$.ajax({
		url: 'collaborator',
		success: function(response){	
			$('#collaborators').html("");
			$.each(JSON.parse(response), function(idx, obj) {	
				
				var div = $('<div></div>').addClass("col-md-3");
					div.attr("id", "-" + obj.key.username);
				var div1 = $('<div></div>').addClass("center");
				var div2 = $('<div></div>').addClass("box box-widget widget-user");
				var div3 = $('<div></div>').addClass("widget-user-header bg-aqua-active");
				
				var open = $('<a></a>').addClass("widget-user-username username").text(obj.key.username);
					open.attr("href","page?action=openProfile&name="+obj.key.username);
				div3.append(open);
				
				if(currUser == creator) 
				{
					var a = $('<a></a>').addClass("btn btn-danger btn-xs remove fa fa-remove");
						a.attr("onclick", "removeCollaborator('${project}','" + obj.key.username + "','" + creator + "','" + currUser + "');");
					div3.append(a);
				}

				if(!obj.value)
					div3.append($('<h5></h5>').attr("id","pending").addClass("text").text("pending..."));
				else
				{	var h5 = $('<h5></h5>').addClass("widget-user-desc text").text("Collaborator");
					div3.append(h5);
				}
				
				div2.append(div3);
				
				var div4 = $('<div></div>').addClass("widget-user-image");

				var image = $('<img>').addClass("img-circle myimg").attr({
					src: obj.key.image,
					alt: "User avatar"
				});
				div4.append(image);
				div2.append(div4);
				
				div.append(div1.append(div2));
				$('#collaborators').append(div);
			});
		
		},
		type : 'GET'
	});	
}

function removeCollaborator(projectId, user, creator, currUser) {
	
	swal({
		text: "are you sure? ", 
		buttons: {
			catch: "Yes!",
		    cancel:  "No!"
		  },
		}).then((value) => {
		  switch (value) {
		  
		    case "catch":      
		  
		    		$.ajax({
		    			url: 'removeCollaborator',
		    			data : {
		    				name : user,
		    				id : projectId
		    			},
		    			success: function(response){
		    				swal("Removed", "Collaborator removed successfully!", "success").then(() => {							
		    				})
		    				document.getElementById("showCollaborator").removeChild(document.getElementById("-"+user));
		    			    findUsers(); 
		    				showCollaborator(creator,currUser);
		    			},
		    			error : function(){ 
		    				alert("error");
		    			},
		    			type : 'POST'
		    		});
		    		break
		  	}
		});
}

function closeSettings(){
	document.location.href="page?action=homepage";
}