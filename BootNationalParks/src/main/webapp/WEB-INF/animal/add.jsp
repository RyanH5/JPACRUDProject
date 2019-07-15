<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Animal</title>
<link rel="stylesheet" type="text/css" href="add.css">
</head>
<body>
	<header>
		<h1>What new animal did you find?</h1>
	</header>

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
   <input type="submit" value="Add Animal" class="btn">
 </form>
 <form action="/" method="GET">
  	<input type="submit" value="Return Home" class="btn"/>
</form>

</body>
</html>