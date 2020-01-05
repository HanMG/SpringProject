<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>   
<style type="text/css">

#header {
	display: flex;
	flex-wrap: nowrap;
	padding: 0.8rem;
	justify-content: space-evenly;
	height: 60px;
    font-size: 23px;
}
.nav_1 > a > span {
  perspective: 1000px;
}
.nav_1 > a > span {
  display: inline-block;
  margin: 0 -.05em;
  transform-origin: 50% 50% -10px;
  transform-style: preserve-3d;
  animation: loading 4.6s infinite;
}
.nav_1 > a > span:nth-child(2) {
  animation-delay: .1s;
}
.nav_1 > a > span:nth-child(3) {
  animation-delay: .2s;
}
.nav_1 > a > span:nth-child(4) {
  animation-delay: .3s;
}
.nav_1 > a > span:nth-child(5) {
  animation-delay: .4s;
}
.nav_1 > a > span:nth-child(6) {
  animation-delay: .5s;
}
.nav_1 > a > span:nth-child(7) {
  animation-delay: .6s;
}
.nav_1 > a > span:nth-child(8) {
  animation-delay: .7s;
}
.nav_1 > a > span:nth-child(9) {
  animation-delay: .8s;
}
.nav_1 > a > span:nth-child(10) {
  animation-delay: .9s;
}
@keyframes loading {
  0% {
    transform: rotateX(-360deg);
  }
  70% {
    transform: rotateX(0);
  }
}
.nav_2 > a {
  display: inline-block;
}
.nav_2 > a:hover {
  -webkit-animation: zoom .3s;
  animation: zoom .3s;
}
@-webkit-keyframes zoom {
  50% {
    -webkit-transform: scale(1.05);
  }
}
@keyframes zoom {
  50% {
    transform: scale(1.05);
  }
}
.nav_1 {
	display: flex;
}
.nav_1 > a{
	color: #EFB730;
}


.nav_1 > input {
    width: 300px;
    font-size: 23px;
    margin-left: 10px;
    /* padding-left: 20px; */
    color: #EFB730;
    font-family: 'Noto Sans KR';
    margin-left: 34px;
    border: none;
	border-bottom: 2px solid #EFB730;
}
.nav_1 > input::placeholder, .nav_1 > input::-webkit-input-placeholder {
	font-size: 23px;
	font-family: Noto Sans KR;
	font-weight: 500;
	color: #EFB730;
}
.nav_2 > a {
	margin-left: 20px;
}

/* 모달 */
#content_main {
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -250px;
	margin-top: -400px;
	
	border-radius: 5px;
	box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 10px;
	min-width: 450px;
	display: flex;
	flex-direction: column;
	background: transparent;
}

.title_main {
	font-size: 30px;
	font-weight: bold;
	display: flex;
	flex-direction: row;
	color: white;
	margin: 30px;
}
/* 로그인  */
.login {
	display: flex;
    flex-direction: column;
    background: white;
    border-radius: 5px;
    margin: 25px;
}

.login>img {
	width: 250px;
    height: 250px;
    margin: 0 auto;
}
#naver_id_login img {
	width: 50%;
}

.login>button {
	font-size: 23px;
	margin: 0 auto;
	display: block;
	margin-bottom: 15px;
	padding: 5px 10px;
}
.login > button:nth-child(2) {
	background: #414959;
    border: 1px solid;
}
.login > button:nth-child(3) {
	background: #EFB730;
    border: 1px solid;
}
.login > button:nth-child(4) {
	background: #3EC729;
    border: 1px solid;
}


/* 이메일 로그인 */
.email {
	display: flex;
	flex-direction: column;
	height: 100%;
	margin: 25px;
	background: white;
	border-radius: 5px;
}
.email > form {
	display: flex;
	flex-direction: column;
	margin: 40px 0;
}
.email > form i {
	font-size: 20px;
}
.email>form>div:nth-child(1), .email>form>div:nth-child(2) {
	display: flex;
	flex-direction: row;
	justify-content: center;
	border-bottom: solid 1px #9b9b9b;
	padding: 10px 0;
	align-items: center;
}

.email>form>div:nth-child(3) {
	display: flex;
	justify-content: center;
	margin-top: 30px;
}

.email>form>div:nth-child(3)>a {
	margin: 5px 30px;
	color: #030305;
}

.email>form>div>input {
	text-align: center;
	font-size: 23px;
	border: transparent;
	
}
.input_Btn {
	color: #FFFFFF;
    border: #EFB730 solid 1px;
    background-color: #EFB730;
    border-radius: 5px;
}

/* 회원가입 */
.join {
	display: flex;
    flex-direction: column;
    background: white;
    margin: 25px;
    border-radius: 5px;
}
.join > form {
	margin: 40px 0;
}

.join>form>div {
	display: flex;
    flex-direction: column;
}
.join > form > div > div {
	display: flex;
	flex-direction: row;
    justify-content: center;
    border-bottom: solid 1px #9b9b9b;
    padding: 10px 0;
    align-items: center;
}
.join > form > div > div:last-child {
	border-bottom: none;
}
.join>form>div>span {
	text-align: center;
}
.join > form i {
	font-size: 20px;
}
.join>form>div>div >input {
	text-align: center;
    font-size: 23px;
    border: transparent;
}
.join > form > div > div:last-child > input {
	cursor: pointer;
	margin: 5px 15px;
}


.join>form>a {
	position: absolute;
	right: 20px;
	bottom: 20px;
}

/* 모달 관련 */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.8); /* Black w/ opacity */
	z-index:2; 
}

.modal_2, .modal_3 {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 10px;
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.8); /* Black w/ opacity */
	z-index: 3;
}

/* The Close Button */
.close {
	color: white;
	font-size: 28px;
	font-weight: bold;
	margin-left: auto;
}

.close:hover, .close:focus {
	color: #aaa;
	text-decoration: none;
	cursor: pointer;
}


</style>
	<div id="header">
		<div class="nav_1">
			<a href="${root}/index.jsp"><span>E</span><span>A</span><span>T</span>          <span>T</span><span>H</span><span>E</span>          <span>J</span><span>E</span><span>J</span><span>U</span></a>
			<input type="text" id="searchInput" name="searchInput" placeholder="검색어를 입력하여 주세요"  autofocus />
		</div>
		<div class="nav_2">
			<c:choose>
				<c:when test="${memberCode == null }">
						<a href="#" id="loginClick">로그인</a>
				</c:when>
				<c:when test="${memberCode != null }">
						<a href="${root}/member/logout.go">로그아웃</a>
						<a href="${root}/member/myPage.go">마이페이지</a>
				</c:when>
			</c:choose>
			<a href="${root}/coupon/couponList.go">EAT딜</a>
			<a href="${root}/food/list.go">맛집리스트</a>
		</div>
	</div>
	<!-- 모달 -->
	<!-- 로그인 -->
	<div id="myModal" class="modal">
		<div id="content_main">
			<div class="title_main">
				<span>로그인</span><span class="close">&times;</span>
			</div>
			<div class="login">
				<img alt="로고" src="${root}/resources/css/jeju.png">
				<button id="emailClick">이메일 로그인</button>
				<button onclick="loginForm()">카카오 로그인</button>
				<button onclick="location.href='${url}'" id="naver_id_login" >네이버 로그인</button>
			</div>
		</div>
	</div>
	<!-- 이메일로 로그인 -->
	<div id="myModal_2" class="modal_2">
		<div id="content_main">
			<div class="title_main">
				<span>이메일로 로그인</span><span class="close">&times;</span>
			</div>
			<div class="email">
				<form action=${root}/member/mailLoginOk.go method="post" id="emailForm">
					<div>
						<i class="fa fa-envelope-o" aria-hidden="true"></i><input type="text" name="mail" placeholder="이메일">
					</div>
					<div>
						<i class="fa fa-unlock-alt" aria-hidden="true"></i><input type="password" name="pwd" placeholder="비밀번호">
					</div>
					<div>
						<input class="input_Btn" type="submit" value="로그인" /> <a href="#"
							id="joinClick">회원가입</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 이메일 회원가입 -->
	<div id="myModal_3" class="modal_3">
		<div id="content_main">
			<div class="title_main">
				<span>이메일 회원가입</span> <span class="close">&times;</span>
			</div>
			
			<div class="join">
				<form id="joinForm" action="${root}/member/signInOk.go" method="post"
					onsubmit="return signForm(this)">
					<div>
						<div>
							<i class="fa fa-envelope-o" aria-hidden="true"></i><input type="text" id="mail1" name="mail" placeholder="이메일">
						</div>
						<span class="warnId"></span>
						<div>
							<i class="fa fa-user-circle-o" aria-hidden="true"></i><input type="text" id="name1" name="name" placeholder="닉네임">
						</div>
						<span class="warnName"> </span>
						<div>
							<i class="fa fa-unlock-alt" aria-hidden="true"></i><input type="password" id="pwd1" name="pwd" placeholder="비밀번호">
						</div>
						<span class="warnPwd1"> </span>
						<div>
							<i class="fa fa-check-square" aria-hidden="true"></i><input type="password" id="pwd2" name="pwdCheck" placeholder="비밀번호 확인">
						</div>
						<span class="warnPwd2"> </span>
						<div>
							<input class="input_Btn" type="submit" value="가입">
							<input class="input_Btn" type="reset" value="취소">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	var url = null;
	$(function(){
		$("#mail1").blur(function(){
			var mail= $("#mail1").val();
			var url= "${root}/member/mailCheck.go?mail="+mail;
			var reg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			if(mail=="") {
				$(".warnId").text("필수 정보입니다.").css("color","red");
			}else if (reg.test(mail)==false) {
				$(".warnId").text("이메일 주소 형식에 맞지 않습니다..").css("color","red");
			}
			else {
				$.ajax({
					url:url,
					method:"get",
					success: function(text){
						if(text==1){
							$(".warnId").text("이미 사용중이거나 탈퇴한 아이디입니다.").css("color","red");
						}else{
							$(".warnId").text("사용 가능한 이메일 주소 입니다.").css("color","#08a600");
						}
						
					},
						
				});
			}

		});
	});
	$(function(){
		$("#name1").blur(function(){
			var name= $("#name1").val();
			if(name=="") {
				$(".warnName").text("필수 정보입니다.").css("color","red");
			}else{
				$(".warnName").text("")
			}
		});
	});
	$(function(){
		$("#pwd1").blur(function(){
			var pwd1= $("#pwd1").val();
			if(pwd1=="") {
				$(".warnPwd1").text("비밀번호를 입력하세요.").css("color","red");
			}else if (!/^[a-zA-Z0-9]{4,10}$/.test(pwd1)){
				$(".warnPwd1").text("숫자 영문 포함 4~10자리를 입력하세요.").css("color","red");
			}else{
				$(".warnPwd1").text("")
			}
		});
	});
	$(function(){
		$("#pwd2").blur(function(){
			var pwd1= $("#pwd1").val();
			var pwd2= $("#pwd2").val();
			if(pwd2=="") {
				$(".warnPwd2").text("비밀번호 확인란을 입력하세요.").css("color","red");
			}else if (pwd1 != pwd2) {
				$(".warnPwd2").text("비밀번호가 같지않습니다.").css("color","red");
			}else{
				$(".warnPwd2").text("")
			}
		});
	});
	function signForm(obj){
	 	   var reg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		    if (reg.test(obj.mail.value)==false){
		    	obj.mail.focus();
		    	return false;
		    } 

			if(obj.name.value == ""){
				obj.name.focus();
				return false;
			}
			if(obj.pwd.value == ""){
				obj.pwd.focus();
				return false;
			}else if (!/^[a-zA-Z0-9]{4,10}$/.test(obj.pwd.value)) {
				obj.pwd.focus();
				return false;
			} 
			if(obj.pwdCheck.value == ""){
				obj.pwdCheck.focus();
				return false;
			}
			if(obj.pwd.value != obj.pwdCheck.value){
				obj.pwdCheck.focus();
				return false;
			}
		}
	function search() {
		var param = $("#searchInput").val()
		url = "${root}/search.go?keyword=" + param;
		location.href = url;
	}

	$("#searchButton").click(function() {
		search();
	});

	$("#searchInput").keypress(function(event) {
		if (event.which == 13) {
			search();
		}
	});

	$("#searchInput").on("change keyup paste", function() {
		var keywordList = [];
		$.ajax({
			type : "POST",
			url : "${root}/searchAutoAjax.do",
			data : {"keyword" : $("#searchInput").val()},
			dataType:"json",
			success : function(data){
				$('#searchInput').autocomplete({
					source : data,
				    focus: function(eventCheck, ui) {
						eventCheck.preventDefault();
						console.log(ui.item.label);
						
						$("#searchInput").keydown(function(key) {
							
							if(key.which == 13) {
								$("#searchInput").val(ui.item.label);
								search();
							}
						});
					}
				   /*  source: data */
				});
			}
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
			modal.style.display = "none";
			}
		span_2.onclick = function() {
			modal_2.style.display = "none";
			modal.style.display = "block";
			$("#emailForm")[0].reset();
			}
		var span_3 = document.getElementsByClassName("close")[2];
		var emailClick = document.getElementById("joinClick");
		var modal_3 = document.getElementById("myModal_3");
		joinClick.onclick = function() {
			modal_3.style.display = "block";
			modal_2.style.display = "none";
			}
		span_3.onclick = function() {
			modal_3.style.display = "none";
			modal_2.style.display = "block";
			$("#joinForm")[0].reset();
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