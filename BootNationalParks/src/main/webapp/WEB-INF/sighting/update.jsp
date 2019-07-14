<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>UPDATE Sighting</h1>
	<form action="displayUpdatedSighting.do" modelAttribute="sighting" method="POST">
		<input type="hidden" name="sid" value="${sighting.id}" /> 
		<label for="name">Name:</label> 
		<input type="Date" name="dateSeen" value="${sighting.dateSeen}"> 
		<br> 
		<!--  STRETCH GOAL alter name, image, description of animal/flower from here -->
		<input type="submit" value="Update Sighting"/>
	</form>
	<hr>
	<form action="/" method="GET">
		<input type="submit" value="Return Home" />
	</form>

</body>
</html>