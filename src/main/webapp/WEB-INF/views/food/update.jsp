<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>음식점정보수정</title>
<script>
	// select 업데이트용 (el때문에 js로 이동불가)
	function selectUpdate(){ 
		document.getElementById("foodArea").value = "${foodDto.foodArea}";
		document.getElementById("foodKind").value = "${foodDto.foodKind}";
		document.getElementById("foodBreak").value = "${foodDto.foodBreak}";
		document.getElementById("foodStatus").value = "${foodDto.foodStatus}";
		document.getElementById("start").value="${foodDto.foodTime}".substring(0,5);
		document.getElementById("end").value="${foodDto.foodTime}".substring(6,11);
	}
</script>
<script src="${root}/resources/javascript/food/food.js"></script>
</head>
<body onload="selectUpdate()">	
	<form action="${root}/food/updateOk.go" method="post" enctype="multipart/form-data" onsubmit="return foodForm(this)">
		<input type="hidden" name="foodCode" value="${foodDto.foodCode}" />
		<input type="hidden" name="imageCode" value="${imageDto.imageCode}" />
		<input type="hidden" name="referCode" value="${imageDto.referCode}" />
		<input type="hidden" name="imageName" value="${imageDto.imageName}" />
		<input type="hidden" name="imageSize" value="${imageDto.imageSize}" />
		<input type="hidden" name="imagePath" value="${imageDto.imagePath}" />
		<input type="hidden" name="memberCode" value="${foodDto.memberCode}" />
		<label>음식점명</label><input type="text" name="foodName" value="${foodDto.foodName}" />
		<br />	
		<label>주소</label><input type="text" name="foodAddr" value="${foodDto.foodAddr}" />
		<br />	
		<label>지역</label>
		<select name="foodArea" id="foodArea">
			<option value="">지역선택</option>
			<option value="제주시">제주시</option>			
			<option value="서귀포시">서귀포시</option>			
		</select>
		<br>		
		<label>전화번호</label>
		<input type="text" name="foodPhone" value="${foodDto.foodPhone}" />
		<br>
		<label>음식 종류</label>
		<select id="foodKind" name="foodKind">
			<option value="">종류선택</option>
			<option value="한식">한식</option>
			<option value="중식">중식</option>
			<option value="양식">양식</option>
			<option value="일식">일식</option>
			<option value="까페">까페</option>
			<option value="식육(숯불구이)">식육(숯불구이)</option>			
			<option value="회집">회집</option>
			<option value="뷔페">뷔페</option>			
		</select>
		<br />		
		<label>대표 메뉴</label>
		<input type="text" name="foodMenu" maxlength="12" value="${foodDto.foodMenu}"/>
		<br />	
		<label>영업 시간 | 현재: ${foodDto.foodTime}</label><br />		
		<label>시작 시간 </label><input type="time" id="start"/>
		<label>종료 시간 </label><input type="time" id="end"/>
		<input type="hidden" name="foodTime" id="fTime"/>
		<br />	
		<label>휴일</label>
		<select id="foodBreak" name="foodBreak">
			<option value="">휴일선택</option>
			<option value="월">월</option>
			<option value="화">화</option>
			<option value="수">수</option>
			<option value="목">목</option>
			<option value="금">금</option>			
			<option value="토">토</option>
			<option value="일">일</option>			
		</select>
		<br />	
		<label>음식점 대표이미지</label>
		<p>${imageDto.imageName}</p>
		<img src="${root}/resources/ftp/${imageDto.imageName}" alt="" style="width:200px;height:200px;"/>
		<input type="file" name="imgFile" accept="image/*"/>
		<br />
		<label>음식점 소개</label>
		<textarea name="foodIntro" cols="30" rows="10" style="width:100%; height: 100px; resize:none;" required>${foodDto.foodIntro }</textarea>
		<label>등록상태</label>
		<select id="foodStatus" name="foodStatus">
			<option value="검토중">검토중</option>
			<option value="완료">완료</option>
		</select>
		<label>등록자</label>
		<input type="text" value="${foodDto.memberCode}" readonly="readonly" />
		<input type="submit" value="수정"/>
		<input type="button" value="뒤로가기" onclick="history.back()"/>				
	</form>	
</body>
</html>