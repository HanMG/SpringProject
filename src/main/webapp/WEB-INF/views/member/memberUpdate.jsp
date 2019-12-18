<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>회원수정</title>
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
	width: 800px;
	height: 50px;
	background: tomato;
	line-height: 50px;
	font-size: 30px;
	border-bottom: 1px dotted;
	margin-top: 220px;
	margin-left: 220px;
}
.member {
	width: 800px;
	overflow: hidden;
	margin: 0 220px;
	background: olive;
}	
.member > div {
	margin: 30px;
	text-align: center;
}
.member > div span:nth-child(1) {
	display: inline-block;
	width: 300px;
	font-size: 35px;
	text-align: center;
}
.member > div > button {
	float: right;	
	margin: 50px;
	width: 100px;
	height: 50px;
}
</style>
</head>
<body>
	<form action="${root}/member/memberUpdateOk.do" method="post">
		<input type="hidden" value="${memberDto.memberCode}" name="memberCode"/>		
		<div id="content">
			<div class="title">
				<span>정보 수정</span>
			</div>
			<div class="member">
				<div>
					<span>이름</span>
					<input type="text" name="memberName" value="${memberDto.memberName}">
				</div>
				<div>
					<span>이메일</span>
					<input type="hidden" value="${memberDto.memberMail}" name="memberMail"/>
					<input type="text" name="mail_2" value="${memberDto.memberMail}" disabled="disabled"/>
				</div>
				<div>
					<span>휴대폰</span>
					<input type="text" name="memberPhone" value="${memberDto.memberPhone}">
				</div>
				<div>
					<span>비밀번호</span>
					<input type="password" name="memberPwd" value="${memberDto.memberPwd}">
				</div>
				<div>
					<span>비밀번호 확인</span>
					<input type="password" name="pwdCheck" value="${memberDto.memberPwd}">
				</div>
				<div>
					<input class="btn btn_small" type="submit" value="수정">
					<input class="btn btn_small" type="reset" value="취소">
				</div>
			</div>
		</div>
	</form>
</body>
</html>