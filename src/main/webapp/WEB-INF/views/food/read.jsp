<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${root}/resources/css/food/read.css" />
<script src="${root}/resources/xhr.js"></script>
<meta charset="UTF-8">
<title>음식점상세페이지</title>
	<script>
		function favorite(x) {
			if(x.className === "fa fa-heart-o"){
				x.className = "fa fa-heart";				
			}else{
				x.className = "fa fa-heart-o";
			}			
		}	
		function load(root){
			let url = root+"/food/foodReviewList.go"
			let param = "foodCode=${foodDto.foodCode}";
			alert(param);
			//sendRequest("GET", url , fromServer, params);
		}
		function fromServer(){
			if(xhr.readyState == 4 && xhr.status == 200){			
				let resultDisplay = document.getElementById("review");
				resultDisplay.innerHTML = xhr.responseText;				
			}
		}
	</script>
</head>
<body onload="load('${root}')">
	<div id="content">
		<div class="nav_1">
			<div class="info_1">
				<span>${foodDto.foodName}</span>
				<span>별점</span>
				<div>
					<a href="${root}/review/insert.go?foodCode=${foodDto.foodCode}"><i class="fa fa-pencil-square-o"></i><br /></a>
					<span>리뷰쓰기</span>
				</div>
				<div>
					<i onclick="favorite(this)" class="fa fa-heart-o"></i><br />
					<span>가고싶다</span>
				</div>
			</div>
			<div class="info_2">
				<span>조회수 ${foodDto.foodRead }</span>
				<span>리뷰수</span>
				<span>즐겨찾기</span>
			</div>
			<div class="info_3">
				<div>
					<span>주소</span>
					<span>${foodDto.foodAddr}</span>
				</div>
				<div>
					<span>전화번호</span>
					<span>${foodDto.foodPhone}</span>
				</div>
				<div>
					<span>음식종류</span>
					<span>${foodDto.foodKind}</span>
				</div>
				<div>
					<span>대표음식</span>
					<span>${foodDto.foodMenu} </span>
				</div>
				<div>
					<span>영업시간</span>
					<span>${foodDto.foodTime}</span>
				</div>
				<div>
					<span>휴일</span>
					<span>${foodDto.foodBreak}요일</span>
				</div>
				<div>
					<span>업데이트</span>
					<span><fmt:formatDate value="${foodDto.foodDate}" pattern="yyyy-MM-dd" /></span>
				</div>
			</div>
			<div class="coupon">
				<div class="eat_1">
					<span>EAT딜</span>
				</div>
				<div class="eat_2">
					<div>
						<span>할인된 가격으로 인기 메뉴를 맛볼 수 있는 기회!</span>
					</div>
					<div>
						<img alt="음식" src="list.jpg">
						<div>쿠폰명</div>
						<span>할인율</span>
						<span>원가격</span>
						<span>할인가격</span>
					</div>
					<div>
						<img alt="음식" src="list.jpg">
						<div>쿠폰명</div>
						<span>할인율</span>
						<span>원가격</span>
						<span>할인가격</span>
					</div>
				</div>
			</div>
			<div id="review">				
			
			</div>
		</div>
		<div class="nav_2">
			<div class="img">
				<img src="${root}/resources/ftp/${imageDto.imageName}" alt="" style="width:400px;"/>
			</div>
			<div class="map"></div>
		</div>
	</div>
</body>
</html>