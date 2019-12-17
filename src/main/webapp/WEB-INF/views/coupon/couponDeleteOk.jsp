<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>쿠폰 상품 수정 완료</title>
	</head>
	<body>
		
		<c:if test="${check > 0}">
			<script type="text/javascript">
				alert("상품이 삭제되었습니다.");
				opener.document.location.href="${root}/coupon/couponList.go?pageNumber=${pageNumber}";
				self.close();
			</script>
		</c:if>
		
		<c:if test="${check == 0}">
			<script type="text/javascript">
				alert("상품 삭제에 실패했습니다.");
				opener.document.location.href="${root}/coupon/couponList.go?pageNumber=${pageNumber}";
				self.close();
			</script>
		</c:if>
	</body>
</html>