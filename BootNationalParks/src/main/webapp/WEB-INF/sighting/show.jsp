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
			<c:if test="${ not empty sighting.animals}">
				<h5>${animal.name}</h5>
				<img src="${animal.image }">
				<p>${animal.description}</p>
			</c:if>
 			<c:if test="${not empty sighting.wildFlowers}">
				<h3>${flower.name}</h3>
				<img src="${flower.image}" />
				<h3>${flower.location }</h3>
				<h4>${flower.bloomingPeriod }</h4>
			</c:if>	
		</c:when>
		<c:otherwise>
			<h2>No sightings so far</h2>
		</c:otherwise>
	
	</c:choose>
	

</body>
</html>