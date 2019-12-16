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
		<a href="${root}/coupon/couponInsert.go">상품등록</a>
		<a href="${root}/coupon/couponList.go">상품리스트</a>
		<a href="${root}/coupon/couponUpdate.go">상품수정</a>
		
	<c:choose>
		<c:when test="${id == null }">
			<a href="${root}/member/signIn.do">회원가입</a>
			<a href="${root}/member/login.do">로그인</a>
		</c:when>
		<c:when test="${id != null }">
			<a href="${root}/fileBoard/write.do">파일 글쓰기</a>
			<a href="${root}/fileBoard/list.do">파일 글목록</a>
			<br />
			<br />
			<a href="${root}/guest/write.do">방명록</a>
			<br />
			<br />
			<a href="${root}/board/write.do">글쓰기</a>
			<a href="${root}/board/list.do">글목록</a>
			<br />
			<br />
			<a href="${root}/member/logout.do">로그아웃</a>
			<a href="${root}/member/update.do">회원수정</a>
			<a href="${root}/member/dropOut.do">탈퇴</a>
		</c:when>
	</c:choose>
	</div>
</body>
</html>