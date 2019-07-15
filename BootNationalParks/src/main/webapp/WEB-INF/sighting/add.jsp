<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Sighting</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="add.css">
</head>
<body>
	<header>
		<h1>Cool!  What did you see?</h1>
	</header>
		<div class="lists">
			<ul>
			  	<c:forEach var="a" items="${animals}">
			  		<li><a href="getAnimal.do?aid=${a.id}">${a.id}: ${a.name}</a></li>
			  	</c:forEach>
		  </ul>
		  <ul>
		  	<c:forEach var="wf" items="${flowers}">
		  		<li><a href="getFlower.do?wfid=${wf.id}">${wf.id}: 	${wf.name}</a></li>
		  	</c:forEach>
		  </ul>
		
		</div>
	<form action="newSighting.do" method="POST">
		<label>Animal</label>
		<input type="radio" name="sighting" value="Animal">
		<label>Wild Flower</label>
		<input type="radio" name="sighting" value="Wild Flower">
		<input type="Date" name="dateSeen">
		<label for="id">    Id:</label>
		<input type="text" name="sid" />
		
	   <input type="submit" value="Add Sighting" class="btn">
	 </form>
	 <form action="/" method="GET">
	  	<input type="submit" value="Return Home" class="btn" />
	</form>
	
</body>
</html>