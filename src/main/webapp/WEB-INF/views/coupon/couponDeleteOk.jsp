<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>쿠폰 삭제완료</title>
	</head>
	<body>
		
		<c:if test="${check > 0}">
			<script type="text/javascript">
				alert("취소 요청되었습니다.");
				opener.document.location.href="${root}/admin/coupon.go?pageNumber=${pageNumber}";
				self.close();
			</script>
		</c:if>
		
		<c:if test="${check == 0}">
			<script type="text/javascript">
				alert("취소 요청이 실패하였습니다. 관리자에게 문의해주세요.");
				opener.document.location.href="${root}/admin/coupon.go?pageNumber=${pageNumber}";
				self.close();
			</script>
		</c:if>
	</body>
</html>