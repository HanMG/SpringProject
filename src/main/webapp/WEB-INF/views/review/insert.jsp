<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<script src="${root}/resources/jquery/jquery-3.4.1.js"></script>
<meta charset="UTF-8">
<title>리뷰등록</title>
<style>
	strong {font-size: 20px;}
</style>
<script src="${root}/resources/javascript/review/review.js"></script>
</head>
<body>		
	<p><strong>${foodName}</strong>에 대한 솔직한 리뷰를 써주세요.</p>
	<form action="${root}/review/insertOk.go" method="POST" enctype="multipart/form-data" onsubmit="return reviewForm(this)">			
		<input type="hidden" name="foodCode" value="${foodCode}" />
		<input type="hidden" name="memberCode" value="${memberCode}" />
		<label for="good">맛있어요</label><input type="radio" id="good" name="reviewScore" value="5" checked/>
		<label for="soso">괜찮아요</label><input type="radio" id="soso" name="reviewScore" value="3"/>
		<label for="bad">별로에요</label><input type="radio" id="bad" name="reviewScore" value="1"/>
		<textarea name="reviewCont" id="" cols="30" rows="10" style="width:100%; height:100px; resize:none;" placeholder="음식점의 분위기, 서비스가 궁금해요!"></textarea>
		<div id="fileDiv">            
            <input type="file" name="imgFile" multiple="multiple" accept="image/*"/>                  
        </div>        
        <input type="submit" value="글쓰기"/>
        <input type="reset" value="취소"/>
	</form>
</body>
</html>