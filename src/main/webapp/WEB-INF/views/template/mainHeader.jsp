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
@font-face {
  font-family: 'Noto Sans KR';
  font-style: normal;
  font-weight: 100;
  src: url(${root}/resources/fonts/NotoSansKR-Thin.woff2) format('woff2'),
       url(${root}/resources/fonts/NotoSansKR-Thin.woff) format('woff'),
       url(${root}/resources/fonts/NotoSansKR-Thin.otf) format('opentype');
}
@font-face {
  font-family: 'Noto Sans KR';
  font-style: normal;
  font-weight: 300;
  src: url(${root}/resources/fonts/NotoSansKR-Light.woff2) format('woff2'),
       url(${root}/resources/fonts/NotoSansKR-Light.woff) format('woff'),
       url(${root}/resources/fonts/NotoSansKR-Light.otf) format('opentype');
}
@font-face {
   font-family: 'Noto Sans KR';
   font-style: normal;
   font-weight: 400;
   src: url(${root}/resources/fonts/NotoSansKR-Regular.woff2) format('woff2'),
        url(${root}/resources/fonts/NotoSansKR-Regular.woff) format('woff'),
        url(${root}/resources/fonts/NotoSansKR-Regular.otf) format('opentype');
 }
@font-face {
   font-family: 'Noto Sans KR';
   font-style: normal;
   font-weight: 500;
   src: url(${root}/resources/fonts/NotoSansKR-Medium.woff2) format('woff2'),
        url(${root}/resources/fonts/NotoSansKR-Medium.woff) format('woff'),
        url(${root}/resources/fonts/NotoSansKR-Medium.otf) format('opentype');
 }
@font-face {
   font-family: 'Noto Sans KR';
   font-style: normal;
   font-weight: 700;
   src: url(${root}/resources/fonts/NotoSansKR-Bold.woff2) format('woff2'),
        url(${root}/resources/fonts/NotoSansKR-Bold.woff) format('woff'),
        url(${root}/resources/fonts/NotoSansKR-Bold.otf) format('opentype');
 }
@font-face {
   font-family: 'Noto Sans KR';
   font-style: normal;
   font-weight: 900;
   src: url(${root}/resources/fonts/NotoSansKR-Black.woff2) format('woff2'),
        url(${root}/resources/fonts/NotoSansKR-Black.woff) format('woff'),
        url(${root}/resources/fonts/NotoSansKR-Black.otf) format('opentype');
 } 
* {
	margin: 0;
	padding: 0;
	font-family: Noto Sans KR;
}
a {
	text-decoration: none;
}
#header {
	width: 100%;
	height: 50px;
	position: fixed;
	z-index: 999;
	
}	
#header > div {
	float: left;
}
#header > div * {
	color: #030305;
	
}
#header > div:nth-child(1) {
	margin-left: 280px;
	width: 100px;
	height: 50px;
}
#header > div:nth-child(n+3) {
	height: 50px; 
	text-align: center;
	line-height: 50px;
	font-size: 25px;
	margin: 0 15px;
}
#header > div:nth-child(2) {
	width: 940px; 
	height: 50px;
}
/* #header > div > img {
	width: 100px;
	height: 50px;
} */
#content_main {
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -250px;
	margin-top: -400px;
	width: 500px;
	height: 700px;
	border-radius: 5px;
	box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 10px;
	background: white;
}
.title_main {
	width: 500px;
	height: 50px;
	line-height: 50px;
	font-size: 30px;
	font-weight: bold;
	text-align: center;
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
	margin: 0 auto;
	display: block;
	margin-bottom: 15px;
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
.modal{
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
  background-color: rgba(255, 255, 255, 0.95); /* Black w/ opacity */
}

.modal_2, .modal_3{
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
}

/* The Close Button */
.close {
  color: #000;
  float: right;
  font-size: 28px;
  font-weight: bold;
  margin-right: 15px;
}
.close:hover,
.close:focus {
  color: #aaa;
  text-decoration: none;
  cursor: pointer;
}

/* 중앙 검색창 */
html { 
	background: url(${root}/resources/css/food_3.jpg) no-repeat center center fixed; 
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}
.search {
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
}
.search > input {
	width: 340px;
	height: 50px;
	font-size: 23px;
	color: #030305;
	text-align: center;
}
.search > input::placeholder {
	color: #030305;
	text-align: center;
}


</style>
<script type="text/javascript" src="${root}/resources/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="//cdn.rawgit.com/hiun/NanumSquare/master/nanumsquare.css">
<link rel="stylesheet" type="text/css" href="${root}/resources/css/button.css" />
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<!-- body부분에도 엔터 이벤트를 추가하면 input태그 외의 공간에서도 엔터 이벤트가 발생  -->
<body onkeypress="if(event.keyCode == 13){search();}">
	<div id="header">
		<div>
		</div>
		<div>
		
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
			</c:when>
		</c:choose>
		<div>
			<a href="${root}/coupon/couponList.go">EAT딜</a>
		</div>
		<div>
			<a href="${root}/food/list.go">맛집리스트</a>
		</div>
	</div>
	<!-- 로그인 -->
	<div id="myModal" class="modal">
		<div id="content_main">
			<div class="title_main">
				<span class="close">&times;</span>
			</div>
			<div class="login">
				<img alt="로고" src="${root}/resources/css/jeju.png">
				<button class="button" id="emailClick" style="width:180pt;height:35pt;">이메일 로그인</button>
				<button class="button" style="width:180pt;height:35pt;" onclick="loginForm()">카카오 로그인</button>
				<div id="naver_id_login" style="text-align:center"><a href="${url}">
				<img style="width: 240px;" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
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
	
	<div id="search" class="search">
		<input type="text" id="searchInput" name="searchInput" style="background-color:transparent; border: none;" placeholder="검색어를 입력하여 주세요"  autofocus />
	</div>
	
<script type="text/javascript">
	var url = null;
	
	function search() {
		var param = $("#searchInput").val()
		url = "${root}/searchKeyword.go?keyword=" + param;
		location.href = url;
	}
	
	$("#searchInput").keypress(function(event) {
		if (event.which == 13) {
			search();
		}
	})
	
	$(document).ready(function() {
		$("#searchInput").on("change", function() {
			getKeywordList($("#testInput").val());
			
			$('#testInput').autocomplete({
			});
		});
	});
	

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