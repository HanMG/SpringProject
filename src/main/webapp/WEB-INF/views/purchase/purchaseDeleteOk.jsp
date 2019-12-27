<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
	<head>
		<meta charset="UTF-8">
		<title>쿠폰 구매 상세페이지</title>
	</head>
	<body>
		<c:if test="${check > 0}">
			<script type="text/javascript">
				alert("정상적으로 취소요청되었습니다.");
				location.href="${root}/admin/purchase.go";
				self.close();
			</script>
		</c:if>
		
		<c:if test="${check == 0}">
			<script type="text/javascript">
				alert("취소처리가 실패했습니다. 관리자에게 문의해주세요.");
				location.href="${root}/admin/purchase.go";
				self.close();
			</script>
		</c:if>
	</body>
</html>
