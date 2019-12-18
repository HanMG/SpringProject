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
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -250px;
	margin-top: -400px;
	background: tomato;
	width: 500px;
	height: 800px;
}
.title {
	width: 500px;
	height: 50px;
	background: tomato;
	line-height: 50px;
	font-size: 30px;
	border-bottom: 1px dotted;
}
.login {
	width: 400px;
	height: 400px;
	margin: 200px 50px;
}
.login > div:nth-child(1), .login > div:nth-child(2) {
	margin: 20px 0;
}
.login > div:nth-child(3) {
	margin: 100px 0;
	width: 400px;
}
.login > div:nth-child(3) > button {
	width: 400px;
	height: 50px;
	text-align: center;
	margin-top: 50px;
	
}
.login > div:nth-child(3) > a {
	float: right;
	margin: 5px 0;
}
.login > div > input {
	display: block;
	width: 100%;
	height: 30px;
}
</style>
</head>
<body>
	<div id="content">
		<div class="title">
			<a href="#"></a>
			<span>이메일로 로그인</span>
		</div>
		<form action=${root}/member/mailLoginOk.do method="post">
		<div class="login">
			<div>
				<label>이메일</label>
				<input type="text" name="mail">
			</div>
			<div>
				<label>비밀번호</label>
				<input type="password" name="pwd">
			</div>
			<div>
				<input type="submit" value="로그인"/>
				<a href="${root}/member/signIn.do">회원가입</a>
			</div>
		</div>
		</form>
	</div>
</body>
</html>