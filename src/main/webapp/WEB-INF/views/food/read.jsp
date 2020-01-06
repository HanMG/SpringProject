<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>음식점상세페이지</title>
<%-- <link rel="stylesheet" href="${root}/resources/css/food/read.css" /> --%>

<style type="text/css">
.fa {
  font-size: 25px;
  cursor: pointer;
  user-select: none;
}

.fa:hover {
  color: #EFB730;
}

#content {
	margin : 0 auto;
	max-width: 1200px;
   	margin-top: 40px;
   	display: flex;
}
/* 음식점 상세 */
.read_nav_1 {
	display: flex;
	flex: 2;
	flex-direction: column;
}
/* 음식점 대표 이미지, 지도 */
.read_nav_2 {
	display: flex;
	flex: 1;
	flex-direction: column;
	height: 800px;
}
.info_1 {
	display: flex;
}
/* 음식점명, 별점, 리뷰쓰기, 가고싶다 */
.info_1 > span > span {
	color: #EFB730;
}
/* 음식점명, 별점 */
.info_1 > span {
	font-size: 30px;
}
/* 리뷰쓰기, 가고싶다 */
.info_1 > div i > span {
	font-size: 12px;
}
.info_1 > div {
	display: flex;
    text-align: center;
    margin-left: auto;
}
.info_1 > div > a {
	margin-left: 10px;
	color: #030305;
}

/* 조회수, 리뷰수, 즐겨찾기 */
.info_2, .info_3, .coupon {
	border-bottom: 1px solid #ddd;
}

.info_3, .coupon {
    padding-bottom: 20px;
    margin-top: 20px;
}


.info_2 > span, .info_2 > i {
	font-size: 12px;
}
/* 음식점 상세설명 */
.info_3 {
	display: flex;
    flex-direction: column;
}
.info_3 > div {
	display: flex;
	padding-left: 20px;
	margin-bottom: 5px;
    align-items: center;
}
.info_3 > div > span:first-child {
	font-size: 12px;
	color: #9b9b9b;
	flex: 2;
}
.info_3 > div > span:last-child {
	flex: 8;
}
/* EAT 딜 */
.coupon {
	display: flex;
}
.eat_1 {
	text-align: center;
	color: #EFB730;
	font-size: 23px;
	flex: 1;
	margin-top: 10px;
}
/* 쿠폰 상세 설명 */
.eat_2 {
	flex: 9;
	flex-direction: column;
	display: flex;
}
.eat_2 > div > span {
	font-size: 20px;
}

.eat_2 > div:first-child {
	margin: 10px 0;
	text-align: center;
}

.eat_2 img {
	width: 100%;
	height: 200px;
}
.slideshow-container {
	display: flex;
}
.eat_2 .prev, .eat_2 .next {
	margin-top: -60px;
}
.fade {
	display: flex;
	flex-direction: column;
	padding: 0 100px;
}
.reviewFade {

}

.couponSalerate {
	display: inline-block;
    position: absolute;
    font-size: 17px;
    font-weight: bold;
    color: white;
    background: #EFB730;
    padding: 3px 10px;;
  	top: 0;
  	left: 100px;
}
.couponCouponName {
	display: inline-block;
    position: absolute;
    font-size: 17px;
    font-weight: bold;
    color: white;
    background-color: rgba(0,0,0,0.4);
    padding: 3px 10px;
    bottom: 5px;
    right: 100px;
}
.couponCostsale {
	display: inline-block;
    position: absolute;
    font-size: 17px;
    font-weight: bold;
    color: white;
    background-color: rgba(0,0,0,0.4);
    padding: 0px 10px;
    bottom: 36px;
    right: 100px;
}

/* 리뷰 */
#review {
	display: flex;
	flex-direction: column;
}
/* 리뷰수, 별점(전체, 맛있다, 괜찮다, 별로) */
.re_1 {
	display: flex;
    justify-content: space-between;
    padding: 0 20px;
    font-size: 20px;
    margin-top: 20px;
    margin-bottom: 20px;
}
.re_1 > div > a {
	margin-right: 10px;
}
.re_1 > span {
	color: #EFB730;
}
/* 별점(전체, 맛있다, 괜찮다, 별로) */
/* 닉네임, 리뷰내용, 별점 */
/* 닉네임 */
.re_2 {
	display: flex;
	align-items: center;
	/* box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 10px; */
	padding: 10px;
    border-bottom: 1px solid #ddd;
}

.re_2 > div > a {
	color: #030305;
}
.re_2 > div:nth-child(1) {
	text-align: center;
	flex: 2;
}
/* 리뷰내용 */
.re_2 > div:nth-child(2) {
	flex: 7;
}
.re_2 > div:nth-child(3) {
	flex: 1;
	text-align: center;
}
/* 리뷰 내용 - 등록일 */

.reviewCont > span:first-child {
	display: block;
	font-size: 14px;
	color: #9b9b9b;
}

/* 리뷰 이미지들 */
.reviewImg {
	margin-top: 6px;
}
.reviewImg > img {
	width: 100px;
	height: 100px;
}

/* 리뷰 별점 */
.read_nav_2 .img > img{
	width: 350px;
	height: 350px;
	margin: 0 20px;
	position: fixed;
}
.emoticon {
	font-size: 40px;
	color: #EFB730;
	text-align: center;
}
.map {	
	width: 350px;
	height: 300px;
	margin: 0 20px;
	position: fixed;
	display: flex;
	top: 450px;
}

/* 모달 관련 */
/* 리뷰 작성 */
#content_reView{
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -500px;
	margin-top: -400px;
	max-width: 1000px;
	border-radius: 5px;
	background: transparent;
}

.reViewIn {
	display: flex;
	flex-direction: column;
}

.reViewIn > .in {
	display: flex;
    flex-direction: column;
    background: white;
    border-radius: 5px;
}

.title_reView > span:first-child {
	margin-left: 40px;
}

.in > p{
	font-size: 23px;
	margin-top: 20px;
	margin-left: 10px;
}
.in > p > strong {
	color: #EFB730;
}
.container_1 {
	margin: 20px 0;
}
.reViewArea {
	margin: 0 10px;
	resize:none;
	width: 980px;
	height: 350px;
	font-size: 20px;
	font-weight: bold;
}
/* 리뷰 상세내용 */
#content_reViewInfo{
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -400px;
	margin-top: -400px;
	width: 800px;
	border-radius: 5px;
	overflow: hidden;
	
}

.reViewInfo {
	width: 800px;
	overflow: hidden;
	background: #F2F4EF;
}
.title_reViewInfo {
	width: 800px;
	height: 50px;
	background: white;
	line-height: 50px;
	font-size: 30px;
}

.title_reView {
	font-size: 30px;
	color: white;
	margin: 30px 0;
}

.title_reViewInfo > span:first-child {
	margin-left: 20px;
}


.reViewInModal {
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

.reViewInfoModal {
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
  background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
}
.close_reView, .close_reViewInfo {
  color: white;
  float: right;
  font-size: 28px;
  font-weight: bold;
  margin-right: 15px;
}
.close_reView:hover, .close_reViewInfo:hover,
.close_reView:focus, .close_reViewInfo:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}
/* 파일 버튼 수정  */
.box-file-input {
	margin: 10px;
}
.button {
	font-size: 23px;
    width: 100px;
    height: 50px;
    margin: 10px;
}
/* 라디오버튼 수정부분 */
.radio-tile-group {
	justify-content: flex-start;
	margin-left: 10px;
}

/* 큰이미지 관련 */
.slideshow-review {
  max-width: 800px;
  position: relative;
  margin: auto;
  background: white;
}
.reviewContent {
	width: 800px;
	overflow: hidden;
	margin: auto;
	background: white;
}
#reviewDate {
	color: #9b9b9b;
	font-size: 12px;
	height: 20px;
	width: 800px;
	float: right;
}
#reviewCont {
	font-size: 23px;
	overflow: hidden;
	width: 780px;
	margin-left: 20px;
	min-height: 200px;
}

.cp_prev, .cp_next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -30px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}


/* Position the "next button" to the right */
.cp_next {
  right: 100px;
  border-radius: 3px 0 0 3px;
}
/* On hover, add a black background color with a little bit see-through */
.cp_prev:hover, .cp_next:hover {
  background-color: rgba(0,0,0,0.8);
}
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f30f46c40f26ed513be4c81611d91389&libraries=services"></script>
</head>
<body>
	<div id="content">
		<div class="read_nav_1">
			<div class="info_1">
				<span>
					${foodDto.foodName}
					<span>
						<c:choose>
							<c:when test="${searchFoodDto != null}">
								<fmt:formatNumber value="${searchFoodDto.reviewScore}" pattern=".0"/>
							</c:when>
							<c:otherwise>별점 없음</c:otherwise>
						</c:choose>
					</span>
				</span> 
				<div>
					<i onclick="favorSwitch(this)" id="favorite" class="fa fa-heart-o"><br /><span>가고싶다</span></i>
					<!-- ${root}/review/insert.go?foodCode=${foodDto.foodCode} -->
					<a href="#" onclick="memberCodeCheck(${memberCode})"><i class="fa fa-pencil-square-o" id="reViewInClick" ><br/><span>리뷰쓰기</span></i></a>
					<!-- memberCode 존재유무 --> 
					<script type="text/javascript">
						function memberCodeCheck(memberCode){
							if (memberCode == null) {
								alert("로그인이 필요합니다.");
								/* 리뷰 등록 모달창 숨기고, 로그인 모달창 띄우기 */
								reViewInModal.style.display = "none";
								modal.style.display = "block";
							}
						};
					</script>
				</div>
			</div>
			<div class="info_2">
				<i class="fa fa-eye" aria-hidden="true"></i>
				<span>${foodDto.foodRead }</span> 
				<i class="fa fa-pencil" aria-hidden="true"></i>
				<span>${reviewCountDto.whole}</span> 
				<i class="fa fa-star"></i>
				<span>${favoriteCnt}</span>
			</div>
			<div class="info_3">
				<div>
					<span>주소</span> 
					<span>${foodDto.foodAddr}</span>
				</div>
				<div>
					<span>전화번호</span> 
					<span>${foodDto.foodPhone}</span>
				</div>
				<div>
					<span>음식종류</span> 
					<span>${foodDto.foodKind}</span>
				</div>
				<div>
					<span>대표음식</span> 
					<span>${foodDto.foodMenu} </span>
				</div>
				<div>
					<span>영업시간</span> 
					<span>${foodDto.foodTime}</span>
				</div>
				<div>
					<span>휴일</span> 
					<span>${foodDto.foodBreak}</span>
				</div>
				<div>
					<span>음식점 소개</span> 
					<span>${foodDto.foodIntro}</span>
				</div>
				<div>
					<span>업데이트 <fmt:formatDate value="${foodDto.foodDate}" pattern="yyyy-MM-dd" /></span> 
				</div>
			</div>
			<!-- 쿠폰 공간 -->
			<c:if test="${couponDtoList[0] != null}">
				<div class="coupon">
					<div class="eat_1">
						<span>EAT딜</span>
					</div>
					<div class="eat_2">
						<div>
							<span>할인된 가격으로 인기 메뉴를 맛볼 수 있는 기회!</span>
						</div>
						<div class="slideshow-container">
						<c:forEach var="couponDto" items="${couponDtoList}" varStatus="status" >
							<div class="cp_mySlides fade">
								<a href="${root}/coupon/couponRead.go?couponCode=${couponDto.couponCode}&pageNumber=1">
								<img alt="쿠폰이미지" src="/img/${couponDto.imageName}" onerror="this.src='${root}/resources/css/list.jpg'">
								<span class="couponCouponName"> ${couponDto.couponName}</span>
								<span class="couponSalerate"> ${couponDto.couponSalerate}%</span> 
								<span class="couponCostsale"> ${couponDto.couponCostsale}원</span>
								</a>
								<div>	
									<a class="cp_prev" onclick="cp_plusSlides(-1)">&#10094;</a>
									<a class="cp_next" onclick="cp_plusSlides(1)">&#10095;</a>
								</div>
							</div>
						</c:forEach>
						</div>
					</div>
				</div> 
			</c:if>
			<!-- 리뷰 공간 -->
			<div id="review">
				<div class="re_1">
					<div>
						<span>리뷰(${reviewCountDto.whole})</span>
					</div>
					<div> 
						<a href="javascript:void(0)" onclick="reviewList('${root}','0')"><span>전체(${reviewCountDto.whole})</span></a>
						<a href="javascript:void(0)" onclick="reviewList('${root}','5')"><span>맛있다(${reviewCountDto.good})</span></a> 
						<a href="javascript:void(0)" onclick="reviewList('${root}','3')"><span>괜찮다(${reviewCountDto.soso})</span></a> 
						<a href="javascript:void(0)" onclick="reviewList('${root}','1')"><span>별로(${reviewCountDto.bad})</span></a> 
					</div> 
				</div>
				<c:choose>
					<c:when test="${reviewList != null}">
			
						<c:forEach var="foodReviewDto" items="${reviewList}">
							<div class="re_2">
								<div>
									<span>${foodReviewDto.memberName}</span>
								</div>
			
								<div onclick="myReview('${foodReviewDto.reviewCode}')">
									<!-- ${root}/review/read.go?reviewCode=${foodReviewDto.reviewCode}  -->
									<a href="javascript:void(0)" class="reviewInfoClick" >
										<div class="reviewCont">
											<span><fmt:formatDate value="${foodReviewDto.reviewDate}" pattern="yyyy-MM-dd" /></span>
											<span>${foodReviewDto.reviewCont}</span>
										</div>
										<div class="reviewImg">
											<c:set var="img" value="${fn:split(foodReviewDto.imageName,',')}" />
											<c:forEach var="imgList" items="${img}">
												<img src="/img/${imgList}" alt="이미지" onerror="this.src='${root}/resources/css/list.jpg'"/>
											</c:forEach>
										</div>							
									</a>
								</div>
			
								<div>
									<c:choose>
										<c:when test="${foodReviewDto.reviewScore == 5}">
											<i class="fa fa-smile-o emoticon" aria-hidden="true"></i>
										</c:when>
										<c:when test="${foodReviewDto.reviewScore == 3}">
											<i class="fa fa-meh-o emoticon" aria-hidden="true"></i>
										</c:when>
										<c:when test="${foodReviewDto.reviewScore == 1}">
											<i class="fa fa-frown-o emoticon" aria-hidden="true"></i>
										</c:when>
									</c:choose>
										<c:if test="${memberCode == foodReviewDto.memberCode}">
										<div>
											<a href="javascript:void(0)" onclick="userUpdate('${root}','${foodReviewDto.foodCode}','${foodReviewDto.reviewCode}')">수정</a>
											<a href="javascript:void(0)" onclick="userDelete('${root}','${foodReviewDto.foodCode}','${foodReviewDto.reviewCode}')">삭제</a>									
										</div>
										</c:if>
									<%-- <span>(${foodReviewDto.reviewScore})</span> --%>
								</div>
							</div>
						</c:forEach>
					</c:when>
					<c:when test="${reviewList == null}">
						<div class="re_2">
							<div>첫 리뷰의 주인공이 되어주세요!!</div>
						</div>
					</c:when>
				</c:choose>
			</div>
		</div>
		<div class="read_nav_2">
			<div class="img">
				<c:choose>
					<c:when test="${foodDto.foodStatus == 'Y'}">
						<img src="/img/${imageDto.imageName}" alt="이미지"
							 onerror="this.src='${root}/resources/css/list.jpg'" />
					</c:when>
					<c:when test="${foodDto.foodStatus != 'N'}">
						<img alt="이미지 검토중" src="${root}/resources/css/list.jpg'">
					</c:when>
				</c:choose>
			</div>
			<div class="map" id="map"></div>
		</div>
	</div>
	<!-- 리뷰 작성 모달 -->
	<div id="reViewInModal" class="reViewInModal">
		<div id="content_reView">
			<div class="reViewIn">
				<div class="title_reView">
					<span>리뷰 작성</span>
					<span class="close_reView">&times;</span>
				</div>
				<div class="in">
					<p><strong>${foodDto.foodName}</strong>에 대한 솔직한 리뷰를 써주세요.</p>
					<form action="${root}/review/insertOk.go" method="POST" enctype="multipart/form-data" onsubmit="return reviewForm(this)">			
						<input type="hidden" name="foodCode" value="${foodDto.foodCode}" />
						<input type="hidden" name="memberCode" value="${memberCode}" />
						<div class="container_1">
							<div class="radio-tile-group">
								<div class="input-container">
									<input id="good" class="radio-button" type="radio" name="reviewScore" value="5"/>
									<div class="radio-tile">
									<label for="good" class="radio-tile-label" style="font-size: 15px;">맛있어요</label>
									</div>
								</div>
								<div class="input-container">
									<input id="soso" class="radio-button" type="radio" name="reviewScore" value="3" />
									<div class="radio-tile">
									<label for="soso" class="radio-tile-label" style="font-size: 15px;">괜찮아요</label>
									</div>
								</div>
								<div class="input-container">
									<input id="drive" class="radio-button" type="radio" name="reviewScore" value="1"/>
									<div class="radio-tile">
									<label for="bad" class="radio-tile-label" style="font-size: 15px;">별로에요</label>
									</div>
								</div>
							</div>
						</div>
						
<!-- 						<label for="good">맛있어요</label><input type="radio" id="good" name="reviewScore" value="5"/>
						<label for="soso">괜찮아요</label><input type="radio" id="soso" name="reviewScore" value="3"/>
						<label for="bad">별로에요</label><input type="radio" id="bad" name="reviewScore" value="1"/> -->
						<textarea class="reViewArea" name="reviewCont" id="" cols="30" rows="10" placeholder="음식점의 분위기, 서비스가 궁금해요!"></textarea>
						<div id="fileDiv">     
							<div class="box-file-input"><label><input type="file" multiple="multiple" name="imgFile" class="file-input" accept="image/*"></label><span class="filename">파일을 선택해주세요</span></div>
				            <!-- <input type="file" name="imgFile" multiple="multiple" accept="image/*"/> -->                  
				        </div>        
				        <input class="button" type="submit" value="글쓰기"/>
				        <input class="button" type="reset" value="취소"/>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 리뷰 상세내용(큰이미지) 모달 -->
	<div id="reViewInfoModal" class="reViewInfoModal">
		<div id="content_reViewInfo">
			<div class="reViewInfo">
				<div class="title_reViewInfo">
					<span>${foodDto.foodName}</span>
					<span class="close_reViewInfo" style="color: #030305;">&times;</span>
				</div>
				<div class="info">
					<div class="slideshow-review">
						<!-- <div class="mySlides fade"></div> -->
						<div>	
							<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
							<a class="next" onclick="plusSlides(1)">&#10095;</a>
						</div>	
					</div>
					<div class="reviewContent">
						<div id="reviewDate"></div>
						<div id="reviewCont"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
/* 쿠폰 관련 */
var cp_slideIndex = 1;
cp_showSlides(cp_slideIndex);

function cp_plusSlides(n) {
	cp_showSlides(cp_slideIndex += n);
}

function cp_showSlides(n) {
	var i;
	var cp_slides = document.getElementsByClassName("cp_mySlides");
	if (n > cp_slides.length) {cp_slideIndex = 1}    
	if (n < 1) {cp_slideIndex = cp_slides.length}
	for (i = 0; i < cp_slides.length; i++) {
		cp_slides[i].style.display = "none";  
	}
	cp_slides[cp_slideIndex-1].style.display = "block";  
}
</script>
<script type="text/javascript">

/* 리뷰 관련 */
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function showSlides(n) {
	var i;
	var slides = document.getElementsByClassName("mySlides");
	if (n > slides.length) {slideIndex = 1}    
	if (n < 1) {slideIndex = slides.length}
	for (i = 0; i < slides.length; i++) {
	    slides[i].style.display = "none";  
	}
	slides[slideIndex-1].style.display = "block";  
}
</script>
<!-- 리뷰 상세보기 모달, 내용 가져오는 ajax -->
<script>
//본인 리뷰 내용 & 리뷰 내용 

function myReview(reviewCode) {
	var url = "${root}/review/read.go?reviewCode=" + reviewCode;
	$("#reViewInfoModal").css("display","block");
	$.ajax({
		url : url,
		type : "GET",
		dataType : "json",
		success : function(data){
			var json=data;
			$("#reviewCont").text(json.reviewCont);
			$("#reviewScore").text(json.reviewScore);
				
			var root = "${root}";
			var mySlides = "";
			for(var i=0; i < Object.keys(json.imgList).length;i++){
				if (i == 0) {
					mySlides = '<div class="mySlides reviewFade" style="block;">';
					mySlides += "<img style='width: 800px; height: 500px; vertical-align:bottom;' src='/img/"+json.imgList[i].imageName+"'>";
					mySlides += '</div>';
					$(".slideshow-review").append(mySlides);
					
				} else {
					mySlides = '<div class="mySlides reviewFade" style="display:none;">';
					mySlides += "<img style='width: 800px; height: 500px; vertical-align:bottom;' src='/img/"+json.imgList[i].imageName+"'>";
					mySlides += '</div>';
					$(".slideshow-review").append(mySlides);
				}
				//console.log("1");
				//console.log(json.imgList[i].imageName);
				console.log("<img style='width: 800px; height: 500px; ' src='/img/"+json.imgList[i].imageName+"'>");
			}
		}
	});
}


// 리뷰 상세 모달 끄기 
$(".close_reViewInfo").click(function(){
	$("#reViewInfoModal").css("display","none");
	$(".mySlides").remove();
});
</script>

<!-- 리뷰 리스트 불러오는 자바 스크립트 ajax -->
<script>
// 리뷰 리스트  ajax로 불러오기 (XHR.js 이용) 
function reviewList(root, selScore) {
	let url = root + "/food/foodReviewList.go";
	let params = "foodCode=${foodDto.foodCode}&selScore="+selScore;		
	sendRequest("GET", url, fromServer, params);
}	
// reivew/list.jsp를 거쳐 값을 #reviewDisplay에 뿌려줌 
function fromServer() {
	if (xhr.readyState == 4 && xhr.status == 200) {
		let reviewDisplay = document.getElementById("review");
		reviewDisplay.innerHTML = xhr.responseText;
	}
}
</script>

<script type="text/javascript">
	//지도 관련 
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
	    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	    level: 1 // 지도의 확대 레벨
	};  
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${foodDto.foodAddr}', function(result, status) {

	// 정상적으로 검색이 완료됐으면 
	 if (status === kakao.maps.services.Status.OK) {
	
	    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	  	
	    var y = result[0].y;
	    var x = result[0].x;
	  	var xx = '${foodDto.foodName}';
		
	    // 결과값으로 받은 위치를 마커로 표시합니다
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: coords
	    });
	
	    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	    map.setCenter(coords);
	    map.setDraggable(false); 
	    map.setZoomable(false);   
	} 
	 kakao.maps.event.addListener(marker, 'click', function() {
	     // 마커 위에 인포윈도우를 표시합니다
	     window.open('https://map.kakao.com/link/map/'+xx+','+y+','+x);   
	});

});    
</script>
<script type="text/javascript">
	
	// 본인 리뷰 내용
	
	
	/* 파일 버튼 */
	$(document).on("change", ".file-input", function(){
	 
		$filename = $(this).val();

		if($filename == "")
			$filename = "파일을 선택해주세요.";

		$(".filename").text($filename);

	});
	
	/*  리뷰쓰기 클릭시 작동 */
	
	var reViewInModal = document.getElementById("reViewInModal");
	var reViewInClick = document.getElementById("reViewInClick");
	var close_reView = document.getElementsByClassName("close_reView")[0];
	reViewInClick.onclick = function() {
		reViewInModal.style.display = "block";
		}
	close_reView.onclick = function() {
		reViewInModal.style.display = "none";
		}	
	
	/*  리뷰내용 클릭시 작동 */
	var reViewInfoModal = $("#reViewInfoModal");
	var close_reViewInfo = $(".close_reViewInfo");
	
	
				

</script>
<script type="text/javascript">
var root = "${root}";
var memberCode = "${memberCode}";
var foodCode = "${foodDto.foodCode}";
var favorStatus = "";

$(function() {
	if (memberCode != "") {
		favorCheck();
	} 
});

function favorCheck() {
	$.ajax({
		type : "POST",
		url : root + "/favorite/check.do",
		data : { "memberCode" : memberCode, "foodCode" : foodCode},
		success : function(data) {
			favorStatus = data;
			if (favorStatus === "on") {
				$("#favorite").attr('class', 'fa fa-heart');
			} else if (favorStatus === "off") {
				$("#favorite").attr('class', 'fa fa-heart-o');
			}
		}, error: function (request, status, error) {
			alert("error");
		}
	});
}

function favorSwitch(x) {
	if (memberCode == "") {
		modal.style.display = "block";
	} else if (memberCode != "") {
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
				favorStatus = data;
				if (favorStatus === "on") {
					$("#favorite").attr('class', 'fa fa-heart');
				} else if (favorStatus === "off") {
					$("#favorite").attr('class', 'fa fa-heart-o');
				}
			}, error: function (request, status, error) {
				alert("error");
			}
		});
	}
}

</script>
<script src="${root}/resources/javascript/review/review.js"></script>
</body>
</html>