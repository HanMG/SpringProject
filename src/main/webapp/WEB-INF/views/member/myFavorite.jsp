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
.favorite {
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
.like {
	overflow: hidden;
	width: 780px; 
	border-bottom: 1px dotted;
	margin: 10px;
	background: tomato;
}
.like_1 {
	width: 250px;
	overflow: hidden;
	height: 250px;
	float: left;
}
.like_1 > img {
	width: 200px;
	height: 200px;
	margin: 25px;
}
.like_2 {
	width: 430px;
	height: 250px;
	float: left;
	
}
.like_2 > div {
	margin-top: 25px;
}
.like_3 {
	width: 100px;
	height: 250px;
	float: left;
	line-height: 250px;
	text-align: center;
}
.like_3 > img {
	vertical-align: middle;
	width: 50px;
	height: 50px;
}
</style>
</head>
<body>
	<div id="content">
		<div class="favorite">
			<div class="title">
				<span>가고싶다</span>
			</div>
			<div class="like">
				<div class="like_1">
					<img alt="가게이미지" src="list.jpg">
				</div>
				<div class="like_2">
					<div>지역군</div>
					<div>음식점명</div>
					<div>별점</div>
					<div>조회수</div>
					<div>리뷰수</div>
				</div>
				<div class="like_3">
					<img alt="별점" src="icon.PNG">
				</div>
			</div>
			<div class="like">
				<div class="like_1">
					<img alt="가게이미지" src="list.jpg">
				</div>
				<div class="like_2">
					<div>지역군</div>
					<div>음식점명</div>
					<div>별점</div>
					<div>조회수</div>
					<div>리뷰수</div>
				</div>
				<div class="like_3">
					<img alt="별점" src="icon.PNG">
				</div>
			</div>
			<div class="like">
				<div class="like_1">
					<img alt="가게이미지" src="list.jpg">
				</div>
				<div class="like_2">
					<div>지역군</div>
					<div>음식점명</div>
					<div>별점</div>
					<div>조회수</div>
					<div>리뷰수</div>
				</div>
				<div class="like_3">
					<img alt="별점" src="icon.PNG">
				</div>
			</div>
		</div>
	</div>
</body>
</html>