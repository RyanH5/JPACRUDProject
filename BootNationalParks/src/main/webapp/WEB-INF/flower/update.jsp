<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Flower</title>
</head>
<body>
	<h1>UPDATE FLOWER</h1>
	<form action="displayUpdatedFlower.do" modelAttribute="flower" method="POST">
		<input type="hidden" name="id" value="${flower.id}" /> 
		<label for="name">Name:</label> 
		<input type="text" name="name" value="${flower.name}"> 
		<br> 
		<label for="location">Location:</label>
		<input type="text" name="location" value="${flower.location}">
		<br> 
		<label for="image">Image-url:</label> 
		<input type="text" name="image" value="${flower.image}"/> 
		<label for="bloomingPeriod">Blooming Period:</label> 
		<input type="text" name="bloomingPeriod" value="${flower.bloomingPeriod}"/> 
		<br> 
		<input type="submit" value="Update Flower"/>
	</form>
	<hr>
	<form action="/" method="GET">
		<input type="submit" value="Return Home" />
	</form>

</body>
</html>