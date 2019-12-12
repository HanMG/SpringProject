<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴</title>
</head>
<body>	
	<div class="container">
	<c:choose>
		<c:when test="${id == null }">
			<a href="${root}/member/signIn.go">회원가입</a>
			<a href="${root}/member/login.go">로그인</a>
			<a href="${root}/food/register.go">음식정보등록</a>
			<a href="${root}/food/update.go">음식정보수정</a>
			<a href="${root}/food/delete.go">음식정보삭제</a>
			<a href="${root}/food/detail.go">음식상세페이지 </a>
		</c:when>
		<c:when test="${id != null }">
			<a href="${root}/food/register.go">음식정보등록</a>
			<a href="${root}/food/update.go">음식정보수정</a>
			<a href="${root}/food/delete.go">음식정보삭제</a>
			<a href="${root}/food/detail.go">음식상세페이지 </a>
		</c:when>
	</c:choose>
	</div>
</body>
</html>