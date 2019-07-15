<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Animal</title>
<link rel="stylesheet" type="text/css" href="show.css">
</head>
<body>
	<div>
		<h5>${animal.name}</h5>
		<img src="${animal.image }">
		<p>${animal.description}</p>
	</div>
		<div class="btns-container">
			<form action="goHome.do" method="GET">
				<input type="submit" value="Return Home" />
			</form>
			<form action="getUpdatedAnimal.do" method="GET">
				<input type="hidden" name="aid" value="${animal.id}" />
				<input type="submit" value="Update This Animal" />
			</form>
			<form action="getDeletedAnimal.do" method="GET">
				<input type="hidden" name="aid" value="${animal.id}" />
				<input type="submit" value="Delete Animal" />
			</form>
		</div>

</body>
</html>