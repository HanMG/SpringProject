<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="EUC-KR">
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
   	border-bottom: 1px dotted;
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
.list img {
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
</style>
<script type="text/javascript" src="${root}/resources/jquery/jquery-3.4.1.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f30f46c40f26ed513be4c81611d91389&libraries=services"></script>
</head>
<body>

<div id="content">
	<div class="nav_1">
		<div class="filter">
			<span>${keyword} 맛집 인기 검색 순위</span>
			<a href="#">필터</a>
		</div>
		
		<!-- 검색 결과가 없는 경우  -->
		<c:if test="${foodCount == 0}">
			<div>
				<p>검색된 음식점이 없습니다.</p>
			</div>
		</c:if>
		
		<!-- 검색된 음식점 리스트 불러오기  -->
		<div style="height: 1600px;">
			<c:if test="${foodCount > 0}">
			<c:forEach var = "searchFoodDto" items="${foodList}">
			<div class="list" style="cursor:pointer;" onclick="location.href='${root}/food/read.go?foodCode=${searchFoodDto.foodCode}'">
				<div>
					<img alt="음식 이미지" src="${searchFoodDto.imageName}" onerror="this.src='${root}/resources/css/list.jpg'">
				</div>
				<div>
					<span class="foodName">${searchFoodDto.foodName}</span>
					<span class="reviewScore"><fmt:formatNumber value="${searchFoodDto.reviewScore}" pattern=".0"/></span>
				</div>
				<div>
					<span class="foodArea">${searchFoodDto.foodArea} - </span>  
					<span class="foodKind">${searchFoodDto.foodKind}</span>
				</div>
				<div>
					<span class="foodRead">${searchFoodDto.foodRead}</span>
					<span class="reviewCount">${searchFoodDto.reviewCount}</span>
				</div>
			</div>
			</c:forEach>
			</c:if>
		</div>
		<div class="page">
			<c:if test="${foodCount > 0}">
				<c:set var = "pageBlock" value = "5" />
				<fmt:parseNumber var = "pageCount" value = "${foodCount / boardSize + (foodCount%boardSize==0 ? 0 : 1 ) }" integerOnly="true"/>
				<fmt:parseNumber var="result" value="${(currentPage -1)/pageBlock}" integerOnly="true"/>
				<c:set var="startPage" value="${result*pageBlock+1}"/>
				<c:set var="endPage" value="${startPage+pageBlock-1}"/>
				
				<c:if test="${endPage > pageCount }">
					<c:set var="endPage" value="${pageCount}"/>
				</c:if>
				
				<%-- 처음, 이전 --%>
				<c:if test="${startPage > pageBlock}">
					<a href="${root}/searchKeyword.go?keyword=${keyword}&pageNumber=1">[처음]</a>
					<a href="${root}/searchKeyword.go?keyword=${keyword}&pageNumber=${startPage-pageBlock}">[이전]</a>
				</c:if>
				
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a href="${root}/searchKeyword.go?keyword=${keyword}&pageNumber=${i}">[${i}]</a>
				</c:forEach>
				
				<%-- 다음, 끝 --%>
				<c:if test="${endPage < pageCount}">
					<a href="${root}/searchKeyword.go?keyword=${keyword}&pageNumber=${startPage+pageBlock}">[다음]</a>
					<a href="${root}/searchKeyword.go?keyword=${keyword}&pageNumber=${pageCount}">[끝]</a>
				</c:if>
			</c:if>
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
				<c:forEach var="couponDto" items="${couponList}" begin="0" step="1">
				<div id="inner" class="couponList" style="cursor:pointer;" onclick="location.href='${root}/food/read.go?foodCode=${couponDto.foodCode}'">
					<div style="background-image: url('${path}${couponDto.imageName}'), url('${root}/resources/css/list.jpg');">
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
		
		<%-- 	
		<c:if test="${couponCount > 0}">
			<c:forEach var = "couponDto" items="${couponList}">
			<div class="abc">
				<span>${couponDto.couponName}</span>
				<span>${couponDto.foodName}</span>
				<span>${couponDto.foodMenu}</span>
			</div>
			</c:forEach>
		</c:if>
		 --%>
		
	</div>
</div>
		<div>
			<h4>필터</h4>
			<label>조회 기준</label>
			<select>
				<option value="">평점순(평점)</option>
				<option value="">인기순(조회)</option>
			</select>
			<label>음식점 지역</label>
			<select>
				<option value="">제주시</option>
				<option value="">서귀포시</option>
			</select>
			<label>음식 종류</label>
			<select>
				<option value="">한식</option>
				<option value="">양식</option>
				<option value="">일식</option>
				<option value="">중식</option>
				<option value="">카페</option>
			</select>
			<input type="button" value="적용">
		</div>

		<div align="center">
		
	</div>
		
</body>
</html>