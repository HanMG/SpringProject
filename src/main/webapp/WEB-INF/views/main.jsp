<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<style type="text/css">
#content {
	position: relative;
	
}
#img_wrapper {
  background-image: url(${root}/resources/css/food_1.jpg);
  height: 40vh;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  position: relative;
}
#img_wrapper::after {
	position: absolute;
	top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-color: rgba(0, 0, 0, .3);
    content: "";
}
#section_container {
	max-width: 1000px;
	margin: 15px auto;
}
.con_2 {
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
}

.con_2 > div {
	display: flex;
	flex-direction: column;
	text-align: center;
	margin: 0 10px;
	box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 10px;
}
.con_2 > div > img {
	width: 100px;
	height: 100px;
}
.con_3 {
	display: flex;
	flex-direction: column;
	max-width: 880px;
	margin: 0 auto;
}
.con_3 > div {
	display: flex;
}
.con_3 > div:first-child {
	border-bottom: solid 3px black;
	font-size: 23px;
}

.con_3 > div:last-child {
	justify-content: center;
	flex-wrap: wrap;
}

.con_3 > div > div {
	display: flex;
	flex-direction: column;
	margin: 0 10px;
	margin-top: 40px;
	box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 10px;
}
.con_3 > div > div > img {
	width: 200px;
	height: 200px;
}
.search {
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	z-index: 1;
	text-align: center;
	color: white;
	display: flex;
  	flex-direction: column;
}
.search > span:first-child {
	font-size: 30px;
}
.search > input {
	width: 200px;
	height: 30px; 
	font-size: 1rem;
	padding-left: 30px;
	margin: 10px auto;
}
.search > input::placeholder {
	font-size: 1rem;
	font-family: Noto Sans KR;
	font-weight: 500;
	color: #EFB730;
}
.searchIcon {
	font-size: 23px;
	color: #EFB730;
	position: absolute;
    top: 150px;
    left: 110px;
}
</style>
<body onkeypress="if(event.keyCode == 13){search();}">
	<div id="content">
		
		<div id="img_wrapper">
			<div id="search" class="search">
				<span>EAT THE JEJU<br/>둘러보기</span>
				<span>EAT THE JEJU에 등록된 ?여 개의 맛집과 ?여 개의 리뷰를 통해 <br/>다양한 맛집을 경험해 보세요.</span>
				<i class="fa fa-search searchIcon"></i><input type="text" id="searchInput" name="searchInput" style="border: none;" placeholder="검색어를 입력하여 주세요"  autofocus />
			</div>
		</div>
		<div id="section_container">
			<div class="con_2">
				<div class="searchKind" onclick="searchKind('한식')">
					<img alt="" src="${root}/resources/css/list.jpg">
					<span>한식</span>
				</div>
				<div class="searchKind" onclick="searchKind('중식')">
					<img alt="" src="${root}/resources/css/list.jpg">
					<span>중식</span>
				</div>
				<div class="searchKind" onclick="searchKind('일식')">
					<img alt="" src="${root}/resources/css/list.jpg">
					<span>일식</span>
				</div>
				<div class="searchKind" onclick="searchKind('양식')">
					<img alt="" src="${root}/resources/css/list.jpg">
					<span>양식</span>
				</div>
				<div class="searchKind" onclick="searchKind('카페')">
					<img alt="" src="${root}/resources/css/list.jpg">
					<span>카페</span>
				</div>
				<div class="searchKind" onclick="searchKind('기타')">
					<img alt="" src="${root}/resources/css/list.jpg">
					<span>기타</span>
				</div>
			</div>
			<div class="con_3">
				<div>
					<span>인기식당</span>
				</div>
				<div class="popularList">
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
$(function() {
	popularFood();	
});

var root = "${root}";

function popularFood() {
	$.ajax({
		type : "POST",
		url :  root + "/searchPopularAjax.do",
		dataType : "json",
		success : function(data) {
			var cont = "";
			for (var i = 0; i < data.length; i++) {
				var url = root + "/food/read.go?foodCode=" + data[i].foodCode;
				cont += "<div style='cursor:pointer;' onclick='location.href=\""+url+"\"'>";
					var err = root + "/resources/css/list.jpg";
					cont += "<img alt='음식 이미지' src='"+root+"/resources/ftp/"+data[i].imageName+"' onerror='this.src=\""+err+"\"'>";
					cont += "<span class='foodName'>음식점명 : "+data[i].foodName+"</span>";
					if (data[i].reviewScore > 0) {
						var reviewScore = Math.round(data[i].reviewScore * 10)/10
					cont += "<span class='reviewScore'>리뷰점수 : "+reviewScore+"</span>";
					}
					cont += "<span class='foodArea'>지역 : "+data[i].foodArea+"  </span>";
// 					cont += "<span class='foodKind'>종류 : "+data[i].foodKind+"</span>";
// 					cont += "<span class='foodKind'>메뉴 : "+data[i].foodMenu+"</span>";
					cont += "<span class='foodRead'>조회수 : "+data[i].foodRead+"</span>";
					if (data[i].reviewCount != null) {
					cont += "<span class='reviewCount'>리뷰수 : "+data[i].reviewCount+"</span>";
					}
				cont += "</div>"
				}
			$(".popularList").html(cont);	
		}
	});
}


</script>
<<script type="text/javascript">
function searchKind(foodKind) {
	url = "${root}/search.go?foodKind=" + foodKind;
	location.href = url;
}

</script>

<script type="text/javascript">
var url = null;

function search() {
	var param = $("#searchInput").val()
	url = "${root}/search.go?keyword=" + param;
	location.href = url;
}

$("#searchButton").click(function() {
	search();
});

$("#searchInput").keypress(function(event) {
	if (event.which == 13) {
		search();
	}
});

$("#searchInput").on("change keyup paste", function() {
	var keywordList = [];
	$.ajax({
		type : "POST",
		url : "${root}/searchAutoAjax.do",
		data : {"keyword" : $("#searchInput").val()},
		dataType:"json",
		success : function(data){
			$('#searchInput').autocomplete({
				source : data,
			    focus: function(eventCheck, ui) {
					eventCheck.preventDefault();
					console.log(ui.item.label);
					
					$("#searchInput").keydown(function(key) {
						
						if(key.which == 13) {
							$("#searchInput").val(ui.item.label);
							search();
						}
					});
				}
			});
		}
	}); 
});
</script>
