$(document).ready(() => {
	var user = $('#user').html();
	
	var name = "";
	if($('#name').html() != undefined)
		name = "/" + $('#name').html();
	
	location.hash = user+name;
	$('#sidebar').attr("style","display:block");
	$('#calendar').attr("style","display:block");
	window.setInterval(loadChat,1000);
});



function addPackage() {
	var name = null;
	swal("Please enter package name:", {
		content: "input",
	})
	.then((value) => {
		name = value;
		if (name != null && name != "") {
			$.ajax({
				url: 'addPackage',
				data : {
					name : name
				},
				success: function(response){
					if(response == "exist")
						swal("Error", "There is already a package with the same name", "error").then(()=>{
							addPackage();
						});
					else {
						swal("Created", "Package created successfully!", "success").then(()=>{
							var buttonFolder = $("<button></button>").addClass("btn btn-warning overflow-ellipsis");
								buttonFolder.attr("onclick", "showContent('" + value + "')");
							var spanFolderBG = $("<span></span>").addClass("info-box-icon bg-yellow");
							var iconFolder = $("<i></i>").addClass("fa fa-folder icon_folder");
							var br = $("<br>");
							var folderName = $("<p></p>").text(name);
								folderName.attr("class", "names");
							iconFolder.append(br);
							iconFolder.append(folderName);
							spanFolderBG.append(iconFolder);
							buttonFolder.append(spanFolderBG);
							
							$("#contentDiv").append(buttonFolder);
						});
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

function removePackage() {
	$.ajax({
		url: 'removePackage',
		data:{
			hash : location.hash
		},
		success: function(response){
			
			if(response == "online")
			{
				swal("Cannot delete package", "Other users are working on it", "error");
			}
			else {
				swal("Removed", "Package removed successfully!", "success").then(() => {
					$('#returnButton').click();
				})
			}
		},
		type: 'POST'
	});
}

function addFile() {
	var name = null;
	var hash = location.hash.split("/");
	
	var div = document.createElement('div');
	var input = document.createElement('input');
	input.classList = "col-xs-12 createInput";
	input.autofocus = true;
	input.name = "file";
	
	var checkDiv = document.createElement('div');
		checkDiv.classList = "form-group";

	var classLabel = document.createElement('label');
	var classB = document.createElement('input');
		classB.type = "radio";
		classB.classList = "minimal";
		classB.name = "choose";
		classB.value = "class";
		classB.checked = true;
	classLabel.classList = "iradio_minimal-blue checked fileButton";
	classLabel.innerHTML = "class";
	classLabel.appendChild(classB);
	
	var abstractLabel = document.createElement('label');
	var abstract = document.createElement('input');
		abstract.type = "radio";
		abstract.classList = "minimal";
		abstract.name = "choose";
		abstract.value = "abstract class";
		
	abstractLabel.classList = "iradio_minimal-blue checked fileButton";
	abstractLabel.innerHTML = "abstract class";
	abstractLabel.appendChild(abstract);

	var interfaceLabel = document.createElement('label');
	var interfaceB = document.createElement('input');
		interfaceB.type = "radio";
		interfaceB.classList = "minimal";
		interfaceB.name = "choose";
		interfaceB.value = "interface";
	interfaceLabel.classList = "iradio_minimal-blue checked fileButton";
	interfaceLabel.innerHTML = "interface";
	interfaceLabel.appendChild(interfaceB);

	checkDiv.appendChild(classLabel);
	checkDiv.appendChild(abstractLabel);
	checkDiv.appendChild(interfaceLabel);
	div.appendChild(input);
	div.appendChild(checkDiv);
	swal("Please enter file name:", {
		content: div
	}).then((value) => {
		name = document.querySelector('input[name="file"]').value;
		if (name != null && name != "") {
			$.ajax({
				url: 'addFile',
				data : {
					name : document.querySelector('input[name="file"]').value,
					packageName : hash[2],
					type: document.querySelector('input[name="choose"]:checked').value
				},
				success: function(response){
					if(response == "exist")
						swal("Error", "There is already a file with the same name", "error").then(()=>{
							addFile();
						});
					else
						swal("Created", "File created successfully!", "success").then(()=> {
							showContent(name);
						})
				},
				error : function(){ 
					alert("error");
				},
				type : 'POST'
			});
		}
	})
}

function removeProject() {
	$.ajax({
		url: 'removeProject',
		success: function(response){
			if(response == "online"){
				swal("You can't delete this project!", "Someone is working on it!", "warning");
			} else {
				swal("Deleted", "Project deleted successfully!", "success").then(() => {
					window.location.href = "page?action=index";
				});
			}
		},
		type: 'POST'
	});
}

function renameProject(){
	swal("Please enter new name:", {
		content: "input",
	})
	.then((value) => {
		if (value != null && value != "") {
			$.ajax({
				url: 'renameProject',
				data : {
					name :  value
				},
				success: function(response){
					if(response == "exist")
						swal("Error", "There is already a project with the same name", "error").then(()=>{
							renameProject();
						});
					else {
						swal("Renamed","Successful renamed!", "success").then(() => {
							$("#name").html(value);
							
							var hash = location.hash.split("/"); 
							hash[hash.length-1] = value;
							location.hash = hash[0];
							for(i = 1; i<hash.length; i++)
								location.hash += "/" + hash[i];
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

function renamePackage(){

	swal("Please enter new name:", {
		content: "input",
	})
	.then((value) => {
		if (value != null && value != "") {
			$.ajax({
				url: 'renamePackage',
				data : {
					packageName : location.hash.split("/")[2],
					name :  value
				},
				success: function(response){
					if(response == "exist")
						swal("Error", "There is already a package with the same name", "error").then(()=>{
							renamePackage();
						});
					else {
						swal("Renamed","Successfull renamed!", "success").then(() => {
							$("#name").html(value);		
							
							var hash = location.hash.split("/"); 
							hash[hash.length-1] = value;
							location.hash = hash[0];
							for(i = 1; i<hash.length; i++)
								location.hash += "/" + hash[i];
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

function showContent(name){
	
	var spin = $('<div></div>').addClass("se-pre-con").attr("id","loading");
	$("body").append(spin);
	
	$('.buttonName').removeAttr("onclick", null);	
	location.hash += "/" + name;
	$.ajax({
		url : 'page',
		data : {
			action : "open",
			hash: location.hash
		},
		type: 'GET',
		success : function(response){
			
			var hash = location.hash.split("/");
			if(hash.length == 2)
			{
				document.location.href="page?action=homepage";
				loadChat();
			}
			else if (hash.length == 3)
			{
				$('#add').text("Add File");
				$('#add').attr("onclick", "addFile();");
				
				$('#rename').remove();
				$('#delete').remove();
				
				var li = $('<li></li>');
				var remove = $('<a></a>').attr({
					id: "delete",
					onclick: " removePackage();"
				}).html("Delete package");
				
				li.append(remove);
				li.insertAfter($('#addLi'));				

				var li2 = $('<li></li>');
				var rename = $('<a></a>').attr({
					id: "rename",
					onclick: "renamePackage();"
				}).html("Rename package");
				
				li2.append(rename);
				li2.insertAfter($('#addLi'));
				
				$('#name').html(hash[2]);
				$('#contentDiv').html("");
				$.each(JSON.parse(response), function(idx, obj) {
					var buttonFolder = $("<button></button>").addClass("btn btn-warning buttonName");
						buttonFolder.attr("onclick", "showContent(\"" + obj.name + "\");");
					var spanFolderBG = $("<span></span>").addClass("info-box-icon bg-yellow");
					var iconFolder = $("<i></i>").addClass("fa fa-file icon_folder");
					var br = $("<br>");
					var folderName = $("<p></p>").text(obj.name);
						folderName.addClass("names");
					
					iconFolder.append(br);
					iconFolder.append(folderName);
					spanFolderBG.append(iconFolder);
					buttonFolder.append(spanFolderBG);
					$('#contentDiv').append(buttonFolder);
				});
				$("#loading").remove();
			}
			else if (hash.length == 4)
			{
				document.location.href = "page?action=openFile&mode="+response;
			}
		}
	});
}

function back(){
	var hash = location.hash.split("/");
	if(hash.length == 2)
	{
		document.location.href= "page?action=index";
		return;
	}
	location.hash = hash[0];
	for(i = 1; i<hash.length-2; i++)
		location.hash += "/"+hash[i];
	showContent(hash[hash.length-2]);
}