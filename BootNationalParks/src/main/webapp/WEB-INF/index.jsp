<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Yellowstone Life</title>
	<link rel="stylesheet" type="text/css" href="index.css">
</head>
<body>
<!-- 	<form action="getAnimal.do" method="GET">
  		Animal ID: <input type="text" name="aid" />
  		<input type="submit" value="Show Animal" />
	</form>
	<form action="getFlower.do" method="GET">
  		Wild Flower ID: <input type="text" name="wfid" />
  		<input type="submit" value="Show Wild Flower" />
	</form> -->
		<header>
			<h1>WELCOME TO YELLOWSTONE</h1>
		</header>
	  <div class="lists">
		  <ul>
		  <h2>Animals</h2>
		  	<c:forEach var="a" items="${animals}">
		  		<li><a href="getAnimal.do?aid=${a.id}">${a.name}</a></li>
		  	</c:forEach>
		  </ul>
		  <ul>
		  <h2>Wild Flowers</h2>
		  	<c:forEach var="wf" items="${wildFlowers}">
		  		<li><a href="getFlower.do?wfid=${wf.id}">${wf.name}</a></li>
		  	</c:forEach>
		  </ul>
		  <ul>
		  <h2>Yellowstone Recent Sightings</h2>
		  	<c:forEach var="s" items="${sightings}">
		  		<li><a href="getSighting.do?sid=${s.id}">${s.dateSeen}</a></li>
		  	</c:forEach>
		  </ul>  
	  </div>
	<div class="btns-container">
	  <form action="getAnimalAdd.do" method="GET">
	  	<input type="submit" value="Add new animal" class="btn">
	  </form>
	  <form action="getWildFlowerAdd.do" method="GET">
	  	<input type="submit" value="Add new wild flower" class="btn">
	  </form>
	  <form action="getSightingAdd.do" method="GET">
	  	<input type="submit" value="Add new sighting" class="btn">
	  </form>	
	</div>

</body>
</html>