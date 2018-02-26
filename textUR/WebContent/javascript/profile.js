function changePassword(){
	$.ajax({
		url: 'change',
		data: {
			type: "password"			
		}
	})
}