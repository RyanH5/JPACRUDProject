<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Sighting</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
</head>
<body>
	<c:choose>
		<c:when test="${! empty sighting }">
			<h2>${sighting.dateSeen}</h2>
			<h3>${flower.name }</h3>
			<h3>${animal.name}</h3>
		
		</c:when>
		<c:otherwise>
			<h2>No sightings so far</h2>
		</c:otherwise>
	
	</c:choose>
	

</body>
</html>