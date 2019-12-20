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
* {
	margin: 0;
	padding: 0;
	font-family: nanum-square bold;
}
input {
	border:none;
}
a {
	text-decoration: none;
}
#header {
	width: 1240px;
	height: 50px;
	margin: 0 auto;
}	
#header > div {
	float: left;
}
#header > div:nth-child(n+3) {
	width: 100px;
	height: 50px; 
	text-align: center;
	line-height: 50px;
	font-size: 20px;
}
#header > div input {
	width: 100%;
	height: 50px;
	border: none;
	min-width: 600px;
}
#header > div > img {
	width: 100px;
	height: 50px;
}
#content_main {
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -250px;
	margin-top: -400px;
	background: #F2F4EF;
	width: 500px;
	height: 700px;
	border-radius: 5px;
}
.title_main {
	width: 500px;
	height: 50px;
	line-height: 50px;
	font-size: 30px;
	border-bottom: 1px dotted;
	font-weight: bold;
}
.title_main > span:first-child {
	margin-left: 40px;
}
/* 로그인  */
.login {
	width: 400px;
	height: 700px;
	margin: 50px;
}

.login > img{
	width: 400px;
	height: 400px;
}
.login > button {
	font-size: 23px;
	margin: 30px auto;
	display: block;
}

/* 이메일 로그인 */
.email {
	width: 400px;
	height: 400px;
	margin: 200px 50px;
}
.email > form > div:nth-child(1), .email > form > div:nth-child(2) {
	margin: 20px 0;
}
.email > form > div:nth-child(3) {
	margin: 100px 0;
	width: 400px;
}
.email > form > div:nth-child(3) > a {
	float: right;
	margin: 5px 0;
	color: #030305;
}
.email > form > div > input {
	display: block;
	width: 100%;
	height: 50px;
	text-align: center;
	font-size: 23px;
}

/* 회원가입 */
.join {
	width: 400px;
	height: 600px;
	margin: 100px 50px;
}
.join > form > div {
	margin: 30px 0;
}
.join > form > div > span {
	display: block;
	margin-bottom: 10px;
}
.join > form > div > input {
	width: 385px;
	height: 50px;
	padding-left: 15px;
}
.join > form > div > .button {
	width: 197px;
	height: 50px;
	text-align: center;
	font-size: 23px;
}
.join > form > a {
	position: absolute;
	right: 20px;
	bottom: 20px;
}

/* 모달 관련 */
.modal, .modal_2, .modal_3{
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* The Close Button */
.close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
  margin-right: 15px;
}
.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}
</style>
<script type="text/javascript" src="${root}/resources/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="//cdn.rawgit.com/hiun/NanumSquare/master/nanumsquare.css">
<link rel="stylesheet" type="text/css" href="${root}/resources/css/button.css" />
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<!-- body부분에도 엔터 이벤트를 추가하면 input태그 외의 공간에서도 엔터 이벤트가 발생  -->
<body onkeypress="if(event.keyCode == 13){searchDate();}">
	<div id="header">
		<div>
			<img alt="로고" src="${root}/resources/css/icon.PNG">
		</div>
		<div>
			<!-- form 안에 text 타입의 input 박스가 하나만 존재 할 경우 (hidden 제외) input 박스에서 엔터를 치면 자동으로 form submit이 된다고 함 
				그걸 방지하기 위해서는 form onsubmit="return false" 처리를 해주어야 자동으로 submit 되는 것을 막을 수 있기함
			-->
			<form action="" method="get">
				<input type="text" id="search" name="search" value="" onkeypress="if(event.keyCode == 13){searchDate();}"/>
			</form>
		</div>
		<c:choose>
			<c:when test="${memberCode == null }">
				<div>
					<a href="#" id="loginClick">로그인</a>
				</div>
			</c:when>
			<c:when test="${memberCode != null }">
				<div>
					<a href="${root}/member/logout.go">로그아웃</a>
				</div>
				<div>
					<a href="${root}/member/myPage.go">마이페이지</a>
				</div>
				${memberCode}
			</c:when>
		</c:choose>
		<div>
			<a href="#">EAT딜</a>
		</div>
		<div>
			<a href="#">맛집리스트</a>
		</div>
	</div>
	<!-- 로그인 -->
	<div id="myModal" class="modal">
		<div id="content_main">
			<div class="title_main">
				<span>로그인</span>
				<span class="close">&times;</span>
			</div>
			<div class="login">
				<img alt="로고" src="${root}/resources/css/list.jpg">
				<button class="button" id="emailClick" style="width:180pt;height:35pt;">이메일 로그인</button>
				<button class="button" style="width:180pt;height:35pt;" onclick="loginForm()">카카오 로그인</button>
			</div>
		</div>
	</div>
	<!-- 이메일로 로그인 -->
	<div id="myModal_2" class="modal_2">
		<div id="content_main">
			<div class="title_main">
				<span>이메일로 로그인</span>
				<span class="close">&times;</span>
			</div>
			<div class="email">
				<form action=${root}/member/mailLoginOk.go method="post">
					<div>
						<input type="text" name="mail" placeholder="이메일">
					</div>
					<div>
						<input type="password" name="pwd" placeholder="비밀번호">
					</div>
					<div>
						<input class="button" type="submit" value="로그인"/>
						<a href="#" id="joinClick">회원가입</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 이메일 회원가입 -->
	<div id="myModal_3" class="modal_3">
		<div id="content_main">
			<div class="title_main">
				<span>이메일 회원가입</span>
				<span class="close">&times;</span>
			</div>
			<div class="join">
				<form action="${root}/member/signInOk.go" method="post"  onsubmit="return signForm(this)">
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
						<input class="button" type="submit" value="가입">
						<input class="button" type="reset" value="취소">
					</div>
				</form>
			</div>
		</div>
	</div>
	
	
<script type="text/javascript">

	function searchDate(){
		alert("??");
	};
	/* 메인화면 로그인 클릭시 작동 */
	var modal = document.getElementById("myModal");
	var loginClick = document.getElementById("loginClick");
	var span = document.getElementsByClassName("close")[0];
	loginClick.onclick = function() {
		modal.style.display = "block";
		}
	span.onclick = function() {
		modal.style.display = "none";
		}
	/* 로그인 모달창에서 이메일 로그인 클릭시 작동 */
	var span_2 = document.getElementsByClassName("close")[1];
	var emailClick = document.getElementById("emailClick");
	var modal_2 = document.getElementById("myModal_2");
	emailClick.onclick = function() {
		modal_2.style.display = "block";
		}
	span_2.onclick = function() {
		modal_2.style.display = "none";
		}
	
	var span_3 = document.getElementsByClassName("close")[2];
	var emailClick = document.getElementById("joinClick");
	var modal_3 = document.getElementById("myModal_3");
	joinClick.onclick = function() {
		modal_3.style.display = "block";
		}
	span_3.onclick = function() {
		modal_3.style.display = "none";
		}
	/* 공용 */
	window.onclick = function(event) {
		  if (event.target == modal) {
			  modal.style.display = "none";
		  }
		  if (event.target == modal_2) {
			  modal_2.style.display = "none";
		  }
		  if (event.target == modal_3) {
			  modal_3.style.display = "none";
		  }
		}
</script>	
<script type='text/javascript'>
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