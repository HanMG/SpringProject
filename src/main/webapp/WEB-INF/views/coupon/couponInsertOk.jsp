<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>쿠폰 상품 등록 완료</title>
	</head>
	<body>
		<c:if test="${check > 0}">
			<script type="text/javascript">
				alert("상품이 등록되었습니다.");
				location.href="${root}/admin/coupon.go";
			</script>
		</c:if>
		
		<c:if test="${check == 0}">
			<script type="text/javascript">
				alert("상품 등록에 실패했습니다.");
				location.href="${root}/admin/coupon.go";
			</script>
		</c:if>
	</body>
</html>