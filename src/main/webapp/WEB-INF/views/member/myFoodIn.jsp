<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
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
}
.food {
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
.register {
	overflow: hidden;
	width: 780px; 
	margin: 10px;
	background: tomato;
}
.register > form > div {
	margin: 10px 40px;
	font-size: 25px;
}
.register > form > div:nth-child(1) {
	margin-bottom: 40px;
}
.register > form > div:last-child {
	text-align: center;
}
.register > form > div > button {
	width: 100px;
	height: 30px;
}
</style>
</head>
<body>
	<div id="content">
		<div class="food">
			<div class="title">
				<span>식당 등록</span>
			</div>
			<div class="register">
				<form action="${root}/member/myFoodWrite.do" method="post">
					<div class="reg_1">
						<span>식당 이름과 위치를 알려주세요.</span>
					</div>
					<div class="reg_2">
						<span>* 식당이름 (예:남춘식당)</span>
					</div>
					<div class="reg_3">
						<input type="text" name="foodName">
					</div>
					<div class="reg_4">
						<span>* 지역 및 위치 선택</span>
					</div>
					<div class="reg_5">
						<input type="text" name="foodAddr">
						<input type="button" value="지도">
					</div>
					<div class="reg_6">
						<span>음식 종류 선택</span>
					</div>
					<div>
						<input type="radio" name="foodKind" value="1">1
						<input type="radio" name="foodKind" value="2">2
						<input type="radio" name="foodKind" value="3">3
						<input type="radio" name="foodKind" value="4">4
						<input type="radio" name="foodKind" value="5">5
						<input type="radio" name="foodKind" value="6">6 
					</div>
					<div>
						<input class="btn btn_small" type="submit" value="등록하기">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>

</body>
</html>