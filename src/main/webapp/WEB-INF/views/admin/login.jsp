<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#content_main {
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -250px;
	margin-top: -200px;
	background: #F2F4EF;
	width: 500px;
	height: 400px;
	border-radius: 5px;
}
.login {
	width: 400px;
	height: 300px;
	margin: 50px;
}
.login > form > div {
	margin: 30px 0;
}
.login > form > div > span {
	display: block;
	margin-bottom: 10px;
	font-size: 23px;
}
.login > form > div > input {
	width: 385px;
	height: 50px;
	padding-left: 15px;
}
.login > form > div > .button {
	width: 197px;
	height: 50px;
	text-align: center;
	font-size: 23px;
}
.button {
    color: #FFFFFF;
    border: #EFB730 solid 1px;
    background-color: #EFB730;
}
</style>
</head>
<body>
	<div id="content_main">
		<div class="login">
			<form action="${root}/admin/loginOk.go" method="post">
			<div>
				<span>관리자 아이디</span>
				<input type="text" name="adminId">
			</div>
			<div>
				<span>관리자 비밀번호</span>
				<input type="password" name="adminPwd">
			</div>
			<div style="text-align: center;">
				<input class="button" type="submit" value="로그인">
			</div>
			</form>
		</div>
	</div>
</body>
</html>