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
.nav_1 {
	display: flex;
}
.nav_1 > a{
	color: #EFB730;
}
.nav_1 > input {
    width: 400px;
    font-size: 23px;
    padding-left: 20px;
    color: #EFB730;
    font-family: 'Noto Sans KR';
    outline-style: solid;
    margin-left: 5px;
}

.nav_1 > input:focus {outline:solid;}
.nav_1 > input::placeholder {
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
.title_main>span:first-child {
	margin-left: 40px;
}
/* 로그인  */
.login {
	width: 400px;
	height: 700px;
	margin: 50px;
}

.login>img {
	width: 400px;
	height: 400px;
}

.login>button {
	font-size: 23px;
	margin: 0 auto;
	display: block;
	margin-bottom: 15px;
	background: #EFB730;
}

/* 이메일 로그인 */
.email {
	width: 400px;
	height: 400px;
	margin: 200px 50px;
}

.email>form>div:nth-child(1), .email>form>div:nth-child(2) {
	margin: 20px 0;
}

.email>form>div:nth-child(3) {
	margin: 100px 0;
	width: 400px;
}

.email>form>div:nth-child(3)>a {
	float: right;
	margin: 5px 0;
	color: #030305;
}

.email>form>div>input {
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

.join>form>div {
	margin: 20px 0;
}

.join>form>div>span {
	display: block;
	margin-bottom: 10px;
}

.join>form>div>input {
	width: 385px;
	height: 50px;
	padding-left: 15px;
}

.join>form>div>.button {
	width: 197px;
	height: 50px;
	text-align: center;
	font-size: 23px;
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
	background-color: rgba(255, 255, 255, 0.95); /* Black w/ opacity */
	box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 10px;
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
	z-index: 3;
}

/* The Close Button */
.close {
	color: #000;
	float: right;
	font-size: 28px;
	font-weight: bold;
	margin-right: 15px;
}

.close:hover, .close:focus {
	color: #aaa;
	text-decoration: none;
	cursor: pointer;
}

</style>
	<div id="header">
		<div class="nav_1">
			<a href="${root}/index.jsp">EAT THE JEJU</a>
			<input type="text" id="searchInput" name="searchInput" style="border: none;" placeholder="검색어를 입력하여 주세요"   autofocus />
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
				<span class="close">&times;</span>
			</div>
			<div class="login">
				<img alt="로고" src="${root}/resources/css/jeju.png">
				<button class="button" id="emailClick"
					style="width: 180pt; height: 35pt;">이메일 로그인</button>
				<button class="button" style="width: 180pt; height: 35pt;"
					onclick="loginForm()">카카오 로그인</button>
				<div id="naver_id_login" style="text-align: center">
					<a href="${url}"> <img style="width: 240px;"
						src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
				</div>
			</div>
		</div>
	</div>
	<!-- 이메일로 로그인 -->
	<div id="myModal_2" class="modal_2">
		<div id="content_main">
			<div class="title_main">
				<span>이메일로 로그인</span> <span class="close">&times;</span>
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
						<input class="button" type="submit" value="로그인" /> <a href="#"
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
				<form action="${root}/member/signInOk.go" method="post"
					onsubmit="return signForm(this)">
					<div>
						<span>이메일</span>
						<input type="text" id="mail1" name="mail">
						<span class="warnId"></span>
					</div>
					<div>
						<span>닉네임</span>
						<input type="text" id="name1" name="name">
						<span class="warnName"></span>
					</div>
					<div>
						<span>비밀번호</span>
						<input type="password" id="pwd1" name="pwd">
						<span class="warnPwd1"></span>
					</div>
					<div>
						<span>비밀번호 확인</span>
						<input type="password" id="pwd2" name="pwdCheck">
						<span class="warnPwd2"></span>
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