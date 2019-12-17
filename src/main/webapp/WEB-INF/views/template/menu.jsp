<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴</title>
</head>
<body>	
	<div class="container">
	<c:choose>
		<c:when test="${id == null }">			
			<a href="${root}/food/insert.go">음식정보등록</a>
			<a href="${root}/food/update.go?foodCode=food0468">음식정보수정</a>
			<a href="${root}/food/delete.go?foodCode=food0467">음식정보삭제</a>			
			<a href="${root}/food/read.go?foodCode=food0468">음식상세페이지 </a>
			<a href="${root}/review/insert.go?foodCode=food0468">리뷰등록</a>
			<a href="${root}/review/read.go?reviewCode=review0042">리뷰상세페이지</a>
			<a href="${root}/review/update.go?reviewCode=review0042">리뷰수정</a>
			<a href="${root}/review/delete.go?reviewCode=review0041">리뷰삭제</a>
		</c:when>
		<c:when test="${id != null }">
					
		</c:when>
	</c:choose>
	</div>
</body>
</html>