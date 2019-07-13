<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>What new animal did you find?</h1>

	<form action="newWildFlower.do" method="POST">
	   <label for="name">Name:</label>
	   <input type="text" name="name" placeholder="Name">
	   <br>
	   <label for="location">Location:</label>
	   <input type="text" name="location" placeholder="location">
	   <br>
	   <label for="image">Image-url:</label>
	   <input type="text" name="image" placeholder="https://yourimage.com">
	   <br>
	   <label for="bloomingPeriod">Blooming Period:</label>
	   <input type="text" name="bloomingPeriod" placeholder="May-September">
	   <br>
	   <input type="submit" value="Add Wild Flower">
	 </form>
 	<hr>
 	<form action="/" method="GET">
  		<input type="submit" value="Return Home" />
	</form>
</body>
</html>