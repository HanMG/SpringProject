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
.eat {
	width: 800px;
	overflow: hidden;
	background: skyblue;
}
.info_1 {
	width: 170px;
	height: 170px;
	float: left;
}

.info_1 > img {
	width: 150px;
	height: 150px;
	margin: 10px;
}
.info_2 {
	width: 630px;
	height: 170px;
	float: left;
}
.info_2 span {
	margin: 10px;
	display: inline-block;
}
.info_2 button {
	float: right;
	margin-right : 20px;
	width: 50px;
	height: 30px;
}
</style>
</head>
<body>
	<div id="content">
		<div class="history">
			<div class="title">
				<span>구매한 EAT딜</span>
			</div>
			<div class="eat">
				<div class="info_1">
					<img alt="쿠폰이미지" src="list.jpg">
				</div>
				<div class="info_2">
					<div>
						<span>쿠폰명</span>
					</div>
					<div>
						<span>쿠폰소개</span>
					</div>
					<div>
						<span>가격</span>
					</div>
					<div>
						<span>할인가</span>
						<button><a href="#">취소</a></button>
					</div>
				</div>
			</div>
			<div class="eat">
				<div class="info_1">
					<img alt="쿠폰이미지" src="list.jpg">
				</div>
				<div class="info_2">
					<div>
						<span>쿠폰명</span>
					</div>
					<div>
						<span>쿠폰소개</span>
					</div>
					<div>
						<span>가격</span>
					</div>
					<div>
						<span>할인가</span>
						<button><a href="#">취소</a></button>
					</div>
				</div>
			</div>
			<div class="eat">
				<div class="info_1">
					<img alt="쿠폰이미지" src="list.jpg">
				</div>
				<div class="info_2">
					<div>
						<span>쿠폰명</span>
					</div>
					<div>
						<span>쿠폰소개</span>
					</div>
					<div>
						<span>가격</span>
					</div>
					<div>
						<span>할인가</span>
						<button><a href="#">취소</a></button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>