<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<meta charest="UTF-8">
	<title>Home</title>	
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
	<script src="js/jquery-1.7.1.min.js"></script>
	<script type="text/javascript">
	var map;
	function initialize() {
	  map = new google.maps.Map(document.getElementById('map-canvas'), {
	    zoom: 8,
	    center: {lat: -34.397, lng: 150.644}
	  });
	}
	
	google.maps.event.addDomListener(window, 'load', initialize);
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
