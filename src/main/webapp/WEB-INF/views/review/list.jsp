<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>리뷰등록OK</title>
</head>
<body>
	<div class="re_1">
		<span>리뷰(${reviewCount})</span> <span>별로(숫자)</span> <span>괜찮다(숫자)</span>
		<span>맛있다(숫자)</span> <span>전체(${reviewCount})</span>
	</div>
	<c:choose>
		<c:when test="${foodReviewList != null}">

			<c:forEach var="foodReviewDto" items="${foodReviewList}">
				<div class="re_2">
					<div>
						<span>${foodReviewDto.memberName}</span>
					</div>

					<div>
						<a href="${root}/review/read.go?reviewCode=${foodReviewDto.reviewCode}">
							<span><fmt:formatDate value="${foodReviewDto.reviewDate}" pattern="yyyy-MM-dd" /></span> <span>${foodReviewDto.reviewCont}</span>
							
								<c:set var="img" value="${fn:split(foodReviewDto.imageName,',')}" />
								<c:forEach var="imgList" items="${img}">
									<img src="${root}/resources/ftp/${imgList}" alt="" style="width: 100px; height: 100px;" />
								</c:forEach>							
						</a>
					</div>

					<div>
						<img alt="별점" src="icon.PNG"> <span>별점<br />
							(${foodReviewDto.reviewScore})
						</span>
					</div>
				</div>
			</c:forEach>

		</c:when>
		<c:when test="${foodReviewList == null}">
			<div class="re_2">
				<div>첫 리뷰의 주인공이 되어주세요!!</div>
			</div>
		</c:when>
	</c:choose>
</body>
</html>