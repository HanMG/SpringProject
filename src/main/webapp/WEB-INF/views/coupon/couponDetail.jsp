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
		pageNumber: ${pageNumber}
		<%-- <img alt="쿠폰이미지" src= "${path}" + "${couponDto.imageName}"> --%>
		<p>쿠폰제목: ${couponDto.couponName}</p>
		<p>쿠폰가격: ${couponDto.couponCostori}</p>
		<p>쿠폰할인율: ${couponDto.couponCostsale}</p>
		<p>쿠폰할인가: ${couponDto.couponSalerate}</p>
		<p>음식점 이름: ${couponDto.foodName}</p>
		<p>쿠폰 사용가능 기간: ${couponDto.couponStartdate}부터 ${couponDto.couponEnddate}까지</p>
		<p>쿠폰내용: ${couponDto.couponIntro}</p>
		
		<!-- 관리자일 경우  -->		
		<p><a href="${root}/coupon/couponUpdate.go?couponCode=${couponDto.couponCode}&pageNumber=${pageNumber}">수정하기</a></p>
		<p><a href="javascript:couponDelete('${root}','${couponDto.couponCode}','${couponDto.couponName}','${pageNumber}')">삭제하기</a></p>
		
		
		<!-- 일반사용자일 경우 -->
		<form action="${root}/purchase/purchaseInsert.go" method="post">
			<input type="hidden" name="couponCode">
			<!-- <input type="hidden" name="memberCode"> -->
			
			<input type="text" name="purchasePhone">
			<input type="button" value="인증" onclick="phoneCheck()">
			
			<p><input type="submit" value="구매하기"></p>
		</form>
		<%-- <p><a href="${root}/purchase/purchaseInsert.go?couponCode=${couponDto.couponCode}&purchasePhone=${purchasePhone}">구매하기</a></p> --%>
	</body>
	
</html>