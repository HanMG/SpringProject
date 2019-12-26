<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
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
	border-bottom: 1px dotted;
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
form span {
	display: inline-block;
	width: 300px;
	font-size: 35px;
	margin: 5px 0;
}
form input {
	width: 400px;
	height: 30px;
	font-size: 32px;
}
.input {
	width: 200px;
}
.button {
	width: 200px;
	height: 50px;
}
</style>
</head>
<body>
	<div id="content_mypage">
		<div class="myPage">
			<div class="title_mypage">
				<span>쿠폰 결제창</span>
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
					<span>음식점 이름: </span>
					<span>${couponDto.foodName}</span>
				</div>
				<div>
					<span>쿠폰 유효기간: </span>
					<span>${couponDto.couponStartdate} ~ ${couponDto.couponEnddate}</span>
				</div>
				<div>
					<span>쿠폰가격: </span>
					<span>${couponDto.couponCostori}</span>
				</div>
				<div>
					<span>쿠폰할인율: </span>
					<span>${couponDto.couponSalerate}</span>
				</div>
				<div>
					<span>쿠폰할인가: </span>
					<span>${couponDto.couponCostsale}</span>
				</div>
				<div>
					<span>결제금액: </span>
					<span>${couponDto.couponCostsale}</span>
				</div>
			</div>
			<div>
			<!-- 결제 -->
				<form action="${root}/purchase/purchaseInsertOk.go" method="post">
					<input type="hidden" name="couponCode" value="${couponDto.couponCode}">
					<input type="hidden" name="memberCode" value="${memberCode}">
					<input type="hidden" name="purchasePhone" value="${purchasePhone}">
					<input type="hidden" name="purchaseCost" value="${couponDto.couponCostsale}">
					<div>
						<span>구매자 정보</span>
						<input class="input" type="text" value="${memberDto.memberName}" disabled>
						<input type="text" value="${memberDto.memberMail}" disabled>
					</div>
					<div>
						<span>쿠폰 받을 번호</span>
						<input class="input" type="text" name="purchasePhone" value="${purchasePhone}" disabled>
					</div>
					<div style="text-align: center; margin-top: 10px">
						<input class="button" type="submit" value="결제하기">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
