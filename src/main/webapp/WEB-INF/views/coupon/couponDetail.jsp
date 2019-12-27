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
			function purchaseForm(obj){
				if(obj.purchasePhone.value==""){
					alert("휴대폰 번호를 인증해주세요.");
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
				} else if(num.length > 11){
					alert("11자리 이내로 입력해주세요.")
					obj.focus();
					return false;
				} else if(num.length < 9){
					alert("휴대폰 번호를 올바르게 입력해주세요.")
					obj.focus();
					return false;
				}
				obj.value = phone;									
			}
		
		</script>
</head>
<body>
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
					</div>
					<div style="text-align: center; margin-top: 10px;">
						<input class="button" type="submit" value="구매하기" style="height: 50px; font-size: 23px; width: 100px;">
					</div>
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