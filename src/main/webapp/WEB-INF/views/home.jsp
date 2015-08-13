<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>	
	<title>Home</title>
	<meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="/resources/style.css">    	
</head>
<body>
<h1>	Hello world!</h1>
<P>  The time on the server is ${serverTime}. </P>
 <button type="button" class="ct-btn white" onclick="facebooklogin(); return false;">로그인</button>
 <button type="button" class="ct-btn white" onclick="facebooklogout(); return false;">로그아웃</button>
 <input type="text" id="user_id">
 <div id="map-canvas"></div>
<div id="fb-root"></div>
<script src="/resources/jquery-1.11.3.min.js"></script>    
<script src="http://connect.facebook.net/ko_KR/all.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
<script>
FB.init({
    appId      : '450354071802804', //사용자 앱ID
    status     : true,
    xfbml      : true,
    version    : 'v2.4'
  });
	
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id)) return;
		js = d.createElement(s); js.id = id;
		js.src = "//connect.facebook.net/en_GB/all.js#xfbml=1&status=0";
		fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
</script>
<script type="text/javascript">		
	 		
	var map = "";
	function initialize() {
	  map = new google.maps.Map(document.getElementById('map-canvas'), {
	    zoom: 8,
	    center: {lat: -34.397, lng: 150.644}
	  });
	}	
	
	function facebooklogin() {				  
		  FB.login(function(response) {
			  if (response.authResponse) {				  
			       // callback 영역입니다. 자신의 브라우저가 페북에 연동되면 여기로직을 처리 하게 되죠				  
				  FB.api('/me', function(response) {
					  $('#user_id').val(response.name);
				       console.log('Good to see you, ' + response.name + '.');
				     }); 				       
			  } else {
			       //오류가 났거나 연동이 실패 했을때 처리 하는부분.....
				  alert("실패");
			         }
			       } , {
			       scope: 'publish_actions, email', 
			       return_scopes: true
		  //,{scope: 'email,user_likes'}); //, {scope: "user_about_me,publish_stream,read_friendlists,offline_access,email,user_birthday"} 			   
		} ); }
	
	function facebooklogout() {
		FB.logout(function(response) {
			  // user is now logged out
			  alert("성공");
			});
	}
		
	 google.maps.event.addDomListener(window, 'load', initialize);			       			      
	
	</script>
</body>
</html>
