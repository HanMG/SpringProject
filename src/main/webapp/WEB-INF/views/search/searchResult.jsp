<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
   	border-bottom: 1px dotted;
}
/* 검색 순위, 필터, 가게 리스트 */
.nav_1 {
	width: 740px;
	/* 임시 높이 설정  */
	height: 800px;
	background: tomato;
	float: left;
	margin: 0 30px;
}
/* 지도 */
.nav_2 {
	width: 440px;
	/* 임시 높이 설정  */
	height: 800px;
	background: olive;
	float: left;
}
/* 인기검색, 필터 */
.filter {
	width: 740px;
	height: 50px;
	background: green;
}
/* 인기검색 */
.filter > span {
	text-align: left;
    color: #ff792a;
    font-size: 24px;
    height: 50px;
    line-height: 50px;
}
/* 필터 */
.filter > a {
	float: right;
	height: 50px;
	line-height: 50px;
	color: #9b9b9b;
	margin-right: 10px;
	font-size: 24px;
}
/* 가게 리스트 */
.list {
	width: 350px;
	height: 300px;
	float: left;
	background: orange;
	margin: 10px;
}
/* 가게 이미지 */
.list img {
	width: 350px;
	height: 200px;
}
.map {
	width: 420px;
	margin: 10px;
	background: skyblue;
	height: 300px;
}
.abc {
	width: 400px;
	margin: 5px 20px;
	background: maroon;
	height: 150px;
}
</style>
</head>
<body>

<div id="content">
	<div class="nav_1">
		<div class="filter">
			<span>${keyword} 맛집 인기 검색 순위</span>
			<a href="#">필터</a>
		</div>
		
		<!-- 검색 결과가 없는 경우  -->
		<c:if test="${foodCount == 0}">
			<div>
				<p>검색된 음식점이 없습니다.</p>
			</div>
		</c:if>
		
		<!-- 검색된 음식점 리스트 불러오기  -->
		<c:if test="${foodCount > 0}">
		<c:forEach var = "searchFoodDto" items="${foodList}">
		<div class="list">
			<a href="#"><img alt="음식 이미지" src="${searchFoodDto.imageName}"></a>
			<div>
				<span>${searchFoodDto.foodName}</span>
				<span>${searchFoodDto.reviewScore}</span>
			</div>
			<div>
				<span>${searchFoodDto.foodArea}</span> -
				<span>${searchFoodDto.foodKind}</span>
			</div>
			<div>
				<span>${searchFoodDto.foodRead}</span>
				<span>${searchFoodDto.reviewCount}</span>
			</div>
		</div>
		</c:forEach>
		</c:if>
	</div>
	
	
	<div class="nav_2">
		<div class="map"></div>
		
		<c:if test="${couponCount > 0}">
		<c:forEach var = "couponDto" items="${couponList}">
		<div class="abc">
			<span>${couponDto.couponName}</span>
			<span>${couponDto.foodName}</span>
			<span>${couponDto.foodMenu}</span>
		</div>
		</c:forEach>
		</c:if>
	</div>
</div>


		
		<div>
			<h4>필터</h4>
			<label>조회 기준</label>
			<select>
				<option value="">평점순(평점)</option>
				<option value="">인기순(조회)</option>
			</select>
			<label>음식점 지역</label>
			<select>
				<option value="">제주시</option>
				<option value="">서귀포시</option>
			</select>
			<label>음식 종류</label>
			<select>
				<option value="">한식</option>
				<option value="">양식</option>
				<option value="">일식</option>
				<option value="">중식</option>
				<option value="">카페</option>
			</select>
			<input type="button" value="적용">
		</div>

		<div align="center">
		<c:if test="${foodCount > 0}">
			<c:set var = "pageBlock" value = "5" />
			<fmt:parseNumber var = "pageCount" value = "${foodCount / boardSize + (foodCount%boardSize==0 ? 0 : 1 ) }" integerOnly="true"/>
			<fmt:parseNumber var="result" value="${(currentPage -1)/pageBlock}" integerOnly="true"/>
			<c:set var="startPage" value="${result*pageBlock+1}"/>
			<c:set var="endPage" value="${startPage+pageBlock-1}"/>
			
			<c:if test="${endPage > pageCount }">
				<c:set var="endPage" value="${pageCount}"/>
			</c:if>
			
			<%-- 처음, 이전 --%>
			<c:if test="${startPage > pageBlock}">
				<a href="${root}/searchKeyword.go?keyword=${keyword}&pageNumber=1">[처음]</a>
				<a href="${root}/searchKeyword.go?keyword=${keyword}&pageNumber=${startPage-pageBlock}">[이전]</a>
			</c:if>
			
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="${root}/searchKeyword.go?keyword=${keyword}&pageNumber=${i}">[${i}]</a>
			</c:forEach>
			
			<%-- 다음, 끝 --%>
			<c:if test="${endPage < pageCount}">
				<a href="${root}/searchKeyword.go?keyword=${keyword}&pageNumber=${startPage+pageBlock}">[다음]</a>
				<a href="${root}/searchKeyword.go?keyword=${keyword}&pageNumber=${pageCount}">[끝]</a>
			</c:if>
		</c:if>
	</div>
		
</body>
</html>