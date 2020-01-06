<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<style>
#myPage {
	max-width: 1000px;
	margin: 0 auto;
	margin-top: 40px;
}

#myInfo {
	display: flex;
	background: #F7F7F7;
	padding: 20px 30px;
	margin-bottom: 30px;
}
#myInfo > div {
	color: #030305;
}
#myInfo > div:first-child {
	display: flex;
	flex: 1;
	flex-direction: column;
}
#myInfo > div:first-child >span:first-child {
	font-size: 30px;
	margin-bottom: 20px;
}
#myInfo > div:last-child {
	flex: 3;
	margin-top: auto;
	display: flex;
	justify-content: space-around;
}
.reviews {
	display: flex;
	box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 10px;
}
.review_1 {
	flex: 9;
	flex-direction: column;
	display: flex;
}
.review_1 > span:first-child{
	font-size: 12px;
	color: #9b9b9b;
}
.review_1 > div{
	display: flex;
}
.review_1 > div > img{
	width: 70px;
	height: 70px;
}
.review_2 {
	flex: 1;
	flex-direction: column;
	display: flex;
	justify-content: center;
}
.review_2 > div {
	 text-align: center;
}

#myReview > span, .coupon_1 > span, .favorite_1 > span, .food_1 > span {
	font-size: 27px;
	margin-top: 20px;
	padding-bottom: 10px;
}
#myCoupon, #myFavorite, #myFood {
	display: flex;
	flex-direction: column;
}
.coupon_1, .favorite_1, .food_1 {
	border-bottom: solid 3px black;
	display: flex;
    justify-content: space-between;
    align-items: baseline;
}
.coupon_2, .favorite_2, .food_2 {
	display: flex;
	flex-direction: column;
	box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 10px;
	margin-bottom: 20px;
}
.coupon_2 ul, .favorite_2 ul, .food_2 ul {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	align-items: center;
	margin: 5px 0;
}
.coupon_2 ul:first-child, .favorite_2 ul:first-child, .food_2 ul:first-child {
	border-bottom: solid 1px black;
}
.coupon_2 li, .favorite_2 li, .food_2 li {
	flex: 1 1 100px;
	text-align: center;
}

.coupon_2 ul img, .favorite_2 ul img {
	width: 70px;
	height: 70px;
}
.coupon_N {
	color: #9b9b9b;
	text-decoration: line-through;
}

/* 모달 공용 */
#content{
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -300px;
	margin-top: -400px;
	min-width: 450px;
	background: transparent;
}
.title {
	font-size: 30px;
	font-weight: bold;
	color: white;
	display: flex;
	padding: 30px 0;
}
.member {
	background: white;
	border-radius: 5px;
	display: flex;
	flex-direction: column;
	padding: 30px 0;
}	
.member i {
	font-size: 23px;
}
.member > div {
	display: flex;
    flex-direction: row;
    justify-content: center;
    border-bottom: solid 1px #9b9b9b;
    padding: 10px 0;
    align-items: center;
}
.member > div > input {
	text-align: center;
    font-size: 23px;
    border: transparent;
}
.member > div > input[type="text"]:disabled {
	background: white;
}
.member > div:last-child {
    border-bottom: none;
}
.member > div:last-child > input {
	margin: 0 10px;
	padding: 5px 10px;
}
/* 모달 관련 */
.infoModal, .foodInModal {
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
  background-color: rgba(0, 0, 0, 0.8); /* Black w/ opacity */
}
/* 음식점 등록 */
.foodReg {

}
.foodReg > form {
	display: flex;
    flex-direction: column;
    background: white;
    border-radius: 5px;
}
.foodReg > form > div {
	font-size: 25px;
	margin: 5px 20px;
}

.foodReg > form > div:last-child {
	text-align: center;
    margin: 20px;
}
.foodReg > form > div > button {
	font-size: 25px;
}
.foodReg > form > div > input {
	font-size: 23px;
}
.input-container {
	width: 65px;
	height: 50px;;
}

.emoticon {
	font-size: 30px;
	color: #EFB730;
	text-align: center;
}
#foodInClick {
	font-size: 23px;
}
</style>
<body>
	<div id="myPage">
		<div id="myInfo">
			<div>
				<span>마이페이지</span>
				<div>
					<span>${memberDto.memberName}</span>
					<a href="#" id="infoClick">회원정보변경</a>
				</div>
			</div>
			<div>
				<span>가입일  : <fmt:formatDate value="${memberDto.memberDate}" pattern="yyyy-MM-dd" /></span>
				<span>리뷰 : ${reviewCount}</span>
				<span>쿠폰 : ${couponCount}</span>
				<span>가고싶다 : ${favoriteCount}</span>
			</div>
		</div>
		<div id="myReview">
			<span>리뷰</span>
			<c:forEach var="reviewList" items="${reviewList}">
			<div class="reviews">
				<div class="review_1" style="cursor: pointer;" onclick="location.href='${root}/food/read.go?foodCode=${reviewList.foodCode}'">
					<span><fmt:formatDate value="${reviewList.reviewDate}" pattern="yyyy-MM-dd" /></span>
					<span>${reviewList.reviewCont}</span>
					<div>
						<c:set var="img" value="${fn:split(reviewList.imageName,',')}" />
						<c:forEach var="imgList" items="${img}">
							<img src="/img/${imgList}" alt="이미지 준비중" style="width: 100px; height: 100px;" />
						</c:forEach>
					</div>
				</div>
				<div class="review_2">
					<c:choose>
						<c:when test="${reviewList.reviewScore == 5}">
							<i class="fa fa-smile-o emoticon" aria-hidden="true"></i>
						</c:when>
						<c:when test="${reviewList.reviewScore == 3}">
							<i class="fa fa-meh-o emoticon" aria-hidden="true"></i>
						</c:when>
						<c:when test="${reviewList.reviewScore == 1}">
							<i class="fa fa-frown-o emoticon" aria-hidden="true"></i>
						</c:when>
					</c:choose>
					<div>
						<a href="${root}/review/myUpdate.go?foodCode=${reviewList.foodCode}&reviewCode=${reviewList.reviewCode}">수정</a>
						<a href="javascript:void(0)" onclick="userDelete('${root}','${reviewList.foodCode}','${reviewList.reviewCode}')">삭제</a>					
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
		<div id="myCoupon">
			<div class="coupon_1">
				<span>구매한 쿠폰</span>
			</div>
			<div class="coupon_2">
				<ul>
				  <li>이미지</li>
				  <li>쿠폰명</li>
				  <li>유효기간</li>
				  <li>결제금액</li>
				  <li>상태</li>
				  <li>비고</li>
				</ul>
				<c:forEach var="couponList" items="${couponList}">
				<c:choose>
					<c:when test="${couponList.purchaseStatus == 'Y'}">
						<ul>
							<li><img alt="쿠폰" src="${root}/resources/ftp/${couponList.imageName}" onerror="this.src='${root}/resources/css/list.jpg'"></li>
							<li style="cursor:pointer;" onclick="location.href='${root}/coupon/couponRead.go?couponCode=${couponList.couponCode}'">${couponList.couponName} </li>
							<li>
								<fmt:parseDate value="${couponList.couponStartdate}" var="startDate" pattern="yyyy-MM-dd" />
								<fmt:formatDate value="${startDate}" pattern="yyyy년  MM월  dd일" /><br /> ~ 
								<fmt:parseDate value="${couponList.couponEnddate}" var="endDate" pattern="yyyy-MM-dd " />
								<fmt:formatDate value="${endDate}" pattern="yyyy년  MM월  dd일 " />
							</li>
							<li>${couponList.couponCostsale}원</li>
							<li>
							<c:choose>
								<c:when test="${couponList.purchaseStatus == 'Y'}">
									<span>사용가능</span>
								</c:when>
								<c:when test="${couponList.purchaseStatus == 'N'}">
									<span>취소됨</span>
								</c:when>
							</c:choose>
							</li>
							<li>
								<span style="cursor: pointer; color: #EFB730;" onclick="myCouponDel('${couponList.purchaseCode}')">취소하기</span>
							</li>
						</ul>
					</c:when>
					<c:when test="${couponList.purchaseStatus == 'N'}">
						<ul class="coupon_N">
							<li><img alt="쿠폰" src="${root}/resources/ftp/${couponList.imageName}" onerror="this.src='${root}/resources/css/list.jpg'"></li>
							<li style="cursor:pointer;" onclick="location.href='${root}/coupon/couponRead.go?couponCode=${couponList.couponCode}'">${couponList.couponName} </li>
							<li>
								<fmt:parseDate value="${couponList.couponStartdate}" var="startDate" pattern="yyyy-MM-dd" />
								<fmt:formatDate value="${startDate}" pattern="yyyy년  MM월  dd일" /><br /> ~ 
								<fmt:parseDate value="${couponList.couponEnddate}" var="endDate" pattern="yyyy-MM-dd " />
								<fmt:formatDate value="${endDate}" pattern="yyyy년  MM월  dd일 " />
							</li>
							<li>${couponList.couponCostsale}원</li>
							<li>
							<c:choose>
								<c:when test="${couponList.purchaseStatus == 'Y'}">
									<span>사용가능</span>
								</c:when>
								<c:when test="${couponList.purchaseStatus == 'N'}">
									<span>취소됨</span>
								</c:when>
							</c:choose>
							</li>
							<li>
								<span style="color: #EFB730;"></span>
							</li>
						</ul>
					</c:when>
				</c:choose>
				
				
				</c:forEach>
			</div>
		</div>
		<div id="myFavorite">
			<div class="favorite_1">
				<span>가고싶다</span>
			</div>
			<div class="favorite_2">
				<ul>
				  <li>이미지</li>
				  <li>음식점명</li>
				  <li>지역군</li>
				  <li>평점</li>
				  <li>조회수</li>
				  <li>리뷰수</li>
				  <li>상태</li>
				</ul>
				<c:forEach var="favoriteList" items="${favoriteList}">
				<ul id="${favoriteList.foodCode}">
				  <li><img alt="음식점" src="/img/${favoriteList.imageName}"></li>
				  <li>${favoriteList.foodName}</li>
				  <li>${favoriteList.foodArea} </li>
				  <c:choose>
				  	<c:when test="${favoriteList.avg == 0.0}">
				  		<li>0</li>
				  	</c:when>
				  	<c:otherwise>
					  <li><fmt:formatNumber value="${favoriteList.avg}" pattern=".0"></fmt:formatNumber></li>
				  	</c:otherwise>
				  </c:choose>
				  <li>${favoriteList.foodRead}</li>
				  <li>${favoriteList.count}</li>
				  <li><i style="cursor: pointer;" onclick="favorSwitch(this, '${favoriteList.foodCode}')" class="fa fa-heart"></i></li>
				</ul>
				</c:forEach>
			</div>
		</div>
		<div id="myFood">
			<div class="food_1">
				<span>내가 등록한 음식점</span>
				<a id="foodInClick" href="#">음식점등록</a>
			</div>
			<div class="food_2">
				<ul>
				  <li>음식점명</li>
				  <li>주소</li>
				  <li>종류</li>
				  <li>상태</li>
				  <li>비고</li>
				</ul>
				<c:forEach var="foodList" items="${foodList}">
				<ul id="${foodList.foodCode}">
				  <li>${foodList.foodName}</li>
				  <li>${foodList.foodAddr}</li>
				  <li>${foodList.foodKind} </li>
				  <li>${foodList.foodStatus}</li>
				  <c:choose>
						<c:when test="${foodList.foodStatus == 'N'}">
						  <li style="cursor: pointer; color: #EFB730;" onclick="myFoodDel('${foodList.foodCode}')">취소</li>
						</c:when>
						<c:when test="${foodList.foodStatus == 'Y'}">
						  <li>등록됨</li>
						</c:when>
					</c:choose>
				  
				</ul>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- 모달 -->
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
						<i class="fa fa-user-circle-o" aria-hidden="true"></i><input type="text" name="memberName" value="${memberDto.memberName}" placeholder="닉네임">
					</div>
					<div>
						<input type="hidden" value="${memberDto.memberMail}" name="memberMail"/>
						<i class="fa fa-envelope-o" aria-hidden="true"></i><input type="text" name="mail_2" value="${memberDto.memberMail}" disabled="disabled"/>
					</div>
					<div>
						<i class="fa fa-mobile" aria-hidden="true"></i><input type="text" name="memberPhone" value="${memberDto.memberPhone}" placeholder="휴대폰 번호">
					</div>
					<div>
						<i class="fa fa-unlock-alt" aria-hidden="true"></i><input type="password" name="memberPwd" value="${memberDto.memberPwd}" placeholder="패스워드">
					</div>
					<div>
						<i class="fa fa-check-square" aria-hidden="true"></i><input type="password" name="pwdCheck" value="${memberDto.memberPwd}" placeholder="패스워드 확인">
					</div>
					<div>
						<input class="button" type="submit" value="수정">
						<input class="button" type="reset" value="취소">
					</div>
				</div>
			</div>
		</form>
	</div>
	<!-- 음식점 등록 -->
	<div id="foodInModal" class="foodInModal">
		<div id="content">
			<div class="food">
				<div class="title">
					<span>음식점 등록</span>
					<span class="close">&times;</span>
				</div>
				<div class="foodReg">
					<form action="${root}/member/myFoodWrite.go" method="post">
						<div>
							<span>음식점이름 (예:카멜리아)</span>
						</div>
						<div>
							<input type="text" name="foodName">
						</div>
						<div>
							<span>지역 및 위치 선택</span>
							<i style="cursor: pointer;" onclick="sample5_execDaumPostcode()" class="fa fa-map-marker" aria-hidden="true"></i>
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
	<script type="text/javascript">
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
	/* 음식점 등록 클릭시 작동 */
	var foodInModal = document.getElementById("foodInModal");
	var foodInClick = document.getElementById("foodInClick");
	var span = document.getElementsByClassName("close")[4];
	foodInClick.onclick = function() {
		foodInModal.style.display = "block";
		}
	span.onclick = function() {
		foodInModal.style.display = "none";
		}
	
	//리뷰 삭제 관련
	function userDelete(root, foodCode, reviewCode){
		let isOk = confirm("정말로 리뷰를 삭제하시겠습니까?");
		if(isOk == true){
		let url = root+"/review/myUserDelete.go?reviewCode="+reviewCode+"&foodCode="+foodCode;		
		location.href=url;	
		}
	}
	// 내가 등록한 음식점 삭제
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

	/* 가고싶다 버튼 */
	var root = "${root}";
	var memberCode = "${memberCode}";
	var foodCode = "";
	var favorStatus = "";	

	function favorSwitch(x, foodCode) {
		foodCode = foodCode;
		if (x.className == "fa fa-heart") {
			favorStatus = "on";
		} else {
			favorStatus = "off";
		}
		$.ajax({
			type : "POST",
			url : root + "/favorite/switch.do",
			data : { "memberCode" : memberCode, "foodCode" : foodCode, "favorStatus" : favorStatus},
			success : function(data) {
				console.log(data);
				favorStatus = data;
				if (favorStatus === "on") {
					$("#"+foodCode).remove();
				} else if (favorStatus === "off") {
					$("#"+foodCode).remove();
				}
			}, error: function (request, status, error) {
				alert("error");
			}
		});
	}


	var header = document.getElementById("header");
	/* 내가 등록한 음식점 삭제 */	
	function myFoodDel(foodCode){
		var url = "${root}/myFoodDel.go?foodCode=" + foodCode;
		$.ajax({
			url : url,
			type : "GET",
			dataType : "text",
			success : function(data){
				location.reload();
			}
		});
	}
	
	/* 내가 구매한 쿠폰 삭제 */
	function myCouponDel(purchaseCode){
		var url = "${root}/purchase/purchaseDeleteOk.go?purchaseCode=" + purchaseCode;
		let isOk = confirm("정말로 취소 하시겠습니까?");
		if(isOk == true){
			$.ajax({
				url : url,
				type : "POST",
				dataType : "json",
				success : function(data){
					alert("취소처리 되었습니다.")
					location.reload();
				}
			});
		}
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
