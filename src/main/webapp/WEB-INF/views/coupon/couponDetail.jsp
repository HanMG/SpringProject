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
.cou_nav_1 img {
	width: 100%;
	height: 100%;
}
.cou_nav_1 > div:first-child{
	margin-bottom: 10px;
}

.cou_nav_1 > div > span:nth-child(1) {
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
.nav_5 {
	width: 700px;
	font-size: 18px;
}


.myPage button {
	float: right;
	right: 10px;
	width: 100px;
	height: 50px;
	font-size: 23px;
}
.input {
	width: 200px;
	height: 30px;
}
.button {
	height: 30px; 
}

.phone_input {
	display: block;
	margin: 10px auto 0;
}


</style>
	<script type="text/javascript">
		function purchaseForm(obj){
			if(obj.purchasePhone.value == ""){
				alert("휴대폰 번호를 입력해주세요.");
				obj.purchasePhone.focus();
				return false;
			}
		}
		
		function couponDelete(root, couponCode, couponName, pageNumber){
			var url = root + "/coupon/couponDelete.go?couponCode="+couponCode+"&couponName="+couponName+"&pageNumber="+pageNumber;
			open(url, "", "width= 500, height=500, scrollbars=yes");
		}
		
		function inputPhone(obj){
			var num = obj.value.replace(/[^0-9]/g,"");
			var phone = "";
			
			if(num.length < 9){
				alert("휴대폰 번호를 올바르게 입력해주세요.")
				obj.focus();
				return false;
			}
			else if(num.length > 11){
				alert("11자리 이내로 입력해주세요.")
				obj.focus();
				return false;
			} 
			
			if(num.length <= 11){
				phone += num.substr(0,3);
				phone += "-";
				phone += num.substr(3,4);
				phone += "-";
				phone += num.substr(7);
			} else if(num.length == 10){
				phone += num.substr(0,3);
				phone += "-";
				phone += num.substr(3,3);
				phone += "-";
				phone += num.substr(7);
			}
			
			obj.value = phone;									
		}
	</script>
</head>
<body>
	<div id="content_mypage">
	<div class="myPage">
		<div class="title_mypage">
			<span>쿠폰 상세페이지</span>
		</div>
		<div class="cou_nav_1">
			<div>
				<img alt="쿠폰이미지" src="/jeju/resources/ftp/${couponDto.imageName}">
			</div>
			<div>
				<span>쿠폰명</span>
				<span>${couponDto.couponName}</span>
			</div>
			<div>
				<span>원가</span>
				<span>${couponDto.couponCostori}원</span>
			</div>
			<div>
				<span>할인가격</span>
				<span>${couponDto.couponCostsale}원</span>
			</div>
			<div>
				<span>유효기간</span>
				<span>${couponDto.couponStartdate}부터 ${couponDto.couponEnddate}까지 사용가능</span>
			</div>
			<div>
				<span>쿠폰소개</span>
				<span>${couponDto.couponIntro}</span>
			</div>
		</div>
		<div>
		     <form action="${root}/purchase/purchaseInsert.go" method="get" onsubmit="return purchaseForm(this)">
				<input type="hidden" name="couponCode" value="${couponDto.couponCode}">
				<% 	
					String memberCode = (String) session.getAttribute("memberCode");
					if(memberCode != null){ 
				%>
				
					<div style="text-align: center;">
						<span class="nav_5"> *휴대폰 번호를 입력해주세요.<span style="font-size: 14px;"></span></span>
						<input class="input phone_input" type="text" name="purchasePhone" onChange="inputPhone(this)">
					</div>
					<div style="text-align: center; margin-top: 10px;">
						<input class="button" type="submit" value="구매하기" style="height: 50px; font-size: 16px; width: 100px;">
					
					</div>
				<% 
				} if(memberCode == null){ 	
				%>
					<p>로그인 후 구매하실 수 있습니다.</p>
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