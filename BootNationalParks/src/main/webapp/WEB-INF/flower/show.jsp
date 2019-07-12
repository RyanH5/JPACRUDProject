<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h2>${flower.name}</h2>
		<img src="${flower.image}" />
		<h3>${flower.location }</h3>
		<h4>${flower.bloomingPeriod }</h4>
	</div>
	<div class="btns-container">
			<form action="goHome.do" method="GET">
				<input type="submit" value="Return Home" />
			</form>
			<form action="getUpdatedFlower.do" method="GET">
				<input type="hidden" name="wfid" value="${flower.id}" />
				<input type="submit" value="Update This Flower" />
			</form>
<%-- 			<form action="getDeletedAnimal.do" method="GET">
				<input type="hidden" name="aid" value="${animal.id}" />
				<input type="submit" value="Delete Animal" />
			</form>  --%>
		</div>

</body>
</html>