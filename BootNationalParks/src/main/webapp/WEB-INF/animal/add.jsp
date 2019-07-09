<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Animal</title>
</head>
<body>

<h1>What new animal did you find?</h1>

<form action="newAnimal.do" method="POST">
      <label for="name">Name:</label>
      <input type="text" name="name" placeholder="Name">
      <br>
      <label for="description">Description:</label>
      <input type="text" name="description" placeholder="description">
      <br>
      <label for="image">Image-url:</label>
      <input type="text" name="image" placeholder="https://yourimage.com">
      <br>
      <input type="submit" value="Add Animal">
    </form>
    
    <hr>
    <form action="/" method="GET">
  <input type="submit" value="Return Home" />
</form>

</body>
</html>