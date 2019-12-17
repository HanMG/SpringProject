<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>음식점정보등록</title>
<script>
	function foodForm() {
		var start = document.getElementById("start").value;
		var end = document.getElementById("end").value;
		document.getElementById("fTime").value = start + "~" + end;
	}
</script>
</head>
<body>
	<form action="${root}/food/insertOk.go" method="post" enctype="multipart/form-data" onsubmit="foodForm()">
		<label>음식점명</label><input type="text" name="foodName" />
		<br />	
		<label>주소</label><input type="text" name="foodAddr" />
		<br />	
		<label>지역</label>
		<select name="foodArea">
			<option value="">지역선택</option>
			<option value="제주시">제주시</option>			
			<option value="서귀포시">서귀포시</option>			
		</select>
		<br>		
		<label>전화번호(-빼고 넣어주세요.)</label>
		<input type="text" name="foodPhone" />
		<br>
		<label>음식 종류</label>
		<select name="foodKind">
			<option value="">종류선택</option>
			<option value="한식">한식</option>
			<option value="중식">중식</option>
			<option value="양식">양식</option>
			<option value="일식">일식</option>
			<option value="식육(숯불구이)">식육(숯불구이)</option>			
			<option value="회집">회집</option>
			<option value="뷔페">뷔페</option>			
		</select>
		<br />		
		<label>대표 메뉴</label>
		<input type="text" name="foodMenu" maxlength="12" />
		<br />	
		<label>영업 시간 |</label>
		<label>시작 시간</label><input type="time" id="start"/>
		<label>종료 시간</label><input type="time" id="end" />
		<input type="hidden" name="foodTime" id="fTime"/>
		<br />	
		<label>휴일</label>
		<select name="foodBreak">
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
		<input type="file" name="imgFile" accept="image/*" />
		<br />
		<label>음식점 소개</label>
		<textarea name="foodIntro" cols="30" rows="10" style="width:100%; height: 100px; resize:none;" required></textarea>
		<input type="submit" value="등록"/>
		<input type="reset" value="취소"/>				
	</form>	
</body>
</html>