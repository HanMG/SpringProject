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
	</script>
</head>
<body>
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
			<div class="review">
				<div class="re_1">
					<span>리뷰(숫자)</span>
					<span>별로(숫자)</span>
					<span>괜찮다(숫자)</span>
					<span>맛있다(숫자)</span>
					<span>전체(숫자)</span>
				</div>
				<div class="re_2">
					<div>
						<span>이름(닉)</span>
					</div>
					<div>
						<span>작성일</span>
						<span>친구가 왕추천한 피스타치오맛은 찐이다. 고소한맛 좋아하는 사람들은 무조건 좋아할 수 밖에 없는 맛!!소금과 쌀은 생각처럼 은은했고 백향과는 상콤한 맛을 잘 살렸다. 가격도 부담없고 맛도 좋고 보기에도 좋아서 바글바글 할 수 밖에 없는듯 :)</span>
						<img alt="이미지" src="list.jpg">
						<img alt="이미지" src="list.jpg">
						<img alt="이미지" src="list.jpg">
					</div>
					<div>
						<img alt="별점" src="icon.PNG">
						<span>별점(5)</span>
					</div>
				</div>
				<div class="re_2">
					<div>
						<span>이름(닉)</span>
					</div>
					<div>
						<span>작성일</span>
						<span>친구가 왕추천한 피스타치오맛은 찐이다. 고소한맛 좋아하는 사람들은 무조건 좋아할 수 밖에 없는 맛!!소금과 쌀은 생각처럼 은은했고 백향과는 상콤한 맛을 잘 살렸다. 가격도 부담없고 맛도 좋고 보기에도 좋아서 바글바글 할 수 밖에 없는듯 :)</span>
						<img alt="이미지" src="list.jpg">
						<img alt="이미지" src="list.jpg">
						<img alt="이미지" src="list.jpg">
					</div>
					<div>
						<img alt="별점" src="icon.PNG">
						<span>별점(5)</span>
					</div>
				</div>
				<div class="re_2">
					<div>
						<span>이름(닉)</span>
					</div>
					<div>
						<span>작성일</span>
						<span>친구가 왕추천한 피스타치오맛은 찐이다. 고소한맛 좋아하는 사람들은 무조건 좋아할 수 밖에 없는 맛!!소금과 쌀은 생각처럼 은은했고 백향과는 상콤한 맛을 잘 살렸다. 가격도 부담없고 맛도 좋고 보기에도 좋아서 바글바글 할 수 밖에 없는듯 :)</span>
						<img alt="이미지" src="list.jpg">
						<img alt="이미지" src="list.jpg">
						<img alt="이미지" src="list.jpg">
					</div>
					<div>
						<img alt="별점" src="icon.PNG">
						<span>별점(5)</span>
					</div>
				</div>
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