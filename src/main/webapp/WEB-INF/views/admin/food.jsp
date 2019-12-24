<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	text-decoration: none;
}
.button {
    color: #FFFFFF;
    border: #EFB730 solid 1px;
    background-color: #EFB730;
}
#title {
	width: 100vh;
	height: 50px;
	line-height: 50px;
}
#title > button {
	float: right;
	font-size: 23px;
	color: black;
	background: white;
	border: #CED4DA solid 1px;
	border-radius: 5px;
}
#title > span {
	margin-left: 60px;
	font-size: 23px;
}
#content {
	width: 100vh;
	overflow: hidden;
	margin: 0 auto;
}
#list {
	width: 100vh;
	margin: 0 auto;
}
/* 식당관련 */
#content_modal {
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -400px;
	margin-top: -450px;
	background: #F2F4EF;
	width: 800px;
	border-radius: 5px;
	background: tomato;
	overflow: hidden;
}
.content_modal {
	width: 800px;
	overflow: hidden;
	background: skyblue;
}
.title_modal {
	width: 800px;
	height: 50px;
	line-height: 50px;
	font-size: 30px;
	border-bottom: 1px dotted;
	font-weight: bold;
	background: olive;
}
.title_modal > span:first-child {
	margin-left: 40px;
}

/* 식당관련 */
.food {
	overflow: hidden;
	width: 500px; 
	border-bottom: 1px dotted;
	margin: 10px auto;
	background: tomato;
}
.food > div {
	margin-top: 5px;
	margin-left: 30px;
}
.food > div span:nth-child(1) {
	display: block;
	font-size: 20px;
	
}
.food > div > input[type=text] {
	display: inline-block;
	width: 400px;
	height: 20px;
	font-size: 20px;
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
	width: 120px;
	height: 50px;
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

</style>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f30f46c40f26ed513be4c81611d91389&libraries=services"></script>
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
					</tr>				
				</thead>
				<tbody>
					<tr id="foodClick">
						<th>foodCode</th>
						<th>foodArea</th>
						<th>foodName</th>
						<th>foodMenu</th>
						<th>foodKind</th>
						<th>foodAddr</th>
						<th>foodDate</th>
					</tr>
					<tr>
						<th>foodsss</th>
						<th>foodArea</th>
						<th>foodName</th>
						<th>foodMenu</th>
						<th>foodddd</th>
						<th>foodAddr</th>
						<th>foodDate</th>
						
					</tr>
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
					<span class="close">&times;</span>
				</div>
				<form action="#" method="post">
				<div class="food">
					<div>
						<span>식당코드</span>
						<input type="text" name="foodCode" value=""/>
					</div>
					<div>
						<span>지역</span>
						<input type="radio" name="foodArea" value="제주시"><label>제주시</label>
						<input type="radio" name="foodArea" value="서귀포시"><label>서귀포시</label>
					</div>
					<div>
						<span>가게명</span>
						<input type="text" name="foodName" value=""/>
					</div>
					<div>
						<span>대표음식</span>
						<input type="text" name="foodMenu" value="">
					</div>
					<div>
						<span>종류</span>
						<input type="radio" name="foodKind" value="한식"><label>한식</label>
						<input type="radio" name="foodKind" value="중식"><label>중식</label>
						<input type="radio" name="foodKind" value="일식"><label>일식</label>
						<input type="radio" name="foodKind" value="양식"><label>양식</label>
						<input type="radio" name="foodKind" value="카페"><label>카페</label>
						<input type="radio" name="foodKind" value="기타"><label>기타</label>
					</div>
					<div>
						<span>주소</span>
						<input type="text" name="foodAddr" id="sample5_address">
						<button type="button" class="button" onclick="sample5_execDaumPostcode()" style="font-size: 16px">지도</button>
					</div>
					<div id="map" style="width:200px;height:200px;margin-top:10px;display:none"></div>
					<div>
						<span>전화번호</span>
						<input type="text" name="foodPhone" value="">
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
						<span>대표이미지</span>
						<input type="file" name="imgFile" accept="image/*"/>
					</div>
					<div>
						<span>음식점소개</span>
						<textarea name="foodIntro" id="" cols="55" rows="3" placeholder="소개"></textarea>
					</div>
					<div>
						<span>식당상태</span>
						<input type="radio" name="foodStatus" value="y"><label>활성화</label>
						<input type="radio" name="foodStatus" value="n"><label>비활성화</label>
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
					<span class="close">&times;</span>
				</div>
				<form action="#" method="post">
				<div class="food">
					<div>
						<span>식당코드 : foodCode</span>
					</div>
					<div>
						<span>지역</span>
						<input type="radio" name="foodArea" value="제주시"><label>제주시</label>
						<input type="radio" name="foodArea" value="서귀포시"><label>서귀포시</label>
					</div>
					<div>
						<span>가게명</span>
						<input type="text" name="foodName" value=""/>
					</div>
					<div>
						<span>대표음식</span>
						<input type="text" name="foodMenu" value="">
					</div>
					<div>
						<span>종류</span>
						<input type="radio" name="foodKind" value="한식"><label>한식</label>
						<input type="radio" name="foodKind" value="중식"><label>중식</label>
						<input type="radio" name="foodKind" value="일식"><label>일식</label>
						<input type="radio" name="foodKind" value="양식"><label>양식</label>
						<input type="radio" name="foodKind" value="카페"><label>카페</label>
						<input type="radio" name="foodKind" value="기타"><label>기타</label>
					</div>
					<div>
						<span>주소</span>
						<input type="text" name="foodAddr" id="sample5_address">
						<button type="button" class="button" onclick="sample5_execDaumPostcode()" style="font-size: 16px">지도</button>
					</div>
					
					<div id="map" style="width:200px;height:200px;margin-top:10px;display:none"></div>
					<div>
						<span>전화번호</span>
						<input type="text" name="foodPhone" value="">
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
						<span>대표이미지</span>
						<input type="file" name="imgFile" accept="image/*"/>
					</div>
					<div>
						<span>음식점소개</span>
						<textarea name="foodIntro" id="" cols="55" rows="3" placeholder="소개"></textarea>
					</div>
					<div>
						<span>식당상태</span>
						<input type="radio" name="foodStatus" value="y"><label>활성화</label>
						<input type="radio" name="foodStatus" value="n"><label>비활성화</label>
					</div>
					<div class="btn">
						<input class="button" type="submit" value="수정하기"></input>
						<input class="button" type="reset" value="초기화"></input>
						<button class="button">삭제하기</button>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>

<script type="text/javascript">
/*  게시판  클릭시 작동 */
var foodModal = document.getElementById("foodModal");
var foodClick = document.getElementById("foodClick");
var span = document.getElementsByClassName("close")[1];
foodClick.onclick = function() {
	foodModal.style.display = "block";
	}
span.onclick = function() {
	foodModal.style.display = "none";
	}
/*  식당 등록 클릭시 작동 */
var foodInModal = document.getElementById("foodInModal");
var foodInClick = document.getElementById("foodInClick");
var span = document.getElementsByClassName("close")[0];
foodInClick.onclick = function() {
	foodInModal.style.display = "block";
	}
span.onclick = function() {
	foodInModal.style.display = "none";
	}
	
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