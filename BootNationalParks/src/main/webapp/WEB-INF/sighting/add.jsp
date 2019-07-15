<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Sighting</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
</head>
<body>
	<h1>Cool!  What did you see?</h1>
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
	<form action="newSighting.do" method="POST">
		<label>Animal</label>
		<input type="radio" name="sighting" value="Animal">
		<label>Wild Flower</label>
		<input type="radio" name="sighting" value="Wild Flower">
		<input type="Date" name="dateSeen">
		<label for="id">Id:</label>
		<input type="text" name="id" />
		
	   <input type="submit" value="Add Sighting">
	 </form>
	 <hr>
	 <form action="/" method="GET">
	  	<input type="submit" value="Return Home" />
	</form>
	
</body>
</html>