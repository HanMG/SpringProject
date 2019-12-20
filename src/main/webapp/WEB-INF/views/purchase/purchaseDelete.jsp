<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
	<head>
		<meta charset="UTF-8">
		<title>삭제 페이지</title>
	</head>
	<body>
		<p><strong>${couponCode} ${couponName}</strong> 쿠폰 (을)를 <br>
			정말로 취소 요청하시겠습니까?</p>
		<form action="${root}/purchase/purchaseDeleteOk.go" method="post">
			<input type="hidden" name="couponCode" value="${couponCode}">
			<input type="hidden" name="pageNumber" value="${pageNumber}">
			<input type="submit"  value="상품 취소 신청">
		</form>
		<a href="javascript:self.close()">닫기</a>
	</body>
</html>