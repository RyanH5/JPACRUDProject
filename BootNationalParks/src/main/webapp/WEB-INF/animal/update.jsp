<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>Ok, Steve Irwin. You tell me</h1>


	<form action="displayUpdatedAnimal.do" method="GET">
		<input type="hidden" name="aid" value="${animal.id}" /> 
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
			<input
			type="submit" value="Update Animal"/>
	</form>

	<hr>
	<form action="/" method="GET">
		<input type="submit" value="Return Home" />
	</form>

</body>
</html>