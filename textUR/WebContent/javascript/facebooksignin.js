window.fbAsyncInit = function() {
	 FB.init({
         appId      : '321258351707436',
         cookie     : true,
         xfbml      : true,
         version    : 'v2.11'
       });
       FB.getLoginStatus(function(response) {
           statusChangeCallback(response);
       });
     };
     (function(d, s, id){
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) {return;}
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/it_IT/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
      }(document, 'script', 'facebook-jssdk'));
      function statusChangeCallback(response){
        if(response.status === 'connected'){
       	 FB.api('/me?fields=email', function(response){
       		 $.ajax({
       				url : 'loginAPI',
       				data : {
       					email : response.email
       				},
       				success : function(responseText) {
       					if(responseText == "register")
       					{
       						alert("register");
       						swal("Please choose your username:", {
       							content: "input",
       							})
       							.then((value) => {
       								if (value != null && value != "") {
       									$.ajax({
       										url: 'loginAPI',
       										data : {
       											email : response.email,
       											name :  value
       										},
       										error : function(){ 
       											alert("error");
       										},
       										type : 'POST'
       									});
       								}
       							}).then(() => {
       								document.location.href = "home.jsp";								
       							})
       					}	
       					else
       						document.location.href = "home.jsp";
       				},
       				type : 'GET',
       			});
       	 });
         
          testAPI();
        }
      }
     function checkLoginState() {
   	  alert("checkLoginState");
       FB.getLoginStatus(function(response) {
         statusChangeCallback(response);
         console.log(response);
       });
     }
     function testAPI(){
       FB.api('/me?fields=name,email,birthday,location', function(response){
         if(response && !response.error){
            console.log(response);
           buildProfile(response);
         }
         FB.api('/me/feed', function(response){
           if(response && !response.error){
             buildFeed(response);
           }
         });
       })
     }
     function buildProfile(user){
   	  alert("buildProfile");
       let profile = `
         <h3>${user.name}</h3>
         <ul class="list-group">
           <li class="list-group-item">User ID: ${user.id}</li>
           <li class="list-group-item">Email: ${user.email}</li>
           <li class="list-group-item">Birthday: ${user.birthday}</li>
           <li class="list-group-item">User ID: ${user.location.name}</li>
         </ul>
       `;
       document.getElementById('profile').innerHTML = profile;
     }
     function buildFeed(feed){
   	  alert("buildFeed");
       let output = '<h3>Latest Posts</h3>';
       for(let i in feed.data){
         if(feed.data[i].message){
           output += `
             <div class="well">
               ${feed.data[i].message} <span>${feed.data[i].created_time}</span>
             </div>
           `;
         }
       }
       document.getElementById('feed').innerHTML = output;
     }
     function setElements(){
         document.getElementById('logout').style.display = 'block';
         document.getElementById('profile').style.display = 'block';
         document.getElementById('feed').style.display = 'block';
         document.getElementById('fb-btn').style.display = 'none';
         document.getElementById('heading').style.display = 'none';
     }
     