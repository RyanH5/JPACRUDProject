<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Animals</title>
</head>
<body>
	<form action="getAnimal.do" method="GET">
  		Animal ID: <input type="text" name="aid" />
  		<input type="submit" value="Show Animal" />
	</form>
	<form action="getFlower.do" method="GET">
  		Wild Flower ID: <input type="text" name="wfid" />
  		<input type="submit" value="Show Wild Flower" />
	</form>
	  <hr>
	  <ul>
	  	<c:forEach var="a" items="${animals}">
	  		<li><a href="getAnimal.do?aid=${a.id}">${a.name}</a></li>
	  	</c:forEach>
	  </ul>
	  <ul>
	  	<c:forEach var="wf" items="${wildFlowers}">
	  		<li><a href="getAnimal.do?aid=${wf.id}">${wf.name}</a></li>
	  	</c:forEach>
	  </ul>
  
  	<hr>
  
  <h2>What's That?  You found a new animal in Yellowstone?!?!</h2>
  <form action="getAnimalAdd.do" method="GET">
  	<input type="submit" value="Add new animal">
  </form>

</body>
</html>