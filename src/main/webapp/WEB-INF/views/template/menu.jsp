<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴</title>
<style>
	.container{
		width: 300px; 
		margin : 0 auto;
	}
</style>
</head>
<body>	
	<div class="container">
	<c:choose>
		<c:when test="${check == null }">
			<a href="${root}/member/login.do">로그인</a>
			<a href="${root}/member/signIn.do">회원가입</a>
		</c:when>
		<c:when test="${check != null }">
			<a href="${root}/member/logout.do">로그아웃</a>
			<a href="${root}/member/myPage.do">마이페이지</a>
		</c:when>
	</c:choose>
	</div>
</body>
</html>