<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%-- <link rel="stylesheet" href="${root}/resources/css/food/read.css" /> --%>
<link rel="stylesheet" href="${root}/resources/css/slideshow.css" />
<script src="${root}/resources/xhr.js"></script>
<script type="text/javascript" src="${root}/resources/jquery-3.4.1.js"></script>
<meta charset="UTF-8">
<title>음식점상세페이지</title>
<script src="${root}/resources/Jquery/jquery-3.4.1.js"></script>
<script>
	$(function(){

		var reviewInfoClick = $(".reviewInfoClick");
		for (var i = 0; i < reviewInfoClick.length; i++) {
			reviewInfoClick[i].onclick = function() {
				reViewInfoModal.css("display","block");
			}
		}
		close_reViewInfo[0].onclick = function() {
			reViewInfoModal.css("display","none");
		}
	});

</script>
<script>
	function favorite(x) {
		if (x.className === "fa fa-heart-o") {
			x.className = "fa fa-heart";
var root = "${root}";
var memberCode = "${memberCode}";
var foodCode = "${foodDto.foodCode}";
var favorStatus = "";

$(function() {
	if (memberCode != "") {
		favorCheck();
	} 
})

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

function favorSwitch() {
	if (memberCode == "") {
		// 로그인
		alert("로그인하세요");
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
	
	
	function reviewList(root, selScore) {
		let url = root + "/food/foodReviewList.go";
		let params = "foodCode=${foodDto.foodCode}&selScore="+selScore;		
		sendRequest("GET", url, fromServer, params);
	}	
	function fromServer() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			let reviewDisplay = document.getElementById("review");
			reviewDisplay.innerHTML = xhr.responseText;
		}
	}
</script>
<style type="text/css">
a {
	color: #030305;
}
.fa {
  font-size: 25px;
  cursor: pointer;
  user-select: none;
}

.fa:hover {
  color: pink;
}

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
   	border-bottom: 1px dotted;
   	margin-top: 30px;
}
/* 가게 상세 */
.nav_1 {
	width: 740px;
	overflow: hidden;
	float: left;
	margin: 0 30px;
}
/* 가게 대표 이미지, 지도 */
.nav_2 {
	width: 440px;
	float: left;
	overflow: hidden;
}
/* 가게명, 별점, 리뷰쓰기, 가고싶다 */
.info_1 {
	width: 740px;
	height: 100px;
}
.info_1 > span:nth-child(2) {
	color: #EFB730;
}
/* 가게명, 별점 */
.info_1 > span {
	line-height: 100px;
	font-size: 30px;
	margin-left: 15px;
}

.info_1 > div {
	width: 70px;
	height: 100px;
	float: right;
	text-align: center;
	line-height: 130px;
}
/* 리뷰,가고 이미지 */
.info_1 img {
	width: 70px;
	height: 70px;
}
/* 리뷰쓰기, 가고싶다 */
.info_1 > div i > span {
	font-size: 12px;
	line-height: 30px;
}
/* 조회수, 리뷰수, 즐겨찾기 */
.info_2 {
	width: 740px;
	height: 50px;
	line-height: 50px;
	border-bottom: 1px dotted;
}
.info_2 > span {
	font-size: 12px;
	margin-left: 10px;
}
/* 가게 상세설명 */
.info_3 {
	width: 740px;
	height: 250px;
	border-bottom: 1px dotted;
}
.info_3 > div {
	margin: 10px 0;
}
.info_3 > div:last-child {
	float: right;	
}
.info_3 > div > span {
	margin-top: 5px;
}
.info_3 > div > span:first-child {
	font-size: 12px;
	color: #9b9b9b;
	margin-left: 10px;
	display: inline-block;
	width: 120px;
}
/* EAT 딜 */
.coupon {
	width: 740px;
	height: 300px;
	border-bottom: 1px dotted;
}
/* 텍스트 EAT딜 */
.eat_1 {
	width: 120px;
	height: 300px;
	text-align: center;
	float: left;
	margin-top: 10px;
	color: #EFB730;
	font-size: 23px;
}
/* 쿠폰 상세 설명 */
.eat_2 {
	width: 620px;
	height: 300px;
	float: left;
}
.eat_2 > div:first-child {
	text-align: center;
	font-weight: bold;
	margin-top: 10px;
}
.eat_2 img {
	width: 580px;
	height: 190px;
}
.eat_2 > div:nth-child(n+2) {
	width: 580px;
	height: 190px;
	margin: 17px;
	float: left;
}
/* 리뷰 */
.review {
	width: 740px;
	overflow: hidden;
	background: green;
}
/* 리뷰수, 별점(전체, 맛있다, 괜찮다, 별로) */
.re_1 {
	width: 740px;
	height: 40px;
	line-height: 40px;
	margin-top: 10px;
}
.re_1 > span {
	margin-left: 30px;
	color: #EFB730;
	font-size: 23px;
}
/* 별점(전체, 맛있다, 괜찮다, 별로) */
.re_1 > a > span{
	float: right;
	margin: 0 5px;
}
/* 닉네임, 리뷰내용, 별점 */
.re_2 {
	width: 740px;
	overflow: hidden;
	margin: 10px 0;
	border-bottom: 1px dotted;
}
/* 닉네임 */
.re_2 > div:nth-child(1) {
	width: 70px;
	float: left;
	font-size: #030305;
	margin-top: 10px;
	text-align: center;
}
/* 리뷰내용 */
.re_2 > div:nth-child(2) {
	width: 600px;
	overflow: hidden;
	float: left;
	margin-top: 10px;
}
.re_2 > div:nth-child(3) {
	text-align: center;
	margin-top: 10px;
}
/* 리뷰 내용 - 등록일 */

.reviewCont > span:first-child {
	display: block;
	font-size: 14px;
	color: #9b9b9b;
}
.reviewCont > span:last-child {
	overflow: hidden;
}

/* 리뷰 이미지들 */
.reviewImg {
	width: 600px;
	height: 100px;
	margin: 5px;
}

/* 리뷰 별점 */
.re_2 > div:nth-child(3) {
	width: 70px;
	float: left;
}
.img {
	width: 400px;
	height: 400px;
	margin: 0 20px;
	margin-bottom: 10px;
}
.map {
	width: 400px;
	height: 400px;
	margin: 0 20px;
	position: fixed;
}

/* 모달 관련 */
/* 리뷰 작성 */
#content_reView{
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -500px;
	margin-top: -400px;
	background: #F2F4EF;
	width: 1000px;
	height: 700px;
	border-radius: 5px;
}

.reViewIn {
	width: 1000px;
	overflow: hidden;
	background: #F2F4EF;
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
	border: none;
	font-size: 20px;
	font-weight: bold;
}
/* 리뷰 상세내용 */
#content_reViewInfo{
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -500px;
	margin-top: -400px;
	background: #F2F4EF;
	width: 1000px;
	height: 700px;
	border-radius: 5px;
}

.reViewInfo {
	width: 1000px;
	overflow: hidden;
	background: #F2F4EF;
}
.title_reViewInfo {
	width: 1000px;
	height: 50px;
	background: #F2F4EF;
	line-height: 50px;
	font-size: 30px;
	border-bottom: 1px dotted;
}

.title_reView {
	width: 1000px;
	height: 50px;
	background: #F2F4EF;
	line-height: 50px;
	font-size: 30px;
	border-bottom: 1px dotted;
	
}
.title_reViewInfo > span:first-child {
	margin-left: 40px;
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
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
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
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
.close_reView, .close_reViewInfo {
  color: #aaaaaa;
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
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f30f46c40f26ed513be4c81611d91389&libraries=services"></script>
</head>
<body>
	<div id="content">
		<div class="nav_1">
			<div class="info_1">
				<span>${foodDto.foodName}</span> 
				<span>
					<c:choose>
						<c:when test="${searchFoodDto != null}">
							<fmt:formatNumber value="${searchFoodDto.reviewScore}" pattern=".0"/>
						</c:when>
						<c:otherwise>별점 없음</c:otherwise>
					</c:choose>
				</span>
				<div>
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
				<div>
<!-- 					<i onclick="favorite(this)" class="fa fa-heart-o"><br/><span>가고싶다</span></i> -->
					<i onclick="favorSwitch(this)" id="favorite" class="fa fa-heart-o"></i><br /> <span>가고싶다</span>
				</div>
			</div>
			<div class="info_2">
				<span>조회수 ${foodDto.foodRead }</span> 
				<span>리뷰수 ${reviewCountDto.whole}</span> 
				<span>즐겨찾기</span>
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
							<div class="mySlides fade">
								<a href="${root}/coupon/couponRead.go?couponCode=${couponDto.couponCode}&pageNumber=1">
								<img alt="쿠폰이미지" src="${root}/resources/ftp/${couponDto.imageName}" onerror="this.src='${root}/resources/css/list.jpg'">
								</a>
								<div class="text">
									<p> ${couponDto.couponName}</p>
									<span class="couponSalerate"> ${couponDto.couponSalerate}%</span> 
									<span class="couponCostsale"> ${couponDto.couponCostsale}</span>
									<span class="couponCostori"> ${couponDto.couponCostori}</span> 
								</div>
								<div>	
									<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
									<a class="next" onclick="plusSlides(1)">&#10095;</a>
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
					<span>리뷰(${reviewCountDto.whole})</span> 
					<a href="javascript:void(0)" onclick="reviewList('${root}','1')"><span>별로(${reviewCountDto.bad})</span></a> 
					<a href="javascript:void(0)" onclick="reviewList('${root}','3')"><span>괜찮다(${reviewCountDto.soso})</span></a> 
					<a href="javascript:void(0)" onclick="reviewList('${root}','5')"><span>맛있다(${reviewCountDto.good})</span></a> 
					<a href="javascript:void(0)" onclick="reviewList('${root}','0')"><span>전체(${reviewCountDto.whole})</span></a> 
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
									<a href="#" class="reviewInfoClick" >
										<div class="reviewCont">
											<span><fmt:formatDate value="${foodReviewDto.reviewDate}" pattern="yyyy-MM-dd" /></span>
											<span>${foodReviewDto.reviewCont}</span>
										</div>
										<div class="reviewImg">
											<c:set var="img" value="${fn:split(foodReviewDto.imageName,',')}" />
											<c:forEach var="imgList" items="${img}">
												<img src="${root}/resources/ftp/${imgList}" alt="" style="width: 100px; height: 100px;" onerror="this.src='${root}/resources/css/list.jpg'" />
											</c:forEach>
										</div>							
									</a>
								</div>
			
								<div>
									<span>(${foodReviewDto.reviewScore})</span>
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
		<div class="nav_2">
			<div class="img">
				<c:choose>
					<c:when test="${foodDto.foodStatus == '완료'}">
						<img src="${root}/resources/ftp/${imageDto.imageName}" alt="이미지"
							style="width: 400px; height: 400px;" onerror="this.src='${root}/resources/css/list.jpg'" />
					</c:when>
					<c:when test="${foodDto.foodStatus != '완료'}">
						<h3>검토중입니다.</h3>
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
					<form action="${root}/review/insertOk.go" method="POST" enctype="multipart/form-data">			
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
						<textarea class="reViewArea" name="reviewCont" id="" cols="30" rows="10" placeholder="식당의 분위기, 서비스가 궁금해요!"></textarea>
						<div id="fileDiv">     
							<div class="box-file-input"><label><input type="file" multiple="multiple" name="imgFile" class="file-input"  accept="image/*"></label><span class="filename">파일을 선택해주세요</span></div>
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
					<span>리뷰 작성</span>
					<span class="close_reViewInfo">&times;</span>
				</div>
				<div class="info">
					<p><strong>${foodDto.foodName}</strong>에 대한 솔직한 리뷰 입니다.</p>
					<div>
						<div id="reviewCont"></div>
						<div id="reviewScore"></div>
						<div id="fileDiv">
							<c:if test="${listImage != null}">
								<table style="text-align:center;">
									<tr>
										<c:forEach var="imageDto" items="${listImage}">							
											<td><img src="${root}/resources/ftp/${imageDto.imageName}"
												alt="image" style="width: 100px; height: 100px;" onerror="this.src='${root}/resources/css/list.jpg'" /><br /><label>${fn:substringAfter(imageDto.imageName,'_')}</label>								
											</td>
										</c:forEach>
									</tr>
								</table>
							</c:if>			
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
	<script type="text/javascript">
	
	// 본인 리뷰 내용
	
	function myReview(reviewCode) {
		var url = "${root}/review/read.go?reviewCode=" + reviewCode;
		$.ajax({
			url : url,
			type : "GET",
			dataType : "json",
			success : function(data){
				var json=data;
				$("#reviewCont").text(json.reviewCont);
				$("#reviewScore").text(json.reviewScore);
				//alert(json.reviewCont);
				//alert(json.reviewScore);
				/* for(var i=0; json.imgList.length;i++){
					alert(json.imgList[i].imagePath);
				} */
			}
		});
	}
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
	
	
	// 지도 관련 
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
	var slideIndex = 1;
	showSlides(slideIndex);

	function plusSlides(n) {
	  showSlides(slideIndex += n);
	}

	function currentSlide(n) {
	  showSlides(slideIndex = n);
	}

	function showSlides(n) {
	  var i;
	  var slides = document.getElementsByClassName("mySlides");
	  var dots = document.getElementsByClassName("dot");
	  if (n > slides.length) {slideIndex = 1}    
	  if (n < 1) {slideIndex = slides.length}
	  for (i = 0; i < slides.length; i++) {
	      slides[i].style.display = "none";  
	  }
	  for (i = 0; i < dots.length; i++) {
	      dots[i].className = dots[i].className.replace(" active", "");
	  }
	  slides[slideIndex-1].style.display = "block";  
	  dots[slideIndex-1].className += " active";
	}

</script>
<script>

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

function favorSwitch(aa) {
	if (memberCode == "") {
		// 로그인
		alert("로그인하세요");
	} else if (memberCode != "") {
		if (aa.className == "fa fa-heart") {
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
	
	
	function reviewList(root, selScore) {
		let url = root + "/food/foodReviewList.go";
		let params = "foodCode=${foodDto.foodCode}&selScore="+selScore;		
		sendRequest("GET", url, fromServer, params);
	}	
	function fromServer() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			let reviewDisplay = document.getElementById("review");
			reviewDisplay.innerHTML = xhr.responseText;
		}
	}
</script>
</html>