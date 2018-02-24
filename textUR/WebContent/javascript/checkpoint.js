
function createCheckpoint(){
	var name = null;
	swal("Please enter checkpoint description:", {
		content: "input",
		})
		.then((value) => {
			name = value;
			if (name != null) {
				$.ajax({
					url: 'createCheckpoint',
					data : {
						name : name
					},
					success: function(response){
						
						if(response=="equals"){
							swal("Unable to create a new checkpoint", "You have to make some changes", "error");
						}
						else{
							swal("Created", "Checkpoint created successfully!", "success").then(() => {
								document.location.href = "settings.jsp";								
							})
						}
					},
					error : function(){ 
						alert("error");
					},
					type : 'POST'
				});
			}
		})
}


function restoreCheckpoint(id){
	swal({
		  title: "Are you sure?",
		  text: "Do you want to restore this checkpoint?",
		  icon: "info",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willRestore) => {
		  if (willRestore) {
				swal({
						text: "Do you want to create a new checkpoint?",
						icon: "info",
						buttons: true,
						dangerMode: true
					}).then((willCreate) => {
						if (willCreate)
						{
							var name = null;
							swal("Please enter checkpoint description:", {
								content: "input",
								})
								.then((value) => {
									name = value;
									if (name != null) {
										$.ajax({
											url: 'createCheckpoint',
											data : {
												name : name
											},
											error : function(){ 
												alert("error");
											},
											type : 'POST'
										});
									}
								}).then(() => {
								$.ajax({
									url: 'restoreCheckpoint',
									data:{
										checkpointId: id
									},
									success: function(response){
										swal("Restored", "Checkpoint restored successfully!", "success").then(() => {
											document.location.href = "settings.jsp";	
										});
									},
									error: function(){
										alert("error");
									},
									type: 'POST'
							    });   
							});
						}
						else
						{
							$.ajax({
								url: 'restoreCheckpoint',
								data:{
									checkpointId: id
								},
								success: function(response){
									swal("Restored", "Checkpoint restored successfully!", "success");
								},
								error: function(){
									alert("error");
								},
								type: 'POST'
						    });   
						}
				});
		  }
	});
}
