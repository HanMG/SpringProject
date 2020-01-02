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
* {
	margin: 0;
	padding: 0;
}
a {
	text-decoration: none;
}
#content {
	margin : 50px auto;
	width: 1240px;
	overflow: hidden;
}
/* 검색 순위, 필터, 가게 리스트 */
.nav_1 {
	width: 740px;
	/* 임시 높이 설정  */
	overflow: hidden;
	float: left;
	margin: 0 30px;
}
/* 지도 */
.nav_2 {
	width: 440px;
	/* 임시 높이 설정  */
	overflow: hidden;
	float: left;
	
}
/* 인기검색, 필터 */
.filter {
	width: 740px;
	height: 50px;
}
/* 인기검색 */
.filter > span {
	text-align: left;
    color: #EFB730;
    font-size: 24px;
    height: 50px;
    line-height: 50px;
    margin-left: 10px;
}
/* 필터 */
.filter > a {
	float: right;
	height: 50px;
	line-height: 50px;
	color: #EFB730;
	margin-right: 10px;
	font-size: 24px;
}
/* 가게 리스트 */
.list {
	width: 350px;
	height: 300px;
	float: left;
	margin: 10px;
}
/* 가게 이미지 */
.list > div:first-child {
	width: 350px;
	height: 200px;
	margin-bottom: 5px;
}
.list > div:first-child > img {
	width: 350px;
	height: 200px;
}
.foodName {
	font-size: 23px;
}
.reviewScore {
	font-size: 23px;
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
	text-align: center;
	width: 740px;
}
.page a {
	font-size: 23px;
	color: #EFB730;
}

.map {
	width: 450px;
	margin: 10px;
	height: 450px;
}
.abc {
	width: 400px;
	margin: 5px 20px;
	background: maroon;
	height: 150px;
}

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

#map {
	position: relative;
}

.dragend {
	position:absolute;
	z-index: 7;
	top: 350px;
	left: 180px;
	}
}

.abc {
	width: 400px;
	margin: 5px 20px;
	background: maroon;
	height: 150px;
}

/* 쿠폰 관련 */
.couponList {
	width: 300px;
	height: 150px;
	float: left;
	margin: 10px;
	margin-left: 70px;
}
.couponList > div:nth-child(1) {
	width: 300px;
	height: 150px;
	background-repeat: no-repeat;
	background-size: 100% 100%;
	position: relative;
	text-align: center;
}
.couponList > div:nth-child(1) > span {
	float: right;
	display: inline-block;
	position: absolute;
	bottom: 25px;
	right: 15px;
	font-size: 23px;
	font-weight: bold;
	color: white;
	
}
.couponList > div:nth-child(1) > span:nth-child(2) {
	bottom: 55px;
	font-size: 14px;
}
.couponList > div:nth-child(1) > span:nth-child(3) {
	bottom: 75px;
	font-size: 23px;
	right: inherit;
	display: inline-block;
}
.couponList > div:nth-child(1) > a {
	float: right;
	display: inline-block;
	position: absolute;
	bottom: 5px;
	right: 15px;
	font-weight: bold;
	color: white;
}
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
  background-color: rgba(255, 255, 255, 0.95); /* Black w/ opacity */
}

#contentFilter{
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -370px;
	margin-top: -400px;
	width: 740px;
	height: 700px;
	border-radius: 5px;
	box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 10px;
	background: white;
}
.titleFilter {
	width: 740px;
	height: 50px;
	line-height: 50px;
	font-size: 30px;
	font-weight: bold;
}
/* 개인정보 */
.titleFilter > span:first-child {
	margin-left: 40px;
}
.radio-tile-label {
	font-size: 15px;
}
.filter_nav span {
	font-size: 23px;
	margin: 20px 30px;
	display: block;
}
.radio-tile-group {
	justify-content: left;
	margin-left: 25px;
}
.search {
    height: 230px;
    text-align: center;
    line-height: 230px;
}
.searchBtn {
	width: 100px;
	height: 50px;
	font-size: 32px;
	line-height: 50px;
	border-radius: 5px;
}
.icon {
	width: 10px;
	height: 10px;
}

</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f30f46c40f26ed513be4c81611d91389&libraries=services"></script>
</head>
<body>

<div id="content">
	<div class="nav_1">
		<div class="filter">
			<span>${keyword} 맛집 인기 검색 순위</span>
			<a href="#" id="filterClick">필터</a>
		</div>
		

		
		<!-- 검색된 음식점 리스트 불러오기  -->
		<div class="result" style="height: 1600px;">
<%-- 			<!-- 검색 결과가 없는 경우  -->
			<c:if test="${foodCount == 0}">
				<div>
					<p>검색된 음식점이 없습니다.</p>
				</div>
			</c:if>	
			
			<c:if test="${foodCount > 0}">
			<c:forEach var = "searchFoodDto" items="${foodList}">
			<div class="list" style="cursor:pointer;" onclick="location.href='${root}/food/read.go?foodCode=${searchFoodDto.foodCode}'">
				<div>
					<img alt="음식 이미지" src="${searchFoodDto.imageName}" onerror="this.src='${root}/resources/css/list.jpg'">
				</div>
				<div>
					<span class="foodName">${searchFoodDto.foodName}</span>
					<c:if test="${searchFoodDto.reviewScore > 0}">
					<span class="reviewScore"><fmt:formatNumber value="${searchFoodDto.reviewScore}" pattern="#.#"/></span>
					</c:if>				
				</div>
				<div>
					<span class="foodArea">${searchFoodDto.foodArea} - </span>  
					<span class="foodKind">${searchFoodDto.foodKind}</span>
				</div>
				<div>
					<img class="icon" alt="" src="${root}/resources/css/views.png">
					<span class="foodRead">${searchFoodDto.foodRead}</span>
					<img class="icon" alt="" src="${root}/resources/css/reviewCount.png">
					<span class="reviewCount">${searchFoodDto.reviewCount}</span>
				</div>
			</div>
			</c:forEach>
			</c:if> --%>
		</div>
		<div class="page">
		</div>
	</div>
		
	<div class="nav_2">
		<div class="map" id="map">
			<div class="dragend" id="dragend">
	        <!-- <button><a href="#">현재 위치에서 재검색</a></button> -->
		    </div> 
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
		
			function mark(arr){
				var array = arr.join();
				var abc = array.split(",");
				
				var addr = abc[0];
				var name = abc[1];
				var filter = abc[2];
				var foodCode = abc[3];
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
			    	// 마커 위에 커스텀오버레이를 표시합니다
					// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
					var CustomOverlay = new daum.maps.CustomOverlay({
						//content: content,
						map: map,
						xAnchor: 0.5,
					    yAnchor: 0.5,
						position: marker.getPosition()
					});
					 
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
						image.setAttribute("src", "${searchFoodDto.imageName}");
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
		
		<c:if test="${couponCount > 0}">
				<c:forEach var="couponDto" items="${couponList}" begin="0" step="1" end="5">
				<div id="inner" class="couponList" style="cursor:pointer;" onclick="location.href='${root}/food/read.go?foodCode=${couponDto.foodCode}'">
					<div style="background-image: url('${root}/resources/ftp/${couponDto.imageName}'), url('${root}/resources/css/list.jpg');">
						<%-- <img alt="쿠폰 이미지" src="${path}${couponDto.imageName}" onerror="this.src='${root}/resources/css/list.jpg'"> --%>
						<span>\ ${couponDto.couponCostsale}</span>
						<span style="text-decoration:line-through;">\ ${couponDto.couponCostori}</span>
						<span>${couponDto.couponName}</span>
						<a class="button" href="${root}/coupon/couponRead.go?couponCode=${couponDto.couponCode}&pageNumber=1">구매하기</a>
					</div>
					<div>
					</div>
					
				</div>
				</c:forEach>
		</c:if>
	</div>
</div>
		 
	<div id="filterModal" class="filterModal">
		<div id="contentFilter">
			<div class="filter">
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
					arr.push(data[i].foodAddr,data[i].foodName,data[i].foodKind,data[i].foodCode);
					mark(arr);
					//alert(arr);
					var url = root + "/food/read.go?foodCode=" + data[i].foodCode;
					cont += "<div class='list' style='cursor:pointer;' onclick='location.href=\""+url+"\"'>";
						cont += "<div>";
							var err = root + "/resources/css/list.jpg";
							cont += "<img alt='음식 이미지' src='"+root+"/resources/ftp/"+data[i].imageName+"' onerror='this.src=\""+err+"\"'>";
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
							cont += "<span class='foodRead'>조회수 "+data[i].foodRead+"</span>";
							if (data[i].reviewCount != null) {
							cont += "<span class='reviewCount'> / 리뷰수 "+data[i].reviewCount+"</span>";
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


$(function() {
	$('input:checkbox[name=kindType]:input[value='+"${foodKind}"+']').attr("checked", true);
	searchType();
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
		header.style.display = "none";
		}
	span.onclick = function() {
		filterModal.style.display = "none";
		header.style.display = "block";
		}


</script>
</html>