<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create New Animal</title>
</head>
<body>
<form action="NewAnimal.do" method="POST">
      <label for="abbreviation">Name:</label>
      <input type="text" name="name" value="name">
      <br>
      <label for="name">Description:</label>
      <input type="text" name="description" value="description">
      <br>
      <label for="capital">Image-url:</label>
      <input type="text" name="image" value="San Juan">
      <br>
      <input type="submit" value="Add Animal">
    </form>

</body>
</html>