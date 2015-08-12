<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>	
	<title>Home</title>	
    <link rel="stylesheet" type="text/css" href="/resources/style.css">
    <script src="http://connect.facebook.net/ko_KR/all.js"></script>
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
	
	function facebooklogin() {		
		  alert("왔어?");
		  FB.login(function(response) {
			  if (response.authResponse) {				  
			       // callback 영역입니다. 자신의 브라우저가 페북에 연동되면 여기로직을 처리 하게 되죠
				  alert("성공");
			  } else {
			       //오류가 났거나 연동이 실패 했을때 처리 하는부분.....
				  alert("실패");
			         }
			       }
			   , {scope: "user_about_me,publish_stream,read_friendlists,offline_access,email,user_birthday"} 
			  );  
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
	 	  	  
	
	</script>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
 http://javafactory.tistory.com/entry/JSP-%ED%8E%98%EC%9D%B4%EC%8A%A4%EB%B6%81-%EC%97%B0%EB%8F%99
 <button type="button" class="ct-btn white" onclick="facebooklogin(); return false;">버튼</button>
 <div id="map-canvas"></div>
</body>
</html>
