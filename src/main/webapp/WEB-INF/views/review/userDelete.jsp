<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>리뷰정보삭제</title>
</head>
<body>
	<c:choose>
		<c:when test="${check > 0 }">
			<script>
				alert("삭제되었습니다.");
				location.href = "${root}/food/read.go?foodCode=${foodCode}";
			</script>
		</c:when>
		<c:when test="${check == 0 }">
			<script>
				alert("ERROR ! 삭제되지않았습니다.");
				location.href = "${root}/food/read.go?foodCode=${foodCode}";
			</script>
		</c:when>
	</c:choose>
</body>
</html>