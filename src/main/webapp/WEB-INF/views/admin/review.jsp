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
<%-- <link rel="stylesheet" href="${root}/resources/css/admin/review.css"/> --%>
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
	width: 500px; 
	margin: 10px auto;
}
.food > div {
	margin-top: 5px;
}
.food > div span:nth-child(1) {
	font-size: 23px;
	display: inline-block;
	width: 150px;
}
.food > div span:nth-child(2) {
	font-size: 23px;
	width: 345px;
	text-align: center;
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
	width: 480px;
	height: 50px;
}

.reviewModal {
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
</head>
<body>
	<div id="content">
		<div id="title">
			<span>리뷰관리</span>			
		</div>
		<div id="list">
			<table id="example" class="display" style="width:100%">
				<thead>
					<tr>
						<th>리뷰 코드</th>
						<th>음식점 코드</th>
						<th>멤버 코드</th>
						<th>리뷰 날짜</th>
						<th>리뷰 내용</th>
						<th>리뷰 점수</th>						
					</tr>				
				</thead>
				<tbody>
					<c:if test="${reviewDtoList != null }">
					<c:forEach var="reviewDto" items="${reviewDtoList}">
					<tr class="reviewClick">
						<th class="reviewCode">${reviewDto.reviewCode}</th>
						<th>${reviewDto.foodCode}</th>
						<th>${reviewDto.memberCode}</th>
						<th><fmt:formatDate value="${reviewDto.reviewDate}" pattern="yyyy-MM-dd" /></th>
						<th>${reviewDto.reviewCont}</th>
						<th>${reviewDto.reviewScore}</th>						
					</tr>					
					</c:forEach>	
					</c:if>				
				</tbody>
			</table>
		</div>	
	</div>
		
	<!-- 음식점 모달 -->
	<div id="reviewModal" class="reviewModal">
		<div id="content_modal">
			<div class="content_modal">
				<div class="title_modal">
					<span>리뷰 관리</span>
					<span class="close reviewClose">&times;</span>
				</div>
				<form action="${root}/review/delete.go" method="post" onsubmit="return reviewForm(this)">
				<input type="hidden" name="reviewCode" id="reviewHidden" value="" />
				<div class="food">
					<div>
						<span>리뷰 코드</span>
						<span id="reviewCode"></span>
					</div>
					<div>
						<span>음식점 코드</span>
						<span id="foodCode"></span>						
					</div>
					<div>
						<span>멤버 코드</span>
						<span id="memberCode"></span>									
					</div>					
					<div>
						<span>리뷰 날짜</span>
						<span id="reviewDate"></span>					
					</div>
					<div>
						<span>리뷰 내용</span>
						<textarea rows="7" cols="65" id="reviewCont" readonly="readonly"></textarea>				
					</div>								
					<div>
						<span>리뷰 점수</span>
						<span id="reviewScore"></span>						
					</div>	
					<div>
						<span>이미지</span>
						<!-- 이미지가 나오면 처리해야할 부분 -->
						<span id="imgWrapper"></span>												
					</div>				
					<div class="btn">												
						<button class="button">삭제하기</button>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>

<script type="text/javascript">
/*  게시판  클릭시 작동 */
 
$(".reviewClick").click(function(){
	$("#reviewModal").css("display","block");	
	let reviewCode = $(this).children(".reviewCode").text();
	$("#imgWrapper").empty();
	//alert(reviewCode);
	let url = "${root}/admin/getReview.go?reviewCode="+reviewCode;
	$.ajax({
		url : url,
		type : "GET",
		dataType : "json",
		success:function(data){
			//console.log(data);			
			$("#reviewHidden").val(data.reviewCode);
			$("#reviewCode").text(data.reviewCode);
			$("#foodCode").text(data.foodCode);
			$("#memberCode").text(data.memberCode);
			$("#reviewDate").text(data.reviewDate);
			$("#reviewCont").val(data.reviewCont);
			$("#reviewScore").text(data.reviewScore);
			for(let i = 0; i<data.listImage.length; i++){				
				$("#imgWrapper").append("<img src='/img/"+data.listImage[i].imageName+"\' alt='"+data.listImage[i].imageName+"' style='width:150px; height:150px' />");
			}
		},
		error:function(request,status,error){
			console.log("code= "+request.status+" message= "+request.responseText+" error= "+error);
		}	
	});
});

$(".reviewClose").click(function(){
	$("#reviewModal").css("display","none");
});

function reviewForm(obj){
	let isOk = confirm("정말로 삭제하시겠습니까?");
	if(!isOk){
		return false;
	}
}
</script>
	
</body>
</html>