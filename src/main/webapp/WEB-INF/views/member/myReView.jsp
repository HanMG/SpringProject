<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/resources/javascript/member/jquery-3.4.1.js"></script>
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
.review {
	overflow: hidden;
	width: 780px; 
	border-bottom: 1px dotted;
	margin: 10px;
	background: tomato;
}
.review_1 {
	width: 90px;
	overflow: hidden;
	text-align: center;
	margin: 10px auto;
	float: left;
}
.review_2 {
	width: 600px;
	overflow: hidden;
	float: left;
	min-height: 150px;
	margin: 10px auto;
}
.review_2 img {
	width: 100px;
	height: 100px;
	margin: 5px;
}
.review_3 {
	width: 90px;
	overflow: hidden;
	float: left;
	text-align: center;
	margin: 10px auto;
}
</style>
</head>
<body>
	<div id="content">
		<div class="history">
			<div class="title">
				<span>리뷰 내역</span>
			</div>
			<div class="review">
				<div class="review_1">
					<span>닉네임</span>
				</div>
				<div class="review_2">
					<div>작성일</div>
					<div>내용</div>
					<div>
						<img alt="리뷰이미지" src="list.jpg"> <img alt="리뷰이미지"
							src="list.jpg"> <img alt="리뷰이미지" src="list.jpg">
					</div>
				</div>
				<div class="review_3">
					<span>별점</span>
				</div>
			</div>
			<div class="review">
				<div class="review_1">
					<span>닉네임</span>
				</div>
				<div class="review_2">
					<div>작성일</div>
					<div>내용</div>
					<div>
						<img alt="리뷰이미지" src="list.jpg"> <img alt="리뷰이미지"
							src="list.jpg"> <img alt="리뷰이미지" src="list.jpg">
					</div>
				</div>
				<div class="review_3">
					<span>별점</span>
				</div>
			</div>
			<div class="review">
				<div class="review_1">
					<span>닉네임</span>
				</div>
				<div class="review_2">
					<div>작성일</div>
					<div>내용</div>
					<div>
						<img alt="리뷰이미지" src="list.jpg"> <img alt="리뷰이미지"
							src="list.jpg"> <img alt="리뷰이미지" src="list.jpg">
					</div>
				</div>
				<div class="review_3">
					<span>별점</span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>