<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="UTF-8">
<title>음식점상세페이지</title>
</head>
<body>
	<div>
		즐겨찾기 : <br />
		<i onclick="favorite(this)" class="fa fa-heart-o"></i><br />
		음식점코드: ${foodDto.foodCode} <br />
		음식점이름: ${foodDto.foodName} <br />
		음식점주소: ${foodDto.foodAddr} <br />
		음식점지역: ${foodDto.foodArea} <br />
		음식점전화번호 : ${foodDto.foodPhone} <br />
		음식종류 : ${foodDto.foodKind} <br />
		대표메뉴 : ${foodDto.foodMenu } <br />
		영업시간 : ${foodDto.foodTime } <br />
		휴일 : ${foodDto.foodBreak } <br />
		식당소개 : ${foodDto.foodIntro } <br />
		업데이트일 : ${foodDto.foodDate } <br />
		조회수 : ${foodDto.foodRead } <br />
		등록상태 : ${foodDto.foodStatus} <br />
		이미지 :<br /> 
		<img src="${root}/resources/ftp/${imageDto.imageName}" alt="" style="width:200px;height:200px;"/>		
	</div>	
	
	
	
	<script>
		function favorite(x) {
			if(x.className === "fa fa-heart-o"){
				x.className = "fa fa-heart";				
			}else{
				x.className = "fa fa-heart-o";
			}			
		}
	</script>
</body>
</html>