<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Animal</title>
<link rel="stylesheet" type="text/css" href="update.css">
</head>
<body>

	<header>
		<h1>UPDATE ANIMAL</h1>
	
	</header>


	<form action="displayUpdatedAnimal.do" modelAttribute="animal" method="POST">
		<input type="hidden" name="id" value="${animal.id}" /> 
		<label for="name">Name:</label> 
			<input type="text" name="name" value="${animal.name}"> 
			<br> 
			<label for="description">Description:</label>
		<input type="text" name="description" value="${animal.description}">
		<br> 
		<label for="image">Image-url:</label> 
		<input type="text"
			name="image" value="${animal.image}"/> 
			<br> 
			<input type="submit" value="Update Animal" class="btn"/>
	</form>

	<hr>
	<form action="/" method="GET">
		<input type="submit" value="Return Home" class="btn"/>
	</form>

</body>
</html>