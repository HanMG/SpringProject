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
.purchase_nav_1 > div > span:nth-child(1) {
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

form span {
	display: inline-block;
	width: 200px;
	font-size: 18px;
	margin: 5px 0;
}
form input {
	width: 300px;
	height: 30px;
	font-size: 15px;
	border: none;
}
.input {
	width: 200px;
}
.button {
	width: 200px;
	height: 50px;
}

.purchase_nav_1 img {
	width: 100%;
	height: 100%;
}
.purchase_nav_1 > div:first-child{
	margin-bottom: 10px;
}

</style>
</head>
<body>
	<div id="content_mypage">
		<div class="myPage">
			<div class="title_mypage">
				<span>쿠폰 결제창</span>
			</div>
			<div class="purchase_nav_1">
				<div>
					<img alt="쿠폰이미지" src="/jeju/resources/ftp/${couponDto.imageName}">
				</div>
				<div>
					<span>쿠폰명</span>
					<span>${couponDto.couponName}</span>
				</div>
				<div>
					<span>음식점 이름</span>
					<span>${couponDto.foodName}</span>
				</div>
				<div>
					<span>쿠폰 유효기간</span>
					<span>${couponDto.couponStartdate} ~ ${couponDto.couponEnddate}</span>
				</div>
				<div>
					<span>쿠폰가격</span>
					<span>${couponDto.couponCostori}</span>
				</div>
				<div>
					<span>쿠폰할인율</span>
					<span>${couponDto.couponSalerate}</span>
				</div>
				<div>
					<span>쿠폰할인가</span>
					<span>${couponDto.couponCostsale}</span>
				</div>
				<div>
					<span>결제금액</span>
					<span>${couponDto.couponCostsale}</span>
				</div>
			</div>
			<div>
			<!-- 결제 -->
				<form action="${root}/purchase/kakaoPay.go" method="post">
				<%-- <form action="${root}/purchase/purchaseInsertOk.go" method="post"> --%>
					<input type="hidden" name="couponCode" value="${couponDto.couponCode}">
					<input type="hidden" name="memberCode" value="${memberCode}">
					<input type="hidden" name="memberMail" value="${memberDto.memberMail}">
					<input type="hidden" name="purchasePhone" value="${purchasePhone}">
					<input type="hidden" name="couponName" value="${couponDto.couponName}">
					<input type="hidden" name="foodName" value="${couponDto.foodName}">
					<input type="hidden" name="couponCostsale" value="${couponDto.couponCostsale}">
					<div>
						<span>구매자 정보</span>
						<input style="background-color:transparent;" name="" class="input" type="text" value="${memberDto.memberName}" disabled>
						<input type="hidden" name="memberName" value="${memberDto.memberName}">
						<input style="background-color:transparent;" name="" type="text" value="${memberDto.memberMail}" disabled>
						<input type="hidden" name="memberMail" value="${memberDto.memberMail}">
					</div>
					<div>
						<span>쿠폰 받을 번호</span>
						<input style="background-color:transparent;" class="input" type="text" name="purchasePhone" value="${purchasePhone}" disabled>
						<input type="hidden" name="memberMail" value="${memberDto.memberMail}">
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
