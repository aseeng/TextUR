$(document).ready(() => {
	var user = $('#user').html();
	
	var name = "";
	if($('#name').html() != undefined)
		name = "/" + $('#name').html();
	location.hash = user+name;
});

window.onload = function() {
	
	window.setInterval(load, 5000, $('#user').html());
};

function addPackage(projectname) {
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
							addPackage(projectname);
						});
					else {
						swal("Created", "Package created successfully!", "success").then(()=>{
							var buttonFolder = $("<button></button>").addClass("btn btn-warning overflow-ellipsis");
								buttonFolder.attr("onclick", "showContent(\"" + value + "\","+"true)");
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

	swal("Please enter file name:", {
		content: "input",
	}).then((value) => {
		name = value;
		if (name != null && name != "") {
			$.ajax({
				url: 'addFile',
				data : {
					name : name,
					packageName : hash[2]
				},
				success: function(response){
					if(response == "exist")
						swal("Error", "There is already a file with the same name", "error").then(()=>{
							addFile();
						});
					else
						swal("Created", "File created successfully!", "success").then(()=> {
							showContent(value, "true");
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
					window.location.href = "page?action=homepage";
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
							$("#name").html($("<b></b>").text(value));
							
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
							$("#name").html($("<b></b>").text(value));		
							
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

function showContent(name, isCreator){
	$('#a_drop').show();
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
			}
			else if (hash.length == 3)
			{
				$('#add').text("Add File");
				$('#add').attr("onclick", "addFile();");
				
				$('#rename').text("Rename package");
				$('#rename').attr("onclick", "renamePackage();");
			
				$('#delete').text("Delete package");
				$('#delete').attr("onclick", "removePackage();");
				
				$('#name').html(hash[2]);
				$('#contentDiv').html("");
				$.each(JSON.parse(response), function(idx, obj) {
					var buttonFolder = $("<button></button>").addClass("btn btn-warning overflow-ellipsis");
						buttonFolder.attr("onclick", "showContent(\"" + obj.name + "\" ," + isCreator +");");
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
			}
			else if (hash.length == 4)
			{
				document.location.href = "page?action=openFile&mode="+response;
			}
		}
	});
}

function back(isCreator){
	var hash = location.hash.split("/");
	if(hash.length == 2)
	{
		document.location.href= "page?action=index";
		return;
	}
	location.hash = hash[0];
	for(i = 1; i<hash.length-2; i++)
		location.hash += "/"+hash[i];
	showContent(hash[hash.length-2], isCreator);
}

/*
function openProject(projectid,projectname,isCreator){
	location.hash += "/" + projectname;
	
	$.ajax({
		url : 'page',
		data : {
			action : "openProject",
			hash: location.hash,
			id : projectid
		},
		type: 'GET',
		success : function(response){ 
			var section = $("<section></section>").addClass("content");
			
			var returnButton = $("<button></button>").addClass("btn btn-danger");
				returnButton.attr("onclick", "returnToProjects();");
			
			var icon = $("<i></i>").addClass("fa fa-arrow-left");
				returnButton.append(icon);
				section.append(returnButton);
			
			var div = $("<div></div>").addClass("input-group-btn");
				div.attr("id","options");
			
			var dropdownButton = $("<button></button>").addClass("btn btn-sm btn-success dropdown-toggle");
				dropdownButton.attr("data-toggle", "dropdown");
				dropdownButton.text("Options");
				
			var spanDrop = $("<span></span>").addClass("fa fa-caret-down");
				dropdownButton.append(spanDrop);
				div.append(dropdownButton);
				
			var list = $("<ul></ul>").addClass("dropdown-menu");
			var a1 = $("<a></a>").text("Add Package");
				a1.attr("onclick", "addPackage('"+ projectname +"');");
			
			list.append($("<li></li>").append(a1));
				
			if(isCreator){
				var a2 = $("<a></a>").text("Rename project");
					a2.attr("onclick", "renameProject();");
				list.append($("<li></li>").append(a2));
					
				var a3 = $("<a></a>").text("Delete project");
					a3.attr("onclick", "removeProject();");
				list.append($("<li></li>").append(a3));
			}
			var a4 = $("<a></a>").text("Settings");
				a4.attr("href", "page?action=settings");
			list.append($("<li></li>").append(a4));
							
			var a5 = $("<a></a>").text("Compile");
				a5.attr("onclick", "compile();");
			list.append($("<li></li>").append(a5));
			
			var a6 = $("<a></a>").text("Execute");
				a6.attr("onclick", "execute();");
			list.append($("<li></li>").append(a6));
			
			div.append(list);
			section.append(div);
			
			var h3 = $("<h3></h3>").addClass("site-heading text-center");
			var spanName = $("<span></span>").addClass("site-heading-lower");
				spanName.attr("id", "name");
			h3.append(spanName.append($("<b></b>").text(projectname)));
			section.append(h3);
			
			var newDiv = $("<div></div>").addClass("text-center");
				newDiv.attr("id", "packagesDiv");

			$.each(JSON.parse(response), function(idx, obj) {
				var buttonFolder = $("<button></button>").addClass("btn btn-warning");
					buttonFolder.attr("onclick", "open('" + obj.name + "'," + isCreator + ")");
				var spanFolderBG = $("<span></span>").addClass("info-box-icon bg-yellow");
				var iconFolder = $("<i></i>").addClass("fa fa-folder");
				var br = $("<br>");
				var folderName = $("<p></p>").text(obj.name);
					folderName.addClass("names");
				
				iconFolder.append(br);
				iconFolder.append(folderName);
				spanFolderBG.append(iconFolder);
				buttonFolder.append(spanFolderBG);
				newDiv.append(buttonFolder);
			});
			section.append(newDiv);
			$('#explorer').html(section);

			var user = $("#user").val();
			firstLoad(user);
			
			var dropdown_li = $('<li></li>').addClass("dropdown messages-menu");
			
			var a7 = $('<a></a>').attr("href","#");
				a7.addClass("dropdown-toggle");
				a7.attr("data-toggle", "dropdown");
			
			var ic = $('<i></i>').addClass("fa fa-envelope-o");
			a7.append(ic);
			
			var span = $('<span></span>').addClass("label label-success");
			a7.append(span);
			
			dropdown_li.append(a7);
			
			var ul = $('<ul></ul>').addClass("dropdown-menu");
			var li2 = $('<li></li>');
			
			var div1 = $('<div></div>').addClass("box box-danger direct-chat direct-chat-danger");
			var chatBox = $('<div></div>').addClass("box-body");
				chatBox.attr("id", "chatBox");
			
			var chatZone =  $('<div></div>').addClass("direct-chat-messages");
				chatZone.attr("id", "chat_zone");
			
			chatBox.append(chatZone);
			div1.append(chatBox);
			li2.append(div1);
			ul.append(li2);
			
			var li3 = $('<li></li>').addClass("footer");
			
			var boxDiv = $('<li></li>').addClass("box-footer");
			var inputDiv = $('<div></div>').addClass("input-group");
			
			$('<input>').attr({
			    type: 'text',
			    name : 'message',
			    placeholder: 'Write message ...',
			    class: 'form-control',
			    id: 'text'
			}).appendTo(inputDiv);
			
			var span1 = $('<span></span>').addClass("input-group-btn");
			var sendButton = $('<button></button>').addClass("btn btn-danger");
				sendButton.attr({
					onclick: "sendMessage('${project.getId()},'text'",
					text: "Send",
				}).appendTo(span1);
			
			inputDiv.append(span1);
			boxDiv.append(inputDiv);
			li3.append(boxDiv);
			ul.append(li3);
			
			dropdown_li.append(ul);
			
			$('#navBar').last().prepend(dropdown_li);
			
			projectOpened = projectid;
			packageOpened = null;
		},

		error : function(){ 
			alert("error");
		}
	});

}

function openPackage(packageid,packagename,projectname, isCreator){ 
	location.hash += "/" + packagename;
	$.ajax({
		url : 'page',

		data : {
			action: "openPackage",
			hash: location.hash,
			id : packageid
		},

		success : function(response){ 
			var section = $("<section></section>").addClass("content");
			var returnButton = $("<button></button>").addClass("btn btn-danger");
				returnButton.attr("onclick", "openProject(" + projectOpened + ",'" + projectname + "'," +  isCreator +");");
				returnButton.attr("id", "returnButton");
				
			var icon = $("<i></i>").addClass("fa fa-arrow-left");
				returnButton.append(icon);
				
			section.append(returnButton);
			
			var div = $("<div></div>").addClass("input-group-btn");
			var dropdownButton = $("<button></button>").addClass("btn btn-sm btn-success dropdown-toggle");
				dropdownButton.attr("data-toggle", "dropdown");
				dropdownButton.text("Options");
			var spanDrop = $("<span></span>").addClass("fa fa-caret-down");
				dropdownButton.append(spanDrop);
			
			div.append(dropdownButton);
			
			var list = $("<ul></ul>").addClass("dropdown-menu");
			var a1 = $("<a></a>").text("Add File");
				a1.attr("onclick", "addFile();");
			list.append($("<li></li>").append(a1));
			
			var a2 = $("<a></a>").text("Rename package");
				a2.attr("onclick", "renamePackage();");
			list.append($("<li></li>").append(a2));
			
			var a3 = $("<a></a>").text("Delete package");
				a3.attr("onclick", "removePackage();");
			list.append($("<li></li>").append(a3));
			
			var a4 = $("<a></a>").text("Settings");
				a4.attr("href", "page?action=settings");
			list.append($("<li></li>").append(a4));

			div.append(list);
			section.append(div);
			
			var h3 = $("<h3></h3>").addClass("site-heading text-center");
			var spanName = $("<span></span>").addClass("site-heading-lower");
				spanName.attr("id", "name");
			h3.append(spanName.append($("<b></b>").text(packagename)));
			section.append(h3);
		
			var newDiv = $("<div></div>").addClass("text-center");
			newDiv.attr("id", "filesDiv");

			$.each(JSON.parse(response), function(idx, obj) {
				var buttonFolder = $("<button></button>").addClass("btn btn-warning overflow-ellipsis");
					buttonFolder.attr("onclick", "openFile(" + obj.id + ",\"false\")");
				var spanFolderBG = $("<span></span>").addClass("info-box-icon bg-yellow");
				var iconFolder = $("<i></i>").addClass("fa fa-file");
				var br = $("<br>");
				var folderName = $("<p></p>").text(obj.name);
					folderName.addClass("names");
				
				iconFolder.append(br);
				iconFolder.append(folderName);
				spanFolderBG.append(iconFolder);
				buttonFolder.append(spanFolderBG);
				newDiv.append(buttonFolder);
			});

			section.append(newDiv);
			$('#explorer').html(section);
			packageOpened = packageid;
		},

		error : function(){ 
			alert("error");
		},

		type : 'GET'
	});
}

function openFile(id, isNewFile)
{	
	location.hash += "/" + id;
	if(isNewFile=="true"){
		$.ajax({
			url: 'openFile',
			data:{
				fileId: id,
				hash: location.hash,
				mode: true
			},
			success: function(response){
				document.location.href = "page?action=openFile&mode=write";
			},
			type: 'POST'
		});

	} else if(isNewFile=="false"){
		$('#file').val(id);
		var mode = true;
		swal({
			text: "Choose how to open file: ", 
			buttons: {
				catch: "Write!",
				defeat:  "ReadOnly!"
			},
		})
		.then((value) => {
			switch (value) {
				case "catch":
					mode = "write";
					break;
				case "defeat":
					mode = "read";
					break;
				default:
					return;
			}
			$.ajax({
				url: 'openFile',
				data:{
					fileId: id,
					hash: location.hash,
					mode: mode
				},
				success: function(response){
					if(response != "lock")
						document.location.href = "page?action=openFile&hash="+location.hash+"&mode="+mode;
					else {
						swal("Alert","You can't write on this file! This file will be opened in read only mode","warning").then(()=>{
							document.location.href = "page?action=openFile&mode="+mode;
						});
					}
				},
				type: 'POST'
			});
		});
		
	}
}
*/