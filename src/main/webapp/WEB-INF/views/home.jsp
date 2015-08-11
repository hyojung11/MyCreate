<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>	
	<title>Home</title>	
    <link rel="stylesheet" type="text/css" href="/resources/style.css">
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
	<script src="/resources/jquery-1.7.1.min.js"></script>
	<script type="text/javascript">
		
	var map;
	function initialize() {
	  map = new google.maps.Map(document.getElementById('map-canvas'), {
	    zoom: 8,
	    center: {lat: -34.397, lng: 150.644}
	  });
	}
	
	google.maps.event.addDomListener(window, 'load', initialize);
	
	
	window.fbAsyncInit = function() {
	    FB.init({
	      appId      : '450354071802804', //사용자 앱ID
	      xfbml      : true,
	      version    : 'v2.4'
	    });
	  };
	  
	  (function(d, s, id){
		     var js, fjs = d.getElementsByTagName(s)[0];
		     if (d.getElementById(id)) {return;}
		     js = d.createElement(s); js.id = id;
		     js.src = "//connect.facebook.net/en_US/sdk.js";
		     fjs.parentNode.insertBefore(js, fjs);
		   }(document, 'script', 'facebook-jssdk'));
	 
	  function facebooklogin() {  
		    //페이스북 로그인 버튼을 눌렀을 때의 루틴.  
		        FB.login(function(response) {  
		            var fbname;  
		            var accessToken = response.authResponse.accessToken;  
		            FB.api('/me', function(user) {  
		                fbname = user.name;  
		                //response.authResponse.userID  
		                $.post("./php/fbloginprocess.php", { "userid": user.id, "username": fbname, "fbaccesstoken":accessToken},  
		                function (responsephp) {  
		                    //댓글을 처리한 다음 해당 웹페이지를 갱신 시키기 위해 호출.  
		                    location.replace('./index.php');  
		                });      
		            });   
		        }, {scope: 'publish_stream,user_likes'});  
		}  
	
	</script>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
 <div onclick="facebooklogin()">
 	<button type="button" class="ct-btn white" value="버튼" onclick="alert('this button click Event')"> </button>
 </div>
 <div id="map-canvas"></div>
</body>
</html>
