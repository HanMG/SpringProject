<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴</title>
<style type="text/css">
</style>
</head>
<body>	

	<div class="container">
<%-- 
		<a href="${root}/coupon/couponInsert.go">상품등록</a>
		<a href="${root}/coupon/couponList.go">상품리스트</a>
		<a href="${root}/search.go">검색</a>
		<a href="${root}/food/list.go">음식점 리스트</a>
		<a href="${root}/food/read.go?foodCode=food0472">음식상세페이지 </a>			
		<a href="${root}/review/read.go?reviewCode=review0011">리뷰상세페이지</a>	
		<a href="${root}/purchase/purchaseList.go">구매내역</a>
		
		
	<c:choose>
		<c:when test="${memberCode == null }">
			<a href="${root}/member/login.go">로그인</a>
			<a href="${root}/member/signIn.go">회원가입</a>
		</c:when>
		<c:when test="${memberCode != null }">
			<a href="${root}/member/logout.go">로그아웃</a>
			<a href="${root}/member/myPage.go">마이페이지</a>
			<a href="${root}/food/insert.go">음식정보등록</a>
			<a href="${root}/food/update.go?foodCode=food0472">음식정보수정</a>
			<a href="${root}/food/insert.go">음식정보등록</a>
			<a href="${root}/coupon/couponInsert.go">상품등록</a>
			<a href="${root}/food/update.go?foodCode=food0468">음식정보수정</a>
			<a href="${root}/food/delete.go?foodCode=food0467">음식정보삭제</a>			
			<a href="${root}/review/update.go?reviewCode=review0011">리뷰수정</a>
			<a href="${root}/review/delete.go?reviewCode=review0041">리뷰삭제</a>
			
		</c:when>
		<c:when test="${memberCode != null }">
			<a href="${root}/member/logout.go">로그아웃</a>
			<a href="${root}/member/myPage.go">마이페이지</a>
			<a href="${root}/purchase/purchaseList.go">구매내역</a>
			${memberCode}
		</c:when>
	</c:choose> --%>
	</div>
	
	
</body>
</html>