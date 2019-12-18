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
.join {
	width: 400px;
	height: 600px;
	margin: 100px 50px;
}
.join > div {
	margin: 30px 0;
}
.join > div > span {
	display: inline-block;
	width: 200px;
	text-align: center;
}
.join > div > input {
	width: 190px;
	height: 30px;
}
.join > div:nth-child(5) > button {
	width: 400px;
	height: 50px;
	text-align: center;
	margin: 50px 0;
}
.join > a {
	position: absolute;
	right: 20px;
	bottom: 20px;
}
</style>
<script type="text/javascript">
	function signForm(obj){
/* 	    var reg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	    if (reg.test(obj.mail.value)==false){ 
	    	alert("이메일주소 형식에 맞지 않습니다.")
	    	obj.mail.focus();
	    	return false;
	    } 

		if(obj.name.value == ""){
			alert("닉네임을 입력하세요.")
			obj.name.focus();
			return false;
		}
		if(obj.pwd.value == ""){
			alert("비밀번호를 입력하세요.")
			obj.pwd.focus();
			return false;
		}
		if(obj.pwdCheck.value == ""){
			alert("비밀번호 확인란을 입력하세요.")
			obj.pwdCheck.focus();
			return false;
		}
		if(obj.pwd.value != obj.pwdCheck.value){
			alert("비밀번호가 같지 않습니다.")
			obj.pwdCheck.focus();
			return false;
		} */
	}
</script>
</head>
<body>
	<div id="content">
		<div class="title">
			<span>이메일 회원가입</span>
		</div>
		<form action="${root}/member/signInOk.do" method="post"  onsubmit="return signForm(this)">
			<div class="join">
				<div>
					<span>이메일</span>
					<input type="text" id="mail" name="mail">
				</div>
				<div>
					<span>닉네임</span>
					<input type="text" name="name">
				</div>
				<div>
					<span>비밀번호</span>
					<input type="password" name="pwd">
				</div>
				<div>
					<span>비밀번호 확인</span>
					<input type="password" name="pwdCheck">
				</div>
				<div>
					<input class="btn btn_small" type="submit" value="가입">
					<input class="btn btn_small" type="reset" value="취소">
				</div>
				<a href="${root}/member/login.do">뒤로가기</a>
			</div>
		</form>
	</div>
</body>

</body>
</html>