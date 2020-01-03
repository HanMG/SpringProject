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
.reg_btn {
	width: 780px;
	height: 50px;
}
.reg_btn > button {
	width: 100px;
	height: 30px;
	float: right;
	margin: 10px;
}
.reg {
	width: 780px;
	height: 140px;
	background: skyblue;
	margin: 5px 0;
}
.reg_1 {
	width: 580px;
	height: 150px;
	float: left;
	font-size: 25px;
	margin-left: 20px;
}
.reg_1 > div {
	margin: 10px;
}
.reg_2 {
	width: 180px;
	height: 150px;
	float: left;
	text-align: center;
}
.reg_2 img {
	width: 50px;
	height: 50px;
	margin: 30px;
}
</style>
</head>
<body>	
	<div id="content">
		<div class="food">
			<div class="title">내가 등록한 음식점</div>
			<div class="register">
				<div class="reg_btn">
					<button><a href="${root}/member/myFoodIn.go">음식점 등록</a></button>
				</div>
				<div class="reg">
					<div class="reg_1">
						<div>
							<span>음식점명 : </span>
							<span>${foodDto.foodName}</span>
						</div>
						<div>
							<span>주소명 : </span>
							<span>${foodDto.foodAddr}</span>
						</div>
						<div>
							<span>음식 종류 : </span>
							<span>${foodDto.foodKind}</span>
						</div>
					</div>
					<div class="reg_2">
						<div>
							<img alt="등록중" src="icon.PNG">
						</div>
						<div>
							<button><a href="#">수정하기</a></button>
							<button><a href="#">삭제하기</a></button>
						</div>
					</div>
				</div>
				<div class="reg">
					<div class="reg_1">
						<div>
							<span>음식점명</span>
						</div>
						<div>
							<span>주소명</span>
						</div>
						<div>
							<span>음식 종류</span>
						</div>
					</div>
					<div class="reg_2">
						<div>
							<img alt="등록중" src="icon.PNG">
						</div>
						<div>
							<button><a href="#">수정하기</a></button>
							<button><a href="#">삭제하기</a></button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>