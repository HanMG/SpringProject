<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 구매 상세페이지</title>
<style type="text/css">
#content_mypage {
	margin : 10px auto;
	width: 1240px;
	overflow: hidden;
}
.title_mypage {
	width: 1000px;
	height: 50px;
	background: #F2F4EF;
	line-height: 50px;
	font-size: 30px;
	text-align: center;
}

/* 마이페이지 */
.myPage {
	width: 1000px;
	overflow: hidden;
	margin: 40px 120px;
	background: #F2F4EF;
}
.myPage > div:nth-child(n+2) {
	margin: 30px;
}
.nav_1 > div > span:nth-child(1) {
	display: inline-block;
	width: 300px;
	font-size: 35px;
	margin: 5px 0;
}
.myPage > div span:nth-child(2) {
	display: inline-block;
	width: 600px;
	font-size: 35px;
	margin: 5px 0;
}
.button {
	width: 200px;
	height: 50px;
	font-size: 23px;
}
</style>
</head>
<body>
<div id="content_mypage">
	<div class="myPage">
	<c:if test="${check > 0}">
<<<<<<< HEAD
		<h3>상품 구매가 완료되었습니다!</h3>
		<p>쿠폰명: ${couponDto.couponName}</p>
		<p>쿠폰 사용가능 기간: ${couponDto.couponStartdate}부터
			${couponDto.couponEnddate}까지</p>
		<p>결제금액: ${couponDto.couponSalerate}</p>

		<p>쿠폰 받을 번호</p>
		${purchaseDto.purchasePhone}
=======
	<div class="title_mypage">
			<span>상품 구매가 완료되었습니다!</span>
		</div>
	<div class="nav_1">
		<div>
			<img alt="쿠폰이미지" src="list.jpg">
		</div>
		<div>
			<span>쿠폰명 : </span>
			<span>${couponDto.couponName}</span>
		</div>
		<div>
			<span>쿠폰소개</span>
			<span>${couponDto.couponIntro}</span>
		</div>
		<div>
			<span>쿠폰 유효기간 : </span>
			<span>${couponDto.couponStartdate} ~ ${couponDto.couponEnddate}</span>
		</div>
		<div>
			<span>결제금액 : </span>
			<span>${couponDto.couponCostsale}</span>
		</div>
		<div>
			<span>쿠폰 받을 번호 : </span>
			<span>${purchaseDto.purchasePhone}</span>
		</div>
	</div>
>>>>>>> nth
	</c:if>
	<c:if test="${check == 0}">
		<h3>상품 구매가 완료되지 않았습니다. 처음부터 다시 시도해주세요.</h3>
		<a href="${root}/coupon/couponList.go">상품리스트 화면으로 돌아가기</a>
	</c:if>
	<% 	String memberCode = (String) session.getAttribute("memberCode");
		if(memberCode != null){ %>
	<p style="text-align: center; margin: 10px;">
		<a class="button" href="${root}/member/myPage.go">구매내역 확인</a>
	</p>
	<% 	}
		if (memberCode == null) { %>
	<p>
		<a href="${root}/member/login.go">로그인 하기</a>
	<p>
	<% } %>
	</div>
</div>
	
	
</html>
