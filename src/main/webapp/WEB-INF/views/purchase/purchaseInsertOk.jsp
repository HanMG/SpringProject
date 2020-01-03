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
	width: 800px;
	height: 50px;
	line-height: 50px;
	font-size: 30px;
	text-align: center;
	padding-top: 20px;
}

/* 마이페이지 */
.myPage {
	width: 800px;
	overflow: hidden;
	margin: 70px 220px;
	box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 10px;
	background: white;
}
.myPage > div:nth-child(n+2) {
	margin: 30px;
}
.ok_nav_1 > div > span:nth-child(1) {
	display: inline-block;
	width: 200px;
	font-size: 18px;
	margin: 5px 0;
}
.myPage > div span:nth-child(2) {
	display: inline-block;
	width: 500px;
	font-size: 15px;
	margin: 5px 0;
}
.button {
	width: 200px;
	height: 50px;
	font-size: 16px;
}
</style>
</head>
<body>
<div id="content_mypage">
	<div class="myPage">
	<c:if test="${check > 0}">
	<div class="title_mypage">
			<span>상품 구매가 완료되었습니다!</span>
		</div>
	<div class="ok_nav_1">
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
			<span>${couponDto.couponCostsale}원</span>
		</div>
		<div>
			<span>쿠폰 받을 번호 : </span>
			<span>${purchaseDto.purchasePhone}</span>
		</div>
	</div>
	</c:if>
	<c:if test="${check == 0}">
		<h3>상품 구매가 완료되지 않았습니다. 처음부터 다시 시도해주세요.</h3>
		<a href="${root}/coupon/couponList.go">상품리스트 화면으로 돌아가기</a>
	</c:if>
	<% 	String memberCode = (String) session.getAttribute("memberCode");
		if(memberCode != null){ %>
	<p style="text-align: center; margin: 10px 0 20px 0;">
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
