<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
	<head>
		<meta charset="UTF-8">
		<title>쿠폰 상세페이지</title>
		<style type="text/css">
			* {
				margin: 0;
				padding: 0;
			}
			a {
				text-decoration: none;
			}
			#content {
				margin : 10px auto;
				width: 1240px;
				overflow: hidden;
			}
			.history {
				width: 800px;
				overflow: hidden;
				margin: 220px;
				background: olive;
			}
			.title {
				width: 800px;
				height: 50px;
				background: tomato;
				line-height: 50px;
				font-size: 30px;
				border-bottom: 1px dotted;
			}
			.eat {
				width: 800px;
				overflow: hidden;
				background: skyblue;
			}
			.eat > div {
				width: 600px;
				margin: 10px 100px;
			}
			.img > img{
				width: 600px;
				height: 500px;
			}
			.eat > div > button {
				width: 600px;
				height: 50px;
			}
		</style>
		<script type="text/javascript">
			function phoneCheck(){
				confirm("휴대폰 인증되었습니다.");
			}
			
			function couponDelete(root, couponCode, couponName, pageNumber){
				var url = root + "/coupon/couponDelete.go?couponCode="+couponCode+"&couponName="+couponName+"&pageNumber="+pageNumber;
				open(url, "", "width= 500, height=500, scrollbars=yes");
			}
		</script>
	</head>
	<body>
		<!-- 관리자일 경우  -->		
		<p><a href="${root}/coupon/couponUpdate.go?couponCode=${couponDto.couponCode}&pageNumber=${pageNumber}">수정하기</a></p>
		<p><a href="javascript:couponDelete('${root}','${couponDto.couponCode}','${couponDto.couponName}','${pageNumber}')">삭제하기</a></p>
		
		<!-- 일반사용자일 경우 -->
		<%-- <p><a href="${root}/purchase/purchaseInsert.go?couponCode=${couponDto.couponCode}&purchasePhone=${purchasePhone}">구매하기</a></p> --%>
		<div id="content">
			<div class="history">
				<div class="title">
					<span>쿠폰 구매창</span>
				</div>
				<div class="eat">
					<div class="img">
						<img alt="쿠폰이미지" src="list.jpg">
					</div>
					<div>
						<span>쿠폰명: ${couponDto.couponName}</span>
					</div>
					<div>
						<span>원가: ${couponDto.couponCostori}</span>
					</div>
					<div>
						<span>할인가격: ${couponDto.couponCostsale}</span>
					</div>
					<div>
						<span>사용가능기간: ${couponDto.couponStartdate}부터 ${couponDto.couponEnddate} 까지</span>
					</div>
					<div>
						<span>쿠폰소개: ${couponDto.couponIntro}</span>
					</div>
					
					<form action="${root}/purchase/purchaseInsert.go" method="get">
					<input type="hidden" name="couponCode" value="${couponDto.couponCode}">
					<!-- <input type="hidden" name="memberCode"> -->
					<% 	
						String memberCode = (String) session.getAttribute("memberCode");
						if(memberCode != null){ 
					%>
						<div>
							<span> *휴대폰번호(해당 번호로 구매한 쿠폰을 보내드립니다.)</span>
							<input type="text" name="purchasePhone" maxlength="11">
							<input type="button" value="인증" onclick="phoneCheck()">
						</div>
						<div>
							<input type="submit" value="구매하기">
						</div>
					<% 
					} if(memberCode == null){ 	
					%>
						<p>로그인 후 구매하실 수 있습니다.</p>
						<a href="${root}/member/login.go">로그인하기</a>
					<% 
					} 
					%>
					</form>
				</div>
			</div>
		</div>
	
	</body>
	
</html>