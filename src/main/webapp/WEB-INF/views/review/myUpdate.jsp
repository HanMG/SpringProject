<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% request.getAttribute("javax.servlet.forward.request_uri"); %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>리뷰수정</title>
<script src="${root}/resources/jquery/jquery-3.4.1.js"></script>
<script src="${root}/resources/javascript/review/review.js"></script>
<script>
function reviewUpdate() {
	var memberCode = "${memberCode}";
	var reviewMemberCode = "${reviewDto.memberCode}";
	// 페이지 로드시 세션의 멤버코드와 불러온 멤버코드를 비교해 안맞으면 뒤로 돌아음식점
	if(reviewMemberCode !== memberCode){
		alert("잘못된 접근입니다!!!");
		history.back();
	} 
	//라디오 버튼 체크 (el때문에 js로 이동불가)	
	$("input:radio[name='reviewScore']:radio[value='${reviewDto.reviewScore}']")
			.prop('checked', true);	
}

$(document).on("change", ".file-input", function(){
	 
	$filename = $(this).val();

	if($filename == "")
		$filename = "파일을 선택해주세요.";

	$(".filename").text($filename);

});
</script>
<style type="text/css">
#content_mypage {
	margin : 10px auto;
	width: 1240px;
	overflow: hidden;
}
.title_mypage {
	width: 1000px;
	height: 50px;
	line-height: 50px;
	font-size: 30px;
}

/* 마이페이지 */
.myPage {
	width: 1000px;
	overflow: hidden;
	margin: 70px 120px;
	box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 10px;
	background: white;
}

.myPage > div:nth-child(n+2) {
	margin: 30px;
}
.myPage > div span {
	display: inline-block;
	text-align: center;
	margin: 5px 30px;
}
.myPage button {
	float: right;
	right: 10px;
	width: 100px;
	height: 50px;
	font-size: 20px;
}
.radio-tile-group {
	justify-content: flex-start;
	margin-left: 10px;
}
.container_1 {
	margin: 20px 0;
}
.reViewArea {
	margin: 0 10px;
	resize:none;
	width: 920px;
	height: 350px;
	font-size: 20px;
	font-weight: bold;
}

/* 파일 버튼 수정  */
.box-file-input {
	margin: 10px;
}
.btn {
	width: 1000px;
	height: 60px;
}
.button {
	height: 40px;
	font-size: 23px;
	line-height: 40px;
	display: inline-block;
	float: left;
	margin: 10px;
	width: 150px;
}
.imgBtn {
    color: #FFFFFF;
    border: #EFB730 solid 1px;
    background-color: #EFB730;
}
</style>
</head>
<body onload="reviewUpdate()">
	<div id="content_mypage">
		<div class="myPage">
			<div class="title_mypage">
				<span><strong style="color: #EFB730;">${foodName}</strong>에 대한 솔직한 리뷰를 써주세요.</span>
			</div>
			<div class="nav_1">
			<form action="${root}/review/MyUpdateOk.go" method="POST"	enctype="multipart/form-data" onsubmit="return reviewUpForm(this)">
				<input type="hidden" name="reviewCode" value="${reviewDto.reviewCode }" />
				<input type="hidden" name="foodCode" value="${reviewDto.foodCode}" /> 
				<input type="hidden" name="memberCode" value="${reviewDto.memberCode }" />
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
				<textarea class="reViewArea" name="reviewCont" id="" cols="30" rows="10" placeholder="음식점의 분위기, 서비스가 궁금해요!">${reviewDto.reviewCont}</textarea>
				<div id="imgDiv" style="margin-left: 10px">
					<c:if test="${listImage != null}">
						<table>
							<tr>
								<c:forEach var="imageDto" items="${listImage}">			
									<c:set var="tdId" value="${fn:substringBefore(imageDto.imageName,'_')}"></c:set>				
									<c:set var="imgName" value="${fn:substringAfter(imageDto.imageName,'_')}"></c:set>
									<td id="${tdId}" style="text-align: center;"><img src="/img/${imageDto.imageName}"
										alt="image" style="width: 100px; height: 100px;" onerror="this.src='${root}/resources/css/list.jpg'"/><br />
										<input style="cursor: pointer;" class="imgBtn" type="button" value="이미지삭제" onclick="delImage('${tdId}','${imageDto.imageName}')"/>
									</td>
								</c:forEach>						
							</tr>
						</table>
						<input type="hidden" name="deleteImg" id="deleteImg"/>
					</c:if>
					<div id="fileDiv">     
						<div class="box-file-input"><label><input type="file" multiple="multiple" name="imgFile" class="file-input"  accept="image/*"></label><span class="filename">파일을 선택해주세요</span></div>
			        </div> 
				</div>
				<div class="btn">
					<input class="button" type="submit" value="수정" /> 
					<input class="button" type="button" value="뒤로가기" onclick="history.back()"/>
				</div>
			</form>
			</div>
		</div>
	</div>
</body>
</html>