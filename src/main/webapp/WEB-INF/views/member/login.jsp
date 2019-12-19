<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
 <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
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
	height: 700px;
	margin: 50px;
}

.login > img{
	width: 400px;
	height: 400px;
}
button {
	margin: 30px auto;
	display: block;
}
.login > a {
	position: absolute;
	right: 20px;
	bottom: 20px;
}
</style>
<script type="text/javascript" src="${root}/resources/javascript/member/jquery-3.4.1.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
<a href="http://developers.kakao.com/logout"></a>
<br/><br/>
	<div id="content">
		<div class="title">
			<span>로그인</span>
		</div>
		<div class="login">
			<img alt="로고" src="${root}/resources/css/list.jpg">
			<button style="width:180pt;height:35pt;"><a href="${root}/member/mailLogin.go">이메일 로그인</a></button>
			<button style="width:180pt;height:35pt;" onclick="loginForm()">카카오 로그인</button>
			<a href="${root}/jeju.go">건너뛰기</a>
		</div>
	</div>

<script type='text/javascript'>

    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('f30f46c40f26ed513be4c81611d91389');
    
    function loginForm() {
    	Kakao.Auth.loginForm({
    		success : function(authObj) {
    			Kakao.API.request({
    				url: '/v2/user/me',
    				success : function(res) {
		    			var url = "";
			            $.ajax({
			    			url: url,
			    			type: "get",
			    			dataType: "text",
			    			success: function(data) {
			    				window.location.href = "${root}" + "/kakaoLogin.go?nickname=" + res.properties['nickname'] + "&mail=" + res.kakao_account.email;
			    	        }
			    		});
    				}
    			});
    		}
    	});
    }
</script>
</body>
</html>