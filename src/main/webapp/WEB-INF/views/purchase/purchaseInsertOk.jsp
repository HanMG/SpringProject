<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 구매 상세페이지</title>
</head>
<body>
	<c:if test="${check > 0}">
		<h3>상품 구매가 완료되었습니다!</h3>
		<p>쿠폰명: ${couponDto.couponName}</p>
		<p>쿠폰 사용가능 기간: ${couponDto.couponStartdate}부터
			${couponDto.couponEnddate}까지</p>
		<p>결제금액: ${couponDto.couponSalerate}</p>

		<p>쿠폰 받을 번호</p>
		${purchaseDto.purchasePhone}
	</c:if>
	<c:if test="${check == 0}">
		<h3>상품 구매가 완료되지 않았습니다. 처음부터 다시 시도해주세요.</h3>
		<a href="${root}/coupon/couponList.go">상품리스트 화면으로 돌아가기</a>
	</c:if>
	<% 	String memberCode = (String) session.getAttribute("memberCode");
		if(memberCode != null){ %>
	<p>
		<a href="${root}/purchase/purchaseList.go?memberCode=${memberCode}">구매내역 확인</a>
	</p>
	<% 	}
		if (memberCode == null) { %>
	<p>
		<a href="${root}/member/login.go">로그인 하기</a>
	<p>
	<% } %>
	
</html>
