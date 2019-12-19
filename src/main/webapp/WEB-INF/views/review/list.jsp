<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>리뷰등록OK</title>
</head>
<body>
	<div class="re_1">
		<span>리뷰(숫자)</span> <span>별로(숫자)</span> <span>괜찮다(숫자)</span> <span>맛있다(숫자)</span>
		<span>전체(숫자)</span>
	</div>
	<c:choose>
		<c:when test="${foodReviewList != null}">
			<c:forEach var="foodReviewDto" items="${foodReviewList}">
				<div class="re_2">
					<div>
						<span>이름(닉)</span>
					</div>
					<div>
						<span>작성일</span> <span>친구가 왕추천한 피스타치오맛은 찐이다. 고소한맛 좋아하는 사람들은
							무조건 좋아할 수 밖에 없는 맛!!소금과 쌀은 생각처럼 은은했고 백향과는 상콤한 맛을 잘 살렸다. 가격도 부담없고
							맛도 좋고 보기에도 좋아서 바글바글 할 수 밖에 없는듯 :)</span> <img alt="이미지" src="list.jpg">
						<img alt="이미지" src="list.jpg"> <img alt="이미지" src="list.jpg">
					</div>
					<div>
						<img alt="별점" src="icon.PNG"> <span>별점(5)</span>
					</div>
				</div>
			</c:forEach>
		</c:when>
		<c:when test="${foodReviewList == null}">
			<div class="re_2">
					<div>
						첫 리뷰의 주인공이 되어주세요!!
					</div>
			</div>
		</c:when>
	</c:choose>
</body>
</html>