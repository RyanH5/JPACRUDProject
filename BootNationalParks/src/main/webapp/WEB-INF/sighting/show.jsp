<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Sighting</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="show.css">
</head>
<body>
	<c:choose>
		<c:when test="${! empty sighting }">
			<h2>${sighting.dateSeen}</h2>
			
			<c:if test="${ not empty sighting.animals}">
				<h5>${animal.name}</h5>
				<img src="${animal.image }" height="200px">
				<p>${animal.description}</p>
			</c:if>
			<c:if test="${ not empty animal}">
				<h5>${animal.name}</h5>
				<img src="${animal.image }" height="200px">
				<p>${animal.description}</p>
			</c:if>
			<c:if test="${ not empty flower}">
				<h3>${flower.name}</h3>
				<img src="${flower.image}" height="200px"/>
				<h3>${flower.location }</h3>
				<h4>${flower.bloomingPeriod }</h4>
			</c:if>
			<!--  THIS WAS TRICKY Sighting must have a field of the thing you empty check, 
			AKA check for wildflowers NOT flower-->
 			<c:if test="${not empty sighting.wildFlowers}">
 			<!--  Then what you display is the data on THIS sighting instance SO flower-->
				<h3>${flower.name}</h3>
				<img src="${flower.image}" height="200px"/>
				<h3>${flower.location }</h3>
				<h4>${flower.bloomingPeriod }</h4>
			</c:if>	
		</c:when>
		<c:when test="${ not empty animal}">
				<h5>${animal.name}</h5>
				<img src="${animal.image }" height="200px">
				<p>${animal.description}</p>
			</c:when>
		<c:when test="${ not empty flower}">
				<h3>${flower.name}</h3>
				<img src="${flower.image}" height="200px"/>
				<h3>${flower.location }</h3>
				<h4>${flower.bloomingPeriod }</h4>
			</c:when>
		<c:otherwise>
			<h2>No sightings so far</h2>
		</c:otherwise>	
	</c:choose>
	
	<div class="btns-container">
			<form action="goHome.do" method="GET">
				<input type="submit" value="Return Home" class="btn"/>
			</form>
			<form action="getUpdatedSighting.do" method="GET">
				<input type="hidden" name="sid" value="${sighting.id}" />
				<input type="submit" value="Update This Sighting" class="btn"/>
			</form>
			<form action="deleteSighting.do" method="GET">
				<input type="hidden" name="sid" value="${sighting.id}" />
				<input type="submit" value="Delete Sighting" class="btn"/>
			</form>
		</div>
	

</body>
</html>