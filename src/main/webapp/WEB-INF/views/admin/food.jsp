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
<script src="${root}/resources/jquery/jquery-3.4.1.js"></script>
<%-- <link rel="stylesheet" href="${root}/resources/css/admin/food.css" /> --%>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	text-decoration: none;
}
.button {
    color: #FFFFFF;
    border: #343A40 solid 1px;
    background-color: #343A40;
}
#title {
	width: 100%;
	height: 50px;
	line-height: 50px;
}
#title > span {
	margin-left: 60px;
	font-size: 23px;
}
#content {
	width: 100%;
	overflow: hidden;
	margin: 0 auto;
}
#list {
	width: 100%;
	margin: 0 auto;
}
/* 음식점관련 */
#content_modal {
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -400px;
	margin-top: -400px;
	background: #F2F4EF;
	width: 800px;
	border-radius: 5px;
	overflow: hidden;
}
.content_modal {
	width: 800px;
	overflow: hidden;
}
.title_modal {
	width: 800px;
	height: 50px;
	line-height: 50px;
	font-size: 30px;
	font-weight: bold;
	text-align: center;
}

/* 음식점관련 */
.food {
	overflow: hidden;
	width: 600px; 
	margin: 10px auto;
}
.food > div {
	margin-top: 5px;
}
.food > div span:nth-child(1) {
	font-size: 23px;
	display: inline-block;
	width: 150px;
	line-height: 50px;
	
}
.food > div > input[type=text] {
	display: inline-block;
	width: 445px;
	height: 50px;
	font-size: 23px;
}


/* The Close Button */
.close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
  margin-right: 15px;
}
.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}
.btn > .button {
	font-size: 23px;
	width: 280px;
	height: 50px;
}
.menuBtn {
	float: right;
	font-size: 23px;
	height: 50px;
    width: 120px;
    line-height: 50px;
    color: #FFFFFF;
    border: #343A40 solid 1px;
    background-color: #343A40;
    margin: 5px;
}

.foodModal, .foodInModal {
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
.span {
	font-size: 23px;
}
.mapBtn {
	height: 50px;
    width: 60px;
    line-height: 55px;
}
thead > tr > th {
	min-width: 70px; 
}

</style>
</head>
<body>
	<div id="content">
		<div id="title">
			<span>음식점관리</span>
			<button class="menuBtn" id="foodInClick">음식점등록</button>
		</div>
		<div id="list">
			<table id="example" class="display" style="width:100%">
				<thead>
					<tr>
						<th>음식점코드</th>
						<th>지역</th>
						<th>음식점명</th>
						<th>대표음식</th>
						<th>종류</th>
						<th>주소</th>
						<th>등록날짜</th>
						<th>음식점상태</th>
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
		<!-- 음식점 등록 모달 -->
	<div id="foodInModal" class="foodInModal">
		<div id="content_modal">
			<div class="content_modal">
				<div class="title_modal">
					<span>음식점 등록</span>
					<span class="close foodInClose">&times;</span>
				</div>
				<form action="${root}/food/insertOk.go" method="post" enctype="multipart/form-data" onsubmit="return foodInForm(this)">
				<input type="hidden" name="memberCode" value="${memberCode}" />
				<div class="food">		
					<div>
						<span>*음식점명</span>
						<input type="text" name="foodName" value=""/>
					</div>		
					<div>
						<span>*주소</span>
						<input style="width: 380px" type="text" name="foodAddr" id="sample5_address">
						<button type="button" class="button mapBtn" onclick="sample5_execDaumPostcode()">지도</button>
					</div>	
					<div id="map" style="width:200px;height:200px;margin-top:10px;display:none; margin-left: 155px"></div>
					<div>
						<span>*지역</span>
						<select name="foodArea">
							<option value="제주시내">제주시내</option>
							<option value="서귀포시내">서귀포시내</option>
							<option value="푸드트럭">푸드트럭</option>
							<option value="중문/예래">중문/예래</option>
							<option value="성산/우도">성산/우도</option>
							<option value="구좌/김녕">구좌/김녕</option>
							<option value="월정/평대/세화">월정/평대/세화</option>
							<option value="조천/함덕">조천/함덕</option>
							<option value="애월">애월</option>
							<option value="한림/협재/비양도">한림/협재/비양도</option>
						</select>						
					</div>		
					<div>
						<span>*전화번호</span>
						<input type="text" name="foodPhone" value="">
					</div>			
					<div>
						<span>*종류</span>
						<select id="foodKind1" onchange="kindChange('foodKind')">
							<option value="">대분류</option>
							<option value="한식">한식</option>
							<option value="중식">중식</option>
							<option value="일식">일식</option>
							<option value="양식">양식</option>
							<option value="카페/술">카페/술</option>
							<option value="기타">기타</option>					
						</select>	
						<select id="foodKind2"></select>
						<input type="hidden" name="foodKind" id="foodKind" />					
					</div>
					<div>
						<span>대표음식</span>
						<input type="text" name="foodMenu" value="">
					</div>				
					<div>
						<span>영업시간</span>
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
						<textarea name="foodIntro" id="" cols="60" rows="5" placeholder="소개" style="vertical-align: top;"></textarea>
					</div>
					<div>
						<span>*음식점상태</span>
						<input type="radio" name="foodStatus" value="Y" id="insertStatY" checked="checked"><label class="span" for="insertStatY">Y</label>
						<input type="radio" name="foodStatus" value="N" id="insertStatN"><label class="span" for="insertStatN">N</label>
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
	
	<!-- 음식점 모달 -->
	<div id="foodModal" class="foodModal">
		<div id="content_modal">
			<div class="content_modal">
				<div class="title_modal">
					<span>음식점 관리</span>
					<span class="close foodClose">&times;</span>
				</div>
				<form action="${root}/food/updateOk.go" method="post" enctype="multipart/form-data" name="foodForm" onsubmit="return foodUpForm(this)">
				<input type="hidden" name="foodCode" id="foodCode" value="" />
				<div class="food">
					<div>
						<span>음식점코드</span>
						<span class="span" id="foodCodeTemp"></span>
					</div>
					<div>
						<span>*음식점명</span>
						<input type="text" name="foodName" id="foodName" value=""/>
					</div>
					<div>
						<span>*주소</span>
						<input type="text" name="foodAddr" id="foodAddr" value=""/>					
					</div>
					<div>
						<span>*지역</span>
						<select name="foodArea" id="foodArea">
							<option value="제주시내">제주시내</option>
							<option value="서귀포시내">서귀포시내</option>
							<option value="푸드트럭">푸드트럭</option>
							<option value="중문/예래">중문/예래</option>
							<option value="성산/우도">성산/우도</option>
							<option value="구좌/김녕">구좌/김녕</option>
							<option value="월정/평대/세화">월정/평대/세화</option>
							<option value="조천/함덕">조천/함덕</option>
							<option value="애월">애월</option>
							<option value="한림/협재/비양도">한림/협재/비양도</option>
						</select>
					</div>
					<div>
						<span>*전화번호</span>
						<input type="text" name="foodPhone" id="foodPhone" value="">
					</div>					
					<div>
						<span>*종류</span>
						<select class="foodKind1" id="foodKindUp1" onchange="kindChange('foodKindUp')">
							<option value="">대분류</option>
							<option value="한식">한식</option>
							<option value="중식">중식</option>
							<option value="일식">일식</option>
							<option value="양식">양식</option>
							<option value="카페/술">카페/술</option>
							<option value="기타">기타</option>					
						</select>	
						<select id="foodKindUp2"></select>
						<input type="hidden" name="foodKind" id="foodKindUp" />					
					</div>			
					<div>
						<span>대표음식</span>
						<input type="text" name="foodMenu" id="foodMenu" value="">
					</div>
					<div>
						<span>영업시간</span>
						<input type="text" name="foodTime" id="foodTime" value="">
					</div>
					<div>
						<span>휴일</span>
						<input type="text" name="foodBreak" id="foodBreak" value="">
					</div>
					<div>
						<span>*대표이미지</span>
						<input type="file" name="imgFile" accept="image/*"/>
						<div id="imgWrapper" class="m-2"></div>
						
					</div>
					<div>
						<span>*음식점소개</span>
						<textarea name="foodIntro" id="foodIntro" cols="60" rows="5" placeholder="소개" style="vertical-align: top;"></textarea>
					</div>
					<div>
						<span>*음식점상태</span>
						<input type="radio" name="foodStatus" id="updateStatY" value="Y"><label class="span" for="updateStatY">Y</label>
						<input type="radio" name="foodStatus" id="updateStatN"value="N"><label class="span" for="updateStatN">N</label>
					</div>
					<div>
						<span>등록자(읽기)</span>
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
	

<script type="text/javascript">
/*  게시판  클릭시 작동 */
 
$(".foodClick").click(function(){	
	$(".foodKind1 option:eq(0)").prop("selected", true);
	$("#foodKindUp2").empty();
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
			$("#foodArea").val(data.foodArea);			
			$("#foodPhone").val(data.foodPhone);	
			let foodKind = data.foodKind;	
			if(foodKind != null){
				let foodKindArr = foodKind.split(" > ");			
				$("#foodKindUp1").val(foodKindArr[0]);
				kindChange("foodKindUp");			
				$("#foodKindUp2").val(foodKindArr[1]);
			}
			$("#foodMenu").val(data.foodMenu);
			$("#foodTime").val(data.foodTime);
			$("#foodBreak").val(data.foodBreak);
			$("#foodIntro").val(data.foodIntro);
			$("input:radio[name='foodStatus'][value='"+data.foodStatus+"']",document.foodForm).prop("checked", true);
			$("#memberCode").val(data.memberCode);
			if(data.imageName != null){
				$("#imgWrapper").append("<img src='/img/"+data.imageName+"\' alt='"+data.imageName+"' style='width:150px; height:150px' />");
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
/*  음식점 등록 클릭시 작동 */
$("#foodInClick").click(function(){
	$(".foodKind1 option:eq(0)").prop("selected", true);
	kindChange();
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