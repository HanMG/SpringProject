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
	color: #F2F4EF;
}
#content_mypage {
	margin : 10px auto;
	width: 1240px;
	overflow: hidden;
}
.title_mypage {
	width: 1000px;
	height: 50px;
	background: #F2F4EF;
	line-height: 50px;
	font-size: 30px;
	border-bottom: 1px dotted;
}

/* 마이페이지 */
.myPage {
	width: 1000px;
	overflow: hidden;
	margin: 40px 120px;
	background: #F2F4EF;
}
.myPage > div:nth-child(n+2) {
	margin: 30px;
}
.myPage > div span {
	display: inline-block;
	width: 300px;
	font-size: 35px;
	text-align: center;
	margin: 5px 0;
}
.myPage button {
	float: right;
	right: 10px;
	width: 100px;
	height: 50px;
	font-size: 20px;
}
/* 모달 공용 */
#content{
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
.title {
	width: 500px;
	height: 50px;
	line-height: 50px;
	font-size: 30px;
	border-bottom: 1px dotted;
	font-weight: bold;
}
/* 개인정보 */
.title > span:first-child {
	margin-left: 40px;
}
.member {
	width: 400px;
	height: 700px;
	margin: 20px 50px;
}	
.member > div {
	margin-bottom: 20px;
}
.member > div span:nth-child(1) {
	display: inline-block;
	width: 300px;
	font-size: 23px;
}
.member > div > input {
	display: block;
	width: 100%;
	height: 50px;
	text-align: center;
	font-size: 23px;
}
.member > div > .button {
	float: left;	
	margin: 20px;
	width: 160px;
	height: 50px;
}

/* 내가 구매한 EAT 딜 */
.history {
	width: 500px;
	height: 650px;
}
.eat {
	width: 480px;
	overflow: hidden;
	margin-bottom: 10px;
	margin: 5px auto;
	border: solid 1px skyblue;
}
.info_1 {
	width: 140px;
	height: 140px;
	float: left;
}

.info_1 > img {
	width: 140px;
	height: 140px;
}
.info_2 {
	width: 330px;
	height: 140px;
	float: left;
	font-size: 20px;
}
.info_2 span {
	margin: 5px;
	display: inline-block;
}
.info_2 button {
	float: right;
	margin-right : 20px;
	width: 50px;
	height: 30px;
}
/* 리뷰 */
#content_review {
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -400px;
	margin-top: -400px;
	background: #F2F4EF;
	width: 800px;
	height: 800px;
	border-radius: 5px;
}
.history_review {
	width: 800px;
	overflow: hidden;
}
.title_review {
	width: 800px;
	height: 50px;
	line-height: 50px;
	font-size: 30px;
	border-bottom: 1px dotted;
	font-weight: bold;
}

.review {
	overflow: hidden;
	width: 780px; 
	border-bottom: 1px dotted;
	margin: 10px;
	background: tomato;
}
.review_1 {
	width: 700px;
	overflow: hidden;
	float: left;
	margin: 10px auto;
}
.review_1 > div:nth-child(2){
	min-height: 100px;
}
.review_1 img {
	width: 70px;
	height: 70px;
	margin: 5px;
}
.review_2 {
	width: 80px;
	overflow: hidden;
	float: left;
	text-align: center;
	margin: 10px auto;
}

/* 가고싶다 */
.favorite {
	width: 500px;
	overflow: hidden;
}
.like {
	overflow: hidden;
	width: 480px; 
	border-bottom: 1px dotted;
	margin: 10px;
	background: tomato;
}
.like_1 {
	width: 200px;
	overflow: hidden;
	height: 200px;
	float: left;
}
.like_1 > img {
	width: 150px;
	height: 150px;
	margin: 25px;
}
.like_2 {
	width: 200px;
	float: left;
	font-size: 20px;
	
}
.like_2 > div {
	margin-top: 10px; 
}
.like_3 {
	width: 70px;
	float: left;
	text-align: center;
}
.like_3 > img {
	vertical-align: middle;
	width: 50px;
	height: 50px;
}

/* 내가등록한 식당 */
.register {
	overflow: hidden;
	width: 500px; 
}
.reg_btn {
	width: 500px;
	height: 50px;
}
.reg_btn > button {
	width: 100px;
	height: 40px;
	float: right;
	margin: 10px;
	font-size: 20px;
}
.reg {
	width: 500px;
	height: 140px;
	background: skyblue;
	margin: 5px 0;
}
.reg_1 {
	width: 500px;
	height: 150px;
	float: left;
	font-size: 20px;
}
.reg_1 > div {
	margin: 10px;
}
.reg_1 > div > span:nth-child(2) {
	float: right;
}
.reg_1 > div > button {
	float: right;
	margin-left: 5px;
	height: 30px;
	width: 50px;
}

/* 식당 등록 */
.foodReg {
	overflow: hidden;
	width: 500px; 
}
.foodReg > form > div {
	margin: 10px 40px;
	font-size: 25px;
}
.foodReg > form > div > button {
	width: 70px;
	height: 33px;
	font-size: 25px;
}
.foodReg > form > div > input {
	width: 415px;
	height: 50px;
	padding-left: 15px;
	font-size: 23px;
	margin-bottom: 10px;
	
}



/* 모달 관련 */
.infoModal, .foodModal, .foodInModal, .eatModal, .reViewModal, .favoriteModal, .myFoodUpModal {
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
</style>
<script type="text/javascript" src="${root}/resources/jquery-3.4.1.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f30f46c40f26ed513be4c81611d91389&libraries=services"></script>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/radioButton.css" />
</head>
<body>
	<!-- 마이페이지 -->	
	<div id="content_mypage">
		<div class="myPage">
			<div class="title_mypage">
				<span>마이페이지</span>
			</div>
			<div class="nav_1">
				<div>
					<span>이름</span>
					<span>${memberDto.memberName}</span>
				</div>
				<div>
					<span>이메일</span>
					<span>${memberDto.memberMail}</span>
					<button class="button" id="infoClick">수정</button>
				</div>
				<div>
					<span>휴대폰</span>
					<span>${memberDto.memberPhone}</span>
				</div>
			</div>
			<div class="nav_2">
				<span>구매한 EAT 딜</span>
				<button class="button" id="eatClick">></button>
				<!-- <a href="${root}/member/myEd.go">></a> -->
			</div>
			<div class="nav_3">
				<span>리뷰</span>
				<button class="button" id="reViewClick">></button>
				<!-- <a href="${root}/member/myReView.go">></a> -->
			</div>
			<div class="nav_4">
				<span>가고싶다</span>
				<button class="button" id="favoriteClick">></button>
				<!-- <a href="${root}/member/myFavorite.go">></a> -->
			</div>
			<div class="nav_5">
				<span>내가 등록한 식당</span>
				<button class="button" id="foodClick">></button>
				<!-- <a href="${root}/member/myFood.go">></a> -->
			</div>
		</div>
	</div>
	<!-- 정보 수정 -->
	<div id="infoModal" class="infoModal">
		<form action="${root}/member/memberUpdateOk.go" method="post">
			<input type="hidden" value="${memberDto.memberCode}" name="memberCode"/>		
			<div id=content>
				<div class="title">
					<span>정보 수정</span>
					<span class="close">&times;</span>
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
						<input class="button" type="submit" value="수정">
						<input class="button" type="reset" value="취소">
					</div>
				</div>
			</div>
		</form>
	</div>
	<!-- 구매한 EAT 딜 -->
	<div id="eatModal" class="eatModal">
		<div id="content">
			<div class="history">
				<div class="title">
					<span>구매한 EAT딜</span>
					<span class="close">&times;</span>
				</div>
				
				<c:forEach var="couponList" items="${couponList}">
					<div class="eat" style="cursor:pointer;" onclick="location.href='${root}/food/read.go?foodCode=${couponList.foodCode}'">
						<div class="info_1">
							<img alt="쿠폰" src="${couponList.imagePath}" onerror="this.src='${root}/resources/css/list.jpg'">
						</div>
						<div class="info_2">
							<div>
								<span style="font-weight: bold;">${couponList.couponName}</span>
							</div>
							<div>
								<span style="font-size: 14px;">${couponList.couponIntro}</span>
							</div>
							<div>
								<span style="font-size: 14px; text-decoration:line-through; color: #9b9b9b;">${couponList.couponCostori}</span> 
							</div>
							<div>
								<span style="color: #EFB730;">${couponList.couponCostsale}</span>
								<button class="button"><a href="#">취소</a></button>
							</div>
						</div>
					</div>
				</c:forEach>
				
			</div>
		</div>
	</div>
	<!-- 리뷰 -->
	<div id="reViewModal" class="reViewModal">
		<div id="content_review">
			<div class="history_review">
				<div class="title_review">
					<span>리뷰 내역</span>
					<span class="close">&times;</span>
				</div>
				
				<c:forEach var="reviewList" items="${reviewList}">
					<div class="review">
						<div class="review_1">
							<div>${reviewList.reviewDate}작성일</div>
							<div>${reviewList.reviewCont}</div>
							<div>
								<%-- <c:forEach items="${reviewList}"> --%>							
									<%-- <img alt="리뷰" src="${reviewList.imageName}"> --%>
								<%-- </c:forEach> --%>
							</div> 
						</div>
						<div class="review_2">
							<span>${reviewList.reviewScore}</span>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	
	<!-- 가고싶다 -->
	<div id="favoriteModal" class="favoriteModal">
		<div id="content">
			<div class="favorite">
				<div class="title">
					<span>가고싶다</span>
					<span class="close">&times;</span>
				</div>
				<div class="like">
					<div class="like_1">
						<img alt="가게" src="${root}/resources/css/list.jpg">
					</div>
					<div class="like_2">
						<div>지역군</div>
						<div>음식점명</div>
						<div>별점</div>
						<div>조회수</div>
						<div>리뷰수</div>
					</div>
					<div class="like_3">
						<img alt="별점" src="${root}/resources/css/icon.PNG">
					</div>
				</div>
				<div class="like">
					<div class="like_1">
						<img alt="가게" src="${root}/resources/css/list.jpg">
					</div>
					<div class="like_2">
						<div>지역군</div>
						<div>음식점명</div>
						<div>별점</div>
						<div>조회수</div>
						<div>리뷰수</div>
					</div>
					<div class="like_3">
						<img alt="별점" src="${root}/resources/css/icon.PNG">
					</div>
				</div>
				<div class="like">
					<div class="like_1">
						<img alt="가게" src="${root}/resources/css/list.jpg">
					</div>
					<div class="like_2">
						<div>지역군</div>
						<div>음식점명</div>
						<div>별점</div>
						<div>조회수</div>
						<div>리뷰수</div>
					</div>
					<div class="like_3">
						<img alt="별점" src="${root}/resources/css/icon.PNG">
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 내가 등록한 식당 -->
	<div id="foodModal" class="foodModal">
		<div id="content">
			<div class="food">
				<div class="title">
					<span>내가 등록한 식당</span>
					<span class="close">&times;</span>
				</div>
				<div class="register">
					<div class="reg_btn">
						<button class="button" id="foodInClick">식당 등록</button>
						<!-- <a href="${root}/member/myFoodIn.go">식당 등록</a> -->
					</div>
					<c:forEach var="foodList" items="${foodList}">
						<div class="reg" id="${foodList.foodCode}">
							<div class="reg_1">
								<div>
									<span>${foodList.foodName }</span>
									<%-- <c:choose>
										<c:when test="${foodList.foodStatus == 0 }">
											<span>등록중</span>
										</c:when>
										<c:when test="${foodList.foodStatus != 0 }">
											<span>등록됨</span>
										</c:when>
									</c:choose> --%>
									<span>${foodList.foodStatus}</span>
								</div>
								<div>
									<span>${foodList.foodKind}</span>
									<button class="button" onclick="myFoodDel('${foodList.foodCode}')">삭제</button>
									<button class="button" id="myFoodUpClick">수정</button>
								</div>
								<div>
									<span>${foodList.foodAddr}</span>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<!-- 식당 등록 -->
	<div id="foodInModal" class="foodInModal">
		<div id="content">
			<div class="food">
				<div class="title">
					<span>식당 등록</span>
					<span class="close">&times;</span>
				</div>
				<div class="foodReg">
					<form action="${root}/member/myFoodWrite.go" method="post">
						<div>
							<span>식당이름 (예:카멜리아)</span>
						</div>
						<div>
							<input type="text" name="foodName">
						</div>
						<div>
							<span>지역 및 위치 선택</span>
							<button type="button" class="button" onclick="sample5_execDaumPostcode()">지도</button>
						</div>
						<div>
							<input type="text" id="sample5_address" name="foodAddr">
						</div>
						<div id="map" style="width:200px;height:200px;margin-top:10px;display:none"></div>
						<div>
							<span>음식 종류 선택</span>
						</div>
						<div class="container_1">
							<div class="radio-tile-group">
								<div class="input-container">
									<input id="walk" class="radio-button" type="radio" name="foodKind" value="한식"/>
									<div class="radio-tile">
									<label for="walk" class="radio-tile-label">한식</label>
									</div>
								</div>
								<div class="input-container">
									<input id="bike" class="radio-button" type="radio" name="foodKind" value="중식" />
									<div class="radio-tile">
									<label for="bike" class="radio-tile-label">중식</label>
									</div>
								</div>
								<div class="input-container">
									<input id="drive" class="radio-button" type="radio" name="foodKind" value="일식"/>
									<div class="radio-tile">
									<label for="drive" class="radio-tile-label">일식</label>
									</div>
								</div>
								<div class="input-container">
									<input id="drive" class="radio-button" type="radio" name="foodKind" value="양식"/>
									<div class="radio-tile">
									<label for="drive" class="radio-tile-label">양식</label>
									</div>
								</div>
								<div class="input-container">
									<input id="drive" class="radio-button" type="radio" name="foodKind" value="카페"/>
									<div class="radio-tile">
									<label for="drive" class="radio-tile-label">카페</label>
									</div>
								</div>
								<div class="input-container">
									<input id="drive" class="radio-button" type="radio" name="foodKind" value="기타"/>
									<div class="radio-tile">
									<label for="drive" class="radio-tile-label">기타</label>
									</div>
								</div>
							</div>
						</div>
						<div>
							<input class="button" type="submit" value="등록하기">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 식당 수정 -->
	<div id="myFoodUpModal" class="myFoodUpModal">
		<div id="content">
			<div class="food">
				<div class="title">
					<span>식당 수정</span>
					<span class="close">&times;</span>
				</div>
				<div class="foodReg">
					<form action="${root}/member/myFoodWrite.go" method="post">
						<div>
							<span>식당이름 (예:카멜리아)</span>
						</div>
						<div>
							<input type="text" name="foodName" value="">
						</div>
						<div>
							<span>지역 및 위치 선택</span>
							<button type="button" class="button" onclick="sample5_execDaumPostcode()">지도</button>
						</div>
						<div>
							<input type="text" id="sample5_address" name="foodAddr">
						</div>
						<div id="map" style="width:200px;height:200px;margin-top:10px;display:none"></div>
						<div>
							<span>음식 종류 선택</span>
						</div>
						<div class="container">
							<div class="radio-tile-group">
								<div class="input-container">
									<input id="walk" class="radio-button" type="radio" name="foodKind" value="한식"/>
									<div class="radio-tile">
									<label for="walk" class="radio-tile-label">한식</label>
									</div>
								</div>
								<div class="input-container">
									<input id="bike" class="radio-button" type="radio" name="foodKind" value="중식" />
									<div class="radio-tile">
									<label for="bike" class="radio-tile-label">중식</label>
									</div>
								</div>
								<div class="input-container">
									<input id="drive" class="radio-button" type="radio" name="foodKind" value="일식"/>
									<div class="radio-tile">
									<label for="drive" class="radio-tile-label">일식</label>
									</div>
								</div>
								<div class="input-container">
									<input id="drive" class="radio-button" type="radio" name="foodKind" value="양식"/>
									<div class="radio-tile">
									<label for="drive" class="radio-tile-label">양식</label>
									</div>
								</div>
								<div class="input-container">
									<input id="drive" class="radio-button" type="radio" name="foodKind" value="카페"/>
									<div class="radio-tile">
									<label for="drive" class="radio-tile-label">카페</label>
									</div>
								</div>
								<div class="input-container">
									<input id="drive" class="radio-button" type="radio" name="foodKind" value="기타"/>
									<div class="radio-tile">
									<label for="drive" class="radio-tile-label">기타</label>
									</div>
								</div>
							</div>
						</div>
						<div>
							<input class="button" type="submit" value="등록하기">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
	
	function myFoodDel(foodCode){
		var url = "${root}/myFoodDel.go?foodCode=" + foodCode;
		$.ajax({
			url : url,
			type : "GET",
			dataType : "text",
			success : function(data){
				$("#"+data).remove();
			}
		});
	}

	/*  개인정보 클릭시 작동 */
	var infoModal = document.getElementById("infoModal");
	var infoClick = document.getElementById("infoClick");
	var span = document.getElementsByClassName("close")[3];
	infoClick.onclick = function() {
		infoModal.style.display = "block";
		}
	span.onclick = function() {
		infoModal.style.display = "none";
		}
	/*  구매한 EAT 딜 클릭시 작동 */
	var eatModal = document.getElementById("eatModal");
	var eatClick = document.getElementById("eatClick");
	var span = document.getElementsByClassName("close")[4];
	eatClick.onclick = function() {
		eatModal.style.display = "block";
		}
	span.onclick = function() {
		eatModal.style.display = "none";
		}
	/*  리뷰 클릭시 작동 */
	var reViewModal = document.getElementById("reViewModal");
	var reViewClick = document.getElementById("reViewClick");
	var span = document.getElementsByClassName("close")[5];
	reViewClick.onclick = function() {
		reViewModal.style.display = "block";
		}
	span.onclick = function() {
		reViewModal.style.display = "none";
		}
	/*  가고싶다 클릭시 작동 */
	var favoriteModal = document.getElementById("favoriteModal");
	var favoriteClick = document.getElementById("favoriteClick");
	var span = document.getElementsByClassName("close")[6];
	favoriteClick.onclick = function() {
		favoriteModal.style.display = "block";
		}
	span.onclick = function() {
		favoriteModal.style.display = "none";
		}
	/*  내가 등록한 식당 클릭시 작동 */
	var foodModal = document.getElementById("foodModal");
	var foodClick = document.getElementById("foodClick");
	var span = document.getElementsByClassName("close")[7];
	foodClick.onclick = function() {
		foodModal.style.display = "block";
		}
	span.onclick = function() {
		foodModal.style.display = "none";
		}
	/* 식당 등록 클릭시 작동 */
	var foodInModal = document.getElementById("foodInModal");
	var foodInClick = document.getElementById("foodInClick");
	var span = document.getElementsByClassName("close")[8];
	foodInClick.onclick = function() {
		foodInModal.style.display = "block";
		}
	span.onclick = function() {
		foodInModal.style.display = "none";
		}
	/* 식당 수정 클릭시 작동 */
	var myFoodUpModal = document.getElementById("myFoodUpModal");
	var myFoodUpClick = document.getElementById("myFoodUpClick");
	var span = document.getElementsByClassName("close")[9];
	myFoodUpClick.onclick = function() {
		myFoodUpModal.style.display = "block";
		}
	span.onclick = function() {
		myFoodUpModal.style.display = "none";
		}
	
	
	/* 지도 검색 */
	
	var themeObj = {
		   bgColor: "#EFB730", //바탕 배경색
		   //searchBgColor: "", //검색창 배경색
		   //contentBgColor: "", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
		   pageBgColor: "#FAFAFA", //페이지 배경색
		   //textColor: "", //기본 글자색
		   //queryTextColor: "", //검색창 글자색
		   //postcodeTextColor: "", //우편번호 글자색
		   emphTextColor: "#008BD3", //강조 글자색
		   outlineColor: "#E0E0E0" //테두리
		};	

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
        	theme: themeObj,
            oncomplete: function(data) {
            	var themeObj = {
            			   bgColor: "#FFDC00", //바탕 배경색
            			   //searchBgColor: "", //검색창 배경색
            			   //contentBgColor: "", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
            			   pageBgColor: "#FAFAFA", //페이지 배경색
            			   //textColor: "", //기본 글자색
            			   //queryTextColor: "", //검색창 글자색
            			   //postcodeTextColor: "", //우편번호 글자색
            			   emphTextColor: "#008BD3", //강조 글자색
            			   outlineColor: "#E0E0E0" //테두리
            			};
            	
                var addr = data.address; // 최종 주소 변수
                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
	
</script>

</body>
</html>