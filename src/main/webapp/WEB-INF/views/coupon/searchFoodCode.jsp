<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
	<head>
		<meta charset="UTF-8">
		<title>식당코드 검색</title>
		<script type="text/javascript" src="${root}/resources/javascript/coupon.js"></script>
	</head>
	<body>
		<form action="${root}/coupon/foodcodeRead.go" method="get">
			<div>
				<input type="text" name="foodName">
				<input type="submit" value="검색">
			</div>
		</form>
		<ul>
			<c:if test="${foodCodeList.size() == 0}">
				<li>검색결과가 없습니다.</li>
			</c:if>
			<c:if test="${foodCodeList.size() > 0}">
				<li>
					<a href="javascript:sendFoodCode('${foodCodeList.food_code}}','${foodCodeList.food_name}}','${foodCodeList.food_addr}}')">
						${foodCodeList.food_code},
						${foodCodeList.food_addr}
					</a>
				</li>
			</c:if>
			
		</ul>
		
	</body>
</html>