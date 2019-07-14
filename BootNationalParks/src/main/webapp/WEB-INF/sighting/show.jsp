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
		<c:when test="${! empty sightings }">
			<h2>${sightings.dateSeen}</h2>
		
		</c:when>
	
	</c:choose>
	<c:otherwise>
		<h2>No sightings so far</h2>
	</c:otherwise>
	

</body>
</html>