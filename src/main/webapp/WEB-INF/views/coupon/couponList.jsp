<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
	<head>
		<meta charset="UTF-8">
		<title>기프티콘 리스트</title>
	</head>
	<body>
		<!-- 검색 했을 경우 : 템플릿 들어갈 것-->
		<div>
			<h3>[${검색어}]로 검색한 결과입니다.</h3>
		</div>
	
		<!-- 판매 중인 쿠폰 없을 경우  -->
		<c:if test="${count == 0}">
			<div>
				<p>판매중인 쿠폰이 없습니다</p>
			</div>
		</c:if>
		
		
		<!-- 판매 중인 쿠폰 리스트 불러오기  -->
		<c:if test="${count > 0}">
		<ul>
			<c:forEach begin="0" end="{b}" step="1">
				<li>
					<a href="#">${a}</a>
				</li>
			</c:forEach>
		</ul>
		</c:if>
	</body>
</html>