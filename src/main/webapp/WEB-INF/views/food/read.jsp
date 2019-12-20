<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${root}/resources/css/food/read.css" />
<script src="${root}/resources/xhr.js"></script>
<meta charset="UTF-8">
<title>음식점상세페이지</title>
<script>
	function favorite(x) {
		if (x.className === "fa fa-heart-o") {
			x.className = "fa fa-heart";
		} else {
			x.className = "fa fa-heart-o";
		}
	}
	function reviewList(root, selScore) {
		let url = root + "/food/foodReviewList.go";
		let params = "foodCode=${foodDto.foodCode}&selScore="+selScore;		
		sendRequest("GET", url, fromServer, params);
	}	
	function fromServer() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			let reviewDisplay = document.getElementById("review");
			reviewDisplay.innerHTML = xhr.responseText;
		}
	}
</script>
<style>
div.scrollmenu {	
	overflow: auto;
	white-space: nowrap;
}

div.scrollmenu a {
	display: inline-block;	
	text-align: center;
	padding: 14px;
	text-decoration: none;
}

div.scrollmenu a:hover {
	background-color: #777;
}
</style>
</head>
<body onload="reviewList('${root}','0')">
	<div id="content">
		<div class="nav_1">
			<div class="info_1">
				<span>${foodDto.foodName}</span> <c:if test="${reviewAvg != 0 }"><span>별점${reviewAvg}</span></c:if>
				<div>
					<a href="${root}/review/insert.go?foodCode=${foodDto.foodCode}"><i
						class="fa fa-pencil-square-o"></i><br /></a> <span>리뷰쓰기</span>
				</div>
				<div>
					<i onclick="favorite(this)" class="fa fa-heart-o"></i><br /> <span>가고싶다</span>
				</div>
			</div>
			<div class="info_2">
				<span>조회수 ${foodDto.foodRead }</span> <span>리뷰수
					${reviewCountDto.whole}</span> <span>즐겨찾기</span>
			</div>
			<div class="info_3">
				<div>
					<span>주소</span> <span>${foodDto.foodAddr}</span>
				</div>
				<div>
					<span>전화번호</span> <span>${foodDto.foodPhone}</span>
				</div>
				<div>
					<span>음식종류</span> <span>${foodDto.foodKind}</span>
				</div>
				<div>
					<span>대표음식</span> <span>${foodDto.foodMenu} </span>
				</div>
				<div>
					<span>영업시간</span> <span>${foodDto.foodTime}</span>
				</div>
				<div>
					<span>휴일</span> <span>${foodDto.foodBreak}요일</span>
				</div>
				<div>
					<span>업데이트</span> <span><fmt:formatDate
							value="${foodDto.foodDate}" pattern="yyyy-MM-dd" /></span>
				</div>
			</div>
			<!-- 쿠폰 공간 -->
			<c:if test="${couponDtoList != null}">
				<div class="coupon">
					<div class="eat_1">
						<span>EAT딜</span>
					</div>
					<div class="eat_2">
						<div>
							<span>할인된 가격으로 인기 메뉴를 맛볼 수 있는 기회!</span>
						</div>
						<div class="scrollmenu">
							<c:forEach var="couponDto" items="${couponDtoList}">
							<a href="${root}/coupon/couponRead.go?couponCode=${couponDto.couponCode}&pageNumber=1">
								<img alt="쿠폰이미지"
									src="${root}/resources/ftp/${couponDto.imageName}">
								<p>쿠폰명 ${couponDto.couponName}</p>
								<span>할인율 ${couponDto.couponSalerate}</span> <span>원가격
									${couponDto.couponCostori}</span> <span>할인가격
									${couponDto.couponCostsale}</span>
							</a>
						</c:forEach>
						</div>						
					</div>
				</div>
			</c:if>

			<!-- 리뷰 공간 -->
			<div id="review"></div>
		</div>
		<div class="nav_2">
			<div class="img">
				<c:choose>
					<c:when test="${foodDto.foodStatus == '완료'}">
						<img src="${root}/resources/ftp/${imageDto.imageName}" alt=""
							style="width: 400px;" />
					</c:when>
					<c:when test="${foodDto.foodStatus == '검토중'}">
						<h3>검토중입니다.</h3>
					</c:when>
				</c:choose>
			</div>
			<div class="map"></div>
		</div>
	</div>
</body>
</html>