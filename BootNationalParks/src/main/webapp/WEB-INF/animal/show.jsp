<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Animal</title>
</head>
<body>
<div>
  <h5>${animal.name}</h5>
  <img src="${animal.image }">
  <p>${animal.description}</p>
  <form action="/" method="GET">
  <input type="submit" value="Return Home" />
</form>
</div>

</body>
</html>