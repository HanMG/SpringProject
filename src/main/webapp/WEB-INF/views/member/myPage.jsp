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
.title {
	width: 1000px;
	height: 50px;
	background: tomato;
	line-height: 50px;
	font-size: 30px;
	border-bottom: 1px dotted;
	margin-left: 120px;
	margin-top: 120px;
}
.myPage {
	width: 1000px;
	overflow: hidden;
	margin: 0 120px;
	background: olive;
}
.myPage > div {
	margin: 30px;
}
.myPage > div span:nth-child(1) {
	display: inline-block;
	width: 300px;
	font-size: 35px;
	text-align: center;
}
.myPage button {
	float: right;
	right: 10px;
	width: 100px;
	height: 50px;
	font-size: 20px;
}
</style>
</head>
<body>	
	<div id="content">
		<div class="title">
			<span>마이페이지</span>
		</div>
		<div class="myPage">
			<div class="nav_1">
				<div>
					<span>이름</span>
					<span>${memberDto.memberName}</span>
				</div>
				<div>
					<span>이메일</span>
					<span>${memberDto.memberMail}</span>
					<button><a href="${root}/member/memberUpdate.go">수정</a></button>
				</div>
				<div>
					<span>휴대폰</span>
					<span>${memberDto.memberPhone}</span>
				</div>
			</div>
			<div class="nav_2">
				<span>구매한 EAT 딜</span>
				<button><a href="${root}/member/myEd.go">></a></button>
			</div>
			<div class="nav_3">
				<span>리뷰</span>
				<button><a href="${root}/member/myReView.go">></a></button>
			</div>
			<div class="nav_4">
				<span>가고싶다</span>
				<button><a href="${root}/member/myFavorite.go">></a></button>
			</div>
			<div class="nav_5">
				<span>내가 등록한 식당</span>
				<button><a href="${root}/member/myFood.go">></a></button>
			</div>
		</div>
	</div>
	

</body>
</html>