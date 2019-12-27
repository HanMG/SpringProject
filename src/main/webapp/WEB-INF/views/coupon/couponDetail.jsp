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
.nav_5 {
	width: 900px;
	font-size: 23px;
}

.myPage button {
	float: right;
	right: 10px;
	width: 100px;
	height: 50px;
	font-size: 20px;
}
.input {
	width: 200px;
	height: 30px;
}
.button {
	height: 30px; 
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
		
		/* function couponDeleteConfirm(root, couponCode, couponName, pageNumber){
			var url = root + "/coupon/couponDelete.go?couponCode="+couponCode+"&couponName="+couponName+"&pageNumber="+pageNumber;
			var bool = confirm("정말로 삭제하시겠습니까?");
			if(bool == true){
				location.href=url;					
			}
		}
		 */
	</script>
</head>
<body>
	<!-- 관리자일 경우  -->		
	<%-- <p><a href="${root}/coupon/couponUpdate.go?couponCode=${couponDto.couponCode}&pageNumber=${pageNumber}">수정하기</a></p>
	<p><a href="javascript:couponDelete('${root}','${couponDto.couponCode}','${couponDto.couponName}','${pageNumber}')">삭제하기</a></p>
	 --%>
	<!-- 일반사용자일 경우 -->
	<%-- <p><a href="${root}/purchase/purchaseInsert.go?couponCode=${couponDto.couponCode}&purchasePhone=${purchasePhone}">구매하기</a></p> --%>
	<%-- 
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
						<input type="text" name="purchasePhone">
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
	 --%>
	<div id="content_mypage">
	<div class="myPage">
		<div class="title_mypage">
			<span>쿠폰 구매창</span>
		</div>
		<div class="nav_1">
			<div>
				<img alt="쿠폰이미지" src="list.jpg">
			</div>
			<div>
				<span>쿠폰명</span>
				<span>${couponDto.couponName}</span>
			</div>
			<div>
				<span>원가</span>
				<span>${couponDto.couponCostori}</span>
			</div>
			<div>
				<span>할인가격</span>
				<span>${couponDto.couponCostsale}</span>
			</div>
			<div>
				<span>유효기간</span>
				<span>${couponDto.couponStartdate} ~ ${couponDto.couponEnddate}</span>
			</div>
			<div>
				<span>쿠폰소개</span>
				<span>${couponDto.couponIntro}</span>
			</div>
		</div>
		<div>
			<form action="${root}/purchase/purchaseInsert.go" method="get">
				<input type="hidden" name="couponCode" value="${couponDto.couponCode}">
				<!-- <input type="hidden" name="memberCode"> -->
				<% 	
					String memberCode = (String) session.getAttribute("memberCode");
					if(memberCode != null){ 
				%>
					<div>
						<span class="nav_5"> *휴대폰번호(해당 번호로 구매한 쿠폰을 보내드립니다.)</span>
						<input class="input" type="text" name="purchasePhone">
						<input class="button" type="button" value="인증" onclick="phoneCheck()">
					</div>
					<div style="text-align: center; margin-top: 10px;">
						<input class="button" type="submit" value="구매하기" style="height: 50px; font-size: 23px; width: 100px;">
					</div>
				<% 
				} if(memberCode == null){ 	
				%>
					<p>로그인 후 구매하실 수 있습니다.</p>
					<%-- <a href="${root}/member/login.go">로그인하기</a> --%>
					<a href="#" onclick="memberCodeCheck(${memberCode})" >로그인하기</a>
					
					<script type="text/javascript">
						function memberCodeCheck(memberCode){
							if (memberCode == null) {
								alert("로그인이 필요합니다.");
								/* 리뷰 등록 모달창 숨기고, 로그인 모달창 띄우기 */
								modal.style.display = "block";
							}
						};
					</script>
				<% 
				} 
				%>
				</form>
		</div>
	</div>
</div>

</body>
</html>