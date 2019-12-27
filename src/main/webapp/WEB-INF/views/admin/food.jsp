<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f30f46c40f26ed513be4c81611d91389&libraries=services"></script>
<script src="${root}/resources/javascript/food/food.js"></script>
<script src="${root}/resources/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="${root}/resources/css/admin/food.css" />
</head>
<body>
	<div id="content">
		<div id="title">
			<span>식당관리</span>
			<button class="button" id="foodInClick">식당등록</button>
		</div>
		<div id="list">
			<table id="example" class="display" style="width:100%">
				<thead>
					<tr>
						<th>식당코드</th>
						<th>지역</th>
						<th>가게명</th>
						<th>대표음식</th>
						<th>종류</th>
						<th>주소</th>
						<th>등록날짜</th>
						<th>식당상태</th>
					</tr>				
				</thead>
				<tbody>
					<c:if test="${foodDtoList != null }">
					<c:forEach var="foodDto" items="${foodDtoList}">
					<tr class="foodClick">
						<th class="foodCode">${foodDto.foodCode}</th>
						<th class="foodArea">${foodDto.foodArea}</th>
						<th class="foodName">${foodDto.foodName}</th>
						<th class="foodMenu">${foodDto.foodMenu}</th>
						<th class="foodKind">${foodDto.foodKind}</th>
						<th class="foodAddr">${foodDto.foodAddr}</th>
						<th class="foodDate"><fmt:formatDate value="${foodDto.foodDate}" pattern="yyyy-MM-dd" /></th>
						<th>${foodDto.foodStatus}</th>
					</tr>					
					</c:forEach>	
					</c:if>				
				</tbody>
			</table>
		</div>	
	</div>
		<!-- 식당 등록 모달 -->
	<div id="foodInModal" class="foodInModal">
		<div id="content_modal">
			<div class="content_modal">
				<div class="title_modal">
					<span>식당 등록</span>
					<span class="close foodInClose">&times;</span>
				</div>
				<form action="${root}/food/insertOk.go" method="post" enctype="multipart/form-data" onsubmit="return foodInForm(this)">
				<input type="hidden" name="memberCode" value="${memberCode}" />
				<div class="food">		
					<div>
						<span>*가게명</span>
						<input type="text" name="foodName" value=""/>
					</div>		
					<div>
						<span>*주소</span>
						<input type="text" name="foodAddr" id="sample5_address">
						<button type="button" class="button" onclick="sample5_execDaumPostcode()" style="font-size: 16px">지도</button>
					</div>	
					<div id="map" style="width:200px;height:200px;margin-top:10px;display:none"></div>
					<div>
						<span>*지역</span>
						<input type="radio" name="foodArea" id="insertAreaJeju" value="제주시" checked="checked"><label for="insertAreaJeju">제주시</label>
						<input type="radio" name="foodArea" id="insertAreaSeo" value="서귀포시"><label for="insertAreaSeo">서귀포시</label>
					</div>		
					<div>
						<span>*전화번호</span>
						<input type="text" name="foodPhone" value="">
					</div>			
					<div>
						<span>*종류</span>
						<input type="radio" name="foodKind" id="insertKor" value="한식" checked="checked"><label for="insertKor">한식</label>
						<input type="radio" name="foodKind" id="insertChn" value="중식"><label for="insertChn">중식</label>
						<input type="radio" name="foodKind" id="insertJp" value="일식"><label for="insertJp">일식</label>
						<input type="radio" name="foodKind" id="insertWt" value="양식"><label for="insertWt">양식</label>
						<input type="radio" name="foodKind" id="insertCf" value="카페"><label for="insertCf">카페</label>
						<input type="radio" name="foodKind" id="insertEtc" value="기타"><label for="insertEtc">기타</label>
					</div>
					<div>
						<span>대표음식</span>
						<input type="text" name="foodMenu" value="">
					</div>				
					<div>
						<span>영업시간(ex:08:00~18:00)</span>
						<input type="text" name="foodTime" value="">
					</div>
					<div>
						<span>휴일</span>
						<input type="text" name="foodBreak" value="">
					</div>
					<div>
						<span>*대표이미지</span>
						<input type="file" name="imgFile" accept="image/*"/>
					</div>
					<div>
						<span>*음식점소개</span>
						<textarea name="foodIntro" id="" cols="55" rows="3" placeholder="소개"></textarea>
					</div>
					<div>
						<span>*식당상태</span>
						<input type="radio" name="foodStatus" value="y" id="insertStatY"><label for="insertStatY">Y</label>
						<input type="radio" name="foodStatus" value="n" id="insertStatN"checked="checked"><label for="insertStatN">N</label>
					</div>
					<div class="btn">
						<input class="button" type="submit" value="등록하기"></input>
						<input class="button" type="reset" value="초기화"></input>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
	
	<!-- 식당 모달 -->
	<div id="foodModal" class="foodModal">
		<div id="content_modal">
			<div class="content_modal">
				<div class="title_modal">
					<span>식당 관리</span>
					<span class="close foodClose">&times;</span>
				</div>
				<form action="${root}/food/updateOk.go" method="post" enctype="multipart/form-data" name="foodForm" onsubmit="return foodForm(this)">
				<input type="hidden" name="foodCode" id="foodCode" value="" />
				<div class="food">
					<div>
						<span>식당코드 : </span>
						<div id="foodCodeTemp"></div>						
					</div>
					<div>
						<span>*가게명</span>
						<input type="text" name="foodName" id="foodName" value=""/>
					</div>
					<div>
						<span>*주소</span>
						<input type="text" name="foodAddr" id="foodAddr" value=""/>					
					</div>
					<div>
						<span>지역</span>
						<input type="radio" name="foodArea" id="updateAreaJeju" value="제주시"><label for="updateAreaJeju">제주시</label>
						<input type="radio" name="foodArea" id="updateAreaSeo" value="서귀포시"><label for="updateAreaSeo">서귀포시</label>
					</div>
					<div>
						<span>*전화번호</span>
						<input type="text" name="foodPhone" id="foodPhone" value="">
					</div>					
					<div>
						<span>*종류</span>
						<input type="radio" name="foodKind" id="updateKor" value="한식"><label for="updateKor">한식</label>
						<input type="radio" name="foodKind" id="updateChn" value="중식"><label for="updateChn">중식</label>
						<input type="radio" name="foodKind" id="updateJp" value="일식"><label for="updateJp">일식</label>
						<input type="radio" name="foodKind" id="updateWt" value="양식"><label for="updateWt">양식</label>
						<input type="radio" name="foodKind" id="updateCf" value="카페"><label for="updateCf">카페</label>
						<input type="radio" name="foodKind" id="updateEtc" value="기타"><label for="updateEtc">기타</label>
					</div>				
					<div>
						<span>대표음식</span>
						<input type="text" name="foodMenu" id="foodMenu" value="">
					</div>
					<div>
						<span>영업시간(ex:08:00~18:00)</span>
						<input type="text" name="foodTime" id="foodTime" value="">
					</div>
					<div>
						<span>휴일</span>
						<input type="text" name="foodBreak" id="foodBreak" value="">
					</div>
					<div>
						<span>*대표이미지</span>
						<div id="imgWrapper" class="m-2"></div>
						
						<input type="file" name="imgFile" accept="image/*"/>
					</div>
					<div>
						<span>*음식점소개</span>
						<textarea name="foodIntro" id="foodIntro" cols="55" rows="3" placeholder="소개"></textarea>
					</div>
					<div>
						<span>*식당상태</span>
						<input type="radio" name="foodStatus" id="updateStatY" value="y"><label for="updateStatY">Y</label>
						<input type="radio" name="foodStatus" id="updateStatN"value="n"><label for="updateStatN">N</label>
					</div>
					<div>
						<span>등록자(읽기전용)</span>
						<input type="text" id="memberCode" readonly="readonly"/>
					</div>
					
					<div class="btn">
						<input class="button" type="submit" value="수정하기"/>	
						<input class="button" type="button" id="foodDeleteBtn" value="삭제하기"/>						
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
	
<!-- 식당 등록 유효성 검사 -->
<script>

</script>
<script type="text/javascript">
/*  게시판  클릭시 작동 */
 
$(".foodClick").click(function(){
	$("#imgWrapper").empty();
	$("#foodDeleteBtn").removeAttr("onclick");
	$("#foodModal").css("display","block");	
	let foodCode = $(this).children(".foodCode").text();
	let url = "${root}/admin/getFood.go?foodCode="+foodCode;	
	$.ajax({
		url : url,
		type : "GET",
		dataType : "json",
		success:function(data){
			//console.log(data);			
			$("#foodCode").val(data.foodCode);
			$("#foodCodeTemp").text(data.foodCode);			
			$("#foodName").val(data.foodName);
			$("#foodAddr").val(data.foodAddr);
			$("input:radio[name='foodArea'][value='"+data.foodArea+"']",document.foodForm).prop("checked", true);			
			$("#foodPhone").val(data.foodPhone);			
			$("input:radio[name='foodKind'][value='"+data.foodKind+"']",document.foodForm).prop("checked", true);
			$("#foodMenu").val(data.foodMenu);
			$("#foodTime").val(data.foodTime);
			$("#foodBreak").val(data.foodBreak);
			$("#foodIntro").val(data.foodIntro);
			$("input:radio[name='foodStatus'][value='"+data.foodStatus+"']",document.foodForm).prop("checked", true);
			$("#memberCode").val(data.memberCode);
			if(data.imageName != null){
				$("#imgWrapper").append("<img src='${root}/resources/ftp/"+data.imageName+"\' alt='"+data.imageName+"' style='width:150px; height:150px' />");
				$("#imgWrapper").append("<span>"+data.imageName+"</span>");
			}
			$("#foodDeleteBtn").attr("onclick","foodDelete('${root}','"+data.foodCode+"')");
		},
		error:function(request,status,error){
			console.log("code= "+request.status+" message= "+request.responseText+" error= "+error);
		}	
	});
});
$(".foodClose").click(function(){
	$("#foodModal").css("display","none");
});
/*  식당 등록 클릭시 작동 */
$("#foodInClick").click(function(){
	$("#foodInModal").css("display","block");
});
$(".foodInClose").click(function(){
	$("#foodInModal").css("display","none");
});


	
/* 지도 */
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