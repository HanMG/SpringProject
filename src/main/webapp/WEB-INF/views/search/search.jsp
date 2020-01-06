<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* 마커 내용 */
.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
.wrap * {padding: 0;margin: 0;}
.wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
.wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
.info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
.info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
.info .close:hover {cursor: pointer;}
.info .body {position: relative;overflow: hidden;}
.info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
.desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
.desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
.info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
.info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.info .link {color: #5085BB;}
#content {
	margin : 0 auto;
	max-width: 1240px;
	display: flex;
}
.food_nav_1 {
	flex: 2;
	display: flex;
	flex-direction: column;
}
.food_nav_2 {
	flex: 1;
    display: flex;
    flex-direction: column;
}
.filter {
	display: flex;
    justify-content: space-between;
    font-size: 23px;
    margin: 20px 10px;
    padding: 0 60px;
}
.filter > span {
	color: #030305;
    font-size: 30px;
}
.filter i {
	font-size: 30px;
}
.dragend {
	position:absolute;
	z-index: 7;
	top: 350px;
	left: 180px;
}

.result {
	display: flex;
    margin: 0 auto;
    flex-flow: row wrap;
    justify-content: center;
}
.list {
	display: flex;
	height: 300px;
	flex-direction: column;
    margin-right: 10px;
}
.list > div > img {
	width: 350px;
	height: 200px;
	/* position: absolute;
	width: 100%;
	height: 100%;
	top: 50%;
	left: 50%; */
}
.list > div:last-child {
	font-size: 8px;
}
/* 지도 */
.couponNav {
	display: flex; 
	flex-direction: column;
}
/* 음식점 이미지 */
.foodName {
	font-size: 23px;
	margin-right: 5px;
}
.reviewScore {
	margin-left: 4px;
	font-size: 23px;
	line-height: 26px;
	color: #EFB730;
}
.foodArea, .foodKind, .foodRead, .reviewCount {
	color: #9b9b9b;
}
.foodRead, .reviewCount {
	font-size: 13px;
}
/* 페이지 */
.page {
	display: flex;
    justify-content: center;
}
.page a {
	font-size: 23px;
	color: #EFB730;
}

.map {
	height: 380px;
	display: flex;
	margin-top: 53px;
}
.couponList {
	display: flex;
    justify-content: center;
    margin-bottom: 10px;
    box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 10px;
}
.couponList img {
	width: 350px;
    height: 150px;
}

.couponList > div:nth-child(1) {
	position: relative;
}
.couponList > div:nth-child(2) {
	transform: rotate(90deg);
    margin: auto 0;
    width: 63px;
}
.couponList > div:nth-child(2) > span {
	position: absolute;
    font-size: 25px;
    color: #EFB730;
    display: block;
    width: 150px;
    left: -25px;
    top: -20px;
}
.couponList > div:nth-child(1):after{
	content:"";
	background-color: rgba(0,0,0,0.3);
	width: 100%;
	height: 30%;
	position: absolute;
	top: 55px;
	left:0;
	right: 0;
	bottom: 0;
} 


.couponList > div:nth-child(1):hover:after{
	background: transparent;
}
.couponList > div:nth-child(1) > span:nth-child(2) {
	color: white;
	position: absolute;
	bottom: 60px;
	right: 15px;
	font-size: 20px;
	/* right: inherit; */
	z-index: 1;
}

#map {
	position: relative;
}


/* 쿠폰 관련 */

/* 필터 모달 관련 */
.filterModal {
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
  background-color: rgba(0, 0, 0, 0.8);
}

#contentFilter{
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -370px;
	margin-top: -400px;
	height: 700px;
	border-radius: 5px;
	background: transparent;
}
.filter_title {
	display: flex;
	flex-direction: column;
}
.titleFilter {
	font-size: 30px;
	display: flex;
	color: white;
	margin: 45px 0;
}
.titleFilter > .close {
	margin-right: 5px;
}
/* 개인정보 */
.titleFilter > span:first-child {
	margin-left: 40px;
}
.radio-tile-label {
	font-size: 15px;
}
.filter_nav {
	background: white;
    border-radius: 5px;
}
.filter_nav span {
	font-size: 23px;
	margin: 20px 30px;
	display: block;
}
.radio-tile-group {
	justify-content: left;
}
.search {
    text-align: center;
    margin: 40px 0;
}
.searchBtn {
	width: 100px;
	font-size: 32px;
	cursor: pointer;
}
.icon {
	width: 10px;
	height: 10px;
}

.input-container, label {
	cursor: pointer;
}
label {
	display: block;
    width: 100px;
    padding: 10px 0;
}
.fa {
	font-size: 14px;
}
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f30f46c40f26ed513be4c81611d91389&libraries=services"></script>
</head>
<body>

<div id="content">
	<div class="food_nav_1">
		<div class="filter">
			<span>${keyword} 맛집 인기 검색 순위</span>
			<a href="#" id="filterClick"><i class="fa fa-bars" aria-hidden="true"></i></a>
		</div>
		<!-- 검색된 음식점 리스트 불러오기  -->
		<div class="result"></div>
		<div class="page"></div>
	</div>
		
	<div class="food_nav_2">
		<div class="map" id="map">
			<div class="dragend" id="dragend"></div> 
		</div>
		<script type="text/javascript">
			// 지도 관련 
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			
			mapOption = {
			    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			    level: 10 // 지도의 확대 레벨
			};  
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			var addrList = new Array();
		
			var clickedOverlay = null;
		    
			
			var markers = [];
			var overlays = [];
		
			function mark(addr, name, filter, foodCode, imageName){
				
				markers.forEach(function (marker) { marker.setMap(null); });
			    markers.length = 0 // 마커 배열 초기화
				//var array = arr.join();
				//var abc = arr.split(",");
				var addr = addr;
				var name = name;
				var filter = filter;
				var foodCode = foodCode;
				var imageName = imageName;
				// 주소-좌표 변환 객체를 생성합니다
				
				var geocoder = new kakao.maps.services.Geocoder();
				
				geocoder.addressSearch(addr, function(result, status) {
			
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			    	  
			    	var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', 
			    	    imageSize = new kakao.maps.Size(64, 69),
			    	 	// 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
			    	    imageOption = {offset: new kakao.maps.Point(27, 69)}; 
			    	
			    	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			    	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
			    	// 마커가 표시될 위치입니다
			    	 
			    	
			    	markerPosition  = new kakao.maps.LatLng(result[0].y, result[0].x);
					
			    	addrList.push(markerPosition);
					addrList.join();
			    	// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
			    	var bounds = new kakao.maps.LatLngBounds();    
			    	
					for (var i = 0; i < addrList.length; i++) {
					    bounds.extend(addrList[i]);
					}
				    	var marker = new kakao.maps.Marker({
				    	    position: markerPosition, 
				    	    map: map,
				    	    images : markerImage
				    	});
			    	   map.setBounds(bounds);
			    	   markers.push(marker);
			    	// 마커 위에 커스텀오버레이를 표시합니다
					// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
					var CustomOverlay = new daum.maps.CustomOverlay({
						//content: content,
						map: map,
						xAnchor: 0.5,
					    yAnchor: 0.5,
						position: marker.getPosition()
					});
					
					var root = '${root}';
			    	// 커스텀 오버레이에 표시할 컨텐츠 입니다
			    	// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
			    	// 별도의 이벤트 메소드를 제공하지 않습니다 
		    	    var Customcontent = document.createElement('div');
		    	        Customcontent.className = "wrap";
		    	    var info = document.createElement('div');
		    	    	info.className = "info";
		    	    	Customcontent.prepend(info);
					var title = document.createElement("div");
						title.className = "title";
						title.innerHTML=name;
						info.prepend(title);
					var close = document.createElement("div");
						close.className = "close";
						close.setAttribute("title", "닫기");
						close.onclick = function () {
		  		        	clickedOverlay.setMap(null);
		  		        };   
						title.prepend(close);
					var body = document.createElement("div");
						body.className = "body";
						info.append(body);
					var img = document.createElement("div");
						img.className = "img";
						body.prepend(img);
					var image = document.createElement("img");
					var foodImage = "/img/"+imageName;
						console.log(foodImage);
						image.setAttribute("src", foodImage);
						image.setAttribute("width", "73px");
						image.setAttribute("height", "70px");
						img.prepend(image);
					var desc = document.createElement("div");
						desc.className = "desc";
						body.append(desc);
					var ellipsis = document.createElement("div");
						ellipsis.className = "ellipsis";
						ellipsis.innerHTML=addr;
						desc.append(ellipsis);
					var jibun = document.createElement("div");
						jibun.classNmae = "jibun ellipsis";
						jibun.innerHTML=filter;
						desc.append(jibun);
					var linkDiv = document.createElement("div");
						desc.append(linkDiv);
					var link = document.createElement("a");
						link.className = "link";
						link.setAttribute("href", "${root}/food/read.go?foodCode="+foodCode);
						link.setAttribute("target", "_blank");
						link.innerHTML="상세보기";
						linkDiv.append(link);
			    	          
			    	// 마커에 click 이벤트를 등록합니다
			        kakao.maps.event.addListener(marker, 'click', function() {
			        	//overlays.push(customOverlay); 
			        	// clickedOverlay 존재하면 다 없앰
			        	if (clickedOverlay) {
			                clickedOverlay.setMap(null);
			            }
			            map.setCenter(markerPosition);
			            map.setLevel(5, markerPosition);
			        	// clickedOverlay 출력하기전에 Customcontent, map 입력
						CustomOverlay.setContent(Customcontent);	    	
			            CustomOverlay.setMap(map);
			            clickedOverlay = CustomOverlay;
			            // 다른마커보다 우선순위 높게 (이 설정을 안해주면 오버레이 공간에 다른 마커가 튀어나오는 상황이 발생)
			            clickedOverlay.setZIndex(999);
			            
			        });
			    } 
			});
		}
		</script>
		
		<div style=" margin: 15px 30px; font-size: 28px; color: #EFB730;">관련 쿠폰</div>
		<c:forEach var="i" items="${foodList}">
		<script>
		var arr = new Array();
		arr.push("${i.foodAddr}","${i.foodName}","${i.foodKind}","${i.foodCode}");
		//alert(arr);
		mark(arr);
		</script>
		</c:forEach>
		<%-- <div class="couponNav">
			<c:if test="${couponCount > 0}">
			<c:forEach var="couponDto" items="${couponList}" begin="0" step="1" end="5">
			<div id="inner" class="couponList" style="cursor:pointer;" onclick="location.href='${root}/food/read.go?foodCode=${couponDto.foodCode}'">
				<div style="background-image: url('${root}/resources/ftp/${couponDto.imageName}'), url('${root}/resources/css/list.jpg');">
					<img alt="쿠폰 이미지" src="${path}${couponDto.imageName}" onerror="this.src='${root}/resources/css/list.jpg'">
					<span>${couponDto.couponCostsale}</span>
					<span>${couponDto.couponName}</span>
				</div>
				<div>
				</div>
			</div>
			</c:forEach>
			</c:if>
		</div> --%>
		<div class="couponNav">
			<c:if test="${couponCount > 0}">
			<c:forEach var="couponDto" items="${couponList}" begin="0" step="1" end="5">
			<div id="inner" class="couponList" style="cursor:pointer;" onclick="location.href='${root}/food/read.go?foodCode=${couponDto.foodCode}'">
				<div>
					<img alt="쿠폰 이미지" src="/img/${couponDto.imageName}" onerror="this.src='${root}/resources/css/list.jpg'"> 
					<span>${couponDto.couponName}</span>
				</div>
				<div>
					<span>${couponDto.couponSalerate} % OFF</span>
				</div>
			</div>
			</c:forEach>
			</c:if>
		</div>
	</div>
</div>
		 
	<div id="filterModal" class="filterModal">
		<div id="contentFilter">
			<div class="filter_title">
				<div class="titleFilter">
					<span>필터</span>
					<span class="close">&times;</span>
				</div>
				<div class="filter_nav">
					<div>
						<span>조회 기준</span>
					</div>
					<div class="container_1">
						<div class="radio-tile-group">
							<div class="input-container">
								<input id="orderType1" class="radio-button" type="radio" name="orderType" value="조회수"/>
								<div class="radio-tile">
								<label for="orderType1" class="radio-tile-label" style="font-size: 15px;">인기순</label>
								</div>
							</div>
							<div class="input-container">
								<input id="orderType2" class="radio-button" type="radio" name="orderType" value="평점" />
								<div class="radio-tile">
								<label for="orderType2" class="radio-tile-label" style="font-size: 15px;">평점순</label>
								</div>
							</div>
						</div>
					</div>
					<div>
						<span>음식점 지역</span>
					</div>
					<div class="container_1">
						<div class="radio-tile-group">
							<div class="input-container">
								<input id="addrType1" class="radio-button" type="checkbox" name="addrType" value="제주시"/>
								<div class="radio-tile">
								<label for="addrType1" class="radio-tile-label" style="font-size: 15px;">제주시</label>
								</div>
							</div>
							<div class="input-container">
								<input id="addrType2" class="radio-button" type="checkbox" name="addrType" value="서귀포시" />
								<div class="radio-tile">
								<label for="addrType2" class="radio-tile-label" style="font-size: 15px;">서귀포시</label>
								</div>
							</div>
						</div>
					</div>
					<div>
						<span>음식 종류</span>
					</div>
					<div class="container_1">
						<div class="radio-tile-group">
							<div class="input-container">
								<input id="kindType1" class="radio-button" type="checkbox" name="kindType" value="한식"/>
								<div class="radio-tile">
								<label for="kindType1" class="radio-tile-label" style="font-size: 15px;">한식</label>
								</div>
							</div>
							<div class="input-container">
								<input id="kindType2" class="radio-button" type="checkbox" name="kindType" value="중식" />
								<div class="radio-tile">
								<label for="kindType2" class="radio-tile-label" style="font-size: 15px;">중식</label>
								</div>
							</div>
							<div class="input-container">
								<input id="kindType3" class="radio-button" type="checkbox" name="kindType" value="일식"/>
								<div class="radio-tile">
								<label for="kindType3" class="radio-tile-label" style="font-size: 15px;">일식</label>
								</div>
							</div>
							<div class="input-container">
								<input id="kindType4" class="radio-button" type="checkbox" name="kindType" value="양식"/>
								<div class="radio-tile">
								<label for="kindType4" class="radio-tile-label" style="font-size: 15px;">양식</label>
								</div>
							</div>
							<div class="input-container">
								<input id="kindType5" class="radio-button" type="checkbox" name="kindType" value="카페"/>
								<div class="radio-tile">
								<label for="kindType5" class="radio-tile-label" style="font-size: 15px;">카페</label>
								</div>
							</div>
							<div class="input-container">
								<input id="kindType6" class="radio-button" type="checkbox" name="kindType" value="기타"/>
								<div class="radio-tile">
								<label for="kindType6" class="radio-tile-label" style="font-size: 15px;">기타</label>
								</div>
							</div>
						</div>
					</div>
					<div class="search">
			        	<input class="button searchBtn" type="button" value="적용" onclick="searchType()" />
			        </div>
			   	</div>
		   	</div>
	   	</div>
	</div>
		 
</body>
<script type="text/javascript">
var root = "${root}";
var keyword = "${keyword}";

/* 필터 관련 */
var orderType = "";
var addrType = "";
var kindType = "";

/* 검색 결과 출력 관련 */
var boardSize = 10;		// 한페이지당 출력 수
var pageBlock = 10;		// 구간당 페이지 표기 수
var currentPage = 1;	// 현재 페이지
var resultCount = 0;	// 검색 결과 수
var pageCount = 0;		// 결과 페이지 수

function searchCountAjax() {
// 	alert(orderType + addrType + kindType);
	$.ajax({
		type : "POST",
		url : root + "/searchCountAjax.do",
		data : { keyword : keyword, addrType : addrType, kindType : kindType},
		success : function (data) {
			resultCount = data;
			pageCount = Math.ceil(resultCount/boardSize);
			// 현재 있는 블락 갯수
			var currentBlock = Math.floor((currentPage-1)/pageBlock);	
			var startPage = currentBlock * pageBlock + 1;
			var endPage = startPage + pageBlock -1;
			if (endPage > pageCount) {
				endPage = pageCount;
			}
			var button = "";
			if (startPage > pageBlock) {
				button += "<a href='javascript:changePage(\"first\")'>[처음]</a>";
				button += "<a href='javascript:changePage(\"prev\")'>[이전]</a>";
			}
			for (var i = startPage; i <= endPage; i++) {
				button += "<a href='javascript:changePage("+i+")'> ["+i+"] </a>";
			}
			
			
			if (endPage < pageCount) {
				button += "<a href='javascript:changePage(\"next\")'>[다음]</a>";
				button += "<a href='javascript:changePage(\"last\")'>[마지막]</a>";
			}
			$(".page").html(button);
		},
		error: function (request, status, error) {
			var str = 'code: '+request.status+'\n';
			str += 'message: ' + request.responseText+'\n';
			str += 'error: ' + error;
			alert(str);
		}
	});
}

function searchResultAjax() {
	var arr = new Array();
	$.ajax({
		type : "POST",
		url : root + "/searchResultAjax.do",
		data : { keyword : keyword, currentPage : currentPage, orderType : orderType, addrType : addrType, kindType : kindType},
		success : function (data) {
			var cont = "";
			if (resultCount > 0) {
				for (var i = 0; i < data.length; i++) {
					arr.push(data[i].foodAddr,data[i].foodName,data[i].foodKind,data[i].foodCode, data[i].imageName);
					mark(data[i].foodAddr,data[i].foodName,data[i].foodKind,data[i].foodCode, data[i].imageName);
					//alert(arr);
					var url = root + "/food/read.go?foodCode=" + data[i].foodCode;
					cont += "<div class='list' style='cursor:pointer;' onclick='location.href=\""+url+"\"'>";
						cont += "<div>";
							var err = root + "/resources/css/list.jpg";
							cont += "<img alt='음식 이미지' src='/img/"+data[i].imageName+"' onerror='this.src=\""+err+"\"'>";
						cont += "</div>";
						cont += "<div>";
							cont += "<span class='foodName'>"+data[i].foodName+"</span>";
							if (data[i].reviewScore > 0) {
								var reviewScore = Math.round(data[i].reviewScore * 10)/10
							cont += "<span class='reviewScore'>"+reviewScore+"</span>";
							}
						cont += "</div>";
						cont += "<div>";
							cont += "<span class='foodArea'>"+data[i].foodArea+"  </span>";
							cont += "<span class='foodKind'>"+data[i].foodKind+"</span>";
						cont += "</div>";
						cont += "<div>";
							cont += "<i class='fa fa-eye' style='color:#9b9b9b;'></i><span class='foodRead'>"+data[i].foodRead+"</span>";
							if (data[i].reviewCount != null) {
							cont += "<i class='fa fa-pencil' style='color:#9b9b9b;'></i><span class='reviewCount'>"+data[i].reviewCount+"</span>";
							}
						cont += "</div>";
					cont += "</div>"
				}
			} else if (resultCount == 0) {
				cont += "<div><p>검색된 음식점이 없습니다.</p></div>";
			}
			$(".result").html(cont);	
			},
		error: function (request, status, error) {
			var str = 'code: '+request.status+'\n';
			str += 'message: ' + request.responseText+'\n';
			str += 'error: ' + error;
			alert(str);
		}
	});
}

var kind = "${foodKind}";
$(function() {
	if (kind != null && kind != "") {
		$('input:checkbox[name=kindType]:input[value='+kind+']').attr("checked", true);
		searchType();
	}
	searchCountAjax();
	searchResultAjax();
});

function searchType() {
	addrType = "";
	kindType = "";
	currentPage=1;
	orderType = $('input[name="orderType"]:checked').val();
	$('input[name="addrType"]:checked').each(function() {
		addrType += $(this).val() + ",";
	});
	$('input[name="kindType"]:checked').each(function() {
		kindType += $(this).val() + ",";
	});
	searchCountAjax();
	searchResultAjax();
	filterModal.style.display = "none";
}

function changePage(n) {
	if (n == "next") {
		currentPage = Math.ceil(currentPage/pageBlock)*pageBlock+1;
		searchCountAjax();
	} else if (n == "prev") {
		currentPage = (Math.floor(currentPage/pageBlock)-1)*pageBlock+1;
		searchCountAjax();
	} else if (n == "first") {
		currentPage = 1;
		searchCountAjax();
	} else if (n == "last") {
		currentPage = pageCount;
		searchCountAjax();
	} else {
		currentPage = n;
	}
	searchResultAjax();
}
	var header = document.getElementById("header");
	var filterModal = document.getElementById("filterModal");
	var filterClick = document.getElementById("filterClick");
	var span = document.getElementsByClassName("close")[3];
	filterClick.onclick = function() {
		filterModal.style.display = "block";
		}
	span.onclick = function() {
		filterModal.style.display = "none";
		}


</script>
</html>