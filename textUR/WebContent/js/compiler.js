function compile(){
	$.ajax({
		url : 'compile',
		success : function(response){
			if(response == "ok")
				swal("Compiled", "Successful compilation!", "success");
			else {	
				var area = document.createElement("textarea");
				area.cols = 50;
				area.rows = 10;
				area.disabled = true;
				area.value = "";
				$.each(JSON.parse(response), function(idx, obj) {
					area.value = area.value + obj + "\n";
				});
				console.log(area.value)
				swal("Error","","error",{
					content : area,
				});
			}
		},
		error : function(){
			alert("compilation error");
		},
		type : 'GET'
	})
}

function execute(){
	$.ajax({
		url : 'execute',
		success : function(){
			swal("Executed", "Successful!", "success");
		},
		error : function(){
			alert("execution error");
		},
		type : 'GET'
	})
}