<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰수정OK</title>
</head>
<body>
	<c:if test="${check > 0 }">
		<script>
			alert("리뷰가 수정되었습니다.");
			location.href="${root}/food/read.go?foodCode=${foodCode}";
		</script>
	</c:if>
	<c:if test="${check == 0 }">
		<script>
			alert("ERROR ! 리뷰가 수정되지않았습니다.");
			location.href="${root}/food/read.go?foodCode=${foodCode}";
		</script>
	</c:if>	
</body>
</html>