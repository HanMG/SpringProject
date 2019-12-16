<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
	<head>
		<meta charset="UTF-8">
		<title>쿠폰 상세페이지</title>
		<script type="text/javascript">
			function phoneCheck(){
				alert("휴대폰 인증되었습니다.");
			}
			
			function couponUpdate(root, obj){
				var url= root+"/coupon/couponUpdate.go?couponCode="+couponCode;
				alert(url);
				location.href=url;
			}
		</script>
	</head>
	<body>
		<p>${couponDto.imageName}</p>
		<img alt="쿠폰이미지" src="${couponDto.imagePath}">
		<p>쿠폰제목: ${couponDto.couponName}</p>
		<p>쿠폰가격: ${couponDto.couponCostori}</p>
		<p>쿠폰할인율: ${couponDto.couponCostsale}</p>
		<p>쿠폰할인가: ${couponDto.couponSalerate}</p>
		<p>음식점 이름: ${a}</p>
		<p>쿠폰 사용가능 기간: ${couponDto.couponStartdate}부터 ${couponDto.couponEnddate}까지</p>
		<p>쿠폰내용: ${couponDto.couponIntro}</p>
		
		<input type="text" name="phone">
		<input id="phoneCheck" type="button" value="인증" onclick="phoneCheck()">
		
		<!-- 관리자일 경우  -->		
		<p><a href="couponUpdate('${root}','${couponDto.couponCode}')">수정하기</a></p>
		<p><a href="couponDelete('${root}','${couponDto.couponCode}')">삭제하기</a></p>
		
		<!-- 일반사용자일 경우 -->
		<p><a href="purchase()">구매하기</a></p>
	</body>
	
</html>