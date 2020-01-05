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
	justify-content: space-evenly;
	flex-wrap: wrap;
	margin: 50px 0;
	text-align: center;
    color: #EFB730;
    font-size: 18px;
    background: #F7F7F7;
    padding: 20px 0px;
}

.con_2 > div {
	display: flex;
    flex-direction: column;
    margin: 0 10px;
    border-radius: 50%;
    padding: 15px 24px;
    cursor: pointer;
    background: white;
}
.con_2 > div > span {
	color: #030305;
}
.con_2 > div > img {
	width: 70px;
	height: 70px;
}
.con_2 > div > img {
	-webkit-transform:scale(1);
    -moz-transform:scale(1);
    -ms-transform:scale(1); 
    -o-transform:scale(1);  
    transform:scale(1);
    -webkit-transition:.3s;
    -moz-transition:.3s;
    -ms-transition:.3s;
    -o-transition:.3s;
    transition:.3s;
}
.con_2 > div:hover > img {
	-webkit-transform:scale(1.2);
    -moz-transform:scale(1.2);
    -ms-transform:scale(1.2);   
    -o-transform:scale(1.2);
    transform:scale(1.2);
}

.con_3 {
	display: flex;
	flex-direction: column;
	/* max-width: 880px; */
	max-width: 1000px;
	margin: 0 auto;
}
.con_3 > div {
	display: flex;
}
.con_3 > div:first-child {
	border-bottom: solid 2px #EFB730;
	font-size: 23px;
}

.con_3 > div:first-child span{
	color: #EFB730;
	line-height: 40px;
}

.con_3 > div:last-child {
	justify-content: center;
	flex-wrap: wrap;
}

.con_3 > div > div {
	padding: 10px;
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
.con_3 > div > div > span:nth-of-type(1){
	padding-top: 8px;
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
	margin-bottom: 20px;
}

.popularList > div:hover {
	animation-name: listMove;
	animation-duration: 0.5s;
}

@keyframes listMove{
	from {margin-top: 35px;}
	to {margin-top: 40px;}
}
.foodInfo {
	color: #9b9b9b;
	font-size: 14px;
}
.foodInfo > span {
	margin-right: 5px; 
}


</style>
<body onkeypress="if(event.keyCode == 13){search();}">
	<div id="content">
		
		<div id="img_wrapper">
			<div id="search" class="search">
			</div>
		</div>
		<div id="section_container">
			<div class="con_2">
				<div class="searchKind" onclick="searchKind('한식')">
					<img alt="" src="${root}/resources/css/icons8-rice-bowl-100.png">
					<span>한식</span>
				</div>
				<div class="searchKind" onclick="searchKind('중식')">
					<img alt="" src="${root}/resources/css/icons8-noodles-100.png">
					<span>중식</span>
				</div>
				<div class="searchKind" onclick="searchKind('일식')">
					<img alt="" src="${root}/resources/css/icons8-sushi-100.png">
					<span>일식</span>
				</div>
				<div class="searchKind" onclick="searchKind('양식')">
					<img alt="" src="${root}/resources/css/icons8-hamburger-100.png">
					<span>양식</span>
				</div>
				<div class="searchKind" onclick="searchKind('카페')">
					<img alt="" src="${root}/resources/css/icons8-cafe-100.png">
					<span>카페</span>
				</div>
				<div class="searchKind" onclick="searchKind('기타')">
					<img alt="" src="${root}/resources/css/icons8-food-cart-100.png">
					<span>기타</span>
				</div>
			</div>
			<div class="con_3">
				<div>
					<span>인기음식점</span>
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
	countCont();
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
					cont += "<div class='foodInfo'>"
					if (data[i].reviewScore > 0) {
						var reviewScore = Math.round(data[i].reviewScore * 10)/10;
					cont += "<span class='reviewScore' id='star_grade'>";
						  for (var j = 0; j < reviewScore; j++) {
							cont += "<a href='#'><i class='fa fa-star'></i></a>";
						}  
					cont += "</span>";
					}
//					cont += "<span class='foodArea'>지역 : "+data[i].foodArea+"  </span>";
// 					cont += "<span class='foodKind'>종류 : "+data[i].foodKind+"</span>";
// 					cont += "<span class='foodKind'>메뉴 : "+data[i].foodMenu+"</span>";
					cont += " <i class='fa fa-eye'></i><span class='foodRead'>"+data[i].foodRead+"</span>";
					if (data[i].reviewCount != null) {
					cont += " <i class='fa fa-pencil'></i><span class='reviewCount'>"+data[i].reviewCount+"</span>";
					}
					cont += "</div>"
				cont += "</div>"
				}
			$(".popularList").html(cont);	
		}
	});
}

function countCont() {
	$.ajax({
		type : "POST",
		url :  root + "/countContAjax.do",
		dataType : "json",
		success : function(data) {
			var cont = "";
			cont += "<span>EAT THE JEJU<br/>둘러보기</span>"
			cont += "<span>EAT THE JEJU에 등록된   "+data.countFood+"여 개의 맛집과   "+data.countReview+"여 개의 리뷰를 통해 <br/>다양한 맛집을 경험해 보세요.</span>"
			$(".search").html(cont);	
		}
	});
}


</script>
<script type="text/javascript">
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
